inherited frmCadEmpresa: TfrmCadEmpresa
  Left = 261
  Top = 97
  Caption = 'Empresa'
  ClientHeight = 588
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 569
    ExplicitHeight = 569
    inherited Splitter2: TSplitter
      Height = 567
      ExplicitHeight = 546
    end
    inherited PanelLeft: TPanel
      Height = 567
      ExplicitHeight = 567
      inherited PageControl1: TPageControl
        Height = 565
        ExplicitHeight = 565
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
          inherited ScrollBox1: TScrollBox
            Height = 534
            ExplicitHeight = 534
            inherited PageControl3: TPageControl
              Height = 486
              ExplicitHeight = 486
              inherited TabSheet3: TTabSheet
                Caption = 'Dados da Empresa'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 455
                inherited ScrollBox3: TScrollBox
                  Height = 455
                  ExplicitHeight = 455
                  inherited GroupBox1: TGroupBox
                    Height = 224
                    Caption = 'Dados da Empresa'
                    ExplicitHeight = 224
                    object Label6: TLabel
                      Left = 52
                      Top = 20
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 10
                      Top = 48
                      Width = 75
                      Height = 13
                      Caption = 'Raz'#227'o/Fantasia'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 431
                      Top = 74
                      Width = 81
                      Height = 13
                      Caption = 'N'#186'/Complemento'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 56
                      Top = 101
                      Width = 28
                      Height = 13
                      Caption = 'Bairro'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 249
                      Top = 101
                      Width = 33
                      Height = 13
                      Caption = 'Cidade'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 431
                      Top = 103
                      Width = 19
                      Height = 13
                      Caption = 'CEP'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 566
                      Top = 101
                      Width = 13
                      Height = 13
                      Caption = 'UF'
                    end
                    object Label13: TLabel
                      Left = 654
                      Top = 101
                      Width = 24
                      Height = 13
                      Caption = 'Fone'
                      FocusControl = DBEdit7
                    end
                    object Label14: TLabel
                      Left = 194
                      Top = 20
                      Width = 25
                      Height = 13
                      Caption = 'CNPJ'
                      FocusControl = DBEdit8
                    end
                    object Label15: TLabel
                      Left = 17
                      Top = 126
                      Width = 68
                      Height = 13
                      Caption = 'Insc. Estadual'
                      FocusControl = DBEdit9
                    end
                    object Label16: TLabel
                      Left = 196
                      Top = 128
                      Width = 70
                      Height = 13
                      Caption = 'Insc. Municipal'
                      FocusControl = DBEdit10
                    end
                    object Label17: TLabel
                      Left = 377
                      Top = 128
                      Width = 56
                      Height = 13
                      Caption = 'Propriet'#225'rio'
                      FocusControl = DBEdit11
                    end
                    object Label18: TLabel
                      Left = 65
                      Top = 153
                      Width = 20
                      Height = 13
                      Caption = 'Filial'
                      FocusControl = DBEdit12
                    end
                    object Label19: TLabel
                      Left = 402
                      Top = 157
                      Width = 23
                      Height = 13
                      Caption = 'Obs.'
                      FocusControl = DBEdit13
                    end
                    object Label20: TLabel
                      Left = 34
                      Top = 180
                      Width = 51
                      Height = 13
                      Caption = 'Mensagem'
                    end
                    object Label21: TLabel
                      Left = 392
                      Top = 182
                      Width = 28
                      Height = 13
                      Caption = 'E-mail'
                      FocusControl = DBEdit15
                    end
                    object Label166: TLabel
                      Left = 40
                      Top = 77
                      Width = 45
                      Height = 13
                      Caption = 'Endere'#231'o'
                      FocusControl = DBEdit113
                    end
                    object Label383: TLabel
                      Left = 358
                      Top = 20
                      Width = 62
                      Height = 13
                      Caption = 'Identifica'#231#227'o'
                      FocusControl = DBEdit217
                    end
                    object DBEdit1: TDBEdit
                      Left = 91
                      Top = 17
                      Width = 99
                      Height = 21
                      DataField = 'COD_EMPRESA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 91
                      Top = 44
                      Width = 334
                      Height = 21
                      Hint = 'Raz'#227'o social da Empresa'
                      DataField = 'NOME_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 3
                    end
                    object DBEdit3: TDBEdit
                      Left = 514
                      Top = 71
                      Width = 45
                      Height = 21
                      Hint = 'N'#250'medo de endere'#231'o'
                      DataField = 'NUMERO_END'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 6
                    end
                    object DBEdit4: TDBEdit
                      Left = 90
                      Top = 98
                      Width = 153
                      Height = 21
                      Hint = 'Descri'#231#227'o do Bairro'
                      DataField = 'BAIRRO_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 8
                    end
                    object DBEdit5: TDBEdit
                      Left = 288
                      Top = 98
                      Width = 137
                      Height = 21
                      Hint = 'Descri'#231#227'o da Cidade'
                      DataField = 'CIDADE_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 9
                    end
                    object DBEdit6: TDBEdit
                      Left = 456
                      Top = 98
                      Width = 103
                      Height = 21
                      Hint = 'CEP da empresa'
                      DataField = 'CEP_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 10
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 585
                      Top = 98
                      Width = 59
                      Height = 21
                      Hint = 'UF da Empresa'
                      DataField = 'UF_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      KeyField = 'CODIGO_UF'
                      ListField = 'SIGLA_UF'
                      ListSource = DtmCadBasicos.dsUF
                      TabOrder = 11
                    end
                    object DBEdit7: TDBEdit
                      Left = 680
                      Top = 98
                      Width = 88
                      Height = 21
                      Hint = 'N'#250'mero de telefone da empresa'
                      DataField = 'TELEFONE_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 12
                    end
                    object DBEdit8: TDBEdit
                      Left = 225
                      Top = 17
                      Width = 122
                      Height = 21
                      Hint = 'CNPJ da Empresa'
                      DataField = 'CGC_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 1
                    end
                    object DBEdit9: TDBEdit
                      Left = 91
                      Top = 125
                      Width = 100
                      Height = 21
                      Hint = 'Inscri'#231#227'o Estadual'
                      DataField = 'IE_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 13
                    end
                    object DBEdit10: TDBEdit
                      Left = 272
                      Top = 125
                      Width = 99
                      Height = 21
                      Hint = 'Inscri'#231#227'o Municipal'
                      DataField = 'IM_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 14
                    end
                    object DBEdit11: TDBEdit
                      Left = 440
                      Top = 125
                      Width = 328
                      Height = 21
                      Hint = 'Propriet'#225'rio da Empresa'
                      DataField = 'PROP_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 15
                    end
                    object DBEdit12: TDBEdit
                      Left = 91
                      Top = 152
                      Width = 280
                      Height = 21
                      Hint = 'Filial'
                      DataField = 'FILIAL'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 16
                    end
                    object DBEdit13: TDBEdit
                      Left = 426
                      Top = 152
                      Width = 342
                      Height = 21
                      Hint = 'Observa'#231#227'o geral da empresa'
                      DataField = 'OBSERV_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 17
                    end
                    object DBEdit15: TDBEdit
                      Tag = 1
                      Left = 426
                      Top = 179
                      Width = 342
                      Height = 21
                      Hint = 'E-mail da empresa'
                      DataField = 'EMAIL_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 19
                    end
                    object DBEdit113: TDBEdit
                      Left = 91
                      Top = 71
                      Width = 334
                      Height = 21
                      Hint = 'Endere'#231'o da empresa'
                      DataField = 'ENDRECO_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 5
                    end
                    object DBEdit129: TDBEdit
                      Left = 426
                      Top = 44
                      Width = 342
                      Height = 21
                      Hint = 'Nome Fantasia'
                      DataField = 'FANTASIA_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 4
                    end
                    object DBEdit134: TDBEdit
                      Left = 565
                      Top = 71
                      Width = 203
                      Height = 21
                      Hint = 'Complemento de endere'#231'o'
                      DataField = 'COMPLEMENTO_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 7
                    end
                    object DBEdit217: TDBEdit
                      Left = 426
                      Top = 17
                      Width = 340
                      Height = 21
                      DataField = 'IDENTIFICACAO_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 2
                    end
                    object DBMemo7: TDBMemo
                      Left = 91
                      Top = 179
                      Width = 280
                      Height = 39
                      Hint = 'Mensagem a ser impressa em pedidos de venda'
                      DataField = 'MENSAGEM_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      MaxLength = 130
                      TabOrder = 18
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 224
                    Width = 771
                    Height = 227
                    Align = alClient
                    Caption = 
                      'Caixa/Demostra'#231#227'o de Resuldatos/SpedFiscal/Dados para o HW Gesto' +
                      'r'
                    TabOrder = 1
                    object Label27: TLabel
                      Left = 21
                      Top = 21
                      Width = 78
                      Height = 13
                      Caption = 'Caixa Integrado'
                    end
                    object Label263: TLabel
                      Left = 32
                      Top = 119
                      Width = 160
                      Height = 13
                      Caption = 'Data '#218'ltima Defini'#231#227'o de Classes:'
                    end
                    object Label264: TLabel
                      Left = 299
                      Top = 119
                      Width = 194
                      Height = 13
                      Caption = 'Qtde Meses '#218'ltima Defini'#231#227'o de Classes:'
                    end
                    object Label265: TLabel
                      Left = 49
                      Top = 144
                      Width = 143
                      Height = 13
                      Caption = 'Data '#218'ltima Defini'#231#227'o de Giro:'
                    end
                    object Label266: TLabel
                      Left = 316
                      Top = 144
                      Width = 177
                      Height = 13
                      Caption = 'Qtde Meses '#218'ltima Defini'#231#227'o de Giro:'
                    end
                    object Label267: TLabel
                      Left = 12
                      Top = 169
                      Width = 180
                      Height = 13
                      Caption = 'Data '#218'ltima Def. de Classes Servi'#231'os:'
                    end
                    object Label268: TLabel
                      Left = 279
                      Top = 169
                      Width = 214
                      Height = 13
                      Caption = 'Qtde Meses '#218'ltima Def. de Classes Servi'#231'os:'
                    end
                    object GroupBox5: TGroupBox
                      Left = 626
                      Top = 141
                      Width = 757
                      Height = 51
                      Caption = 'Estoque'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      Visible = False
                      object Label22: TLabel
                        Left = 14
                        Top = 19
                        Width = 70
                        Height = 13
                        Caption = 'Gr Desp. Fixas'
                        FocusControl = DBEdit16
                      end
                      object Label23: TLabel
                        Left = 156
                        Top = 19
                        Width = 78
                        Height = 13
                        Caption = 'Gr.Rec.(Outras)'
                        FocusControl = DBEdit17
                      end
                      object Label24: TLabel
                        Left = 309
                        Top = 19
                        Width = 81
                        Height = 13
                        Caption = 'Gr.Desp.Vari'#225'vel'
                        FocusControl = DBEdit18
                      end
                      object Label25: TLabel
                        Left = 467
                        Top = 19
                        Width = 62
                        Height = 13
                        Caption = 'Gr. Imp.Vnd.'
                        FocusControl = DBEdit19
                      end
                      object Label26: TLabel
                        Left = 610
                        Top = 19
                        Width = 60
                        Height = 13
                        Caption = 'Gr. Reinvest'
                        FocusControl = DBEdit20
                      end
                      object DBEdit16: TDBEdit
                        Left = 88
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CDF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit17: TDBEdit
                        Left = 237
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CRO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit18: TDBEdit
                        Left = 396
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CDV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit19: TDBEdit
                        Left = 531
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CI'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit20: TDBEdit
                        Left = 676
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CSE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 105
                      Top = 18
                      Width = 80
                      Height = 21
                      Hint = 'Utilizar o Caixa Geral para as apura'#231#245'es de resultados'
                      DataField = 'CAIXA_INTEGRADO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 0
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object GroupBox6: TGroupBox
                      Left = 639
                      Top = 152
                      Width = 755
                      Height = 50
                      Caption = 'Ve'#237'culos'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      Visible = False
                      object Label28: TLabel
                        Left = 13
                        Top = 21
                        Width = 70
                        Height = 13
                        Caption = 'Gr Desp. Fixas'
                        FocusControl = DBEdit21
                      end
                      object Label29: TLabel
                        Left = 156
                        Top = 20
                        Width = 78
                        Height = 13
                        Caption = 'Gr.Rec.(Outras)'
                        FocusControl = DBEdit22
                      end
                      object Label30: TLabel
                        Left = 307
                        Top = 19
                        Width = 81
                        Height = 13
                        Caption = 'Gr.Desp.Vari'#225'vel'
                        FocusControl = DBEdit23
                      end
                      object Label31: TLabel
                        Left = 466
                        Top = 20
                        Width = 62
                        Height = 13
                        Caption = 'Gr. Imp.Vnd.'
                        FocusControl = DBEdit24
                      end
                      object Label32: TLabel
                        Left = 610
                        Top = 20
                        Width = 64
                        Height = 13
                        Caption = 'Gr. Reinvest.'
                        FocusControl = DBEdit25
                      end
                      object DBEdit21: TDBEdit
                        Left = 89
                        Top = 17
                        Width = 65
                        Height = 21
                        DataField = 'G_CDF_VEIC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit22: TDBEdit
                        Left = 236
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CRO_VEIC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit23: TDBEdit
                        Left = 396
                        Top = 16
                        Width = 64
                        Height = 21
                        DataField = 'G_CDV_VEIC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit24: TDBEdit
                        Left = 531
                        Top = 17
                        Width = 66
                        Height = 21
                        DataField = 'G_CI_VEIC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit25: TDBEdit
                        Left = 676
                        Top = 16
                        Width = 65
                        Height = 21
                        DataField = 'G_CSE_VEIC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                    object GroupBox7: TGroupBox
                      Left = 652
                      Top = 158
                      Width = 755
                      Height = 50
                      Caption = 'Servi'#231'os'
                      TabOrder = 3
                      Visible = False
                      object Label33: TLabel
                        Left = 12
                        Top = 19
                        Width = 70
                        Height = 13
                        Caption = 'Gr Desp. Fixas'
                        FocusControl = DBEdit26
                      end
                      object Label34: TLabel
                        Left = 156
                        Top = 19
                        Width = 78
                        Height = 13
                        Caption = 'Gr.Rec.(Outras)'
                        FocusControl = DBEdit27
                      end
                      object Label35: TLabel
                        Left = 308
                        Top = 19
                        Width = 81
                        Height = 13
                        Caption = 'Gr.Desp.Vari'#225'vel'
                        FocusControl = DBEdit28
                      end
                      object Label36: TLabel
                        Left = 465
                        Top = 21
                        Width = 62
                        Height = 13
                        Caption = 'Gr. Imp.Vnd.'
                        FocusControl = DBEdit29
                      end
                      object Label37: TLabel
                        Left = 610
                        Top = 21
                        Width = 64
                        Height = 13
                        Caption = 'Gr. Reinvest.'
                        FocusControl = DBEdit30
                      end
                      object DBEdit26: TDBEdit
                        Left = 87
                        Top = 15
                        Width = 63
                        Height = 21
                        DataField = 'G_CDF_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit27: TDBEdit
                        Left = 238
                        Top = 16
                        Width = 63
                        Height = 21
                        DataField = 'G_CRO_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit28: TDBEdit
                        Left = 397
                        Top = 16
                        Width = 62
                        Height = 21
                        DataField = 'G_CDV_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit29: TDBEdit
                        Left = 533
                        Top = 16
                        Width = 66
                        Height = 21
                        DataField = 'G_CI_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit30: TDBEdit
                        Left = 680
                        Top = 16
                        Width = 60
                        Height = 21
                        DataField = 'G_CSE_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                    object GroupBox8: TGroupBox
                      Left = 665
                      Top = 185
                      Width = 755
                      Height = 74
                      Caption = 'Administrativos'
                      TabOrder = 4
                      Visible = False
                      object Label38: TLabel
                        Left = 10
                        Top = 20
                        Width = 71
                        Height = 13
                        Caption = 'Gr. Imp.Renda'
                        FocusControl = DBEdit31
                      end
                      object Label39: TLabel
                        Left = 239
                        Top = 23
                        Width = 75
                        Height = 13
                        Caption = 'Gr. Contr Social'
                        FocusControl = DBEdit32
                      end
                      object Label40: TLabel
                        Left = 504
                        Top = 19
                        Width = 79
                        Height = 13
                        Caption = 'Rem. Cap. Terc.'
                        FocusControl = DBEdit33
                      end
                      object Label41: TLabel
                        Left = 6
                        Top = 47
                        Width = 79
                        Height = 13
                        Caption = 'Reinvestimentos'
                        FocusControl = DBEdit34
                      end
                      object Label42: TLabel
                        Left = 258
                        Top = 50
                        Width = 56
                        Height = 13
                        Caption = 'Desp. Fixas'
                        FocusControl = DBEdit35
                      end
                      object Label43: TLabel
                        Left = 504
                        Top = 47
                        Width = 74
                        Height = 13
                        Caption = 'Desp. Vari'#225'veis'
                        FocusControl = DBEdit36
                      end
                      object DBEdit31: TDBEdit
                        Left = 87
                        Top = 16
                        Width = 140
                        Height = 21
                        DataField = 'G_IR_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit32: TDBEdit
                        Left = 320
                        Top = 19
                        Width = 140
                        Height = 21
                        DataField = 'G_CTRS_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit33: TDBEdit
                        Left = 588
                        Top = 16
                        Width = 140
                        Height = 21
                        DataField = 'G_REM_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit34: TDBEdit
                        Left = 88
                        Top = 44
                        Width = 138
                        Height = 21
                        DataField = 'G_REIV_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit35: TDBEdit
                        Left = 321
                        Top = 47
                        Width = 138
                        Height = 21
                        DataField = 'G_DF_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                      object DBEdit36: TDBEdit
                        Left = 588
                        Top = 43
                        Width = 140
                        Height = 21
                        DataField = 'G_DV_ADM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 5
                      end
                    end
                    object GroupBox21: TGroupBox
                      Left = 14
                      Top = 41
                      Width = 749
                      Height = 66
                      Caption = 'HW Gestor'
                      TabOrder = 5
                      object Label190: TLabel
                        Left = 111
                        Top = 42
                        Width = 67
                        Height = 13
                        Caption = 'Dtpo p/ Veic.:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label192: TLabel
                        Left = 329
                        Top = 42
                        Width = 150
                        Height = 13
                        Caption = 'Qtde padr'#227'o de dias Trab. M'#234's:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label193: TLabel
                        Left = 12
                        Top = 20
                        Width = 166
                        Height = 13
                        Caption = 'Dpto Caixa para Vendas Produtos: '
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label194: TLabel
                        Left = 317
                        Top = 20
                        Width = 162
                        Height = 13
                        Caption = 'Dpto Caixa para Vendas Servi'#231'os:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit135: TDBEdit
                        Left = 181
                        Top = 39
                        Width = 72
                        Height = 21
                        Hint = 'Departamento para Ve'#237'culos'
                        DataField = 'CODDEPVEICULOS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit136: TDBEdit
                        Left = 485
                        Top = 39
                        Width = 70
                        Height = 21
                        Hint = 'Quantidade padr'#227'o de dias trabalhados no m'#234's'
                        DataField = 'DIAS_TRABALHO_MES'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit137: TDBEdit
                        Left = 181
                        Top = 17
                        Width = 72
                        Height = 21
                        Hint = 'Departamento do Caixa para Vendas de Produtos'
                        DataField = 'CODDEPPRODUTOS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit138: TDBEdit
                        Left = 485
                        Top = 17
                        Width = 70
                        Height = 21
                        Hint = 'Departamento do Caixa para Venda de Servi'#231'os'
                        DataField = 'CODDEPOFICINA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                    end
                    object DBEdit179: TDBEdit
                      Left = 195
                      Top = 111
                      Width = 72
                      Height = 21
                      DataField = 'DTDEF_CLASSEP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 6
                    end
                    object DBEdit180: TDBEdit
                      Left = 499
                      Top = 111
                      Width = 70
                      Height = 21
                      DataField = 'QTDMES_CLASSEP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 7
                    end
                    object DBEdit181: TDBEdit
                      Left = 195
                      Top = 136
                      Width = 72
                      Height = 21
                      DataField = 'DTDEFINICAO_GE'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 8
                    end
                    object DBEdit182: TDBEdit
                      Left = 499
                      Top = 136
                      Width = 70
                      Height = 21
                      DataField = 'QTDMES_GE'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 9
                    end
                    object DBEdit183: TDBEdit
                      Left = 499
                      Top = 163
                      Width = 70
                      Height = 21
                      DataField = 'QTDMES_CLASSE_S'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 10
                    end
                    object DBEdit184: TDBEdit
                      Left = 195
                      Top = 163
                      Width = 72
                      Height = 21
                      DataField = 'DTDEF_CLASSE_S'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Enabled = False
                      TabOrder = 11
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Complemento'
                ImageIndex = 1
                object GroupBox9: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 298
                  Align = alTop
                  TabOrder = 0
                  object Label44: TLabel
                    Left = 50
                    Top = 13
                    Width = 108
                    Height = 13
                    Caption = 'Emiss'#227'o de Nota Fiscal'
                  end
                  object Label46: TLabel
                    Left = 88
                    Top = 67
                    Width = 70
                    Height = 13
                    Hint = 
                      'Alterado para Config Global > [nf_e_custos] - Configura'#231#245'es para' +
                      ' calculo de custo em entradas de Notas Fiscais'
                    Caption = 'D'#233'bito/Credito'
                  end
                  object Label47: TLabel
                    Left = 127
                    Top = 94
                    Width = 31
                    Height = 13
                    Caption = 'Multas'
                    FocusControl = DBEdit37
                  end
                  object Label48: TLabel
                    Left = 46
                    Top = 118
                    Width = 112
                    Height = 13
                    Caption = 'Venda Abaixo do Custo'
                  end
                  object Label49: TLabel
                    Left = 90
                    Top = 142
                    Width = 68
                    Height = 13
                    Caption = 'Usar Auditoria'
                  end
                  object Label50: TLabel
                    Left = 54
                    Top = 170
                    Width = 104
                    Height = 13
                    Caption = 'Usar Declara'#231#227'o Req.'
                  end
                  object Label51: TLabel
                    Left = 58
                    Top = 194
                    Width = 100
                    Height = 13
                    Caption = 'Alterar Pre'#231'o Repos.'
                  end
                  object Label52: TLabel
                    Left = 46
                    Top = 245
                    Width = 112
                    Height = 13
                    Caption = 'Observa'#231#227'o Padr'#227'o OS'
                    FocusControl = DBMemo1
                  end
                  object Label53: TLabel
                    Left = 320
                    Top = 13
                    Width = 62
                    Height = 13
                    Caption = 'N'#250'mero Ped.'
                    FocusControl = DBEdit38
                  end
                  object Label54: TLabel
                    Left = 279
                    Top = 40
                    Width = 99
                    Height = 13
                    Caption = 'M'#243'dulo Faturamento'
                  end
                  object Label55: TLabel
                    Left = 335
                    Top = 66
                    Width = 43
                    Height = 13
                    Caption = 'Conex'#227'o'
                  end
                  object Label56: TLabel
                    Left = 325
                    Top = 94
                    Width = 53
                    Height = 13
                    Caption = 'Taxa Juros'
                    FocusControl = DBEdit39
                  end
                  object Label57: TLabel
                    Left = 273
                    Top = 118
                    Width = 105
                    Height = 13
                    Caption = 'Qtde Meses Sugest'#227'o'
                    FocusControl = DBEdit40
                  end
                  object Label58: TLabel
                    Left = 273
                    Top = 142
                    Width = 106
                    Height = 13
                    Caption = 'Usar Arredondamento'
                  end
                  object Label59: TLabel
                    Left = 286
                    Top = 170
                    Width = 93
                    Height = 13
                    Caption = 'Usar DAV ECF Req.'
                  end
                  object Label60: TLabel
                    Left = 286
                    Top = 197
                    Width = 92
                    Height = 13
                    Caption = 'Usar DAV ECF O.S.'
                  end
                  object Label61: TLabel
                    Left = 523
                    Top = 13
                    Width = 79
                    Height = 13
                    Caption = 'Alt Perc.Margem'
                  end
                  object Label62: TLabel
                    Left = 505
                    Top = 40
                    Width = 97
                    Height = 13
                    Caption = 'Apresentar Est.Real'
                  end
                  object Label64: TLabel
                    Left = 485
                    Top = 120
                    Width = 117
                    Height = 13
                    Caption = 'Emitir cupom de servi'#231'os'
                  end
                  object Label187: TLabel
                    Left = 470
                    Top = 143
                    Width = 78
                    Height = 13
                    Caption = 'Regime Federal:'
                  end
                  object Label261: TLabel
                    Left = 467
                    Top = 92
                    Width = 135
                    Height = 13
                    Caption = 'Dias Car'#234'ncia p/ Juros/Mult:'
                    FocusControl = DBEdit177
                  end
                  object Label277: TLabel
                    Left = 65
                    Top = 221
                    Width = 93
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Vers'#227'o Retaguarda'
                    FocusControl = DBEdit190
                  end
                  object Label306: TLabel
                    Left = 511
                    Top = 170
                    Width = 91
                    Height = 13
                    Caption = 'Contribuinte de IPI'
                  end
                  object Label308: TLabel
                    Left = 527
                    Top = 194
                    Width = 75
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Usar Pr'#233'-Venda'
                  end
                  object Label349: TLabel
                    Left = 382
                    Top = 222
                    Width = 220
                    Height = 13
                    Caption = 'Metodo para calculo do Prazo medio de venda'
                  end
                  object DBComboBox2: TDBComboBox
                    Left = 168
                    Top = 10
                    Width = 80
                    Height = 21
                    Hint = 'Indica se a empresa vai emitir nota fiscal pelo sistema'
                    DataField = 'EM_NF'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 0
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox4: TDBComboBox
                    Left = 168
                    Top = 64
                    Width = 80
                    Height = 21
                    Hint = 
                      'Alterado para Config Global > [nf_e_custos] - Configura'#231#245'es para' +
                      ' calculo de custo em entradas de Notas Fiscais'
                    DataField = 'DEB_CRED'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 1
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBEdit37: TDBEdit
                    Left = 168
                    Top = 90
                    Width = 79
                    Height = 21
                    Hint = 'Percentual de Multa Praticado pela empresa'
                    DataField = 'MULTAS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 2
                  end
                  object DBComboBox5: TDBComboBox
                    Left = 168
                    Top = 115
                    Width = 79
                    Height = 21
                    Hint = 'Venda abaixo do custo'
                    DataField = 'VND_AB_CUSTO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 3
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox6: TDBComboBox
                    Left = 168
                    Top = 140
                    Width = 79
                    Height = 21
                    Hint = 'Utilizar auditoria no sistema'
                    DataField = 'UTIL_AUD'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 4
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox7: TDBComboBox
                    Left = 168
                    Top = 167
                    Width = 79
                    Height = 21
                    Hint = 'Usar declara'#231#227'o de SPC na requisi'#231#227'o'
                    DataField = 'US_DECL_REQ'
                    DataSource = DtmCadBasicos.dsEmpresa
                    Enabled = False
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 5
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox8: TDBComboBox
                    Left = 168
                    Top = 194
                    Width = 79
                    Height = 21
                    Hint = 'Alterar pre'#231'o'
                    DataField = 'AT_PRECREP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 6
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBMemo1: TDBMemo
                    Left = 168
                    Top = 245
                    Width = 520
                    Height = 48
                    Hint = 'Observa'#231#227'o padr'#227'o da OS'
                    DataField = 'OBS_PAD_OS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 24
                  end
                  object DBEdit38: TDBEdit
                    Left = 384
                    Top = 10
                    Width = 80
                    Height = 21
                    Hint = 
                      'N'#250'mero da autoriza'#231#227'o para Processamento eletr'#244'nico de Dados emi' +
                      'tido pelo Estado'
                    DataField = 'N_PED'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 7
                  end
                  object DBComboBox9: TDBComboBox
                    Left = 384
                    Top = 37
                    Width = 80
                    Height = 21
                    Hint = 'Usar o m'#243'dulo de Caixa Auxiliar no fechamento das Vendas'
                    DataField = 'MOD_FAT'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 8
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox10: TDBComboBox
                    Left = 384
                    Top = 64
                    Width = 80
                    Height = 21
                    Hint = 'Conex'#227'o'
                    DataField = 'CONEXAO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 9
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBEdit39: TDBEdit
                    Left = 384
                    Top = 90
                    Width = 80
                    Height = 21
                    Hint = 'Taxa de Juros que a empresa trabalha.'
                    DataField = 'TX_JUROS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 10
                  end
                  object DBEdit40: TDBEdit
                    Left = 384
                    Top = 115
                    Width = 80
                    Height = 21
                    Hint = 
                      'Quantidade de Meses usada na sugest'#227'o de compra e c'#225'lculo de m'#233'd' +
                      'ia para os produtos.'
                    DataField = 'QTMESSUG'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 11
                  end
                  object DBComboBox11: TDBComboBox
                    Left = 385
                    Top = 139
                    Width = 82
                    Height = 21
                    Hint = 
                      'Usar no fechamento de um pedido de venda o arredondamento do val' +
                      'or total'
                    DataField = 'ARREDOND'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'NAO')
                    TabOrder = 12
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox12: TDBComboBox
                    Left = 385
                    Top = 167
                    Width = 82
                    Height = 21
                    Hint = 'Usar DAV na venda requisi'#231#227'o'
                    DataField = 'USPREVENDA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 13
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox13: TDBComboBox
                    Left = 384
                    Top = 194
                    Width = 82
                    Height = 21
                    Hint = 'Usar DAV na Ordem de servi'#231'o.'
                    DataField = 'USPREVENDA_OS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 14
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox14: TDBComboBox
                    Left = 608
                    Top = 10
                    Width = 80
                    Height = 21
                    Hint = 
                      'Altera a Margem do percentual de tabela quando se altera o pre'#231'o' +
                      ' de tabela'
                    DataField = 'ALT_PERC_MARGEM'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 15
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox15: TDBComboBox
                    Left = 608
                    Top = 37
                    Width = 80
                    Height = 21
                    Hint = 
                      'Apresentar na hora da consulta de um produto o estoque real, ou ' +
                      'seja, o estoque que est'#225' no cadastro menos as quantidades que es' +
                      't'#227'o em requisi'#231#245'es em abertas, O.S. abertas ou Pedidos de Produ'#231 +
                      #227'o em Aberto'
                    DataField = 'APRES_ESTR'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      
                        'SIM - Apresentar o estoque menos as pendencias em Requisi'#231#245'es, O' +
                        'rdens de Servi'#231'os e Pedidos de Produ'#231#227'o'
                      
                        'REQ - Apresentar apenas estoque menos os pendentes em Requisi'#231#245'e' +
                        's'
                      
                        'OS - Apresentar apenas estoque menos os pendentes em Ordens de S' +
                        'ervi'#231'o'
                      
                        'Produ'#231#227'o - Apresentar apenas estoque menos os pendentes em Pedid' +
                        'o de Produ'#231#227'o'
                      'N'#195'O - Apresentar apenas o estoque do produto sem olha pend'#234'ncias')
                    TabOrder = 16
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox16: TDBComboBox
                    Left = 608
                    Top = 115
                    Width = 80
                    Height = 21
                    Hint = 'Empresa autorizada a emitir cupom fiscal de servi'#231'os'
                    DataField = 'AUT_SERV_CUPOM'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 18
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox40: TDBComboBox
                    Left = 554
                    Top = 140
                    Width = 134
                    Height = 21
                    Hint = 
                      'Indica o regime de Impostos Federais em que a empresa se enquadr' +
                      'a'
                    DataField = 'REGIME'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIMPLES'
                      'LUCRO REAL'
                      'LUCRO PRESUMIDO'
                      'SIMPLES / EXCESSO : Excesso Sub Limite da Receita Bruta.')
                    TabOrder = 19
                    OnKeyPress = DBComboBox1KeyPress
                  end
                  object DBEdit177: TDBEdit
                    Left = 608
                    Top = 88
                    Width = 80
                    Height = 21
                    Hint = 'Taxa de Juros que a empresa trabalha.'
                    DataField = 'DIAS_CAR_JUROS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 17
                  end
                  object DBEdit190: TDBEdit
                    Left = 168
                    Top = 219
                    Width = 79
                    Height = 21
                    Hint = 'N'#250'mero da Concession'#225'ria junto a sua bandeira'
                    DataField = 'VERSAO_RETAGUARDA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 23
                  end
                  object DBComboBox84: TDBComboBox
                    Left = 608
                    Top = 167
                    Width = 80
                    Height = 21
                    Hint = 'Empresa autorizada a emitir cupom fiscal de servi'#231'os'
                    DataField = 'CONTRIBUINTE_IPI'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 20
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox85: TDBComboBox
                    Left = 608
                    Top = 191
                    Width = 80
                    Height = 21
                    Hint = 'Usar Pr'#233'-Venda'
                    DataField = 'PAF_USAR_PREVENDA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 21
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBComboBox98: TDBComboBox
                    Left = 608
                    Top = 218
                    Width = 80
                    Height = 21
                    Hint = 'Usar Pr'#233'-Venda'
                    DataField = 'METODO_PMV'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'FORMPAG'
                      'CREDITOS')
                    TabOrder = 22
                    OnKeyPress = DBComboBox2KeyPress
                  end
                end
                object GroupBox10: TGroupBox
                  Left = 0
                  Top = 298
                  Width = 775
                  Height = 151
                  Align = alTop
                  Caption = 'Nota Fiscal'
                  TabOrder = 1
                  object Label65: TLabel
                    Left = 106
                    Top = 19
                    Width = 51
                    Height = 13
                    Caption = 'Nota Ativa'
                  end
                  object Label66: TLabel
                    Left = 30
                    Top = 45
                    Width = 127
                    Height = 13
                    Caption = 'Quant. Servi'#231'o Nota Fiscal'
                    FocusControl = DBEdit42
                  end
                  object Label67: TLabel
                    Left = 23
                    Top = 72
                    Width = 134
                    Height = 13
                    Caption = 'Quant.Linhas da Nota Fiscal'
                    FocusControl = DBEdit43
                  end
                  object Label68: TLabel
                    Left = 37
                    Top = 98
                    Width = 120
                    Height = 13
                    Caption = 'Usar Impr. por Romaneio'
                  end
                  object Label69: TLabel
                    Left = 27
                    Top = 122
                    Width = 134
                    Height = 13
                    Caption = 'Qtde Caracteres Desc Itens'
                    FocusControl = DBEdit44
                  end
                  object Label70: TLabel
                    Left = 319
                    Top = 18
                    Width = 119
                    Height = 13
                    Caption = 'Tamanho Letra p/ Regua'
                  end
                  object Label71: TLabel
                    Left = 294
                    Top = 45
                    Width = 145
                    Height = 13
                    Caption = 'Quant. Total Prod. Nota Fiscal'
                    FocusControl = DBEdit45
                  end
                  object Label72: TLabel
                    Left = 365
                    Top = 72
                    Width = 73
                    Height = 13
                    Caption = 'Al'#237'quota do ISS'
                    FocusControl = DBEdit46
                  end
                  object Label73: TLabel
                    Left = 347
                    Top = 98
                    Width = 92
                    Height = 13
                    Caption = 'S'#233'rie da NF Venda:'
                    FocusControl = DBEdit47
                  end
                  object Label74: TLabel
                    Left = 352
                    Top = 122
                    Width = 86
                    Height = 13
                    Caption = 'Aliq. Padrao ICMS'
                    FocusControl = DBEdit48
                  end
                  object Label205: TLabel
                    Left = 532
                    Top = 23
                    Width = 101
                    Height = 13
                    Caption = 'Serv Padrao Terceiro'
                    FocusControl = DBEdit140
                  end
                  object Label224: TLabel
                    Left = 532
                    Top = 45
                    Width = 102
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Conf Dife Entrada NF'
                  end
                  object Label225: TLabel
                    Left = 541
                    Top = 72
                    Width = 93
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Max Dif Entrada NF'
                    FocusControl = DBEdit158
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 167
                    Top = 15
                    Width = 134
                    Height = 21
                    Hint = 
                      'Define qual modelo de nota fiscal se trabalha, este modelo '#233' con' +
                      'figurado no sistema'
                    DataField = 'NOTA_FISCAL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    KeyField = 'CODIGO'
                    ListField = 'NOME_NF'
                    ListSource = DtmCadBasicos.dscabNF
                    TabOrder = 0
                  end
                  object DBEdit42: TDBEdit
                    Left = 167
                    Top = 42
                    Width = 80
                    Height = 21
                    Hint = 'Quantidade m'#225'xima de itens de servi'#231'os para a nota fiscal.'
                    DataField = 'QT_SERV_NF'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 1
                  end
                  object DBEdit43: TDBEdit
                    Left = 167
                    Top = 69
                    Width = 80
                    Height = 21
                    Hint = 'Quantidade de linhas para nota fiscal utilizada'
                    DataField = 'QTDE_LINHASNF'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 2
                  end
                  object DBComboBox17: TDBComboBox
                    Left = 167
                    Top = 95
                    Width = 80
                    Height = 21
                    Hint = 'Permitir imprimir uma nota em v'#225'rios formul'#225'rios s'#233'rie '#250'nica'
                    DataField = 'US_ROMANEIO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 3
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBEdit44: TDBEdit
                    Left = 167
                    Top = 119
                    Width = 80
                    Height = 21
                    Hint = 'Quantidade de caracteres para impress'#227'o dos itens na nota fiscal'
                    DataField = 'QTDE_CARAC_ITENSNF'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 4
                  end
                  object DBComboBox18: TDBComboBox
                    Left = 444
                    Top = 15
                    Width = 78
                    Height = 21
                    Hint = 
                      'Tamanho da letra na impress'#227'o de uma r'#233'gua para configurar a imp' +
                      'ress'#227'o de nf'
                    DataField = 'TAMANHOLETRA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'S05cpp'
                      'S10cpp'
                      'S12cpp'
                      'S17cpp'
                      'S20cpp')
                    TabOrder = 5
                    OnKeyPress = DBComboBox2KeyPress
                  end
                  object DBEdit45: TDBEdit
                    Left = 445
                    Top = 42
                    Width = 77
                    Height = 21
                    Hint = 'Quantidade m'#225'xima de itens de produtos para emiss'#227'o de nf'
                    DataField = 'QT_PROD_NF'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 6
                  end
                  object DBEdit46: TDBEdit
                    Left = 445
                    Top = 69
                    Width = 77
                    Height = 21
                    Hint = 'Al'#237'quota de iss Padr'#227'o que a empresa paga.'
                    DataField = 'ISS_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 7
                  end
                  object DBEdit47: TDBEdit
                    Left = 445
                    Top = 95
                    Width = 77
                    Height = 21
                    Hint = 'S'#233'rie de trabalho na nota fiscal de sa'#237'da'
                    DataField = 'SUB_SERIE'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 8
                  end
                  object DBEdit48: TDBEdit
                    Left = 444
                    Top = 119
                    Width = 80
                    Height = 21
                    Hint = 'Al'#237'quota Padr'#227'o utilizada pela empresa nas vendas de mercadoria'
                    DataField = 'ALIQPADRAO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 9
                  end
                  object DBEdit140: TDBEdit
                    Left = 640
                    Top = 15
                    Width = 80
                    Height = 21
                    Hint = 'Al'#237'quota Padr'#227'o utilizada pela empresa nas vendas de mercadoria'
                    DataField = 'COD_SERV_PADRAO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 10
                  end
                  object DBEdit158: TDBEdit
                    Left = 640
                    Top = 69
                    Width = 80
                    Height = 21
                    Hint = 
                      'Valor m'#225'ximo permitido de diferen'#231'a para os valores da nota fisc' +
                      'al de Entrada'
                    DataField = 'MAXIMO_DIFERENCA_ENTRADA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 12
                  end
                  object DBComboBox51: TDBComboBox
                    Left = 640
                    Top = 42
                    Width = 80
                    Height = 21
                    Hint = 'Conferir diferen'#231'a na nota fiscal de entrada'
                    DataField = 'CONFERIR_DIFERENCA_ENTRADA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'NAO')
                    TabOrder = 11
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Configura'#231#245'es do Sistema'
                ImageIndex = 2
                object PageControl2: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 455
                  ActivePage = TabSheet15
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  object TabSheet15: TTabSheet
                    Caption = 'Venda'
                    object PageControl7: TPageControl
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      ActivePage = TabSheet34
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      object TabSheet34: TTabSheet
                        Caption = '1'
                        object GroupBox11: TGroupBox
                          Left = 0
                          Top = -7
                          Width = 778
                          Height = 406
                          TabOrder = 0
                          object Label77: TLabel
                            Left = 106
                            Top = 11
                            Width = 76
                            Height = 13
                            Caption = 'Cabe'#231'alho Req.'
                          end
                          object Label78: TLabel
                            Left = 107
                            Top = 37
                            Width = 75
                            Height = 13
                            Caption = 'Cabe'#231'alho O.S.'
                          end
                          object Label79: TLabel
                            Left = 89
                            Top = 105
                            Width = 93
                            Height = 13
                            Caption = 'Aparelho Nos Serv.'
                          end
                          object Label80: TLabel
                            Left = 88
                            Top = 59
                            Width = 94
                            Height = 13
                            Caption = 'Qtd Casas Decimais'
                            FocusControl = DBEdit51
                          end
                          object Label81: TLabel
                            Left = 30
                            Top = 128
                            Width = 152
                            Height = 13
                            Caption = 'M'#225'ximo de Desconto Varejo(%)'
                            FocusControl = DBEdit52
                          end
                          object Label82: TLabel
                            Left = 32
                            Top = 151
                            Width = 150
                            Height = 13
                            Caption = 'M'#225'ximo Desconto Atacado:(%)'
                            FocusControl = DBEdit53
                          end
                          object Label83: TLabel
                            Left = 44
                            Top = 199
                            Width = 139
                            Height = 13
                            Caption = 'Mark up M'#237'nimo P/ Varejo(%)'
                            FocusControl = DBEdit54
                          end
                          object Label84: TLabel
                            Left = 35
                            Top = 223
                            Width = 148
                            Height = 13
                            Caption = 'Mark up M'#237'nimo P/ Atacado(%)'
                            FocusControl = DBEdit55
                          end
                          object Label85: TLabel
                            Left = 32
                            Top = 246
                            Width = 151
                            Height = 13
                            Caption = 'Arredondar pre'#231'os de produtos'
                          end
                          object Label88: TLabel
                            Left = 498
                            Top = 33
                            Width = 139
                            Height = 13
                            Caption = 'M'#237'nimo Margem(Lq) P/ Varejo'
                            FocusControl = DBEdit58
                          end
                          object Label89: TLabel
                            Left = 489
                            Top = 57
                            Width = 148
                            Height = 13
                            Caption = 'M'#237'nimo Margem(Lq) P/ Atacado'
                            FocusControl = DBEdit59
                          end
                          object Label90: TLabel
                            Left = 482
                            Top = 81
                            Width = 155
                            Height = 13
                            Caption = 'Max. Desconto em Parcelas(Cxl)'
                            FocusControl = DBEdit60
                          end
                          object Label91: TLabel
                            Left = 492
                            Top = 104
                            Width = 145
                            Height = 13
                            Caption = 'Perc. p/ Produto Marg. Minima'
                          end
                          object Label92: TLabel
                            Left = 477
                            Top = 128
                            Width = 160
                            Height = 13
                            Caption = 'Segmentar Produtos por Servi'#231'os'
                          end
                          object Label93: TLabel
                            Left = 470
                            Top = 151
                            Width = 167
                            Height = 13
                            Caption = 'Usar Controle de Estoque Fechado'
                          end
                          object Label94: TLabel
                            Left = 390
                            Top = 197
                            Width = 247
                            Height = 13
                            Caption = 'Atribuir data do servidor em fechamento de vendas'
                          end
                          object Label234: TLabel
                            Left = 429
                            Top = 247
                            Width = 208
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Tipo de venda padr'#227'o para o Venda R'#225'pida'
                          end
                          object Label_QuitarBoleto: TLabel
                            Left = 508
                            Top = 291
                            Width = 129
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Quitar boleto pelo sistema:'
                          end
                          object Label235: TLabel
                            Left = 41
                            Top = 269
                            Width = 141
                            Height = 13
                            Caption = 'M'#225'scara de D'#237'gitos no Grupo:'
                          end
                          object Label237: TLabel
                            Left = 6
                            Top = 291
                            Width = 179
                            Height = 13
                            Caption = 'M'#225'scara de D'#237'gitos no Cod. Empresa:'
                          end
                          object Label238: TLabel
                            Left = 41
                            Top = 313
                            Width = 142
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Imprimir boleto na nota fiscal:'
                          end
                          object Label257: TLabel
                            Left = 19
                            Top = 335
                            Width = 164
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Imprimir boleto na (REQ/OS/REC):'
                          end
                          object Label258: TLabel
                            Left = 383
                            Top = 269
                            Width = 254
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Tipo de Or'#231'amento padr'#227'o para o Or'#231'amento R'#225'pido'
                          end
                          object Label278: TLabel
                            Left = 21
                            Top = 174
                            Width = 162
                            Height = 13
                            Caption = 'Checar Mark up M'#237'nimo na Venda:'
                            FocusControl = DBEdit54
                          end
                          object Label293: TLabel
                            Left = 423
                            Top = 360
                            Width = 127
                            Height = 13
                            Caption = 'Ordem do Pre'#231'o de Tabela'
                          end
                          object SpeedButton10: TSpeedButton
                            Left = 711
                            Top = 378
                            Width = 23
                            Height = 21
                            Flat = True
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000E30E0000E30E0000000100000001000010630000006B
                              0000086B00000073000008730000007B0000107B000000840000088400001084
                              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                              000008630800087B0800107B080010840800008C0800088C0800009408001094
                              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                              1000187B10001084100018841000088C1000188C1000109410001894100010D6
                              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                              210018842100189421002194210029A521001873290029AD290031DE290029E7
                              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
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
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                              774F4F777777777777777777777777774F41464F77777777777777777777774F
                              345757414F7777777777777777774F34574B4C57334F777777777777774F2957
                              4105033657294F77777777774F2D57390507051B37572D4F7777774F35084407
                              07070707074308384F774F393D0B0A1E1E1E1E0C0A0C0A3B3B4F2F120E0E1F0A
                              0E0C200C0D0C0E210E4477777777131012121210241277777777777777772513
                              13131313132577777777777777773F1414141414143F77777777777777775216
                              1516161616527777777777777777554017171717405677777777777777775C58
                              585D5E5859627777777777777777122221100F0E201277777777}
                            ParentShowHint = False
                            ShowHint = True
                            OnClick = SpeedButton10Click
                          end
                          object SpeedButton9: TSpeedButton
                            Left = 711
                            Top = 355
                            Width = 23
                            Height = 21
                            Flat = True
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000E30E0000E30E0000000100000001000010630000006B
                              0000086B00000073000008730000007B0000107B000000840000088400001084
                              0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                              000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                              000008630800087B0800107B080010840800008C0800088C0800009408001094
                              0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                              1000187B10001084100018841000088C1000188C1000109410001894100010D6
                              100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                              18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                              210018842100189421002194210029A521001873290029AD290031DE290029E7
                              290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                              420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                              63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                              7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                              C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                              DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
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
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777771220
                              0E0F1021221277777777777777776259585E5D58585C77777777777777775640
                              1717171740557777777777777777521616161615165277777777777777773F14
                              14141414143F7777777777777777251313131313132577777777777777771224
                              10121212101377777777440E210E0C0D0C200C0E0A1F0E0E122F4F3B3B0A0C0A
                              0C1E1E1E1E0A0B3D394F774F3808430707070707074408354F7777774F2D5737
                              1B05070539572D4F77777777774F29573603054157294F777777777777774F33
                              574C4B57344F7777777777777777774F415757344F7777777777777777777777
                              4F46414F777777777777777777777777774F4F77777777777777}
                            ParentShowHint = False
                            ShowHint = True
                            OnClick = SpeedButton9Click
                          end
                          object Label304: TLabel
                            Left = 522
                            Top = 335
                            Width = 115
                            Height = 13
                            Caption = 'Repetir Itens na Venda:'
                          end
                          object Label346: TLabel
                            Left = 429
                            Top = 221
                            Width = 208
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Tipo de venda padr'#227'o para a Venda Normal'
                          end
                          object Label356: TLabel
                            Left = 49
                            Top = 82
                            Width = 133
                            Height = 13
                            Caption = 'Vincular Veic/Obj ao Servi'#231'o'
                          end
                          object Label375: TLabel
                            Left = 400
                            Top = 174
                            Width = 237
                            Height = 13
                            Caption = 'Utilizar o Cliente no Controle de Estoque Fechado'
                          end
                          object Label420: TLabel
                            Left = 401
                            Top = 313
                            Width = 236
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'N'#227'o Verificar CNPJ da Empresa ao quitar Boletos:'
                          end
                          object Label447: TLabel
                            Left = 44
                            Top = 359
                            Width = 138
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Enviar email email marketing:'
                          end
                          object DBComboBox19: TDBComboBox
                            Left = 188
                            Top = 7
                            Width = 116
                            Height = 21
                            Hint = 'Padr'#227'o de cabe'#231'alho para Requisi'#231#227'o'
                            DataField = 'CABREQ'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'REDUZIDO'
                              'DETALHADO')
                            TabOrder = 0
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox20: TDBComboBox
                            Left = 188
                            Top = 34
                            Width = 116
                            Height = 21
                            Hint = 'Padr'#227'o de cabe'#231'alho para a O.S. na impress'#227'o'
                            DataField = 'CABOS'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'REDUZIDO'
                              'DETALHADO')
                            TabOrder = 1
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox21: TDBComboBox
                            Left = 188
                            Top = 102
                            Width = 72
                            Height = 21
                            Hint = 'Indica se a empresa trabalha com Aparelhos ou Ve'#237'culos'
                            DataField = 'DADVAP'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 4
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBEdit51: TDBEdit
                            Left = 188
                            Top = 56
                            Width = 64
                            Height = 21
                            Hint = 
                              'Quantidade de Casas decimais que o sistema ir'#225' trabalhar nos cam' +
                              'pos de valores'
                            DataField = 'CASAS_DECIMAIS'
                            DataSource = DtmCadBasicos.dsEmpresa
                            TabOrder = 2
                          end
                          object DBEdit52: TDBEdit
                            Left = 188
                            Top = 125
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [M'#225'ximo de desconto permitido na ven' +
                              'da varejo]'
                            Color = cl3DLight
                            DataField = 'TOTDESC_EMP'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 5
                          end
                          object DBEdit53: TDBEdit
                            Left = 188
                            Top = 148
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [M'#225'ximo de desconto permitido na ven' +
                              'da atacado]'
                            Color = cl3DLight
                            DataField = 'TOTDESC_EMPA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 6
                          end
                          object DBEdit54: TDBEdit
                            Left = 188
                            Top = 196
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [Mark Up bruto minimo de venda no va' +
                              'rejo]'
                            Color = cl3DLight
                            DataField = 'MIN_MARGEM_V'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 8
                          end
                          object DBEdit55: TDBEdit
                            Left = 188
                            Top = 220
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [Mark Up bruto minimo de venda no at' +
                              'acado]'
                            Color = cl3DLight
                            DataField = 'MIN_MARGEM_A'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 9
                          end
                          object DBComboBox22: TDBComboBox
                            Left = 188
                            Top = 243
                            Width = 72
                            Height = 21
                            Hint = 'Arredondamento do pre'#231'o de venda calculado pela entrada de nf'
                            DataField = 'ARREDONDA_PRECO'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              ''
                              '0,90'
                              '0,99'
                              '0,50')
                            TabOrder = 10
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBEdit58: TDBEdit
                            Left = 643
                            Top = 30
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [Margem m'#237'nima para varejo (Valor L'#237 +
                              'quido)]'
                            Color = cl3DLight
                            DataField = 'MIN_M_LQ_V'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 16
                          end
                          object DBEdit59: TDBEdit
                            Left = 643
                            Top = 54
                            Width = 116
                            Height = 21
                            Hint = 
                              'Informar o valor para deste campo no cadastro de tipos de vendas' +
                              ' para cada tipo de venda -> [Margem m'#237'nima para atacado (Valor L' +
                              #237'quido)]'
                            Color = cl3DLight
                            DataField = 'MIN_M_LQ_A'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ReadOnly = True
                            TabOrder = 17
                          end
                          object DBEdit60: TDBEdit
                            Left = 643
                            Top = 78
                            Width = 116
                            Height = 21
                            Hint = 
                              'M'#225'ximo de desconto permitido para parcelas recebidas no caixa au' +
                              'xiliar'
                            DataField = 'MAXDESCPARC'
                            DataSource = DtmCadBasicos.dsEmpresa
                            TabOrder = 18
                          end
                          object DBComboBox23: TDBComboBox
                            Left = 643
                            Top = 101
                            Width = 65
                            Height = 21
                            Hint = 
                              'Utilizar por produto a margem m'#237'nima estabelecida nos campos M'#237'n' +
                              'imo Margem(Lq) Varejo ou Atacado'
                            DataField = 'US_MINM_PROD'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 19
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox24: TDBComboBox
                            Left = 643
                            Top = 125
                            Width = 65
                            Height = 21
                            Hint = 
                              'Fazer com que o sistema pe'#231'a o tipo de servi'#231'o no momento da ven' +
                              'da'
                            DataField = 'SEG_PROD_SERV'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'N'
                              'S1'
                              'S2')
                            TabOrder = 20
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox25: TDBComboBox
                            Left = 643
                            Top = 148
                            Width = 65
                            Height = 21
                            Hint = 'Utilizar o sistema de almoxarifado'
                            DataField = 'ALMOX'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'N'
                              'S1'
                              'S2')
                            TabOrder = 21
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox26: TDBComboBox
                            Left = 643
                            Top = 194
                            Width = 65
                            Height = 21
                            Hint = 'Atribuir data do servidor  em fechamento de vendas'
                            DataField = 'ATRIBUIR_DATA_SERVIDOR'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 22
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox57: TDBComboBox
                            Left = 643
                            Top = 244
                            Width = 65
                            Height = 21
                            Hint = 'Tipo de venda padr'#227'o para a Venda R'#225'pida'
                            DataField = 'TIPV_VENDARAPIDA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'V - VAREJO'
                              'A - ATACADO'
                              'C - CONSIGNADO'
                              'T - TELEVENDA'
                              'L - APLICADORES'
                              'O - OUTRAS EMPRESAS'
                              'P - PRODU'#199#195'O'
                              'S - CONSUMO'
                              'E - ESCOLHA')
                            TabOrder = 24
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox_QuitarBoleto: TDBComboBox
                            Left = 643
                            Top = 288
                            Width = 65
                            Height = 21
                            Hint = 'Quitar boleto pelo sistema'
                            DataField = 'QUITARBOLETOPELOSISTEMA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 26
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox59: TDBComboBox
                            Left = 188
                            Top = 266
                            Width = 72
                            Height = 21
                            Hint = 
                              'M'#225'scara de D'#237'gitos no Grupo do Produto na gera'#231#227'o e leitura de c' +
                              #243'digos de barra'
                            DataField = 'DIGITOSGRUP'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              '1'
                              '2'
                              '3')
                            TabOrder = 11
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox60: TDBComboBox
                            Left = 188
                            Top = 288
                            Width = 66
                            Height = 21
                            Hint = 
                              'M'#225'scara de D'#237'gitos no C'#243'digo da Empresa na gera'#231#227'o e leitura de ' +
                              'c'#243'digo de barras que contenham grade.'
                            DataField = 'DIGITOSEMP'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              '0'
                              '1'
                              '2')
                            TabOrder = 12
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox61: TDBComboBox
                            Left = 188
                            Top = 310
                            Width = 66
                            Height = 21
                            Hint = 'Imprimir boleto na nota fiscal:'
                            DataField = 'IMPRIMIRBOLETONF'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 13
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox62: TDBComboBox
                            Left = 188
                            Top = 332
                            Width = 66
                            Height = 21
                            Hint = 'Imprimir boleto na ordem de servi'#231'o:'
                            DataField = 'IMPRIMIRBOLETO_OS'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 14
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox63: TDBComboBox
                            Left = 643
                            Top = 266
                            Width = 65
                            Height = 21
                            Hint = 'Tipo de Or'#231'amento padr'#227'o para o Or'#231'amento R'#225'pido'
                            DataField = 'TIPOORC_ORCRAPIDO'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'T - TERCEIRO'
                              'O - OFICINA'
                              'E - ESCOLHA')
                            TabOrder = 25
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox68: TDBComboBox
                            Left = 188
                            Top = 171
                            Width = 66
                            Height = 21
                            Hint = 'Checar Mark up M'#237'nimo na Venda:'
                            DataField = 'USARMARKUPPRODVND'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 7
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object ListBox1: TListBox
                            Left = 557
                            Top = 355
                            Width = 151
                            Height = 47
                            ItemHeight = 13
                            TabOrder = 28
                          end
                          object DBComboBox82: TDBComboBox
                            Left = 643
                            Top = 332
                            Width = 66
                            Height = 21
                            Hint = 'Repetir Itens na Venda'
                            DataField = 'REPETIR_ITEMVND'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 27
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox95: TDBComboBox
                            Left = 643
                            Top = 218
                            Width = 65
                            Height = 21
                            Hint = 'Tipo de venda padr'#227'o para a Venda Normal'
                            DataField = 'TIPV_VENDAPADRAO'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'V - VAREJO'
                              'A - ATACADO'
                              'C - CONSIGNADO'
                              'T - TELEVENDA'
                              'L - APLICADORES'
                              'O - OUTRAS EMPRESAS'
                              'P - PRODU'#199#195'O'
                              'S - CONSUMO'
                              'E - ESCOLHA')
                            TabOrder = 23
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox100: TDBComboBox
                            Left = 188
                            Top = 79
                            Width = 72
                            Height = 21
                            Hint = 'Indica se a empresa trabalha com Aparelhos ou Ve'#237'culos'
                            DataField = 'VINCULAR_VEIC_OBJ'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O'
                              'ESCOLHER')
                            TabOrder = 3
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox113: TDBComboBox
                            Left = 643
                            Top = 171
                            Width = 65
                            Height = 21
                            Hint = 'Usar o Cliente no Controle de Estoque Fechado'
                            DataField = 'CLIENTE_ALMOX'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 29
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox135: TDBComboBox
                            Left = 643
                            Top = 310
                            Width = 65
                            Height = 21
                            Hint = 'N'#227'o Verificar CNPJ ao quitar os arquivos de retorno'
                            DataField = 'NAOVERIF_EMP_ARQRETORNO'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 30
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox150: TDBComboBox
                            Left = 188
                            Top = 354
                            Width = 66
                            Height = 21
                            Hint = 'Enviar email email marketing:'
                            DataField = 'ENV_MAIL_MARK'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 15
                            OnKeyPress = DBComboBox19KeyPress
                          end
                        end
                      end
                      object TabSheet35: TTabSheet
                        Caption = '2'
                        ImageIndex = 1
                        object Panel10: TPanel
                          Left = 0
                          Top = 0
                          Width = 759
                          Height = 393
                          Align = alClient
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 0
                          object Label287: TLabel
                            Left = 317
                            Top = 11
                            Width = 360
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 
                              'Usar aprova'#231#227'o de pedidos pelo gerente conforme definido no Tipo' +
                              ' Vendas'
                          end
                          object Label288: TLabel
                            Left = 25
                            Top = 11
                            Width = 173
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Usar Controle Interno de Devolu'#231#227'o'
                          end
                          object Label289: TLabel
                            Left = 332
                            Top = 38
                            Width = 345
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 
                              'Montar Requisi'#231#227'o automaticamente ao Emitir NF para baixa de est' +
                              'oque'
                          end
                          object Label294: TLabel
                            Left = 349
                            Top = 65
                            Width = 328
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 
                              'Selecionar o cliente ao iniciar uma venda r'#225'pida ou or'#231'amento r'#225 +
                              'pido'
                          end
                          object Label358: TLabel
                            Left = 43
                            Top = 33
                            Width = 155
                            Height = 26
                            Alignment = taRightJustify
                            Caption = 'Definir controles no cliente para montar forma de pagamento'
                            WordWrap = True
                          end
                          object Label359: TLabel
                            Left = 46
                            Top = 92
                            Width = 152
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'Usar uma venda por Nota Fiscal'
                          end
                          object Label360: TLabel
                            Left = 41
                            Top = 61
                            Width = 157
                            Height = 26
                            Alignment = taRightJustify
                            Caption = 'Habilitar controle na venda para montar forma de pagamento'
                            WordWrap = True
                          end
                          object Label362: TLabel
                            Left = 333
                            Top = 92
                            Width = 344
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 
                              'Percentual M'#225'ximo de desconto a vista a ser permitido no Caixa A' +
                              'uxiliar'
                          end
                          object Label400: TLabel
                            Left = 382
                            Top = 114
                            Width = 295
                            Height = 26
                            Alignment = taRightJustify
                            Caption = 
                              'Percentual de Tolerancia na Venda a menor do MarkUp ou no percen' +
                              'tual de desconto a maior que  o m'#225'ximo permitido'
                            FocusControl = DBEdit221
                            WordWrap = True
                          end
                          object Label401: TLabel
                            Left = 60
                            Top = 113
                            Width = 138
                            Height = 26
                            Alignment = taRightJustify
                            Caption = 'Usar pol'#237'ticas de pagamento ao confirmar venda'
                            WordWrap = True
                          end
                          object Label402: TLabel
                            Left = 485
                            Top = 146
                            Width = 192
                            Height = 13
                            Caption = 'Fechar venda Ap'#243's Financeiro Autorizar'
                          end
                          object Label433: TLabel
                            Left = 421
                            Top = 173
                            Width = 256
                            Height = 26
                            Alignment = taRightJustify
                            Caption = 
                              'Abater itens de uma venda previamente configurada no tipos venda' +
                              ' ao realizar uma nova venda'
                            WordWrap = True
                          end
                          object Label444: TLabel
                            Left = 25
                            Top = 142
                            Width = 169
                            Height = 26
                            Caption = 'Data de vencimento para incluir ou alterar itens na venda'
                            WordWrap = True
                          end
                          object Label442: TLabel
                            Left = 44
                            Top = 173
                            Width = 154
                            Height = 13
                            Caption = 'Usar separa'#231#227'o no Pedido(REQ)'
                          end
                          object DBComboBox77: TDBComboBox
                            Left = 683
                            Top = 8
                            Width = 65
                            Height = 21
                            Hint = 'Usar aprova'#231#227'o de venda pelo Gerente'
                            DataField = 'VENDA_APROVACAO_GERENCIA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 7
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox78: TDBComboBox
                            Left = 204
                            Top = 8
                            Width = 65
                            Height = 21
                            Hint = 'Usar Controle Interno de Devolu'#231#227'o'
                            DataField = 'USAR_DEVOLUCAO_INTERNA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 0
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox79: TDBComboBox
                            Left = 683
                            Top = 35
                            Width = 65
                            Height = 21
                            Hint = 
                              'Montar Requisi'#231#227'o automaticamente ao Emitir NF para baixa de est' +
                              'oque'
                            DataField = 'MONTAR_REQ_AUT_NF'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 8
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox81: TDBComboBox
                            Left = 683
                            Top = 62
                            Width = 65
                            Height = 21
                            Hint = 
                              'Exibir op'#231#227'o de selecionar o cliente da venda r'#225'pida ou do or'#231'am' +
                              'ento r'#225'pido antes de incluir os itens da venda.'
                            DataField = 'CLI_INICIOVND_RAPIDA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 9
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox101: TDBComboBox
                            Left = 204
                            Top = 35
                            Width = 65
                            Height = 21
                            Hint = 'Ativa as formas de pagamento no cadastro do cliente e na venda'
                            DataField = 'USAR_CONTROLE_FP_CLIENTE'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 1
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox102: TDBComboBox
                            Left = 204
                            Top = 89
                            Width = 65
                            Height = 21
                            Hint = 'Ativa o uso de apenas uma venda por Nota Fiscal'
                            DataField = 'USAR_UMA_VND_POR_NF'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 3
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox103: TDBComboBox
                            Left = 204
                            Top = 62
                            Width = 65
                            Height = 21
                            Hint = 'Usar politicas de pagamento da Venda'
                            Color = cl3DLight
                            DataField = 'USAR_CONTROLE_FP_VENDA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            Enabled = False
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            ReadOnly = True
                            TabOrder = 2
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBEdit209: TDBEdit
                            Left = 683
                            Top = 89
                            Width = 65
                            Height = 21
                            Hint = 
                              'Percentual M'#225'ximo de desconto a vista a ser permitido no Caixa A' +
                              'uxiliar'
                            DataField = 'MAX_DESC_AVISTA'
                            DataSource = DtmCadBasicos.dsEmpresa
                            TabOrder = 10
                          end
                          object GroupBox31: TGroupBox
                            Left = 0
                            Top = 259
                            Width = 755
                            Height = 130
                            Align = alBottom
                            Caption = 
                              'Configura'#231#245'es para envio de e-mail  do DAV (Ser'#225' utilizado as co' +
                              'nfigura'#231#245'es de email existentes na cartas de cobran'#231'a)'
                            TabOrder = 14
                            object Label377: TLabel
                              Left = 97
                              Top = 51
                              Width = 88
                              Height = 13
                              Caption = 'Mensagem padr'#227'o'
                              FocusControl = DBMemo6
                            end
                            object Label378: TLabel
                              Left = 109
                              Top = 24
                              Width = 76
                              Height = 13
                              Caption = 'Assunto padr'#227'o'
                              FocusControl = DBEdit214
                            end
                            object DBEdit214: TDBEdit
                              Tag = 1
                              Left = 191
                              Top = 21
                              Width = 420
                              Height = 21
                              DataField = 'ASSUNTO_DAV'
                              DataSource = DtmCadBasicos.dsEmpresa
                              TabOrder = 0
                            end
                            object DBMemo6: TDBMemo
                              Tag = 1
                              Left = 190
                              Top = 48
                              Width = 421
                              Height = 73
                              DataField = 'MSG_DAV'
                              DataSource = DtmCadBasicos.dsEmpresa
                              TabOrder = 1
                            end
                          end
                          object DBEdit221: TDBEdit
                            Left = 683
                            Top = 116
                            Width = 65
                            Height = 21
                            Hint = 
                              'Percentual de Tolerancia na Venda a menor do MarkUp ou no percen' +
                              'tual de desconto a maior que  o m'#225'ximo permitido. Exemplos: 0,01' +
                              '%;  0,02% '
                            DataField = 'VND_TOLER_PERC_MARKUP'
                            DataSource = DtmCadBasicos.dsEmpresa
                            TabOrder = 11
                          end
                          object DBComboBox122: TDBComboBox
                            Left = 204
                            Top = 116
                            Width = 65
                            Height = 21
                            Hint = 'Usar pol'#237'ticas de desconto na venda'
                            DataField = 'USARPOLITICASDESC'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 4
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox123: TDBComboBox
                            Left = 683
                            Top = 143
                            Width = 65
                            Height = 21
                            Hint = 'Fechar venda Ap'#243's Financeiro Autorizar'
                            DataField = 'VND_FECH_DEPOIS_DE_AUT'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 12
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBComboBox116: TDBComboBox
                            Left = 683
                            Top = 170
                            Width = 65
                            Height = 21
                            Hint = 
                              'Abater itens ao realizar uma nova venda. '#201' necess'#225'rio configurar' +
                              ' no tipos venda para abater os itens.'
                            CharCase = ecUpperCase
                            DataField = 'ABATER_ITENS'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 13
                            OnKeyPress = DBComboBox19KeyPress
                          end
                          object DBEdit241: TDBEdit
                            Left = 204
                            Top = 143
                            Width = 85
                            Height = 21
                            Hint = 'Data de vencimento para incluir ou alterar itens na venda'
                            DataField = 'VENC_UI_ITENSVND'
                            DataSource = DtmCadBasicos.dsEmpresa
                            TabOrder = 5
                          end
                          object DBComboBox146: TDBComboBox
                            Left = 204
                            Top = 170
                            Width = 65
                            Height = 21
                            Hint = 'Usar separa'#231#227'o no Pedido(REQ)'
                            DataField = 'USAR_SEPARACAO_PED'
                            DataSource = DtmCadBasicos.dsEmpresa
                            ItemHeight = 13
                            Items.Strings = (
                              'SIM'
                              'N'#195'O')
                            TabOrder = 6
                            OnKeyPress = DBComboBox19KeyPress
                          end
                        end
                      end
                    end
                  end
                  object TabSheet16: TTabSheet
                    Caption = 'CRM'
                    ImageIndex = 1
                    object GroupBox12: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 139
                      Align = alTop
                      Caption = 'P'#243's Vendas'
                      TabOrder = 0
                      object Label97: TLabel
                        Left = 122
                        Top = 14
                        Width = 81
                        Height = 13
                        Caption = 'M. Ret. Veiculo 1'
                        FocusControl = DBEdit63
                      end
                      object Label98: TLabel
                        Left = 134
                        Top = 39
                        Width = 69
                        Height = 13
                        Caption = 'KM Ret. Veic 1'
                        FocusControl = DBEdit64
                      end
                      object Label99: TLabel
                        Left = 122
                        Top = 64
                        Width = 81
                        Height = 13
                        Caption = 'M. Ret. Veiculo 2'
                        FocusControl = DBEdit65
                      end
                      object Label100: TLabel
                        Left = 134
                        Top = 89
                        Width = 69
                        Height = 13
                        Caption = 'KM Ret. Veic 2'
                        FocusControl = DBEdit66
                      end
                      object Label380: TLabel
                        Left = 52
                        Top = 113
                        Width = 151
                        Height = 13
                        Caption = 'Intervalo de KM entre Revis'#245'es'
                        FocusControl = DBEdit216
                      end
                      object DBEdit63: TDBEdit
                        Left = 209
                        Top = 11
                        Width = 116
                        Height = 21
                        Hint = 
                          'Quantidade de meses para sugerir a primeira revis'#227'o gratuita pel' +
                          'a concession'#225'ria'
                        DataField = 'MES_RET_SERV1'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit64: TDBEdit
                        Left = 209
                        Top = 36
                        Width = 116
                        Height = 21
                        Hint = 
                          'Kilometragem para sugest'#227'o da primeira revis'#227'o gratuita pela con' +
                          'cession'#225'ria'
                        DataField = 'KM_RET_SERV1'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit65: TDBEdit
                        Left = 209
                        Top = 61
                        Width = 116
                        Height = 21
                        Hint = 
                          'Quantidade de meses para sugerir a segunda revis'#227'o gratuita pela' +
                          ' concession'#225'ria'
                        DataField = 'MES_RET_SERV3'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit66: TDBEdit
                        Left = 209
                        Top = 86
                        Width = 116
                        Height = 21
                        Hint = 
                          'Kilometragem para sugest'#227'o da segunda revis'#227'o gratuita pela conc' +
                          'ession'#225'ria'
                        DataField = 'KM_RET_SERV3'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit216: TDBEdit
                        Left = 208
                        Top = 111
                        Width = 117
                        Height = 21
                        Hint = 'Intervalo padr'#227'o de kilometragem entre uma revis'#227'o e outra.'
                        DataField = 'INTERV_KM_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                    object GroupBox26: TGroupBox
                      Left = 0
                      Top = 139
                      Width = 767
                      Height = 104
                      Align = alTop
                      Caption = 'Televendas'
                      TabOrder = 1
                      object Label307: TLabel
                        Left = 152
                        Top = 24
                        Width = 328
                        Height = 13
                        Caption = 
                          'Dias de intervalo padr'#227'o para contato com o cliente pelo Televen' +
                          'das'
                        FocusControl = DBEdit200
                      end
                      object Label325: TLabel
                        Left = 12
                        Top = 51
                        Width = 468
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Qtde em dias sem compras fechadas ou pendentes  para remover cli' +
                          'ente da carteira do vendedor'
                        FocusControl = DBEdit201
                      end
                      object Label327: TLabel
                        Left = 92
                        Top = 78
                        Width = 388
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Associar cliente a carteira do vendedor quando efetuar a venda p' +
                          'elo Televendas'
                      end
                      object DBEdit200: TDBEdit
                        Left = 486
                        Top = 16
                        Width = 61
                        Height = 21
                        DataField = 'DIAS_CONTATO_TLV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit201: TDBEdit
                        Left = 486
                        Top = 43
                        Width = 61
                        Height = 21
                        DataField = 'QTDE_DIAS_SEM_COMP_CART'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBComboBox88: TDBComboBox
                        Left = 486
                        Top = 70
                        Width = 61
                        Height = 21
                        DataField = 'ASSOCIAR_CART_VND_TLV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Sim'
                          'Nao')
                        TabOrder = 2
                        OnKeyPress = DBComboBox1KeyPress
                      end
                    end
                  end
                  object TabSheet17: TTabSheet
                    Caption = 'Sugest'#227'o de Compra'
                    ImageIndex = 2
                    object GroupBox13: TGroupBox
                      Left = 5
                      Top = 10
                      Width = 471
                      Height = 103
                      Caption = 'Dados Sugest'#227'o de Compra'
                      TabOrder = 0
                      object Label101: TLabel
                        Left = 42
                        Top = 31
                        Width = 108
                        Height = 13
                        Caption = 'Tempo Processamento'
                        FocusControl = DBEdit67
                      end
                      object Label102: TLabel
                        Left = 62
                        Top = 55
                        Width = 88
                        Height = 13
                        Caption = 'Tempo de Entrega'
                        FocusControl = DBEdit68
                      end
                      object Label103: TLabel
                        Left = 246
                        Top = 31
                        Width = 93
                        Height = 13
                        Caption = 'Tempo de Aloca'#231#227'o'
                        FocusControl = DBEdit69
                      end
                      object Label104: TLabel
                        Left = 251
                        Top = 55
                        Width = 88
                        Height = 13
                        Caption = 'Frequ'#234'ncia Pedido'
                        FocusControl = DBEdit70
                      end
                      object Label196: TLabel
                        Left = 5
                        Top = 79
                        Width = 145
                        Height = 13
                        Caption = 'Estoque de Seguran'#231'a Padr'#227'o'
                        FocusControl = DBEdit139
                      end
                      object DBEdit67: TDBEdit
                        Left = 154
                        Top = 28
                        Width = 80
                        Height = 21
                        Hint = 
                          'Tempo de Processamento padr'#227'o para a montar o tempo c'#237'clico da s' +
                          'ugest'#227'o de compras'
                        DataField = 'TP_SUG'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit68: TDBEdit
                        Left = 154
                        Top = 52
                        Width = 80
                        Height = 21
                        Hint = 'Tempo de entrega do fornecedor para a empresa'
                        DataField = 'TE_SUG'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit69: TDBEdit
                        Left = 345
                        Top = 28
                        Width = 80
                        Height = 21
                        Hint = 'Tempo de aloca'#231#227'o da empresa para sugest'#227'o de compras'
                        DataField = 'TA_SUG'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit70: TDBEdit
                        Left = 345
                        Top = 52
                        Width = 80
                        Height = 21
                        Hint = 'Frequencia de pedido junto ao fornecedor'
                        DataField = 'FP_SUG'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit139: TDBEdit
                        Left = 154
                        Top = 76
                        Width = 80
                        Height = 21
                        Hint = 'Estoque de seguran'#231'a padr'#227'o para produtos.'
                        DataField = 'EST_SEGURACAPROD'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                  end
                  object TabSheet18: TTabSheet
                    Caption = 'Outras'
                    ImageIndex = 3
                    object Label75: TLabel
                      Left = 264
                      Top = 16
                      Width = 98
                      Height = 13
                      Caption = 'Porta da Impressora'
                      FocusControl = DBEdit49
                    end
                    object Label76: TLabel
                      Left = 306
                      Top = 43
                      Width = 56
                      Height = 13
                      Caption = 'Calculadora'
                      FocusControl = DBEdit50
                    end
                    object Label236: TLabel
                      Left = 219
                      Top = 70
                      Width = 143
                      Height = 13
                      Caption = 'Codigo Sequencial no Produto'
                    end
                    object Label260: TLabel
                      Left = 191
                      Top = 97
                      Width = 171
                      Height = 13
                      Caption = 'Responsavel pela c'#243'pia do HwF.fdb'
                    end
                    object Label366: TLabel
                      Left = 168
                      Top = 151
                      Width = 194
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cadastrar cliente como Consumidor Final'
                    end
                    object Label367: TLabel
                      Left = 47
                      Top = 178
                      Width = 315
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliquota padr'#227'o dos Tributos  para Servi'#231'os (De Olho no Imposto)'
                      FocusControl = DBEdit211
                    end
                    object Label368: TLabel
                      Left = 48
                      Top = 205
                      Width = 318
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliquota padr'#227'o dos Tributos  para Produtos (De Olho no Imposto)'
                      FocusControl = DBEdit212
                    end
                    object Label369: TLabel
                      Left = 114
                      Top = 232
                      Width = 248
                      Height = 13
                      Caption = 'Usar valor das devolu'#231#227'o no recebimento do Pedido'
                    end
                    object Label379: TLabel
                      Left = 205
                      Top = 124
                      Width = 157
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Diret'#243'rio para disponibilizar HwF:'
                      FocusControl = DBEdit215
                    end
                    object Label381: TLabel
                      Left = 173
                      Top = 259
                      Width = 189
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar Logo nos relat'#243'rios Crystal Report'
                    end
                    object DBEdit49: TDBEdit
                      Left = 368
                      Top = 13
                      Width = 116
                      Height = 21
                      Hint = 'Porta padr'#227'o da impressora'
                      DataField = 'PORTA_IMPRESSAO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 0
                    end
                    object DBEdit50: TDBEdit
                      Left = 368
                      Top = 40
                      Width = 278
                      Height = 21
                      Hint = 
                        'Diret'#243'rio onde est'#225' localizado o programa de calculadora seja do' +
                        ' windows ou do sistema'
                      DataField = 'CALCULADORA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 1
                    end
                    object BitBtn7: TBitBtn
                      Left = 652
                      Top = 40
                      Width = 25
                      Height = 21
                      Caption = '...'
                      TabOrder = 2
                      OnClick = BitBtn7Click
                    end
                    object DBComboBox58: TDBComboBox
                      Left = 368
                      Top = 67
                      Width = 134
                      Height = 21
                      Hint = 
                        'Indica que o sistema ir'#225' utilizar o c'#243'digo sequencial ou atrav'#233'z' +
                        ' do grupo'
                      DataField = 'CODIGO_PRODUTO_SEQUENCIAL'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'Sim'
                        'Nao')
                      TabOrder = 3
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBComboBox65: TDBComboBox
                      Left = 368
                      Top = 94
                      Width = 134
                      Height = 21
                      DataField = 'COPIAR_HWF_TERM_RET'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'Terminal'
                        'Retaguarda')
                      TabOrder = 4
                    end
                    object DBComboBox107: TDBComboBox
                      Left = 368
                      Top = 148
                      Width = 134
                      Height = 21
                      DataField = 'PADRAO_CONSUMIDOR_FINAL'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 6
                    end
                    object DBEdit211: TDBEdit
                      Left = 368
                      Top = 175
                      Width = 134
                      Height = 21
                      DataField = 'ALIQ_TRIB_SERV'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 7
                    end
                    object DBEdit212: TDBEdit
                      Left = 368
                      Top = 202
                      Width = 134
                      Height = 21
                      DataField = 'ALIQ_TRIB_PROD'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 8
                    end
                    object DBComboBox108: TDBComboBox
                      Left = 368
                      Top = 229
                      Width = 134
                      Height = 21
                      DataField = 'USAR_VR_DEV_FORMPAG'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 9
                    end
                    object DBEdit215: TDBEdit
                      Tag = 1
                      Left = 368
                      Top = 121
                      Width = 366
                      Height = 21
                      Hint = 
                        'Diret'#243'rio onde est'#225' localizado o programa de calculadora seja do' +
                        ' windows ou do sistema'
                      DataField = 'DIRETORIO_HWF_TERM'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 5
                    end
                    object BitBtn14: TBitBtn
                      Left = 740
                      Top = 121
                      Width = 25
                      Height = 21
                      Caption = '...'
                      TabOrder = 10
                      OnClick = BitBtn14Click
                    end
                    object DBComboBox114: TDBComboBox
                      Left = 368
                      Top = 256
                      Width = 65
                      Height = 21
                      Hint = 'Usar logo exibida nas notafiscais'
                      DataField = 'USAR_LOGO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 11
                      OnKeyPress = DBComboBox19KeyPress
                    end
                  end
                  object TabSheet19: TTabSheet
                    Caption = 'Nota Fiscal'
                    ImageIndex = 4
                    object Label195: TLabel
                      Left = 306
                      Top = 15
                      Width = 99
                      Height = 13
                      Caption = 'Usar Regras do NCM'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label202: TLabel
                      Left = 161
                      Top = 39
                      Width = 244
                      Height = 13
                      Caption = 'Desconsiderar ICMS na Importa'#231#227'o de Xml de NF-e'
                    end
                    object Label233: TLabel
                      Left = 58
                      Top = 64
                      Width = 347
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 
                        'Usar regra de combina'#231#227'o CFOP e CST do cadastro de CFOP na Entra' +
                        'da'
                    end
                    object Label232: TLabel
                      Left = 70
                      Top = 87
                      Width = 335
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar regra de combina'#231#227'o CFOP e CST do cadastro de CFOP na Sa'#237'da'
                    end
                    object Label275: TLabel
                      Left = 67
                      Top = 114
                      Width = 338
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 
                        'Na Nota Fiscal Usar Formas de pagamento do Pedido (Apenas Boleto' +
                        's)'
                    end
                    object Label290: TLabel
                      Left = 122
                      Top = 141
                      Width = 283
                      Height = 13
                      Caption = 'Usar lan'#231'amentos de NF de venda fora do estabelecimento'
                    end
                    object Label291: TLabel
                      Left = 198
                      Top = 168
                      Width = 207
                      Height = 13
                      Caption = 'S'#233'rie da NF venda fora do estabelecimento'
                      FocusControl = DBEdit192
                    end
                    object Label292: TLabel
                      Left = 203
                      Top = 195
                      Width = 202
                      Height = 13
                      Caption = 'Modelo NF Venda fora do estabelecimento'
                      FocusControl = DBEdit193
                    end
                    object Label345: TLabel
                      Left = 122
                      Top = 222
                      Width = 285
                      Height = 13
                      Caption = 'Habilitar combust'#237'veis no Cadastro do Produto e Nota Fiscal'
                    end
                    object Label347: TLabel
                      Left = 196
                      Top = 249
                      Width = 209
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Confirmar para gerar boletos na Nota Fiscal'
                    end
                    object Label365: TLabel
                      Left = 35
                      Top = 276
                      Width = 370
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 
                        'Usar Altera'#231#227'o do Pre'#231'o de Venda na digita'#231#227'o dos Itens na Entra' +
                        'da da Nota'
                    end
                    object Label373: TLabel
                      Left = 109
                      Top = 303
                      Width = 296
                      Height = 13
                      Caption = 'Usar c'#243'digo da cor do Fabricante ou DENATRAN vindo do XML'
                    end
                    object Label382: TLabel
                      Left = 264
                      Top = 330
                      Width = 141
                      Height = 13
                      Caption = 'Usar % de Redu'#231#227'o invertido'
                    end
                    object Label396: TLabel
                      Left = 172
                      Top = 357
                      Width = 233
                      Height = 13
                      Caption = 'NF Veiculos - Mostrar dados da NF do Fabricante'
                    end
                    object Label421: TLabel
                      Left = 197
                      Top = 384
                      Width = 208
                      Height = 13
                      Caption = 'Gerar faturas para notas fiscais de ve'#237'culos'
                    end
                    object Label445: TLabel
                      Left = 54
                      Top = 411
                      Width = 351
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 
                        'Ativar o c'#225'lculo do ST na NF de sa'#237'da apenas quando CST = 10, 30' +
                        ' ou 70'
                    end
                    object DBComboBox45: TDBComboBox
                      Left = 411
                      Top = 12
                      Width = 65
                      Height = 21
                      Hint = 
                        'Faz com que o sistema fa'#231'a a valida'#231'ao do NCM no lan'#231'amento das ' +
                        'notas fiscais'
                      DataField = 'USAR_REGRAS_NCM'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 0
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox47: TDBComboBox
                      Left = 411
                      Top = 35
                      Width = 65
                      Height = 21
                      Hint = 'Desconsiderar ICMS na Importa'#231#227'o de Xml de NF-e'
                      DataField = 'DESCONSIDERAR_ICMS_NFENT'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 1
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox55: TDBComboBox
                      Left = 411
                      Top = 61
                      Width = 65
                      Height = 21
                      DataField = 'USAR_REGRA_CFOP_CST_ENTRADA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 2
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox56: TDBComboBox
                      Left = 411
                      Top = 84
                      Width = 65
                      Height = 21
                      DataField = 'USAR_REGRA_CFOP_CST_SAIDA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 3
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox67: TDBComboBox
                      Left = 411
                      Top = 111
                      Width = 65
                      Height = 21
                      DataField = 'NF_USAR_FORMAPAG_PED'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 4
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBEdit192: TDBEdit
                      Left = 411
                      Top = 165
                      Width = 65
                      Height = 21
                      DataField = 'NF_VFE_SERIE'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 6
                    end
                    object DBEdit193: TDBEdit
                      Left = 411
                      Top = 192
                      Width = 65
                      Height = 21
                      DataField = 'NF_VFE_MODELO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 7
                    end
                    object DBComboBox80: TDBComboBox
                      Left = 411
                      Top = 138
                      Width = 65
                      Height = 21
                      DataField = 'NF_VFE_USAR'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 5
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox94: TDBComboBox
                      Left = 411
                      Top = 219
                      Width = 65
                      Height = 21
                      DataField = 'COMB_HAB_PROD'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 8
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox96: TDBComboBox
                      Left = 411
                      Top = 246
                      Width = 65
                      Height = 21
                      DataField = 'BOL_CONF_NF'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 9
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox106: TDBComboBox
                      Left = 411
                      Top = 273
                      Width = 65
                      Height = 21
                      DataField = 'USAR_ALT_PRECO_ENT_NF'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 10
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox111: TDBComboBox
                      Tag = 1
                      Left = 411
                      Top = 300
                      Width = 65
                      Height = 21
                      DataField = 'XML_NFE_USAR_COR'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'Fabricante'
                        'DENATRAN')
                      TabOrder = 11
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox115: TDBComboBox
                      Tag = 1
                      Left = 411
                      Top = 327
                      Width = 65
                      Height = 21
                      DataField = 'USAR_REDUCAO_INVERTIDA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 12
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object GroupBox34: TGroupBox
                      Left = 498
                      Top = 12
                      Width = 271
                      Height = 365
                      Caption = 'Pr'#233' -Nota de Transfenrencia ( Apenas para Sa'#237'das )'
                      TabOrder = 13
                      object Panel17: TPanel
                        Left = 2
                        Top = 15
                        Width = 267
                        Height = 348
                        Align = alClient
                        BevelOuter = bvNone
                        BorderWidth = 6
                        TabOrder = 0
                        object Label393: TLabel
                          Left = 6
                          Top = 6
                          Width = 255
                          Height = 13
                          Align = alTop
                          Caption = 'Gerar Pr'#233'-Nota para as outras empresa com CNPJ:'
                          ExplicitWidth = 244
                        end
                        object SpeedButton13: TSpeedButton
                          Left = 6
                          Top = 116
                          Width = 255
                          Height = 22
                          Align = alTop
                          Caption = 'Adicionar CNPJ a lista'
                          Flat = True
                          OnClick = SpeedButton13Click
                          ExplicitTop = 102
                        end
                        object Label394: TLabel
                          Left = 6
                          Top = 151
                          Width = 255
                          Height = 13
                          Align = alTop
                          Caption = 'Quando a Nota Fiscal conter o CFOP:'
                          ExplicitWidth = 179
                        end
                        object Label395: TLabel
                          Left = 6
                          Top = 138
                          Width = 255
                          Height = 13
                          Align = alTop
                          ExplicitWidth = 3
                        end
                        object SpeedButton14: TSpeedButton
                          Left = 6
                          Top = 268
                          Width = 255
                          Height = 22
                          Align = alBottom
                          Caption = 'Adicionar CFOP a lista'
                          Flat = True
                          OnClick = SpeedButton14Click
                          ExplicitLeft = 48
                          ExplicitTop = 292
                          ExplicitWidth = 113
                        end
                        object Label388: TLabel
                          Left = 6
                          Top = 329
                          Width = 255
                          Height = 13
                          Align = alBottom
                          Caption = 'Para excluir selecione o registro e pressione Delete'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlue
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ExplicitWidth = 244
                        end
                        object Label389: TLabel
                          Left = 6
                          Top = 290
                          Width = 255
                          Height = 13
                          Align = alBottom
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ExplicitWidth = 3
                        end
                        object Label391: TLabel
                          Left = 6
                          Top = 303
                          Width = 255
                          Height = 13
                          Align = alBottom
                          Caption = 'N'#227'o usar esta configura'#231#227'o quando usar Replica'#231#227'o'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ExplicitWidth = 249
                        end
                        object Label392: TLabel
                          Left = 6
                          Top = 316
                          Width = 255
                          Height = 13
                          Align = alBottom
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clRed
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ExplicitWidth = 3
                        end
                        object edCFOPPreNotas: TEditHw
                          Left = 6
                          Top = 247
                          Width = 255
                          Height = 21
                          Align = alBottom
                          MaxLength = 4
                          TabOrder = 0
                          Text = 
                            '                                                                ' +
                            '          5409'
                          OnKeyDown = edCFOPPreNotasKeyDown
                          Formato = fInteger
                          FormatSize = '0.0'
                          DisplayFormat = '0000'
                          AsValue = 5409.000000000000000000
                        end
                        object ListBox2: TListBox
                          Left = 6
                          Top = 19
                          Width = 255
                          Height = 97
                          Align = alTop
                          ItemHeight = 13
                          TabOrder = 1
                          OnKeyDown = ListBox2KeyDown
                        end
                        object ListBox3: TListBox
                          Left = 6
                          Top = 164
                          Width = 255
                          Height = 83
                          Align = alClient
                          ItemHeight = 13
                          TabOrder = 2
                          OnKeyDown = ListBox3KeyDown
                        end
                      end
                    end
                    object pnSelEmpresa: TPanel
                      Left = 753
                      Top = 102
                      Width = 767
                      Height = 166
                      BevelOuter = bvNone
                      BorderWidth = 6
                      TabOrder = 14
                      Visible = False
                      object Panel19: TPanel
                        Left = 6
                        Top = 119
                        Width = 755
                        Height = 41
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object BitBtn20: TBitBtn
                          Left = 379
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar Registro - [BAS080]'
                          Caption = '&Cancela'
                          TabOrder = 1
                          OnClick = BitBtn20Click
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
                        object BitBtn21: TBitBtn
                          Left = 298
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Salvar Registro - [BAS079]'
                          Caption = '&OK'
                          TabOrder = 0
                          OnClick = BitBtn21Click
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
                    object DBComboBox120: TDBComboBox
                      Tag = 1
                      Left = 411
                      Top = 354
                      Width = 65
                      Height = 21
                      DataField = 'NF_VEIC_MOSTRAR_NF_FAB'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 15
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox136: TDBComboBox
                      Tag = 1
                      Left = 411
                      Top = 381
                      Width = 65
                      Height = 21
                      DataField = 'GERA_FATURAS_NF_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 16
                      OnKeyPress = DBComboBox19KeyPress
                    end
                    object DBComboBox148: TDBComboBox
                      Tag = 1
                      Left = 411
                      Top = 408
                      Width = 65
                      Height = 21
                      DataField = 'US_CFG_CST_SAIDA_NFST'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 17
                      OnKeyPress = DBComboBox19KeyPress
                    end
                  end
                  object TabSheet38: TTabSheet
                    Caption = 'Financeiro'
                    ImageIndex = 14
                    object Panel18: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label397: TLabel
                        Left = 107
                        Top = 30
                        Width = 162
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Lancar Sobra ou Quebra de Caixa'
                      end
                      object Label403: TLabel
                        Left = 77
                        Top = 57
                        Width = 192
                        Height = 13
                        Caption = 'Fechar venda Ap'#243's Financeiro Autorizar'
                      end
                      object Label436: TLabel
                        Left = 20
                        Top = 84
                        Width = 249
                        Height = 13
                        Caption = 'Desnegativar cliente ao quitar todos os documentos'
                      end
                      object Label440: TLabel
                        Left = 183
                        Top = 112
                        Width = 86
                        Height = 13
                        Caption = 'Usar Check Check'
                      end
                      object DBComboBox121: TDBComboBox
                        Left = 275
                        Top = 27
                        Width = 65
                        Height = 21
                        DataField = 'FIN_LANC_SOBRA_QUEBRA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'NAO'
                          'SIM')
                        TabOrder = 0
                      end
                      object DBComboBox124: TDBComboBox
                        Left = 275
                        Top = 54
                        Width = 65
                        Height = 21
                        Hint = 'Fechar venda Ap'#243's Financeiro Autorizar'
                        DataField = 'VND_FECH_DEPOIS_DE_AUT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 1
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox141: TDBComboBox
                        Left = 275
                        Top = 81
                        Width = 65
                        Height = 21
                        Hint = 'Desnegativar cliente ao quitar todos os documentos'
                        DataField = 'DESB_CL_CONTAS_QUIT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 2
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox144: TDBComboBox
                        Left = 275
                        Top = 108
                        Width = 65
                        Height = 21
                        DataField = 'USAR_CHECKCHECK'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - N'#195'O')
                        TabOrder = 3
                      end
                    end
                  end
                  object tsContasAReceber: TTabSheet
                    Caption = 'Contas a Receber'
                    ImageIndex = 5
                    object Panel5: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label259: TLabel
                        Left = 5
                        Top = 6
                        Width = 342
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Usar Barramento Autom'#225'tico de Cliente ao cadastrar Contas a Rece' +
                          'ber'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label175: TLabel
                        Left = 270
                        Top = 50
                        Width = 77
                        Height = 13
                        Caption = 'C'#243'digo Liberado'
                        FocusControl = DBEdit120
                      end
                      object Label174: TLabel
                        Left = 273
                        Top = 28
                        Width = 74
                        Height = 13
                        Caption = 'C'#243'digo Barrado'
                        FocusControl = DBEdit119
                      end
                      object Label350: TLabel
                        Left = 133
                        Top = 72
                        Width = 214
                        Height = 13
                        Caption = 'Usar comiss'#227'o por Recebimento Proporcional'
                      end
                      object Label363: TLabel
                        Left = 188
                        Top = 94
                        Width = 159
                        Height = 13
                        Caption = 'Reprocessar Cartas de Cobran'#231'a'
                      end
                      object Label364: TLabel
                        Left = 112
                        Top = 116
                        Width = 235
                        Height = 13
                        Caption = 'N'#250'mero padr'#227'o de dias entre cartas de cobran'#231'a'
                        FocusControl = DBEdit210
                      end
                      object DBComboBox64: TDBComboBox
                        Left = 353
                        Top = 3
                        Width = 65
                        Height = 21
                        DataField = 'USAR_BARRAMENTO_AUTOMATICO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 0
                      end
                      object DBEdit120: TDBEdit
                        Left = 353
                        Top = 47
                        Width = 144
                        Height = 21
                        Hint = 
                          'C'#243'digo para tirar a negativa'#231#227'o do cliente no controle de cr'#233'dit' +
                          'o'
                        DataField = 'CODDBARRADO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit119: TDBEdit
                        Left = 353
                        Top = 25
                        Width = 145
                        Height = 21
                        Hint = #39'C'#243'digo para negativar o cliente no controle de cr'#233'dito'
                        DataField = 'CODBARRADO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object GroupBox25: TGroupBox
                        Left = 13
                        Top = 135
                        Width = 748
                        Height = 287
                        Caption = 
                          'Configura'#231#245'es para envio de e-mail de cobran'#231'a '#224' clientes em d'#233'b' +
                          'ito'
                        TabOrder = 6
                        object Label295: TLabel
                          Left = 97
                          Top = 18
                          Width = 92
                          Height = 13
                          Caption = 'E-mail de Cobran'#231'a'
                          FocusControl = DBEdit191
                        end
                        object Label296: TLabel
                          Left = 85
                          Top = 40
                          Width = 104
                          Height = 13
                          Caption = 'Login/e-mail cobran'#231'a'
                          FocusControl = DBEdit194
                        end
                        object Label297: TLabel
                          Left = 399
                          Top = 40
                          Width = 76
                          Height = 13
                          Caption = 'Senha do e-mail'
                          FocusControl = DBEdit195
                        end
                        object Label298: TLabel
                          Left = 94
                          Top = 58
                          Width = 95
                          Height = 13
                          Caption = 'Nome do remetente'
                          FocusControl = DBEdit196
                        end
                        object Label299: TLabel
                          Left = 120
                          Top = 84
                          Width = 69
                          Height = 13
                          Caption = 'Servidor SMTP'
                          FocusControl = DBEdit197
                        end
                        object Label300: TLabel
                          Left = 420
                          Top = 84
                          Width = 55
                          Height = 13
                          Caption = 'Porta SMTP'
                          FocusControl = DBEdit198
                        end
                        object Label301: TLabel
                          Left = 113
                          Top = 128
                          Width = 76
                          Height = 13
                          Caption = 'Assunto padr'#227'o'
                          FocusControl = DBEdit199
                        end
                        object Label302: TLabel
                          Left = 101
                          Top = 151
                          Width = 88
                          Height = 13
                          Caption = 'Mensagem padr'#227'o'
                          FocusControl = DBMemo5
                        end
                        object Label303: TLabel
                          Left = 49
                          Top = 192
                          Width = 140
                          Height = 13
                          Caption = 'Exemplos para configura'#231#245'es'
                        end
                        object Label371: TLabel
                          Left = 3
                          Top = 106
                          Width = 186
                          Height = 13
                          Caption = 'Servidor de e-mail requer autentica'#231#227'o'
                        end
                        object Label372: TLabel
                          Left = 327
                          Top = 106
                          Width = 148
                          Height = 13
                          Caption = 'Servidor usa conex'#227'o SSL/TLS '
                        end
                        object DBEdit191: TDBEdit
                          Tag = 1
                          Left = 195
                          Top = 15
                          Width = 420
                          Height = 21
                          Hint = 'E-mail utilizado para combran'#231'a'
                          DataField = 'EMAIL_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 0
                        end
                        object DBEdit194: TDBEdit
                          Tag = 1
                          Left = 195
                          Top = 37
                          Width = 134
                          Height = 21
                          Hint = 'Login ou mesmo o pr'#243'prio e-mail'
                          DataField = 'LOGIN_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 1
                        end
                        object DBEdit195: TDBEdit
                          Tag = 1
                          Left = 481
                          Top = 37
                          Width = 134
                          Height = 21
                          DataField = 'SENHA_EMAIL_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          PasswordChar = '*'
                          TabOrder = 2
                        end
                        object DBEdit196: TDBEdit
                          Tag = 1
                          Left = 195
                          Top = 59
                          Width = 420
                          Height = 21
                          DataField = 'REMETENTE_EMAIL_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 3
                        end
                        object DBEdit197: TDBEdit
                          Tag = 1
                          Left = 195
                          Top = 81
                          Width = 134
                          Height = 21
                          Hint = 'Servidor SMTP'
                          DataField = 'SMTP_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 4
                        end
                        object DBEdit198: TDBEdit
                          Left = 481
                          Top = 81
                          Width = 134
                          Height = 21
                          Hint = 'N'#250'mero da porta SMTP'
                          DataField = 'SMTPPORTA_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 5
                        end
                        object DBEdit199: TDBEdit
                          Tag = 1
                          Left = 195
                          Top = 125
                          Width = 420
                          Height = 21
                          DataField = 'ASSUNTO_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 8
                        end
                        object DBMemo5: TDBMemo
                          Tag = 1
                          Left = 195
                          Top = 148
                          Width = 421
                          Height = 41
                          DataField = 'MSG_COBRANCA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 9
                        end
                        object RichEdit1: TRichEdit
                          Left = 195
                          Top = 192
                          Width = 421
                          Height = 89
                          Lines.Strings = (
                            
                              'Observa'#231#227'o: N'#227'o foram feitos testes com todos os SMTPs listados ' +
                              'abaixo. '
                            
                              #201' recomendado fazer a configura'#231#227'o e efetuar um teste de envio d' +
                              'e email antes.'
                            ''
                            '*** Gmail'
                            'e-mail do remetente: e-mail do usu'#225'rio;'
                            
                              'Login/E-mail (Servidor SMTP): preencha o seu gmail. Exemplo: se ' +
                              'seu e-mail for '
                            'XXXXXX@gmail.com informe apenas XXXXXX ou ent'#227'o preencha '
                            'XXXXXX@gmail.com'
                            'Senha(Servidor SMTP): senha do e-mail;'
                            'Nome remetente: nome do usu'#225'rio;'
                            'Servidor SMTP: smtp.gmail.com;'
                            'Porta SMTP: 465'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            
                              'Importante: Necess'#225'rio ativar POP e IMAP nas configura'#231#245'es no si' +
                              'te (webmail)'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser'
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma'
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** Google Apps p/ Empresas'
                            'e-mail do remetente: e-mail do usu'#225'rio;'
                            
                              'Login/E-mail (Servidor SMTP): preencha o seu gmail. Exemplo: se ' +
                              'seu e-mail for '
                            'XXXXXX@empresa.com.br  ent'#227'o informe XXXXXX@empresa.com.br;'
                            'Senha(Servidor SMTP): senha do e-mail;'
                            'Nome remetente: nome do usu'#225'rio;'
                            'Servidor SMTP: smtp.gmail.com;'
                            'Porta SMTP: 465'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            
                              'Importante: Necess'#225'rio ativar POP e IMAP nas configura'#231#245'es no si' +
                              'te (webmail)'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser'
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma'
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            ''
                            '*** Yahoo'
                            
                              'Depende de como voc'#234' est'#225' registrado no Yahoo. Se o seu email fo' +
                              'r @yahoo.com'
                            
                              '(sem .br) ele n'#227'o vai funcionar. Se for @yahoo.com.br siga as in' +
                              'stru'#231#245'es abaixo.'
                            'e-mail do remetente: e-mail do usu'#225'rio;'
                            
                              'Login/E-mail (Servidor SMTP): preencha o seu ID Yahoo. Exemplo: ' +
                              'se seu e-mail for '
                            
                              'XXXXXX@yahoo.com.br, informe apenas XXXXXX  ou o e-mail completo' +
                              ';'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtp.mail.yahoo.com.br'
                            'Porta SMTP: 587'
                            'Exige Autentica'#231#227'o? : Sim'
                            
                              'Necessita Conex'#227'o Segura SSL?: N'#227'o/Sim  ('#233' configur'#225'vel no webma' +
                              'il)'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser'
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma'
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** IG'
                            'Servidor SMTP : smtp.ig.com.br'
                            'Porta SMTP: 465'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha com o seu email IG.  Exemplo: ' +
                              'se seu e-mail for '
                            'xxxxxx@ig.com.br, informe apenas xxxxxx.'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usu'#225'rio'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser'
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma'
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** UOL'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Login/E-mail (Servidor SMTP): Exemplo: se seu e-mail for (xxxxxx' +
                              '@uol.com.br), '
                            'preencha apenas xxxxxx.'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtps.uol.com.br'
                            'Porta SMTP: 587'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: N'#227'o'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser'
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma'
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** BOL'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha o seu email BOL, sem o @bol.co' +
                              'm.br. Exemplo: '
                            'XXXXXXX'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtps.bol.com.br'
                            'Porta SMTP: 587 ou 465'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** Click 21'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha o seu email Click 21. Exemplo:' +
                              ' '
                            'XXXXXXX@click21.com.br <mailto:XXXXXXX@click21.com.br> '
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtp.click21.com.br'
                            'Porta SMTP: 25 '
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** iBest'
                            
                              'Usuario (Servidor SMTP): preencha o seu email iBest. Exemplo: XX' +
                              'XXXX '
                            '@ibest.com.br <mailto:XXXXXX@ibest.com.br> '
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'e-mail do remetente: e-mail do usuario'
                            'Servidor SMTP : smtp.ibest.com.br'
                            'Porta SMTP: 465 '
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** TERRA'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha o seu email Terra, sem o @terr' +
                              'a.com.br. '
                            'Exemplo: XXXXXX'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtp.terra.com.br '
                            'Porta SMTP: 587'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: N'#227'o'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** Globo.com'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha o seu email globo.com, sem o @' +
                              'globo.com. '
                            'Exemplo: XXXXXX'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario'
                            'Servidor SMTP : smtp.globo.com '
                            'Porta SMTP: 25'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: N'#227'o'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** BrTurbo'
                            'e-mail do remetente: e-mail do usuario'
                            
                              'Usuario (Servidor SMTP): preencha o seu email BrTurbo, sem o @br' +
                              'turbo.com. '
                            'Exemplo: XXXXXX'
                            'Senha (Servidor SMTP): senha do e-mail'
                            'Nome remetente: nome do usuario '
                            'Servidor SMTP : smtp.brturbo.com '
                            'Porta SMTP: 465'
                            'Exige Autentica'#231#227'o? : Sim'
                            'Necessita Conex'#227'o Segura SSL?: Sim'
                            
                              'Assunto padr'#227'o: Digite um Assunto padr'#227'o (na hora do envio o mes' +
                              'mo poder'#225' ser '
                            'alterado si assim for preciso);'
                            
                              'Mensagem padr'#227'o: Digite uma messagem padr'#227'o (na hora do envio a ' +
                              'mesma '
                            'poder'#225' ser alterada si assim for preciso).'
                            ''
                            '*** Hotmail'
                            
                              'O Hotmail foi feito para comunicar-se apenas com o Outlook e Out' +
                              'look Express '
                            
                              '(pois pertencem a mesma empresa). Crie uma conta de e-mail em ou' +
                              'tro servidor.')
                          PlainText = True
                          ReadOnly = True
                          ScrollBars = ssVertical
                          TabOrder = 10
                        end
                        object DBComboBox109: TDBComboBox
                          Left = 195
                          Top = 103
                          Width = 65
                          Height = 21
                          Hint = 'O servidor SMTP requer autentica'#231#227'o'
                          DataField = 'EMAIL_COB_AUTENTICAR'
                          DataSource = DtmCadBasicos.dsEmpresa
                          ItemHeight = 13
                          Items.Strings = (
                            'NAO'
                            'SIM')
                          TabOrder = 6
                        end
                        object DBComboBox110: TDBComboBox
                          Left = 481
                          Top = 103
                          Width = 65
                          Height = 21
                          Hint = 'O servidor SMTP usa conex'#227'o SSL'
                          DataField = 'EMAIL_COB_SEGURANCASSL'
                          DataSource = DtmCadBasicos.dsEmpresa
                          ItemHeight = 13
                          Items.Strings = (
                            'NAO'
                            'SIM')
                          TabOrder = 7
                        end
                      end
                      object DBComboBox99: TDBComboBox
                        Left = 353
                        Top = 69
                        Width = 65
                        Height = 21
                        DataField = 'USAR_COMISSAO_RECEB_PROP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 3
                      end
                      object DBComboBox104: TDBComboBox
                        Left = 353
                        Top = 91
                        Width = 65
                        Height = 21
                        Hint = 
                          'Reprocessar cartas de cobran'#231'a j'#225' eniviadas respeitando o prazo ' +
                          'definido entre uma carta e outra'
                        DataField = 'REPROCESSARCARTAS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'NAO'
                          'SIM')
                        TabOrder = 4
                      end
                      object DBEdit210: TDBEdit
                        Left = 353
                        Top = 113
                        Width = 65
                        Height = 21
                        Hint = 
                          'N'#250'mero padr'#227'o de dias entre o envio de uma carta de cobran'#231'a e o' +
                          ' envio de outra ou reprocessamento da mesma'
                        DataField = 'DIASENTRECARTAS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 5
                      end
                    end
                  end
                  object tsContasAPagar: TTabSheet
                    Caption = 'Contas a Pagar'
                    ImageIndex = 6
                    object Panel6: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label269: TLabel
                        Left = 231
                        Top = 14
                        Width = 435
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Limitar a quita'#231#227'o de contas a pagar de acordo com o tipo de con' +
                          'trole (C/N) de mesmo tipo'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBComboBox66: TDBComboBox
                        Left = 672
                        Top = 11
                        Width = 65
                        Height = 21
                        Hint = 
                          'Limitar a quita'#231#227'o de contas a pagar de acordo com o tipo de con' +
                          'trole (C/N) de mesmo tipo'
                        DataField = 'FILTRAR_TIP_CNT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 0
                        OnKeyPress = DBComboBox19KeyPress
                      end
                    end
                  end
                  object TabSheet27: TTabSheet
                    Caption = 'Produ'#231#227'o'
                    ImageIndex = 7
                    object Label279: TLabel
                      Left = 275
                      Top = 23
                      Width = 122
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar M'#243'dulo de Produ'#231#227'o'
                    end
                    object Label280: TLabel
                      Left = 276
                      Top = 50
                      Width = 121
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Usar Cliente na Produ'#231#227'o'
                    end
                    object Label282: TLabel
                      Left = 190
                      Top = 77
                      Width = 207
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Precis'#227'o do M'#243'dulo de Produ'#231#227'o Detalhada'
                    end
                    object Label419: TLabel
                      Left = 219
                      Top = 104
                      Width = 178
                      Height = 13
                      Caption = 'CFOP Padr'#227'o NF Baixa MP e Insumos'
                      FocusControl = DBEdit227
                    end
                    object DBComboBox69: TDBComboBox
                      Left = 403
                      Top = 20
                      Width = 94
                      Height = 21
                      Hint = 'Ativa o M'#243'dulo de Produ'#231#227'o no Sistema'
                      DataField = 'USAR_PRODUCAO_TIPO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N'#227'o'
                        'Simples'
                        'Detalhada')
                      TabOrder = 0
                    end
                    object DBComboBox70: TDBComboBox
                      Left = 403
                      Top = 47
                      Width = 94
                      Height = 21
                      Hint = 'Ativa o campo de sele'#231#227'o de cliente no m'#243'dulo de produ'#231#227'o'
                      DataField = 'USAR_CLIENTE_PRODUCAO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 1
                    end
                    object DBComboBox71: TDBComboBox
                      Left = 403
                      Top = 74
                      Width = 94
                      Height = 21
                      Hint = 'Informar o valor da precisao no peso da produ'#231#227'o'
                      Style = csDropDownList
                      DataField = 'PRECISAO_PRODUCAO_D'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        '3'
                        '4'
                        '5'
                        '6')
                      TabOrder = 2
                    end
                    object DBEdit227: TDBEdit
                      Left = 403
                      Top = 101
                      Width = 94
                      Height = 21
                      DataField = 'CFOP_PAD_PRODUCAO_MP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 3
                    end
                  end
                  object TabSheet28: TTabSheet
                    Caption = 'Carregamento'
                    ImageIndex = 8
                    object Panel7: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label281: TLabel
                        Left = 211
                        Top = 50
                        Width = 218
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Colaborador obrigat'#243'rio no cadastro do Setor'
                      end
                      object Label283: TLabel
                        Left = 204
                        Top = 77
                        Width = 225
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Montagem da Ordem de Carregamento'
                      end
                      object Label284: TLabel
                        Left = 285
                        Top = 23
                        Width = 144
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Usar Ordem de Carregamento'
                      end
                      object Label285: TLabel
                        Left = 70
                        Top = 104
                        Width = 359
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Tipo Padr'#227'o de Entrega (Apenas para Ordem de Carregamento Detalh' +
                          'ada)'
                      end
                      object Label286: TLabel
                        Left = 16
                        Top = 131
                        Width = 413
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Efetuar conferencia de mercadorias antes do fechamento da Ordem ' +
                          'de Carregamento'
                      end
                      object Label361: TLabel
                        Left = 195
                        Top = 158
                        Width = 234
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Ativar o fechamento da carga pelo Caixa Auxiliar'
                      end
                      object Label390: TLabel
                        Left = 92
                        Top = 185
                        Width = 337
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Permitir a altera'#231#227'o de Pedidos com a Ordem de Carregamento Aber' +
                          'ta'
                      end
                      object DBComboBox72: TDBComboBox
                        Left = 435
                        Top = 20
                        Width = 94
                        Height = 21
                        Hint = 'Usar Ordem de Carregamento'
                        DataField = 'OC_USAR_ORDEM_CARREGAMENTO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'N'#227'o'
                          'Simples'
                          'Detalhada')
                        TabOrder = 0
                      end
                      object DBComboBox73: TDBComboBox
                        Left = 435
                        Top = 47
                        Width = 94
                        Height = 21
                        Hint = 'Colaborador obrigat'#243'rio no cadastro do Setor'
                        DataField = 'OC_VENDEDOR_POR_SETOR'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'NAO'
                          'SIM')
                        TabOrder = 1
                      end
                      object DBComboBox74: TDBComboBox
                        Left = 435
                        Top = 74
                        Width = 94
                        Height = 21
                        Hint = 'Tipo de Montagem da Ordem de Carregamento'
                        DataField = 'OC_TIPO_MONTAGEM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'MOVIMENTO'
                          'FIXO')
                        TabOrder = 2
                      end
                      object DBComboBox75: TDBComboBox
                        Left = 435
                        Top = 101
                        Width = 94
                        Height = 21
                        Hint = 
                          'Tipo Padr'#227'o de Entrega (Apenas para Ordem de Carregamento Detalh' +
                          'ada)'
                        DataField = 'OC_TIPO_PADRAO_ENTREGA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'TOTAL'
                          'PARCIAL'
                          'MISTA')
                        TabOrder = 3
                      end
                      object DBComboBox76: TDBComboBox
                        Left = 435
                        Top = 128
                        Width = 94
                        Height = 21
                        Hint = 
                          'Efetuar conferencia de mercadorias antes do fechamento da Ordem ' +
                          'de Carregamento'
                        DataField = 'OC_EFETUAR_CONFERENCIA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO'
                          'ESCOLHA')
                        TabOrder = 4
                      end
                      object DBComboBox105: TDBComboBox
                        Left = 435
                        Top = 155
                        Width = 94
                        Height = 21
                        Hint = 'Ativar o fechamento da carga pelo Caixa Auxiliar'
                        DataField = 'USAR_FECH_CARGA_CXL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 5
                      end
                      object DBComboBox119: TDBComboBox
                        Left = 435
                        Top = 182
                        Width = 94
                        Height = 21
                        Hint = 
                          'Permitir a altera'#231#227'o de Pedidos com a Ordem de Carregamento Aber' +
                          'ta'
                        DataField = 'OC_ALT_PED_OC_FECH'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 6
                      end
                    end
                  end
                  object TabSheet29: TTabSheet
                    Caption = 'Agenda Oficina'
                    ImageIndex = 9
                    object Panel8: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label309: TLabel
                        Left = 88
                        Top = 14
                        Width = 98
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Usar Agenda Oficina'
                      end
                      object Label312: TLabel
                        Left = 65
                        Top = 245
                        Width = 121
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Usar Domingo na Agenda'
                      end
                      object Label339: TLabel
                        Left = 10
                        Top = 370
                        Width = 176
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Usar Disponibilidade Mec'#226'nico em OS'
                      end
                      object Label340: TLabel
                        Left = 22
                        Top = 392
                        Width = 164
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Quantidade de OS Aberta por Box'
                      end
                      object DBComboBox86: TDBComboBox
                        Left = 192
                        Top = 11
                        Width = 198
                        Height = 21
                        Hint = 'Ativa o M'#243'dulo Agenda Oficina'
                        DataField = 'AGENDA_OFICINA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'N - N'#195'O'
                          'S- SIM')
                        TabOrder = 0
                      end
                      object DBComboBox87: TDBComboBox
                        Left = 192
                        Top = 242
                        Width = 198
                        Height = 21
                        Hint = 'Inclui o dia de domingo na agenda'
                        DataField = 'USAR_DOMINGO_AGENDA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'N - N'#195'O'
                          'S- SIM')
                        TabOrder = 3
                      end
                      object GroupBox27: TGroupBox
                        Left = 191
                        Top = 33
                        Width = 199
                        Height = 100
                        Caption = 'Hor'#225'rio da Semana'
                        TabOrder = 1
                        object Label313: TLabel
                          Left = 15
                          Top = 26
                          Width = 58
                          Height = 13
                          Caption = 'Hora Manh'#227
                        end
                        object Label314: TLabel
                          Left = 126
                          Top = 26
                          Width = 54
                          Height = 13
                          Caption = 'Hora Tarde'
                        end
                        object Label315: TLabel
                          Left = 42
                          Top = 72
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label316: TLabel
                          Left = 153
                          Top = 72
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label326: TLabel
                          Left = 8
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label328: TLabel
                          Left = 55
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object Label329: TLabel
                          Left = 119
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label330: TLabel
                          Left = 166
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object MaskEdit6: TMaskEdit
                          Left = 118
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 2
                          OnExit = MaskEdit6Exit
                          OnKeyPress = MaskEdit6KeyPress
                        end
                        object MaskEdit7: TMaskEdit
                          Left = 163
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 3
                          OnExit = MaskEdit7Exit
                          OnKeyPress = MaskEdit7KeyPress
                        end
                        object MaskEdit4: TMaskEdit
                          Left = 7
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 0
                          OnExit = MaskEdit4Exit
                          OnKeyPress = MaskEdit4KeyPress
                        end
                        object MaskEdit5: TMaskEdit
                          Left = 52
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 1
                          OnExit = MaskEdit5Exit
                          OnKeyPress = MaskEdit5KeyPress
                        end
                      end
                      object GroupBox28: TGroupBox
                        Left = 191
                        Top = 139
                        Width = 198
                        Height = 100
                        Caption = 'Hor'#225'rio do Sabado'
                        TabOrder = 2
                        object Label317: TLabel
                          Left = 16
                          Top = 20
                          Width = 58
                          Height = 13
                          Caption = 'Hora Manh'#227
                        end
                        object Label318: TLabel
                          Left = 128
                          Top = 20
                          Width = 54
                          Height = 13
                          Caption = 'Hora Tarde'
                        end
                        object Label319: TLabel
                          Left = 42
                          Top = 72
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label320: TLabel
                          Left = 153
                          Top = 72
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label331: TLabel
                          Left = 3
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label332: TLabel
                          Left = 55
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object Label333: TLabel
                          Left = 119
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label334: TLabel
                          Left = 166
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object MaskEdit11: TMaskEdit
                          Left = 163
                          Top = 69
                          Width = 30
                          Height = 21
                          MaxLength = 2
                          TabOrder = 3
                          OnExit = MaskEdit11Exit
                          OnKeyPress = MaskEdit11KeyPress
                        end
                        object MaskEdit8: TMaskEdit
                          Left = 7
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 0
                          OnExit = MaskEdit8Exit
                          OnKeyPress = MaskEdit8KeyPress
                        end
                        object MaskEdit9: TMaskEdit
                          Left = 52
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 1
                          OnExit = MaskEdit9Exit
                          OnKeyPress = MaskEdit9KeyPress
                        end
                        object MaskEdit10: TMaskEdit
                          Left = 118
                          Top = 69
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 2
                          OnExit = MaskEdit10Exit
                          OnKeyPress = MaskEdit10KeyPress
                        end
                      end
                      object GroupBox29: TGroupBox
                        Left = 192
                        Top = 264
                        Width = 198
                        Height = 100
                        Caption = 'Hor'#225'rio do Domingo'
                        TabOrder = 4
                        object Label321: TLabel
                          Left = 16
                          Top = 28
                          Width = 58
                          Height = 13
                          Caption = 'Hora Manh'#227
                        end
                        object Label322: TLabel
                          Left = 128
                          Top = 28
                          Width = 54
                          Height = 13
                          Caption = 'Hora Tarde'
                        end
                        object Label323: TLabel
                          Left = 40
                          Top = 69
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label324: TLabel
                          Left = 153
                          Top = 69
                          Width = 4
                          Height = 13
                          Caption = '-'
                        end
                        object Label335: TLabel
                          Left = 6
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label336: TLabel
                          Left = 50
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object Label337: TLabel
                          Left = 119
                          Top = 50
                          Width = 27
                          Height = 13
                          Caption = 'Inicial'
                        end
                        object Label338: TLabel
                          Left = 166
                          Top = 50
                          Width = 22
                          Height = 13
                          Caption = 'Final'
                        end
                        object MaskEdit13: TMaskEdit
                          Left = 47
                          Top = 67
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 1
                          OnExit = MaskEdit13Exit
                          OnKeyPress = MaskEdit13KeyPress
                        end
                        object MaskEdit14: TMaskEdit
                          Left = 118
                          Top = 67
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 2
                          OnExit = MaskEdit14Exit
                          OnKeyPress = MaskEdit14KeyPress
                        end
                        object MaskEdit15: TMaskEdit
                          Left = 163
                          Top = 67
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 3
                          OnExit = MaskEdit15Exit
                          OnKeyPress = MaskEdit15KeyPress
                        end
                        object MaskEdit12: TMaskEdit
                          Left = 7
                          Top = 67
                          Width = 29
                          Height = 21
                          MaxLength = 2
                          TabOrder = 0
                          OnExit = MaskEdit12Exit
                          OnKeyPress = MaskEdit12KeyPress
                        end
                      end
                      object DBComboBox89: TDBComboBox
                        Left = 192
                        Top = 365
                        Width = 375
                        Height = 21
                        DataField = 'DISPONIBILIDADE_MEC_OS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - Somente em OS Agendadas'
                          'A - Ambas (OS agendadas e n'#227'o agendadas)'
                          '')
                        TabOrder = 5
                      end
                      object DBEdit202: TDBEdit
                        Left = 192
                        Top = 389
                        Width = 93
                        Height = 21
                        DataField = 'QUANT_OS_ABERTA_BOX'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 6
                      end
                    end
                  end
                  object TabSheet30: TTabSheet
                    Caption = 'Televendas'
                    ImageIndex = 10
                    object Panel9: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label305: TLabel
                        Left = 44
                        Top = 13
                        Width = 75
                        Height = 13
                        Caption = 'Usar Televenda'
                      end
                      object Label343: TLabel
                        Left = 13
                        Top = 40
                        Width = 106
                        Height = 13
                        Caption = 'Tipo Venda Televenda'
                      end
                      object Label344: TLabel
                        Left = 29
                        Top = 67
                        Width = 90
                        Height = 13
                        Caption = 'Tipo OS Televenda'
                      end
                      object DBComboBox83: TDBComboBox
                        Left = 125
                        Top = 10
                        Width = 66
                        Height = 21
                        Hint = 'Usar o Modulo de Televendas'
                        DataField = 'USAR_TELEVENDA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 0
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox92: TDBComboBox
                        Left = 125
                        Top = 37
                        Width = 145
                        Height = 21
                        DataField = 'TIPO_VENDA_REQ_TLVND'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        TabOrder = 1
                      end
                      object DBComboBox93: TDBComboBox
                        Left = 125
                        Top = 64
                        Width = 145
                        Height = 21
                        DataField = 'TIPO_VENDA_OS_TLVND'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        TabOrder = 2
                      end
                    end
                  end
                  object TabSheet39: TTabSheet
                    Caption = 'Mobile'
                    ImageIndex = 15
                    object Panel20: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label404: TLabel
                        Left = 197
                        Top = 39
                        Width = 288
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de Venda padr'#227'o para Vendas feitas a partir do Mobile:'
                      end
                      object Label405: TLabel
                        Left = 269
                        Top = 63
                        Width = 216
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Verificar Estoque ao Enviar Pedido no Mobile:'
                      end
                      object Label406: TLabel
                        Left = 239
                        Top = 87
                        Width = 246
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Repetir produtos no pedido feito a partir do Mobile:'
                      end
                      object Label407: TLabel
                        Left = 150
                        Top = 111
                        Width = 335
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'Habilitar o uso do Auto incremento no balan'#231'o feito a partir do ' +
                          'Mobile:'
                      end
                      object Label408: TLabel
                        Left = 29
                        Top = 137
                        Width = 456
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'C'#243'digo do Faturamento Barrado utilizado no Financeiro do Sistema' +
                          ' Retaguarda (Ex: 3, 13, 15):'
                      end
                      object Label409: TLabel
                        Left = 235
                        Top = 161
                        Width = 250
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Habilitar o uso do Som ao fazer o balan'#231'o no Mobile:'
                      end
                      object Label410: TLabel
                        Left = 246
                        Top = 210
                        Width = 239
                        Height = 13
                        Hint = 'Usar carteira do vendedor pelo mobile'
                        Alignment = taRightJustify
                        Caption = 'Habilitar o uso da carteira do vendedor no Mobile:'
                      end
                      object Label411: TLabel
                        Left = 91
                        Top = 235
                        Width = 394
                        Height = 13
                        Hint = 
                          'Consultar mensagens mobile enviadas pelo sistema HW For'#231'a de Ven' +
                          'da ao entrar no sistema'
                        Alignment = taRightJustify
                        Caption = 
                          'Verificar o recebimento de mensagens ao entrada no sistema HW Fo' +
                          'r'#231'a de Venda:'
                      end
                      object Label412: TLabel
                        Left = 86
                        Top = 185
                        Width = 399
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 
                          'M'#225'scara padr'#227'o de loca'#231#227'o do produto utilizada no balan'#231'o feito ' +
                          'a partir do mobile:'
                      end
                      object Label357: TLabel
                        Left = 121
                        Top = 12
                        Width = 365
                        Height = 13
                        Caption = 
                          'Intervalo de Verifica'#231#227'o de Mensagens Mobile do Sistema Retaguar' +
                          'da (Min):'
                      end
                      object Label417: TLabel
                        Left = 259
                        Top = 260
                        Width = 227
                        Height = 13
                        Hint = 
                          'Consultar mensagens mobile enviadas pelo sistema HW For'#231'a de Ven' +
                          'da ao entrar no sistema'
                        Alignment = taRightJustify
                        Caption = 'Habilitar o uso da Atualiza'#231#227'o Parcial no Mobile:'
                      end
                      object Label423: TLabel
                        Left = 17
                        Top = 284
                        Width = 469
                        Height = 13
                        Hint = 
                          'Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo cli' +
                          'ente cadastrado.'
                        Alignment = taRightJustify
                        Caption = 
                          '1'#186' Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo ' +
                          'cliente cadastrado pelo Mobile:'
                      end
                      object Label425: TLabel
                        Left = 17
                        Top = 308
                        Width = 469
                        Height = 13
                        Hint = 
                          'Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo cli' +
                          'ente cadastrado.'
                        Alignment = taRightJustify
                        Caption = 
                          '2'#186' Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo ' +
                          'cliente cadastrado pelo Mobile:'
                      end
                      object DBComboBox125: TDBComboBox
                        Left = 491
                        Top = 34
                        Width = 232
                        Height = 21
                        Hint = 'Tipo de Venda Padr'#227'o para vendas feitas no mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_TIPV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'V - VAREJO'
                          'A - ATACADO'
                          'C - CONSIGNADO'
                          'T - TELEVENDA'
                          'L - APLICADORES'
                          'O - OUTRAS EMPRESAS'
                          'P - PRODU'#199#195'O'
                          'S - CONSUMO'
                          'E - ESCOLHA')
                        TabOrder = 1
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox126: TDBComboBox
                        Left = 491
                        Top = 60
                        Width = 65
                        Height = 21
                        Hint = 'Consultar estoque ao enviar pedido no mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_VERIFIICAEST'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 2
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox127: TDBComboBox
                        Left = 491
                        Top = 84
                        Width = 65
                        Height = 21
                        Hint = 
                          'Incluir o mesmo produto mais de uma vez em venda feita a partir ' +
                          'do mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_REPESTOQUE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 3
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox128: TDBComboBox
                        Left = 491
                        Top = 109
                        Width = 65
                        Height = 21
                        Hint = 'Usar o Auto incremento no balan'#231'o feito a partir do mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_AUTOINC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 4
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox129: TDBComboBox
                        Left = 491
                        Top = 158
                        Width = 65
                        Height = 21
                        Hint = 'Utilizar som ao fazer balan'#231'o pelo mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_VSOM'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 6
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox130: TDBComboBox
                        Left = 491
                        Top = 207
                        Width = 65
                        Height = 21
                        Hint = 'Utilicar carteira do vendedor no mobile'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_VUSARCARTEIRA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 8
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox131: TDBComboBox
                        Left = 491
                        Top = 232
                        Width = 65
                        Height = 21
                        Hint = 
                          'Consultar Mensagens mobile recebidas apartir do sistema HW For'#231'a' +
                          ' de venda'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_VVERMENSENTRADA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 9
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBEdit222: TDBEdit
                        Left = 491
                        Top = 134
                        Width = 232
                        Height = 21
                        Hint = 
                          'C'#243'digo do Faturamento Barrato utilizado no Financeiro do Sistema' +
                          ' Retaguarda'
                        DataField = 'CFGMOB_CODFATURAMENTO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 5
                      end
                      object DBEdit223: TDBEdit
                        Left = 491
                        Top = 182
                        Width = 232
                        Height = 21
                        Hint = 'M'#225'scara do produto utilizado ao realizar o balan'#231'o no mobile'
                        DataField = 'CFGMOB_MASCARAALOC'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 7
                      end
                      object DBEdit208: TDBEdit
                        Left = 491
                        Top = 9
                        Width = 65
                        Height = 21
                        Hint = 
                          'Intervalo de consulta de mensagens enviadas pelo Sistema HW For'#231 +
                          'a de Venda ao Sistema Retaguarda'
                        DataField = 'INTERV_MENS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBComboBox133: TDBComboBox
                        Left = 492
                        Top = 257
                        Width = 65
                        Height = 21
                        Hint = 'Consulta Parcial da Atualiza'#231#227'o no HW For'#231'a de Venda'
                        CharCase = ecUpperCase
                        DataField = 'CFGMOB_ATPARCIAL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'S - SIM'
                          'N - NAO')
                        TabOrder = 10
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBEdit228: TDBEdit
                        Left = 492
                        Top = 281
                        Width = 232
                        Height = 21
                        Hint = 
                          'Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo cli' +
                          'ente cadastrado.'
                        DataField = 'US_ENVMENSCADCL1'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 11
                      end
                      object DBEdit229: TDBEdit
                        Left = 492
                        Top = 305
                        Width = 232
                        Height = 21
                        Hint = 
                          'Usu'#225'rio do sistema retaguarda respons'#225'vel por aprovar o novo cli' +
                          'ente cadastrado.'
                        DataField = 'US_ENVMENSCADCL2'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 12
                      end
                    end
                  end
                  object TabSheet33: TTabSheet
                    Caption = 'Suporte'
                    ImageIndex = 11
                    object Panel11: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label370: TLabel
                        Left = 13
                        Top = 24
                        Width = 102
                        Height = 13
                        Caption = 'Url de Suporte Online'
                        FocusControl = DBEdit213
                      end
                      object DBEdit213: TDBEdit
                        Tag = 1
                        Left = 121
                        Top = 21
                        Width = 624
                        Height = 21
                        DataField = 'URL_SUPORTE_ONLINE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                    end
                  end
                  object TabSheet36: TTabSheet
                    Caption = 'Ve'#237'culos'
                    ImageIndex = 12
                    object Label374: TLabel
                      Left = 192
                      Top = 24
                      Width = 94
                      Height = 13
                      Caption = 'Modulo de Ve'#237'culos:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label385: TLabel
                      Left = 563
                      Top = 51
                      Width = 91
                      Height = 13
                      Caption = 'Cod Serv. Interm.:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label426: TLabel
                      Left = 203
                      Top = 51
                      Width = 83
                      Height = 13
                      Caption = 'Tipo de Empresa:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label427: TLabel
                      Left = 19
                      Top = 77
                      Width = 267
                      Height = 13
                      Caption = 'Habilitar informa'#231#245'es de Redu'#231#227'o no Modelo de Ve'#237'culo:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label428: TLabel
                      Left = 134
                      Top = 205
                      Width = 152
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual Comiss'#227'o Vendedor:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label429: TLabel
                      Left = 509
                      Top = 127
                      Width = 145
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual Comiss'#227'o Gerente:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label430: TLabel
                      Left = 108
                      Top = 231
                      Width = 178
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual Retorno Banco Vendedor:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label431: TLabel
                      Left = 483
                      Top = 153
                      Width = 171
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Percentual Retorno Banco Gerente:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label432: TLabel
                      Left = 120
                      Top = 256
                      Width = 166
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Senha de Prote'#231#227'o dos Contratos:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label434: TLabel
                      Left = 8
                      Top = 121
                      Width = 278
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 
                        'Conferir CNPJ ao fazer Transfer'#234'ncia, caso esteja configurado pa' +
                        'ra gerar Pr'#233'-Nota para as outras empresa:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      WordWrap = True
                    end
                    object Label435: TLabel
                      Left = 432
                      Top = 77
                      Width = 222
                      Height = 13
                      Caption = 'Considerar Ve'#237'culo no Dep'#243'sito como Estoque:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label437: TLabel
                      Left = 45
                      Top = 100
                      Width = 241
                      Height = 13
                      Caption = 'C'#243'digo do Controle configurado como MTUSADAS:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label86: TLabel
                      Left = 149
                      Top = 154
                      Width = 137
                      Height = 13
                      Caption = 'Dias Demonstra'#231#227'o Produto:'
                      FocusControl = DBEdit56
                    end
                    object Label87: TLabel
                      Left = -94
                      Top = 383
                      Width = 108
                      Height = 13
                      Caption = 'Dias Reserva (Venda):'
                      FocusControl = DBEdit57
                      Visible = False
                    end
                    object Label443: TLabel
                      Left = 16
                      Top = 173
                      Width = 272
                      Height = 26
                      Alignment = taRightJustify
                      Caption = 
                        'Adicionar zeros a esquerda quando chassi do ve'#237'culo for menor qu' +
                        'e 17 caracteres:'
                      FocusControl = DBEdit57
                      WordWrap = True
                    end
                    object Label63: TLabel
                      Left = 584
                      Top = 24
                      Width = 70
                      Height = 13
                      Caption = 'C'#243'd. Concess:'
                      FocusControl = DBEdit41
                    end
                    object Label45: TLabel
                      Left = -2
                      Top = 30
                      Width = 72
                      Height = 13
                      Caption = 'Concession'#225'ria'
                      Visible = False
                    end
                    object Label448: TLabel
                      Left = -93
                      Top = 408
                      Width = 107
                      Height = 13
                      Caption = 'Dias Reserva (Banco):'
                      FocusControl = DBEdit57
                      Visible = False
                    end
                    object Label453: TLabel
                      Left = 165
                      Top = 287
                      Width = 121
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mascara Grupo/Cota/RD:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label454: TLabel
                      Left = 0
                      Top = 315
                      Width = 288
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Agrupar hist'#243'rico (NOTAFISCAL, COMANDO, OS, ORC) por:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label455: TLabel
                      Left = 497
                      Top = 338
                      Width = 157
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Enviar email reserva de ve'#237'culos:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object lbOrdemExibicao: TLabel
                      Left = 96
                      Top = 367
                      Width = 192
                      Height = 13
                      Caption = 'Ordem exibi'#231#227'o do controle de estoque:'
                      FocusControl = BitBtn1
                    end
                    object lbReordenarFila: TLabel
                      Left = 24
                      Top = 341
                      Width = 264
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ativar reordena'#231#227'o dos vendedores na fila de reserva:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object lbCtrPlano: TLabel
                      Left = 530
                      Top = 184
                      Width = 215
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controles adicionais do plano de pagamento:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBComboBox112: TDBComboBox
                      Left = 294
                      Top = 21
                      Width = 86
                      Height = 21
                      Hint = 'Modulo de Ve'#237'culos a ser utilizado.'
                      DataField = 'VERSAO_VEICULO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        '3.0'
                        '4.0')
                      TabOrder = 0
                    end
                    object DBEdit218: TDBEdit
                      Left = 660
                      Top = 48
                      Width = 85
                      Height = 21
                      Hint = 'C'#243'digo Servi'#231'o utilizado nos contratos de Intermedia'#231#227'o'
                      DataField = 'COD_SERV_INTERM'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 3
                    end
                    object DBComboBox139: TDBComboBox
                      Left = 294
                      Top = 48
                      Width = 86
                      Height = 21
                      Hint = 'Tipo de Empresa (Concession'#225'ria ou Ag'#234'ncia)'
                      DataField = 'TP_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'C - CONCESSION'#193'RIA'
                        'A - AG'#202'NCIA')
                      TabOrder = 2
                    end
                    object DBComboBox140: TDBComboBox
                      Left = 294
                      Top = 73
                      Width = 86
                      Height = 21
                      Hint = 'Habilitar o uso da Redu'#231#227'o no Modelo de Ve'#237'culo'
                      DataField = 'INF_RED_LUCRO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 4
                    end
                    object DBEdit230: TDBEdit
                      Left = 294
                      Top = 202
                      Width = 86
                      Height = 21
                      DataField = 'PERC_COMISSAO_V_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 13
                    end
                    object DBEdit231: TDBEdit
                      Left = 660
                      Top = 124
                      Width = 85
                      Height = 21
                      DataField = 'PERC_COMISSAO_G_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 9
                    end
                    object DBEdit232: TDBEdit
                      Left = 294
                      Top = 227
                      Width = 86
                      Height = 21
                      DataField = 'PERC_RET_BANCO_V_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 14
                    end
                    object DBEdit233: TDBEdit
                      Left = 660
                      Top = 150
                      Width = 85
                      Height = 21
                      DataField = 'PERC_RET_BANCO_G_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 11
                    end
                    object DBEdit234: TDBEdit
                      Left = 294
                      Top = 253
                      Width = 166
                      Height = 25
                      DataField = 'SENHA_CONTRATO_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Webdings'
                      Font.Style = []
                      ParentFont = False
                      PasswordChar = '*'
                      TabOrder = 15
                    end
                    object DBComboBox142: TDBComboBox
                      Left = 660
                      Top = 73
                      Width = 85
                      Height = 21
                      Hint = 'Considerar V'#233'iculos no Dep'#243'sito como Estoque'
                      DataField = 'CONS_DEPOSITO_ESTOQUE'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 5
                    end
                    object DBComboBox143: TDBComboBox
                      Left = 294
                      Top = 124
                      Width = 86
                      Height = 21
                      Hint = 'Conferir CNPJ ao fazer transfer'#234'ncia'
                      DataField = 'CONF_CNPJ_TRANSFDEP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 8
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 381
                      Top = 98
                      Width = 364
                      Height = 21
                      BevelOuter = bvNone
                      DataField = 'COD_CTRL_MTUSADAS'
                      DataSource = DtmCadBasicos.dsEmpresa
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL'
                      ListSource = DtmCadBasicos.dsControlesEmp
                      TabOrder = 7
                    end
                    object DBEdit237: TDBEdit
                      Left = 294
                      Top = 98
                      Width = 86
                      Height = 21
                      DataField = 'COD_CTRL_MTUSADAS'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 6
                      OnExit = DBEdit237Exit
                    end
                    object DBEdit56: TDBEdit
                      Left = 294
                      Top = 151
                      Width = 86
                      Height = 21
                      Hint = 'Dias para Demonstra'#231#227'o para os Veiculos do Sistema de Veiculos'
                      DataField = 'DIAS_DEMO_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 10
                    end
                    object DBEdit57: TDBEdit
                      Left = 22
                      Top = 380
                      Width = 86
                      Height = 21
                      Hint = 'Dias para reserva de ve'#237'culos do tipo venda'
                      DataField = 'DIAS_RES_EMP'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 25
                      Visible = False
                    end
                    object DBComboBox147: TDBComboBox
                      Left = 294
                      Top = 178
                      Width = 86
                      Height = 21
                      DataField = 'ACRESC_CARACTERES_CHASSI'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 12
                    end
                    object DBEdit41: TDBEdit
                      Left = 660
                      Top = 21
                      Width = 85
                      Height = 21
                      Hint = 'N'#250'mero da Concession'#225'ria junto a sua bandeira'
                      DataField = 'N_CONC_ASS'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 1
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 74
                      Top = 27
                      Width = 86
                      Height = 21
                      Hint = 'Empresa concession'#225'ria de ve'#237'culos'
                      DataField = 'CONCESS'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 27
                      Visible = False
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBEdit238: TDBEdit
                      Left = 22
                      Top = 405
                      Width = 86
                      Height = 21
                      Hint = 'Dias para reserva de ve'#237'culos do tipo banco'
                      DataField = 'DIAS_RES_BANCO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 26
                      Visible = False
                    end
                    object DBEdit242: TDBEdit
                      Left = 294
                      Top = 284
                      Width = 166
                      Height = 21
                      DataField = 'MASCARA_GRUPO_COTA_RD'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 16
                    end
                    object DBComboBox151: TDBComboBox
                      Left = 294
                      Top = 312
                      Width = 86
                      Height = 21
                      DataField = 'AGRUPAR_HISTORICO_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'C - CHASSI'
                        'P - PLACA'
                        'A - AMBOS')
                      TabOrder = 17
                    end
                    object DBComboBox154: TDBComboBox
                      Left = 660
                      Top = 337
                      Width = 85
                      Height = 21
                      DataField = 'ENV_EMAIL_RESERVA_VEIC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 19
                    end
                    object DBOrdemExibicao: TDBMemo
                      Tag = 1
                      Left = 294
                      Top = 364
                      Width = 451
                      Height = 41
                      DataField = 'SQL_ORDEM_FILA_RES'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ScrollBars = ssVertical
                      TabOrder = 20
                    end
                    object DBReordenarFIla: TDBComboBox
                      Left = 294
                      Top = 338
                      Width = 86
                      Height = 21
                      DataField = 'REORDENAR_FILA_RES'
                      DataSource = DtmCadBasicos.dsEmpresa
                      ItemHeight = 13
                      Items.Strings = (
                        'N - N'#195'O'
                        'S - SIM')
                      TabOrder = 18
                    end
                    object ComboBoxCtrPlano: TComboBox
                      Left = 544
                      Top = 204
                      Width = 201
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      ItemIndex = 0
                      TabOrder = 21
                      Text = 'RETORNO'
                      Items.Strings = (
                        'RETORNO'
                        'FRETE'
                        'RECIBOSANT'
                        'OUTROS')
                    end
                    object BtAddCtrPlano: TBitBtn
                      Left = 544
                      Top = 228
                      Width = 100
                      Height = 25
                      Caption = 'Add'
                      TabOrder = 22
                      OnClick = BtAddCtrPlanoClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                    end
                    object BtDelCtrPlano: TBitBtn
                      Left = 645
                      Top = 228
                      Width = 100
                      Height = 25
                      Caption = 'Del'
                      TabOrder = 23
                      OnClick = BtDelCtrPlanoClick
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100000021A5006B84
                        C6000029E700526BF700638CF7009494F700FF00FF009CB5FF009CBDFF00B5C6
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
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
                        0606060606060606060606060606060606060606060606060606060606060606
                        0606060606060606060606060606060606060606060606060606060606060606
                        0606060606060606060606060606060606060606060606060606060100000000
                        0000000000000000010606000502020202020202020202020006060009080807
                        0707040404040303000606010000000000000000000000000106060606060606
                        0606060606060606060606060606060606060606060606060606060606060606
                        0606060606060606060606060606060606060606060606060606060606060606
                        0606060606060606060606060606060606060606060606060606}
                    end
                    object ListBoxCtrPlano: TListBox
                      Left = 544
                      Top = 252
                      Width = 201
                      Height = 80
                      ItemHeight = 13
                      TabOrder = 24
                    end
                  end
                  object TabSheet37: TTabSheet
                    Caption = 'Confer'#234'ncias'
                    ImageIndex = 13
                    object Panel13: TPanel
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 0
                      object gbConferenciaCega: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 763
                        Height = 184
                        Align = alTop
                        Caption = 'Confer'#234'ncia Cega'
                        TabOrder = 0
                        object Label441: TLabel
                          Left = 146
                          Top = 107
                          Width = 87
                          Height = 13
                          Caption = 'Confirmar venda: '
                        end
                        object Label387: TLabel
                          Left = 118
                          Top = 80
                          Width = 115
                          Height = 13
                          Caption = 'Conferencia Cega Saida'
                        end
                        object Label386: TLabel
                          Left = 106
                          Top = 53
                          Width = 127
                          Height = 13
                          Caption = 'Conferencia Cega Entrada'
                        end
                        object DBComboBox145: TDBComboBox
                          Left = 239
                          Top = 104
                          Width = 65
                          Height = 21
                          Hint = 
                            'No fechamento da confer'#234'ncia cega tamb'#233'm ser'#225' fechada a venda vi' +
                            'nculada'
                          DataField = 'CONF_CEGA_FECHAR_VENDA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 2
                        end
                        object DBComboBox118: TDBComboBox
                          Left = 239
                          Top = 77
                          Width = 258
                          Height = 21
                          DataField = 'CONF_CEGA_SAIDA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          ItemHeight = 13
                          Items.Strings = (
                            'N - N'#227'o utilizar Confer'#234'ncia Cega'
                            'S1 - Carga;'
                            'S2 - Pedido;'
                            'S3 - Pedidos(em lote pela Carga);')
                          TabOrder = 1
                        end
                        object DBComboBox117: TDBComboBox
                          Left = 239
                          Top = 50
                          Width = 65
                          Height = 21
                          DataField = 'USAR_CONFERENCIA_ENTRADA'
                          DataSource = DtmCadBasicos.dsEmpresa
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'NAO')
                          TabOrder = 0
                        end
                      end
                    end
                  end
                  object tsDebCred: TTabSheet
                    Caption = 'D'#233'bito e Cr'#233'dito'
                    ImageIndex = 16
                    object GroupBox35: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 184
                      Align = alTop
                      TabOrder = 0
                      object Label449: TLabel
                        Left = 15
                        Top = 106
                        Width = 261
                        Height = 13
                        Caption = 'Percentual para lan'#231'ar D'#233'bito e Credito na Devolu'#231#227'o:'
                      end
                      object Label450: TLabel
                        Left = 91
                        Top = 80
                        Width = 185
                        Height = 13
                        Caption = 'Lan'#231'ar D'#233'bito e Credito na Devolu'#231#227'o:'
                      end
                      object Label451: TLabel
                        Left = 166
                        Top = 53
                        Width = 110
                        Height = 13
                        Caption = 'Usar D'#233'bito e Cr'#233'dito: '
                      end
                      object DBComboBox152: TDBComboBox
                        Left = 280
                        Top = 77
                        Width = 74
                        Height = 21
                        Hint = 
                          'Fazer lan'#231'amentos de d'#233'bito e cr'#233'dito na conta do colaborador ao' +
                          ' fazer ou excluir uma devolu'#231#227'o de mercadoria. (Caso usar D'#233'bito' +
                          ' e Cr'#233'dito = SIM)'
                        DataField = 'LANCDEBCRED_DEV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'NAO'
                          'SIM')
                        TabOrder = 1
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBComboBox153: TDBComboBox
                        Left = 280
                        Top = 50
                        Width = 74
                        Height = 21
                        Hint = 'Fazer lan'#231'amentos de d'#233'bito e cr'#233'dito na conta do colaborador.'
                        DataField = 'USARDEBITOCREDITO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 0
                        OnKeyPress = DBComboBox19KeyPress
                      end
                      object DBEdit239: TDBEdit
                        Left = 280
                        Top = 103
                        Width = 74
                        Height = 21
                        Hint = 
                          'Percentual padr'#227'o de todos os produtos para lan'#231'amento de d'#233'bito' +
                          ' e cr'#233'dito na conta do colaborador em caso de devolu'#231#227'o de merca' +
                          'dorias. (Caso usar D'#233'bito e Cr'#233'dito = SIM)'
                        DataField = 'PERC_LANCDEBCRED_DEV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Campos Pad'#245'es de Pesquisa/Etc'
                ImageIndex = 3
                object GroupBox14: TGroupBox
                  Left = 1
                  Top = 0
                  Width = 779
                  Height = 435
                  TabOrder = 0
                  object Label105: TLabel
                    Left = 58
                    Top = 16
                    Width = 74
                    Height = 13
                    Caption = 'Campo Produto'
                  end
                  object Label106: TLabel
                    Left = 63
                    Top = 41
                    Width = 69
                    Height = 13
                    Caption = 'Campo Cliente'
                  end
                  object Label107: TLabel
                    Left = 63
                    Top = 65
                    Width = 69
                    Height = 13
                    Caption = 'Campo Ve'#237'culo'
                  end
                  object Label108: TLabel
                    Left = 51
                    Top = 88
                    Width = 81
                    Height = 13
                    Caption = 'Local Pagamento'
                    FocusControl = DBEdit71
                  end
                  object Label109: TLabel
                    Left = 65
                    Top = 112
                    Width = 67
                    Height = 13
                    Caption = 'Obs. Protesto'
                    FocusControl = DBEdit72
                  end
                  object Label110: TLabel
                    Left = 43
                    Top = 136
                    Width = 90
                    Height = 13
                    Caption = 'Declara'#231#227'o Padr'#227'o'
                    FocusControl = DBMemo2
                  end
                  object Label111: TLabel
                    Left = 64
                    Top = 200
                    Width = 68
                    Height = 13
                    Caption = 'Decl. em OBS.'
                  end
                  object Label112: TLabel
                    Left = 7
                    Top = 227
                    Width = 125
                    Height = 13
                    Caption = 'Layout Recibo Boleto Html'
                  end
                  object Label113: TLabel
                    Left = 599
                    Top = 16
                    Width = 73
                    Height = 13
                    Caption = 'Pesquisa Exata'
                  end
                  object Label114: TLabel
                    Left = 502
                    Top = 41
                    Width = 170
                    Height = 13
                    Caption = 'Editar cadastro do cliente na venda'
                  end
                  object Label115: TLabel
                    Left = 234
                    Top = 200
                    Width = 135
                    Height = 13
                    Caption = 'Sequ'#234'ncia Arquivo Remessa'
                    FocusControl = DBEdit73
                  end
                  object Label116: TLabel
                    Left = 480
                    Top = 90
                    Width = 92
                    Height = 13
                    Caption = '(Boletas Banc'#225'rias)'
                  end
                  object Label117: TLabel
                    Left = 480
                    Top = 112
                    Width = 92
                    Height = 13
                    Caption = '(Boletas Banc'#225'rias)'
                  end
                  object DBComboBox27: TDBComboBox
                    Left = 138
                    Top = 13
                    Width = 225
                    Height = 21
                    Hint = 'Campo padr'#227'o para pesquisar produtos'
                    DataField = 'CPPADPROD'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    TabOrder = 0
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBComboBox28: TDBComboBox
                    Left = 138
                    Top = 38
                    Width = 225
                    Height = 21
                    Hint = 'Campo padr'#227'o para pesquisar clientes'
                    DataField = 'CPPADCL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    TabOrder = 2
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBComboBox29: TDBComboBox
                    Left = 138
                    Top = 62
                    Width = 225
                    Height = 21
                    Hint = 'Campo padr'#227'o para pesquisar clientes'
                    DataField = 'CPPADVEI'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    TabOrder = 4
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBEdit71: TDBEdit
                    Left = 138
                    Top = 85
                    Width = 336
                    Height = 21
                    Hint = 
                      'Local de pagamento nas boletas emitidas pelo sistema, campo de m' +
                      'ensagem padr'#227'o'
                    DataField = 'LOCAL_PAG'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 5
                  end
                  object DBEdit72: TDBEdit
                    Left = 138
                    Top = 109
                    Width = 336
                    Height = 21
                    Hint = 'Observa'#231#227'o padr'#227'o de protesto para Boletas'
                    DataField = 'OBS_BOL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 6
                  end
                  object DBMemo2: TDBMemo
                    Left = 138
                    Top = 135
                    Width = 336
                    Height = 54
                    Hint = 'Dados padr'#245'es que sair'#227'o no campo de Observa'#231#245'es da O.S.'
                    DataField = 'OBS_DECL_OS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 7
                  end
                  object DBComboBox30: TDBComboBox
                    Left = 138
                    Top = 197
                    Width = 59
                    Height = 21
                    Hint = 
                      'Imprimir a decalara'#231#227'o da O.S. no verso da folha de O.S. padr'#227'o ' +
                      'da Honda'
                    DataField = 'DECL_OBS_OS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 8
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBMemo3: TDBMemo
                    Left = 138
                    Top = 224
                    Width = 612
                    Height = 195
                    Hint = 'Layout do boleto banc'#225'rio CobreBem'
                    DataField = 'RECIBO_HTML_BOLETO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 10
                  end
                  object DBComboBox31: TDBComboBox
                    Left = 678
                    Top = 13
                    Width = 60
                    Height = 21
                    Hint = 'Pesquisa Exata'
                    DataField = 'UTIL_PESQE'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 1
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBComboBox32: TDBComboBox
                    Left = 678
                    Top = 38
                    Width = 60
                    Height = 21
                    Hint = 'Editar cadastro do cliente na venda'
                    DataField = 'US_EDICAOCLIENTE_VENDA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 3
                    OnKeyPress = DBComboBox27KeyPress
                  end
                  object DBEdit73: TDBEdit
                    Left = 373
                    Top = 196
                    Width = 101
                    Height = 21
                    Hint = 'Sequ'#234'ncia do arquivo de remessa das boletas'
                    DataField = 'SEQ_ARQ_REMESSA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 9
                  end
                end
              end
              object TabSheet7: TTabSheet
                Caption = 'Encargos/Imp. Sobre Venda'
                ImageIndex = 4
                object GroupBox15: TGroupBox
                  Left = -3
                  Top = 0
                  Width = 780
                  Height = 435
                  TabOrder = 0
                  object Label118: TLabel
                    Left = 142
                    Top = 16
                    Width = 30
                    Height = 13
                    Caption = 'Cofins'
                    FocusControl = DBEdit74
                  end
                  object Label119: TLabel
                    Left = 159
                    Top = 40
                    Width = 13
                    Height = 13
                    Caption = 'Pis'
                    FocusControl = DBEdit75
                  end
                  object Label120: TLabel
                    Left = 98
                    Top = 64
                    Width = 74
                    Height = 13
                    Caption = 'Comiss'#227'o Prod.'
                    FocusControl = DBEdit76
                  end
                  object Label121: TLabel
                    Left = 54
                    Top = 88
                    Width = 118
                    Height = 13
                    Caption = 'Encargo Sobre Comiss'#227'o'
                    FocusControl = DBEdit77
                  end
                  object Label122: TLabel
                    Left = 87
                    Top = 113
                    Width = 85
                    Height = 13
                    Caption = 'Custo do Estoque'
                    FocusControl = DBEdit78
                  end
                  object Label123: TLabel
                    Left = 92
                    Top = 140
                    Width = 80
                    Height = 13
                    Caption = 'Outros Encargos'
                    FocusControl = DBEdit79
                  end
                  object Label124: TLabel
                    Left = 359
                    Top = 16
                    Width = 74
                    Height = 13
                    Caption = 'Despesas Fixas'
                    FocusControl = DBEdit80
                  end
                  object Label125: TLabel
                    Left = 337
                    Top = 40
                    Width = 96
                    Height = 13
                    Caption = 'Juros Compra Prazo'
                    FocusControl = DBEdit81
                  end
                  object Label126: TLabel
                    Left = 359
                    Top = 64
                    Width = 73
                    Height = 13
                    Caption = 'Imposto Renda'
                    FocusControl = DBEdit82
                  end
                  object Label127: TLabel
                    Left = 342
                    Top = 88
                    Width = 90
                    Height = 13
                    Caption = 'Contribui'#231#227'o Social'
                    FocusControl = DBEdit83
                  end
                  object Label128: TLabel
                    Left = 397
                    Top = 113
                    Width = 35
                    Height = 13
                    Caption = 'Simples'
                    FocusControl = DBEdit84
                  end
                  object Label129: TLabel
                    Left = 407
                    Top = 140
                    Width = 25
                    Height = 13
                    Caption = 'Cpmf'
                    FocusControl = DBEdit85
                  end
                  object Label171: TLabel
                    Left = 580
                    Top = 118
                    Width = 29
                    Height = 13
                    Caption = 'ICMS:'
                    FocusControl = DBEdit130
                  end
                  object Label188: TLabel
                    Left = 682
                    Top = 118
                    Width = 20
                    Height = 13
                    Caption = 'ISS:'
                    FocusControl = DBEdit132
                  end
                  object Label452: TLabel
                    Left = 584
                    Top = 64
                    Width = 118
                    Height = 13
                    Caption = 'Adicional Imposto Renda'
                    FocusControl = DBEdit240
                  end
                  object DBEdit74: TDBEdit
                    Left = 178
                    Top = 13
                    Width = 137
                    Height = 21
                    Hint = 'Al'#237'quota da Cofins paga pelo produto na venda'
                    DataField = 'COFINS_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 0
                  end
                  object DBEdit75: TDBEdit
                    Left = 178
                    Top = 37
                    Width = 137
                    Height = 21
                    Hint = 'Al'#237'quota do Pis pago pelo produto na venda'
                    DataField = 'PIS_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 1
                  end
                  object DBEdit76: TDBEdit
                    Left = 178
                    Top = 61
                    Width = 137
                    Height = 21
                    Hint = 'Percentual padr'#227'o de comiss'#227'o sobre os produtos da empresa'
                    DataField = 'COMISS_PROD_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 2
                  end
                  object DBEdit77: TDBEdit
                    Left = 178
                    Top = 85
                    Width = 137
                    Height = 21
                    Hint = 'Percentual de Encargos sobre as comiss'#245'es pagas aos vendedores'
                    DataField = 'ENC_SOBR_COM'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 3
                  end
                  object DBEdit78: TDBEdit
                    Left = 178
                    Top = 110
                    Width = 137
                    Height = 21
                    Hint = 'Percentual de custo do estoque'
                    DataField = 'CUSTO_EST_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 4
                  end
                  object DBEdit79: TDBEdit
                    Left = 178
                    Top = 137
                    Width = 137
                    Height = 21
                    Hint = 
                      'Percentual de outros encargos(micro Gerais) que venha a incidir ' +
                      'sobre o produto na compra'
                    DataField = 'OUT_ENC_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 5
                  end
                  object DBEdit80: TDBEdit
                    Left = 437
                    Top = 13
                    Width = 137
                    Height = 21
                    Hint = 
                      'Percentual de despesas fixas apuradas no final do mes anterior p' +
                      'ara que o mesmo seja acrescentado no custo do produto'
                    DataField = 'DESP_FIXAS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 6
                  end
                  object DBEdit81: TDBEdit
                    Left = 437
                    Top = 38
                    Width = 137
                    Height = 21
                    Hint = 'Percentual de Juros para a compra a Prazo'
                    DataField = 'JR_CMP_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 7
                  end
                  object DBEdit82: TDBEdit
                    Left = 437
                    Top = 61
                    Width = 137
                    Height = 21
                    Hint = 
                      'Imposto de renda pago na venda de cada produto naturalmente se f' +
                      'or o regime diferente do Simples'
                    DataField = 'IMP_RENDA'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 8
                  end
                  object DBEdit83: TDBEdit
                    Left = 437
                    Top = 85
                    Width = 137
                    Height = 21
                    Hint = 
                      'Contribui'#231#227'o Social que '#233' pago em cima da venda de cada produto,' +
                      ' se o regime da empresa for diferente do Simples'
                    DataField = 'CONTR_S_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 10
                  end
                  object DBEdit84: TDBEdit
                    Left = 437
                    Top = 110
                    Width = 137
                    Height = 21
                    Hint = 
                      'Percentual do imposto Simples para cada produto na simula'#231#227'o de ' +
                      'margem'
                    DataField = 'SIMPLES_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 11
                  end
                  object DBEdit85: TDBEdit
                    Left = 438
                    Top = 137
                    Width = 137
                    Height = 21
                    Hint = 
                      'CPMF usada para o c'#225'lculo de custo dos produtos no formul'#225'rio de' +
                      ' simula'#231#227'o de margem de produtos'
                    DataField = 'CPMF_EMP'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 14
                  end
                  object GroupBox16: TGroupBox
                    Left = 4
                    Top = 163
                    Width = 768
                    Height = 266
                    Caption = 'Outros dados Plano de Venda'
                    TabOrder = 15
                    object Label130: TLabel
                      Left = 55
                      Top = 24
                      Width = 113
                      Height = 13
                      Caption = 'Dias p/ Pre'#231'o de Tabela'
                      FocusControl = DBEdit86
                    end
                    object Label131: TLabel
                      Left = 74
                      Top = 51
                      Width = 96
                      Height = 13
                      Caption = 'Prazo M'#233'dio p/ Vnd.'
                      FocusControl = DBEdit87
                    end
                    object Label132: TLabel
                      Left = 107
                      Top = 76
                      Width = 61
                      Height = 13
                      Caption = 'Custo Boleta'
                      FocusControl = DBEdit88
                    end
                    object Label133: TLabel
                      Left = 107
                      Top = 100
                      Width = 60
                      Height = 13
                      Caption = 'Taxa Cart'#227'o'
                      FocusControl = DBEdit89
                    end
                    object Label134: TLabel
                      Left = 59
                      Top = 127
                      Width = 109
                      Height = 13
                      Caption = 'Perc. de Venda Cart'#227'o'
                      FocusControl = DBEdit90
                    end
                    object Label135: TLabel
                      Left = 58
                      Top = 151
                      Width = 110
                      Height = 13
                      Caption = 'Taxa Cart'#227'o Parcelado'
                      FocusControl = DBEdit91
                    end
                    object Label136: TLabel
                      Left = 56
                      Top = 177
                      Width = 112
                      Height = 13
                      Caption = 'Dias de Rec. Financeira'
                      FocusControl = DBEdit92
                    end
                    object Label137: TLabel
                      Left = 48
                      Top = 202
                      Width = 120
                      Height = 13
                      Caption = 'Adic. Cobrado Financeira'
                      FocusControl = DBEdit93
                    end
                    object Label138: TLabel
                      Left = 29
                      Top = 225
                      Width = 138
                      Height = 13
                      Caption = 'Valor de Venda Minima finan.'
                      FocusControl = DBEdit94
                    end
                    object DBEdit86: TDBEdit
                      Left = 174
                      Top = 21
                      Width = 134
                      Height = 21
                      Hint = 'Dias para o pre'#231'o de tabela na venda com plano de pagamento'
                      DataField = 'DIAS_PREC_TAB'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 0
                    end
                    object DBEdit87: TDBEdit
                      Left = 174
                      Top = 48
                      Width = 134
                      Height = 21
                      Hint = 'Prazo m'#225'ximo em dias para venda no plano de pagamento'
                      DataField = 'PRAZO_MED_VND'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 1
                    end
                    object DBEdit88: TDBEdit
                      Left = 174
                      Top = 73
                      Width = 134
                      Height = 21
                      Hint = 'Custo da boleta para o c'#225'lculo do plano de pagamento'
                      DataField = 'CUSTO_BOLETA'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 2
                    end
                    object DBEdit89: TDBEdit
                      Left = 173
                      Top = 97
                      Width = 134
                      Height = 21
                      Hint = 'Taxa do cart'#227'o para o plano de pagamento'
                      DataField = 'TX_CARTAO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 3
                    end
                    object DBEdit90: TDBEdit
                      Left = 174
                      Top = 124
                      Width = 134
                      Height = 21
                      Hint = 'Percentual de venda no cart'#227'o para o plano de pagamento'
                      DataField = 'PERC_VND_CARTAO'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 4
                    end
                    object DBEdit91: TDBEdit
                      Left = 174
                      Top = 148
                      Width = 134
                      Height = 21
                      Hint = 
                        'Percentual cobrado pela administradora para venda parcelada no c' +
                        'art'#227'o. C'#225'lculo do plano.'
                      DataField = 'TX_CARTAO_PARC'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 5
                    end
                    object DBEdit92: TDBEdit
                      Left = 174
                      Top = 174
                      Width = 134
                      Height = 21
                      Hint = 
                        'Dias para o recebimento da financeira. Dado que entra no plano d' +
                        'e pagamento.'
                      DataField = 'DIAS_REC_FIN'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 6
                    end
                    object DBEdit93: TDBEdit
                      Left = 174
                      Top = 199
                      Width = 134
                      Height = 21
                      Hint = 
                        'Valor adicional cobrado pela financeira. Entra no calculo do pla' +
                        'no de pagamento'
                      DataField = 'ADIC_FIN'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 7
                    end
                    object DBEdit94: TDBEdit
                      Left = 173
                      Top = 222
                      Width = 134
                      Height = 21
                      Hint = 'Valor m'#237'nimo de venda para financiamento'
                      DataField = 'VND_MIN_FIN'
                      DataSource = DtmCadBasicos.dsEmpresa
                      TabOrder = 8
                    end
                    object GroupBox17: TGroupBox
                      Left = 434
                      Top = 21
                      Width = 311
                      Height = 207
                      Caption = 'Taxas Financeiras'
                      TabOrder = 9
                      object DBGrid2: TDBGrid
                        Left = 8
                        Top = 16
                        Width = 294
                        Height = 153
                        DataSource = DtmCadBasicos.dsTaxaJuros
                        ReadOnly = True
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnKeyDown = DBGrid2KeyDown
                      end
                      object BitBtn8: TBitBtn
                        Left = 81
                        Top = 175
                        Width = 75
                        Height = 25
                        Caption = 'OK'
                        TabOrder = 2
                        OnClick = BitBtn8Click
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
                      object BitBtn9: TBitBtn
                        Left = 162
                        Top = 175
                        Width = 74
                        Height = 25
                        Caption = 'Cancela'
                        TabOrder = 3
                        OnClick = BitBtn9Click
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
                      object Panel4: TPanel
                        Left = 3
                        Top = 16
                        Width = 305
                        Height = 153
                        TabOrder = 1
                        Visible = False
                        object Label167: TLabel
                          Left = 25
                          Top = 42
                          Width = 78
                          Height = 13
                          Caption = 'N'#186' da Presta'#231#227'o'
                          FocusControl = DBEdit114
                        end
                        object Label168: TLabel
                          Left = 34
                          Top = 67
                          Width = 69
                          Height = 13
                          Caption = 'Juro Praticado'
                          FocusControl = DBEdit115
                        end
                        object Label169: TLabel
                          Left = 49
                          Top = 94
                          Width = 54
                          Height = 13
                          Caption = 'Coeficiente'
                          FocusControl = DBEdit116
                        end
                        object DBEdit114: TDBEdit
                          Left = 108
                          Top = 37
                          Width = 134
                          Height = 21
                          Hint = 'N'#186' de presta'#231#245'es'
                          DataField = 'NPREST_J'
                          DataSource = DtmCadBasicos.dsTaxaJuros
                          TabOrder = 0
                        end
                        object DBEdit115: TDBEdit
                          Left = 108
                          Top = 64
                          Width = 134
                          Height = 21
                          Hint = 'Juros praticado'
                          DataField = 'JUROS_J'
                          DataSource = DtmCadBasicos.dsTaxaJuros
                          TabOrder = 1
                        end
                        object DBEdit116: TDBEdit
                          Left = 108
                          Top = 91
                          Width = 134
                          Height = 21
                          Hint = 'Coeficiente aplicado'
                          DataField = 'COEF_J'
                          DataSource = DtmCadBasicos.dsTaxaJuros
                          TabOrder = 2
                        end
                      end
                    end
                    object BitBtn10: TBitBtn
                      Left = 515
                      Top = 196
                      Width = 75
                      Height = 25
                      Caption = 'Incluir>>'
                      TabOrder = 10
                      OnClick = BitBtn10Click
                    end
                    object BitBtn11: TBitBtn
                      Left = 596
                      Top = 196
                      Width = 75
                      Height = 25
                      Caption = 'Alterar>>'
                      TabOrder = 11
                      OnClick = BitBtn11Click
                    end
                  end
                  object DBEdit130: TDBEdit
                    Left = 615
                    Top = 110
                    Width = 61
                    Height = 21
                    DataField = 'ALIQ_SIMPLES_ICM'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 12
                  end
                  object DBEdit132: TDBEdit
                    Left = 708
                    Top = 110
                    Width = 61
                    Height = 21
                    DataField = 'ALIQ_SIMPLES_ISS'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 13
                  end
                  object DBEdit240: TDBEdit
                    Left = 708
                    Top = 61
                    Width = 61
                    Height = 21
                    Hint = 
                      'Adicional do Imposto de renda pago na venda de cada produto natu' +
                      'ralmente se for o regime diferente do Simples e se o Lucro Apura' +
                      'do for superior a R$ 20.000,00,'
                    DataField = 'IMP_RENDA_ADICIONAL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 9
                  end
                end
              end
              object TabSheet8: TTabSheet
                Caption = 'NF-e'
                ImageIndex = 5
                object pnNfe: TPanel
                  Left = 0
                  Top = 0
                  Width = 784
                  Height = 437
                  TabOrder = 0
                  object pgControlNF: TPageControl
                    Left = 1
                    Top = 1
                    Width = 782
                    Height = 435
                    ActivePage = TabSheet10
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 0
                    object TabSheet9: TTabSheet
                      Caption = 'Endere'#231'os'
                      object Label139: TLabel
                        Left = 59
                        Top = 22
                        Width = 77
                        Height = 13
                        Caption = 'End. Certificado'
                        FocusControl = DBEdit95
                      end
                      object Label140: TLabel
                        Left = 69
                        Top = 50
                        Width = 67
                        Height = 13
                        Caption = 'Caminho Logo'
                        FocusControl = DBEdit96
                      end
                      object Label141: TLabel
                        Left = 73
                        Top = 76
                        Width = 63
                        Height = 13
                        Caption = 'Caminho XML'
                        FocusControl = DBEdit97
                      end
                      object Label142: TLabel
                        Left = 45
                        Top = 103
                        Width = 91
                        Height = 13
                        Caption = 'End Modelo DANFE'
                        FocusControl = DBEdit98
                      end
                      object Label143: TLabel
                        Left = 51
                        Top = 130
                        Width = 85
                        Height = 13
                        Caption = 'End exportar PDF'
                        FocusControl = DBEdit99
                      end
                      object DBEdit95: TDBEdit
                        Tag = 1
                        Left = 142
                        Top = 19
                        Width = 441
                        Height = 21
                        Hint = 'Endere'#231'o do Certificado'
                        DataField = 'NFE_CAMINHO_CERT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit96: TDBEdit
                        Tag = 1
                        Left = 142
                        Top = 46
                        Width = 441
                        Height = 21
                        Hint = 'Diret'#243'rio onde est'#225' a logomarca'
                        DataField = 'NFE_LOGOMARCA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit97: TDBEdit
                        Tag = 1
                        Left = 142
                        Top = 73
                        Width = 441
                        Height = 21
                        Hint = 'Deret'#243'rio onde ser'#225' salvo o XML da NF-e'
                        DataField = 'NFE_LOGPATH'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit98: TDBEdit
                        Tag = 1
                        Left = 142
                        Top = 100
                        Width = 441
                        Height = 21
                        Hint = 'Endere'#231'o do modelo do DANFE'
                        DataField = 'NFE_ENDRELRAVE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit99: TDBEdit
                        Tag = 1
                        Left = 142
                        Top = 128
                        Width = 441
                        Height = 21
                        Hint = 'Endere'#231'o para exporta'#231#227'o em PDF'
                        DataField = 'NFE_ENDERECOPDF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                    end
                    object TabSheet10: TTabSheet
                      Caption = 'Configura'#231#245'es'
                      ImageIndex = 1
                      object Label144: TLabel
                        Left = 59
                        Top = 27
                        Width = 85
                        Height = 13
                        Caption = 'Senha Certificado'
                        FocusControl = DBEdit100
                      end
                      object Label145: TLabel
                        Left = 41
                        Top = 48
                        Width = 103
                        Height = 13
                        Caption = 'Num S'#233'rie Certificado'
                        FocusControl = DBEdit101
                      end
                      object Label146: TLabel
                        Left = 73
                        Top = 75
                        Width = 71
                        Height = 13
                        Caption = 'Tipo de DANFE'
                      end
                      object Label147: TLabel
                        Left = 59
                        Top = 102
                        Width = 85
                        Height = 13
                        Caption = 'Forma Emiss NF-e'
                      end
                      object Label148: TLabel
                        Left = 71
                        Top = 128
                        Width = 73
                        Height = 13
                        Caption = 'UF WebService'
                      end
                      object Label149: TLabel
                        Left = 39
                        Top = 149
                        Width = 105
                        Height = 13
                        Caption = 'Ambiente WebService'
                      end
                      object Label150: TLabel
                        Left = 40
                        Top = 173
                        Width = 104
                        Height = 13
                        Caption = 'Visualizar WebService'
                      end
                      object Label151: TLabel
                        Left = 95
                        Top = 197
                        Width = 49
                        Height = 13
                        Caption = 'Dias Aviso'
                        FocusControl = DBEdit102
                      end
                      object Label152: TLabel
                        Left = 63
                        Top = 221
                        Width = 81
                        Height = 13
                        Caption = 'Cod IBGE Cidade'
                        FocusControl = DBEdit103
                      end
                      object Label153: TLabel
                        Left = 63
                        Top = 245
                        Width = 81
                        Height = 13
                        Caption = 'Cod IBGE Estado'
                        FocusControl = DBEdit104
                      end
                      object Label154: TLabel
                        Left = 477
                        Top = 27
                        Width = 60
                        Height = 13
                        Caption = 'Modelo NF-e'
                        FocusControl = DBEdit105
                      end
                      object Label155: TLabel
                        Left = 483
                        Top = 52
                        Width = 54
                        Height = 13
                        Caption = 'S'#233'rie SCAN'
                        FocusControl = DBEdit106
                      end
                      object Label156: TLabel
                        Left = 451
                        Top = 75
                        Width = 86
                        Height = 13
                        Caption = 'Usar Servi'#231'o NF-e'
                      end
                      object Label197: TLabel
                        Left = 438
                        Top = 102
                        Width = 99
                        Height = 13
                        Caption = 'Gravar Log das NF-E'
                      end
                      object Label198: TLabel
                        Left = 374
                        Top = 128
                        Width = 163
                        Height = 13
                        Caption = 'Tempo de espera em milisegundos'
                        FocusControl = DBEdit141
                      end
                      object Label199: TLabel
                        Left = 379
                        Top = 152
                        Width = 158
                        Height = 13
                        Caption = 'Qtde M'#225'x. NF-e sem autoriza'#231#227'o'
                        FocusControl = DBEdit142
                      end
                      object Label200: TLabel
                        Left = 367
                        Top = 179
                        Width = 170
                        Height = 13
                        Caption = 'Qtde M'#225'x. dias NF sem autoriza'#231#227'o'
                        FocusControl = DBEdit143
                      end
                      object Label201: TLabel
                        Left = 481
                        Top = 201
                        Width = 56
                        Height = 13
                        Caption = 'CNAE Fiscal'
                        FocusControl = DBEdit144
                      end
                      object Label206: TLabel
                        Left = 3
                        Top = 268
                        Width = 141
                        Height = 13
                        Caption = 'Mostrar Tot. com Desc. Item:'
                      end
                      object DBEdit100: TDBEdit
                        Tag = 1
                        Left = 150
                        Top = 24
                        Width = 145
                        Height = 21
                        Hint = 'Senha do Certificado'
                        DataField = 'NFE_SENHA__CERT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        PasswordChar = '*'
                        TabOrder = 0
                      end
                      object DBEdit101: TDBEdit
                        Tag = 1
                        Left = 150
                        Top = 48
                        Width = 145
                        Height = 21
                        Hint = 'N'#250'mero de s'#233'rie do certificado'
                        DataField = 'NFE_NUMSERIE_CERT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBComboBox33: TDBComboBox
                        Tag = 1
                        Left = 150
                        Top = 72
                        Width = 145
                        Height = 21
                        Hint = 'Tipo de DANFE'
                        DataField = 'NFE_DANFE_TIPO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Retrato'
                          'Paisagem'
                          'Simplificado'
                          'Selecionar')
                        TabOrder = 2
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBComboBox34: TDBComboBox
                        Tag = 1
                        Left = 150
                        Top = 99
                        Width = 145
                        Height = 21
                        Hint = 'Forma de Emiss'#227'o da NF-e'
                        DataField = 'NFE_DANFE_FOREMISS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        Enabled = False
                        ItemHeight = 13
                        Items.Strings = (
                          'NORMAL'
                          'SCAN'
                          'CONTINGENCIA'
                          'DPEC')
                        TabOrder = 3
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBLookupComboBox3: TDBLookupComboBox
                        Tag = 1
                        Left = 150
                        Top = 123
                        Width = 145
                        Height = 21
                        Hint = 'UF do WebService'
                        DataField = 'WEBSERV_UF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        KeyField = 'SIGLA_UF'
                        ListField = 'NOME_UF'
                        ListSource = DtmCadBasicos.dsUF
                        TabOrder = 4
                      end
                      object DBComboBox35: TDBComboBox
                        Tag = 1
                        Left = 150
                        Top = 146
                        Width = 145
                        Height = 21
                        Hint = 'Ambiente WebService'
                        DataField = 'WEBSERV_AMBIENTE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Produ'#231#227'o'
                          'Homologa'#231#227'o')
                        TabOrder = 5
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBComboBox36: TDBComboBox
                        Tag = 1
                        Left = 150
                        Top = 170
                        Width = 145
                        Height = 21
                        Hint = 'Visualizar WebService'
                        DataField = 'WEBSERV_VISUALIZAR'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 6
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBEdit102: TDBEdit
                        Tag = 1
                        Left = 150
                        Top = 194
                        Width = 65
                        Height = 21
                        Hint = 'Dias de Aviso'
                        DataField = 'DIAS_AVISO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 7
                      end
                      object DBEdit103: TDBEdit
                        Tag = 1
                        Left = 150
                        Top = 218
                        Width = 134
                        Height = 21
                        Hint = 'C'#243'digo IBGE da cidade'
                        DataField = 'IBGE_COD_CIDADE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 8
                        OnExit = DBEdit103Exit
                      end
                      object DBEdit104: TDBEdit
                        Tag = 1
                        Left = 150
                        Top = 242
                        Width = 134
                        Height = 21
                        Hint = 'C'#243'digo IBGE do estado'
                        DataField = 'IBGE_CODIGO_UF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 9
                      end
                      object DBEdit105: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 25
                        Width = 134
                        Height = 21
                        Hint = 'Modelo da Nota Fiscal'
                        DataField = 'MODELO_NF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 10
                      end
                      object DBEdit106: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 49
                        Width = 134
                        Height = 21
                        Hint = 'S'#233'rie do SCAN quando o SEFAZ estadual estiver fora do ar'
                        DataField = 'SERIE_SCAN'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 11
                      end
                      object DBComboBox37: TDBComboBox
                        Tag = 1
                        Left = 543
                        Top = 72
                        Width = 134
                        Height = 21
                        Hint = 'Indica se ir'#225' usar NF-e para servi'#231'os'
                        DataField = 'USO_SERVICO_NFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 12
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBEdit141: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 125
                        Width = 134
                        Height = 21
                        Hint = 
                          'Tempo em milisegundos de espera al'#233'm dos 5 segundos de tempo de ' +
                          'espera padr'#227'o'
                        DataField = 'NFE_TMPRETORNOMIL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 14
                      end
                      object DBEdit142: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 149
                        Width = 134
                        Height = 21
                        Hint = 'Quantidade M'#225'xima de nfes sem autoriza'#231#227'o'
                        DataField = 'NFE_QTDELIMITENFPEND'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 15
                      end
                      object DBEdit143: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 174
                        Width = 134
                        Height = 21
                        Hint = 'Quantidade m'#225'xima de dias que a nf pode ficar sem autoriza'#231#227'o'
                        DataField = 'NFEPENDEMDIAS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 16
                      end
                      object DBEdit144: TDBEdit
                        Tag = 1
                        Left = 543
                        Top = 198
                        Width = 95
                        Height = 21
                        Hint = 'C'#243'digo Nacional de Atividade Econ'#244'mica da empresa'
                        DataField = 'CNAE_FISCAL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 17
                        OnExit = DBEdit144Exit
                      end
                      object DBComboBox46: TDBComboBox
                        Tag = 1
                        Left = 543
                        Top = 98
                        Width = 134
                        Height = 21
                        Hint = 'S para gravar log de NF-es e N para n'#227'o gravar log'
                        DataField = 'NFE_GRAVALOG'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 13
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object DBComboBox50: TDBComboBox
                        Tag = 1
                        Left = 150
                        Top = 265
                        Width = 134
                        Height = 21
                        Hint = 'Mostrar Total de desconto  no item na NFe'
                        DataField = 'MS_VAL_LIQ_NFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 18
                        OnKeyPress = DBComboBox33KeyPress
                      end
                      object groupAutXML: TGroupBox
                        Left = 367
                        Top = 225
                        Width = 271
                        Height = 182
                        Caption = 'CPF ou CNPJ Autorizados a acessar XML'
                        TabOrder = 19
                        object spBtAutXMLAdicionar: TSpeedButton
                          Left = 2
                          Top = 136
                          Width = 267
                          Height = 22
                          Align = alBottom
                          Caption = 'Adicionar'
                          Flat = True
                          OnClick = spBtAutXMLAdicionarClick
                          ExplicitLeft = 96
                          ExplicitTop = 72
                          ExplicitWidth = 23
                        end
                        object spBtAutXMLRemover: TSpeedButton
                          Left = 2
                          Top = 158
                          Width = 267
                          Height = 22
                          Align = alBottom
                          Caption = 'Remover'
                          Flat = True
                          OnClick = spBtAutXMLRemoverClick
                          ExplicitLeft = 200
                          ExplicitTop = 88
                          ExplicitWidth = 23
                        end
                        object lbxAutXML: TListBox
                          Left = 2
                          Top = 15
                          Width = 267
                          Height = 121
                          Align = alClient
                          ItemHeight = 13
                          TabOrder = 0
                        end
                      end
                    end
                    object TabSheet11: TTabSheet
                      Caption = 'E-mail'
                      ImageIndex = 2
                      object Label159: TLabel
                        Left = 59
                        Top = 16
                        Width = 87
                        Height = 13
                        Caption = 'Enviar e-mail NF-e'
                      end
                      object Label160: TLabel
                        Left = 116
                        Top = 97
                        Width = 30
                        Height = 13
                        Caption = 'Senha'
                        FocusControl = DBEdit109
                      end
                      object Label161: TLabel
                        Left = 118
                        Top = 43
                        Width = 28
                        Height = 13
                        Caption = 'E-mail'
                        FocusControl = DBEdit110
                      end
                      object Label162: TLabel
                        Left = 91
                        Top = 151
                        Width = 55
                        Height = 13
                        Caption = 'Porta SMTP'
                        FocusControl = DBEdit111
                      end
                      object Label163: TLabel
                        Left = 104
                        Top = 201
                        Width = 42
                        Height = 13
                        Caption = 'Usar SSL'
                      end
                      object Label164: TLabel
                        Left = 76
                        Top = 230
                        Width = 70
                        Height = 13
                        Caption = 'Assunto e-mail'
                        FocusControl = DBEdit112
                      end
                      object Label165: TLabel
                        Left = 64
                        Top = 265
                        Width = 82
                        Height = 13
                        Caption = 'Mensagem e-mail'
                      end
                      object Label185: TLabel
                        Left = 77
                        Top = 124
                        Width = 69
                        Height = 13
                        Caption = 'Servidor SMTP'
                        FocusControl = DBEdit127
                      end
                      object Label186: TLabel
                        Left = 121
                        Top = 70
                        Width = 25
                        Height = 13
                        Caption = 'Login'
                        FocusControl = DBEdit128
                      end
                      object Label223: TLabel
                        Left = 25
                        Top = 181
                        Width = 121
                        Height = 13
                        Caption = 'Porta SMTP TLS FlexDocs'
                        FocusControl = DBEdit156
                      end
                      object Label461: TLabel
                        Left = 360
                        Top = 201
                        Width = 42
                        Height = 13
                        Caption = 'Usar TSL'
                      end
                      object DBComboBox38: TDBComboBox
                        Tag = 1
                        Left = 152
                        Top = 13
                        Width = 57
                        Height = 21
                        Hint = 'Enviar NF-e por e-mail'
                        DataField = 'ENVIAEMAILNFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 0
                        OnKeyPress = DBComboBox38KeyPress
                      end
                      object DBEdit109: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 94
                        Width = 145
                        Height = 21
                        Hint = 'Senha'
                        DataField = 'EMAIL_SENHA'
                        DataSource = DtmCadBasicos.dsEmpresa
                        PasswordChar = '*'
                        TabOrder = 3
                      end
                      object DBEdit110: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 40
                        Width = 401
                        Height = 21
                        Hint = 'e-mail a ser configurado para enviar a NF-e'
                        DataField = 'EMAIL_EMP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                      end
                      object DBEdit111: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 148
                        Width = 145
                        Height = 21
                        Hint = 'Porta SMTP'
                        DataField = 'PORTA_SMTP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 5
                      end
                      object DBComboBox39: TDBComboBox
                        Tag = 1
                        Left = 152
                        Top = 200
                        Width = 145
                        Height = 21
                        Hint = 'O e-mail utiliza SSL'
                        DataField = 'EMAIL_USASSL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 7
                        OnKeyPress = DBComboBox38KeyPress
                      end
                      object DBEdit112: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 227
                        Width = 401
                        Height = 21
                        Hint = 'Assunto NF-e'
                        DataField = 'ASSUNTO_NFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 9
                      end
                      object DBMemo4: TDBMemo
                        Tag = 1
                        Left = 152
                        Top = 254
                        Width = 401
                        Height = 89
                        Hint = 'Mensagem do e-mail'
                        DataField = 'MENSAGEM_NFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 10
                      end
                      object DBEdit127: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 121
                        Width = 401
                        Height = 21
                        Hint = 
                          'Smtp utilizado para que o sistema possa enviar os e-mail para os' +
                          ' clientes'
                        DataField = 'SMTP_EMP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                      object DBEdit128: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 67
                        Width = 145
                        Height = 21
                        Hint = 'Login para utilizar o SMTP para envio de e-mail'
                        DataField = 'LOGIN_EMP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit156: TDBEdit
                        Tag = 1
                        Left = 152
                        Top = 173
                        Width = 145
                        Height = 21
                        Hint = 'Porta Smtp para a DLL FlexDocs'
                        DataField = 'PORTA_SMTPTSL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 6
                      end
                      object DBComboBox155: TDBComboBox
                        Tag = 1
                        Left = 408
                        Top = 200
                        Width = 145
                        Height = 21
                        Hint = 'O e-mail utiliza SSL'
                        DataField = 'EMAIL_USATLS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 8
                        OnKeyPress = DBComboBox38KeyPress
                      end
                    end
                    object TabSheet14: TTabSheet
                      Caption = 'NFS-e'
                      ImageIndex = 3
                      object Label207: TLabel
                        Left = 3
                        Top = 16
                        Width = 141
                        Height = 13
                        Caption = 'Natureza de Opera'#231#227'o NFSe:'
                      end
                      object Label208: TLabel
                        Left = 214
                        Top = 2
                        Width = 411
                        Height = 13
                        Caption = 
                          '(1 '#8211' Tributa'#231#227'o no munic'#237'pio; 2 '#8211' Tributa'#231#227'o fora do munic'#237'pio 3' +
                          ' '#8211' Isen'#231#227'o; 4 '#8211' Imune '
                        Color = clBtnFace
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentColor = False
                        ParentFont = False
                      end
                      object Label209: TLabel
                        Left = 214
                        Top = 18
                        Width = 508
                        Height = 13
                        Caption = 
                          '5 '#8211' Exigibilidade suspensa por decis'#227'o Judicial 6 '#8211' Exigibilidad' +
                          'e suspensa por procedimento Administrativo)'
                        Color = clBtnFace
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentColor = False
                        ParentFont = False
                      end
                      object Label210: TLabel
                        Left = 13
                        Top = 43
                        Width = 121
                        Height = 13
                        Caption = 'Regime Tributa'#231#227'o NFSe:'
                        FocusControl = DBEdit146
                      end
                      object Label212: TLabel
                        Left = 9
                        Top = 70
                        Width = 125
                        Height = 13
                        Caption = 'Optante Simples Nacional:'
                        FocusControl = DBEdit147
                      end
                      object Label213: TLabel
                        Left = 214
                        Top = 70
                        Width = 194
                        Height = 13
                        Caption = '(1 - SIM ME/EPP | 2 - N'#195'O | 3 - SIM MEI)'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label214: TLabel
                        Left = 29
                        Top = 97
                        Width = 105
                        Height = 13
                        Caption = 'Incentivador Cultural:'
                        FocusControl = DBEdit148
                      end
                      object Label215: TLabel
                        Left = 214
                        Top = 97
                        Width = 83
                        Height = 13
                        Caption = '(1 - SIM 2 - N'#195'O)'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label216: TLabel
                        Left = 18
                        Top = 124
                        Width = 116
                        Height = 13
                        Caption = 'Certificado Digital NFSe:'
                        FocusControl = DBEdit149
                      end
                      object Label217: TLabel
                        Left = 56
                        Top = 151
                        Width = 78
                        Height = 13
                        Caption = 'Envelopamento:'
                        FocusControl = DBEdit151
                      end
                      object Label218: TLabel
                        Left = 222
                        Top = 151
                        Width = 35
                        Height = 13
                        Caption = '(ii:,etc)'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label219: TLabel
                        Left = 19
                        Top = 178
                        Width = 115
                        Height = 13
                        Caption = 'Endere'#231'o da Prefeitura:'
                        FocusControl = DBEdit152
                      end
                      object Label220: TLabel
                        Left = 51
                        Top = 205
                        Width = 83
                        Height = 13
                        Caption = 'Bairro Prefeitura:'
                        FocusControl = DBEdit153
                      end
                      object Label221: TLabel
                        Left = 111
                        Top = 232
                        Width = 23
                        Height = 13
                        Caption = 'Cep:'
                        FocusControl = DBEdit154
                      end
                      object Label222: TLabel
                        Left = 49
                        Top = 255
                        Width = 85
                        Height = 13
                        Caption = 'Licen'#231'a FlexDocs:'
                        FocusControl = DBEdit155
                      end
                      object Label157: TLabel
                        Left = 78
                        Top = 281
                        Width = 56
                        Height = 13
                        Caption = 'S'#233'rie NFSe:'
                        FocusControl = DBEdit107
                      end
                      object Label158: TLabel
                        Left = 64
                        Top = 308
                        Width = 70
                        Height = 13
                        Caption = 'Modelo NFS-e:'
                        FocusControl = DBEdit108
                      end
                      object Label341: TLabel
                        Left = 62
                        Top = 338
                        Width = 72
                        Height = 13
                        Caption = 'Vers'#227'o Abrasf:'
                        FocusControl = DBEdit108
                      end
                      object Label342: TLabel
                        Left = 9
                        Top = 362
                        Width = 125
                        Height = 13
                        Caption = 'Envio de Lote Rps Abrasf:'
                        FocusControl = DBEdit108
                      end
                      object Label211: TLabel
                        Left = 241
                        Top = 37
                        Width = 553
                        Height = 13
                        Caption = 
                          '(1 '#8211' Microempresa Municipal; 2 '#8211' Estimativa; 3 '#8211' Sociedade de Pr' +
                          'ofissionais; 4 '#8211' Cooperativa; 5 '#8211' Microempresario )'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label376: TLabel
                        Left = 241
                        Top = 56
                        Width = 380
                        Height = 13
                        Caption = 
                          '(Individual(MEI); 6 '#8211' Microempresario e Empresa de Pequeno Porte' +
                          '(ME e EPP) )'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clHotLight
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        Visible = False
                      end
                      object Label446: TLabel
                        Left = 408
                        Top = 362
                        Width = 187
                        Height = 13
                        Caption = 'Usar quebra de linha da Obs na NFS-e:'
                        FocusControl = DBEdit108
                      end
                      object SpeedButton15: TSpeedButton
                        Left = 212
                        Top = 34
                        Width = 23
                        Height = 22
                        Hint = 'Ver lista de regimes'
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D8FFF7C5FFF7C5FFF7C5FF
                          F7C5FFF7C5FFF7C5FFF7C5FFF7C5FFF9D8FFFFFFFAEED7F6E1BAFFFFFFFFFFFF
                          FFFFFFFFE754FFE650FFE650FFE650FFE650FFE650FFE650FBE24FFBE24FFFE7
                          54FAEFDBE7AD42FAEDD6FFFFFFFFFFFFFFFFFFFFE650FFE650FFE650FFE650FF
                          E650FCE451F8E770FDEF84FDEC80F3DD65F1C653FAEED7FFFFFFFFFFFFFFFFFF
                          FFFFFFFFE650FFE650FFE650FFE650FFE650E0C35BD4B159D4B057D5B257FFEE
                          87FCEEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650CFB12EB7971DB7971DB4
                          941DE4D173EAD67BEAD577EAD475FFF28CFFF092FFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFE650E7CC3FDBBE37DBBE37D6BB36CEB253C4A848BEA33FBA9F38FFF4
                          91FFF396FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650E7CC3FDBBE37DBBE37DB
                          BE37DAC45BE2D375DFCF6FDDCD6AFFF795FFF9C4FFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFE650D2B430B7981EB7981EB7981EB79921D9CB64F8F495FCF695F8EA
                          75FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650FFE650FFE650FFE650FF
                          E650FFE650FFE650FBE24FFBE24FFFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFE650CFB12EB7971DB7971DB7971DFFE650FADA4CF1C245F1C244F3C9
                          4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650E7CC3FDBBE37DBBE37DB
                          BE37FFE650E4A03BD47A2DD5812EF5DDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFE650E7CC3FDBBE37DBBE37DBBE37FFE650E29E39D5802DF4DAAAFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE754FFE650FFE650FFE650FF
                          E650FFE650E4A43DF4DBAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFF9D8FFF7C5FFF7C5FFF7C5FFF7C5FFF7C5FDF4D8FFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                        OnClick = SpeedButton15Click
                      end
                      object DBEdit145: TDBEdit
                        Left = 147
                        Top = 10
                        Width = 59
                        Height = 21
                        DataField = 'NFS_NATOP'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 0
                      end
                      object DBEdit146: TDBEdit
                        Left = 147
                        Top = 35
                        Width = 59
                        Height = 21
                        DataField = 'NFS_REGIMETRIB'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 1
                        OnExit = DBEdit146Exit
                      end
                      object DBEdit147: TDBEdit
                        Left = 147
                        Top = 62
                        Width = 59
                        Height = 21
                        DataField = 'NFS_OPTANTESIMPLES'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                        OnEnter = DBEdit147Enter
                      end
                      object DBEdit148: TDBEdit
                        Left = 147
                        Top = 89
                        Width = 59
                        Height = 21
                        DataField = 'INCENTIVADORCULT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit149: TDBEdit
                        Tag = 1
                        Left = 147
                        Top = 116
                        Width = 575
                        Height = 21
                        DataField = 'NFS_CERT'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                      object BitBtn13: TBitBtn
                        Left = 723
                        Top = 116
                        Width = 51
                        Height = 21
                        Caption = 'Obter>>'
                        TabOrder = 5
                        OnClick = BitBtn13Click
                      end
                      object DBEdit151: TDBEdit
                        Tag = 1
                        Left = 147
                        Top = 143
                        Width = 69
                        Height = 21
                        DataField = 'ENV_NFSE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 6
                      end
                      object DBEdit152: TDBEdit
                        Left = 147
                        Top = 170
                        Width = 575
                        Height = 21
                        DataField = 'ENDERECO_PREF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 7
                      end
                      object DBEdit153: TDBEdit
                        Left = 147
                        Top = 197
                        Width = 394
                        Height = 21
                        DataField = 'BAIRRO_PREF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 8
                      end
                      object DBEdit154: TDBEdit
                        Left = 147
                        Top = 224
                        Width = 121
                        Height = 21
                        DataField = 'CEP_PREF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 9
                      end
                      object DBEdit155: TDBEdit
                        Tag = 1
                        Left = 147
                        Top = 247
                        Width = 575
                        Height = 21
                        DataField = 'LICENCANFSE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 10
                      end
                      object DBEdit107: TDBEdit
                        Tag = 1
                        Left = 147
                        Top = 273
                        Width = 121
                        Height = 21
                        Hint = 'S'#233'rie da NF-e de Servi'#231'o'
                        DataField = 'SERIE_SERV_NFE'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 11
                      end
                      object DBEdit108: TDBEdit
                        Tag = 1
                        Left = 147
                        Top = 300
                        Width = 122
                        Height = 21
                        Hint = 'Modelo da NF-e de servi'#231'o'
                        DataField = 'MODELO_NF_SERV'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 12
                      end
                      object DBComboBox91: TDBComboBox
                        Left = 147
                        Top = 359
                        Width = 121
                        Height = 21
                        Hint = 
                          'Indica se for o caso de abrasf 2.0 o uso ou n'#227'o de envio de rps ' +
                          'sincrono. Caso seja n'#227'o o envio ser'#225' assincrono'
                        DataField = 'USARENVRPSSINCRONO'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'N - Ass'#237'ncrono'
                          'S - S'#237'ncrono')
                        TabOrder = 13
                        OnExit = DBComboBox90Exit
                      end
                      object DBComboBox90: TDBComboBox
                        Left = 147
                        Top = 330
                        Width = 121
                        Height = 21
                        Hint = 
                          'Vers'#227'o do padr'#227'o adotado pela prefeitura para emiss'#227'o da nota fi' +
                          'scal eletr'#244'nica de servi'#231'o via webservice.(1.0 ou 2.0)'
                        DataField = 'VERSAO_ABRASF'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          '1'
                          '2')
                        TabOrder = 14
                        OnExit = DBComboBox90Exit
                      end
                      object DBComboBox149: TDBComboBox
                        Left = 601
                        Top = 359
                        Width = 121
                        Height = 21
                        Hint = 'Usar quebra de linha da Obs na NFS-e'
                        DataField = 'NFSE_OBSOS_SEMENTER'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 15
                        OnExit = DBComboBox90Exit
                      end
                    end
                    object TabSheet40: TTabSheet
                      Caption = 'MDF-e'
                      ImageIndex = 4
                      object Panel21: TPanel
                        Left = 0
                        Top = 0
                        Width = 774
                        Height = 404
                        Align = alClient
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label413: TLabel
                          Left = 99
                          Top = 19
                          Width = 95
                          Height = 13
                          Caption = 'Tipo Emiss'#227'o MDF-e'
                        end
                        object Label414: TLabel
                          Left = 160
                          Top = 46
                          Width = 34
                          Height = 13
                          Hint = 'Registro Nacional de Transportadores Rodovi'#225'rios de Carga'
                          Caption = 'RNTRC'
                          FocusControl = DBEdit224
                        end
                        object Label415: TLabel
                          Left = 169
                          Top = 73
                          Width = 25
                          Height = 13
                          Hint = 
                            'C'#243'digo Identificador da Opera'#231#227'o de Transporte (Tamb'#233'm Conhecido' +
                            ' como conta frete)'
                          Caption = 'CIOT'
                          FocusControl = DBEdit225
                        end
                        object Label416: TLabel
                          Left = 121
                          Top = 100
                          Width = 73
                          Height = 13
                          Caption = 'S'#233'rie do MDF-e'
                          FocusControl = DBEdit226
                        end
                        object DBComboBox132: TDBComboBox
                          Left = 200
                          Top = 16
                          Width = 145
                          Height = 21
                          Style = csDropDownList
                          DataField = 'TIPOMDFE'
                          DataSource = DtmCadBasicos.dsEmpresa
                          Enabled = False
                          ItemHeight = 13
                          Items.Strings = (
                            'NORMAL'
                            'CONTINGENCIA')
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object DBEdit224: TDBEdit
                          Left = 200
                          Top = 43
                          Width = 134
                          Height = 21
                          Hint = 'Registro Nacional de Transportadores Rodovi'#225'rios de Carga'
                          DataField = 'RNTRC'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 1
                        end
                        object DBEdit225: TDBEdit
                          Left = 200
                          Top = 70
                          Width = 134
                          Height = 21
                          Hint = 
                            'C'#243'digo Identificador da Opera'#231#227'o de Transporte (Tamb'#233'm Conhecido' +
                            ' como conta frete)'
                          DataField = 'CIOT'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 2
                        end
                        object DBEdit226: TDBEdit
                          Left = 200
                          Top = 97
                          Width = 134
                          Height = 21
                          DataField = 'SERIE_MDFE'
                          DataSource = DtmCadBasicos.dsEmpresa
                          TabOrder = 3
                        end
                      end
                    end
                  end
                end
              end
              object TabSheet12: TTabSheet
                Caption = 'CDL/Outras Conf.'
                ImageIndex = 6
                object GroupBox18: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 775
                  Height = 190
                  Caption = 'CDL'
                  TabOrder = 0
                  object Label177: TLabel
                    Left = 104
                    Top = 24
                    Width = 49
                    Height = 13
                    Caption = 'Nome CDL'
                    FocusControl = DBEdit122
                  end
                  object Label178: TLabel
                    Left = 108
                    Top = 51
                    Width = 45
                    Height = 13
                    Caption = 'Endere'#231'o'
                    FocusControl = DBEdit123
                  end
                  object Label179: TLabel
                    Left = 125
                    Top = 78
                    Width = 28
                    Height = 13
                    Caption = 'Bairro'
                    FocusControl = DBEdit124
                  end
                  object Label180: TLabel
                    Left = 140
                    Top = 100
                    Width = 13
                    Height = 13
                    Caption = 'UF'
                  end
                  object Label181: TLabel
                    Left = 107
                    Top = 126
                    Width = 46
                    Height = 13
                    Caption = 'Fone CDL'
                    FocusControl = DBEdit125
                  end
                  object Label182: TLabel
                    Left = 67
                    Top = 150
                    Width = 86
                    Height = 13
                    Caption = 'N'#250'mero Emp. CDL'
                    FocusControl = DBEdit126
                  end
                  object DBEdit122: TDBEdit
                    Left = 161
                    Top = 21
                    Width = 474
                    Height = 21
                    Hint = 'Nome do CDL para emiss'#227'o do relat'#243'rio de negativa'#231#227'o'
                    DataField = 'NOME_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 0
                  end
                  object DBEdit123: TDBEdit
                    Left = 161
                    Top = 48
                    Width = 474
                    Height = 21
                    Hint = 'Endere'#231'o CDL para relat'#243'rio de negativa'#231#227'o'
                    DataField = 'ENDERECO_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 1
                  end
                  object DBEdit124: TDBEdit
                    Left = 161
                    Top = 75
                    Width = 210
                    Height = 21
                    Hint = 'Bairro CDL para emiss'#227'o de relat'#243'rio de negativa'#231#227'o junto ao CDL'
                    DataField = 'BAIRRO_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 2
                  end
                  object DBLookupComboBox4: TDBLookupComboBox
                    Left = 161
                    Top = 97
                    Width = 145
                    Height = 21
                    Hint = 'UF da CDL para emiss'#227'o do relat'#243'rio de negativa'#231#227'o'
                    DataField = 'UF_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    KeyField = 'SIGLA_UF'
                    ListField = 'NOME_UF'
                    ListSource = DtmCadBasicos.dsUF
                    TabOrder = 3
                  end
                  object DBEdit125: TDBEdit
                    Left = 161
                    Top = 123
                    Width = 145
                    Height = 21
                    Hint = 'Fone CDL para relat'#243'rio de negativa'#231#227'o junto ao CDL'
                    DataField = 'FONE_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 4
                  end
                  object DBEdit126: TDBEdit
                    Left = 161
                    Top = 150
                    Width = 145
                    Height = 21
                    Hint = 'C'#243'digo da empresa no CDL'
                    DataField = 'COD_EMP_CDL'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 5
                  end
                end
                object GroupBox19: TGroupBox
                  Left = 3
                  Top = 199
                  Width = 775
                  Height = 235
                  Caption = 'Outras Configura'#231#245'es'
                  TabOrder = 1
                  object Label172: TLabel
                    Left = 337
                    Top = 18
                    Width = 123
                    Height = 13
                    Caption = 'Endere'#231'o HWF.FDB Serv.'
                    FocusControl = DBEdit118
                  end
                  object Label173: TLabel
                    Left = 61
                    Top = 74
                    Width = 92
                    Height = 13
                    Caption = 'Transf. Automacao'
                  end
                  object Label176: TLabel
                    Left = 88
                    Top = 101
                    Width = 65
                    Height = 13
                    Caption = 'Tipo Impress.'
                    FocusControl = DBEdit121
                  end
                  object Label170: TLabel
                    Left = 36
                    Top = 128
                    Width = 117
                    Height = 13
                    Caption = 'N'#186' do Termo de Creden.'
                    FocusControl = DBEdit117
                  end
                  object Label183: TLabel
                    Left = 8
                    Top = 182
                    Width = 145
                    Height = 13
                    Caption = 'Ordem de Pesquisa de Cr'#233'dito'
                  end
                  object Label184: TLabel
                    Left = 3
                    Top = 209
                    Width = 147
                    Height = 13
                    Caption = 'Ordem de Pesquisa de Cheque'
                  end
                  object Label203: TLabel
                    Left = 352
                    Top = 47
                    Width = 106
                    Height = 13
                    Caption = 'Forma de Pagamento:'
                  end
                  object Label204: TLabel
                    Left = 315
                    Top = 74
                    Width = 143
                    Height = 13
                    Caption = 'Busca C'#243'digo Ent NF no Prod:'
                  end
                  object Label226: TLabel
                    Left = 335
                    Top = 101
                    Width = 123
                    Height = 13
                    Caption = 'Cod Serv Padrao Retorno'
                    FocusControl = DBEdit157
                  end
                  object Label227: TLabel
                    Left = 329
                    Top = 128
                    Width = 129
                    Height = 13
                    Caption = 'Placa Padrao O.S. Retorno'
                    FocusControl = DBEdit159
                  end
                  object Label95: TLabel
                    Left = 323
                    Top = 155
                    Width = 135
                    Height = 13
                    Caption = 'CFOP Padr'#227'o para Produtos'
                    FocusControl = DBEdit61
                  end
                  object Label96: TLabel
                    Left = 326
                    Top = 182
                    Width = 132
                    Height = 13
                    Caption = 'CFOP Padr'#227'o para Servi'#231'os'
                    FocusControl = DBEdit62
                  end
                  object Label231: TLabel
                    Left = 316
                    Top = 209
                    Width = 142
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'CFOP Padr'#227'o para Devolu'#231#227'o'
                    FocusControl = DBEdit160
                  end
                  object DBEdit118: TDBEdit
                    Tag = 1
                    Left = 464
                    Top = 17
                    Width = 293
                    Height = 21
                    Hint = 
                      'Endere'#231'o da base de dados HwF.fdb original que ser'#225' atualizada e' +
                      ' enviada para os terminais'
                    DataField = 'ENDERECOHWFFDB'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 5
                  end
                  object DBComboBox41: TDBComboBox
                    Left = 159
                    Top = 71
                    Width = 66
                    Height = 21
                    Hint = 
                      'Campo que define se o caixa estar'#225' conectada ou n'#227'o ao sistema d' +
                      'e retaguarda'
                    DataField = 'ITAUTO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                    TabOrder = 0
                  end
                  object DBEdit121: TDBEdit
                    Left = 159
                    Top = 98
                    Width = 144
                    Height = 21
                    Hint = 'Tipo de impress'#227'o utilizada como padr'#227'o nos relat'#243'rios do caixa'
                    DataField = 'TPIMPRE'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 1
                  end
                  object DBEdit117: TDBEdit
                    Left = 159
                    Top = 125
                    Width = 144
                    Height = 21
                    Hint = 
                      'N'#250'mero do Termo de Credenciamento e reponsabiliza'#231#227'o para interv' +
                      'en'#231#245'es tecnicas'
                    DataField = 'NUM_CREDENC_INTERVENTOR'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 2
                  end
                  object DBComboBox42: TDBComboBox
                    Left = 159
                    Top = 206
                    Width = 145
                    Height = 21
                    Hint = 
                      'Campo padr'#227'o pelo qual ser'#225' feita a ordena'#231#227'o da pesquisa de cr'#233 +
                      'ditos'
                    DataField = 'ORDERBY_CRED'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    TabOrder = 4
                  end
                  object DBComboBox43: TDBComboBox
                    Left = 159
                    Top = 179
                    Width = 145
                    Height = 21
                    Hint = 
                      'Campo padr'#227'o pelo qual ser'#225' feita a ordena'#231#227'o da pesquisa de che' +
                      'ques'
                    DataField = 'ORDERBY_CH'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    TabOrder = 3
                  end
                  object DBComboBox48: TDBComboBox
                    Left = 464
                    Top = 44
                    Width = 293
                    Height = 21
                    Hint = 
                      'Campo padr'#227'o pelo qual ser'#225' feita a ordena'#231#227'o da pesquisa de che' +
                      'ques'
                    DataField = 'CONF_FORMPAGAMENTO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'PEDIDOS (REQ, OS, ETC)'
                      'NF (NOTA FISCAL)')
                    TabOrder = 6
                  end
                  object DBComboBox49: TDBComboBox
                    Left = 464
                    Top = 71
                    Width = 293
                    Height = 21
                    Hint = 
                      'Na entrada de NF, busca o codigo do produto na tabela de produto' +
                      's e n'#227'o no fornecedor'
                    DataField = 'BUSCA_COD_NO_PROD'
                    DataSource = DtmCadBasicos.dsEmpresa
                    ItemHeight = 13
                    Items.Strings = (
                      'SIM'
                      'NAO')
                    TabOrder = 7
                  end
                  object DBEdit157: TDBEdit
                    Left = 464
                    Top = 98
                    Width = 134
                    Height = 21
                    DataField = 'COD_SERV_PAD_RETORNO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 8
                  end
                  object DBEdit159: TDBEdit
                    Left = 464
                    Top = 125
                    Width = 134
                    Height = 21
                    DataField = 'PLACA_PAD_RETORNO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 9
                  end
                  object DBEdit61: TDBEdit
                    Left = 464
                    Top = 152
                    Width = 134
                    Height = 21
                    Hint = 'CFOP padr'#227'o para produtos'
                    DataField = 'CFOP_PAD_PROD'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 10
                  end
                  object DBEdit62: TDBEdit
                    Left = 464
                    Top = 179
                    Width = 134
                    Height = 21
                    Hint = 'CFOP padr'#227'o para servi'#231'os'
                    DataField = 'CFOP_PAD_SERV'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 11
                  end
                  object DBEdit160: TDBEdit
                    Left = 464
                    Top = 206
                    Width = 134
                    Height = 21
                    Hint = 'CFOP padr'#227'o para servi'#231'os'
                    DataField = 'CFOP_PAD_DEVOLUCAO'
                    DataSource = DtmCadBasicos.dsEmpresa
                    TabOrder = 12
                  end
                end
              end
              object tsSped: TTabSheet
                Caption = 'SPED'
                ImageIndex = 8
                object Label189: TLabel
                  Left = 133
                  Top = 19
                  Width = 75
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Insc. SUFRAMA'
                  FocusControl = DBEdit131
                end
                object Label191: TLabel
                  Left = 504
                  Top = 19
                  Width = 45
                  Height = 13
                  Caption = 'Contador'
                  FocusControl = DBEdit133
                end
                object DBRadioGroup2: TDBRadioGroup
                  Left = 17
                  Top = 43
                  Width = 740
                  Height = 67
                  Hint = 'Sped Fiscal. Indicardor de atividade da empresa.'
                  Caption = 'Atividade'
                  Columns = 2
                  DataField = 'SPED_IND_ATIV'
                  DataSource = DtmCadBasicos.dsEmpresa
                  Items.Strings = (
                    '0 - Industrial ou equiparado a industrial;'
                    '1 - Prestador de servi'#231'os;'
                    '2 - Atividade de com'#233'rcio;'
                    '3 - Atividade financeira;'
                    '4 - Atividade imobili'#225'ria;'
                    '9 - Outros.')
                  ParentBackground = True
                  TabOrder = 3
                  Values.Strings = (
                    '0'
                    '1'
                    '2'
                    '3'
                    '4'
                    '9')
                end
                object DBEdit131: TDBEdit
                  Left = 214
                  Top = 16
                  Width = 121
                  Height = 21
                  Hint = 'Sped Fiscal. N'#250'mero de inscri'#231#227'o SUFRAMA'
                  DataField = 'SPED_SUFRAMA'
                  DataSource = DtmCadBasicos.dsEmpresa
                  TabOrder = 0
                end
                object DBEdit133: TDBEdit
                  Left = 555
                  Top = 15
                  Width = 121
                  Height = 21
                  Hint = 'C'#243'digo do Contador respons'#225'vel pelo SPED cont'#225'bil'
                  DataField = 'COD_CONTADOR'
                  DataSource = DtmCadBasicos.dsEmpresa
                  TabOrder = 1
                end
                object BitBtn12: TBitBtn
                  Left = 682
                  Top = 11
                  Width = 75
                  Height = 25
                  Caption = 'Selecionar'
                  TabOrder = 2
                  OnClick = BitBtn12Click
                end
                object PageControl6: TPageControl
                  Left = 17
                  Top = 116
                  Width = 740
                  Height = 336
                  ActivePage = TabSheet31
                  Style = tsFlatButtons
                  TabOrder = 4
                  object TabSheet31: TTabSheet
                    Caption = 'EFD Contribui'#231#245'es'
                    object GroupBox22: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 732
                      Height = 305
                      Align = alClient
                      Caption = 'PIS/COFINS'
                      TabOrder = 0
                      object Label228: TLabel
                        Left = 536
                        Top = 19
                        Width = 53
                        Height = 13
                        Caption = 'Matriz/Filial'
                      end
                      object Label229: TLabel
                        Left = 56
                        Top = 46
                        Width = 135
                        Height = 13
                        Caption = 'Natureza da Pessoa Jur'#237'dica'
                      end
                      object Label230: TLabel
                        Left = 51
                        Top = 19
                        Width = 140
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Gerar Escritu'#231#227'o PIS/COFINS'
                      end
                      object DBComboBox52: TDBComboBox
                        Left = 595
                        Top = 16
                        Width = 126
                        Height = 21
                        DataField = 'SPED_MATRIZ_FILIAL'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Matriz'
                          'Filial')
                        TabOrder = 1
                      end
                      object DBComboBox53: TDBComboBox
                        Left = 197
                        Top = 43
                        Width = 524
                        Height = 21
                        DataField = 'SPED_IND_NAT_PJ'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          '00 '#8211' Sociedade empres'#225'ria em geral'
                          '01 '#8211' Sociedade cooperativa'
                          
                            '02 '#8211' Entidade sujeita ao PIS/Pasep exclusivamente com base na Fo' +
                            'lha de Sal'#225'rios')
                        TabOrder = 2
                      end
                      object DBComboBox54: TDBComboBox
                        Left = 197
                        Top = 16
                        Width = 145
                        Height = 21
                        DataField = 'GERAR_SPED_PISCOFINS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Sim'
                          'N'#227'o')
                        TabOrder = 0
                      end
                      object PageControl4: TPageControl
                        Left = 14
                        Top = 97
                        Width = 705
                        Height = 180
                        ActivePage = TabSheet41
                        Style = tsFlatButtons
                        TabOrder = 3
                        object TabSheet21: TTabSheet
                          Caption = 'Incid'#234'ncia tribut'#225'ria'
                          object DBRadioGroup3: TDBRadioGroup
                            Left = 0
                            Top = 0
                            Width = 697
                            Height = 149
                            Align = alClient
                            Caption = 'Indicador da incid'#234'ncia tribut'#225'ria'
                            DataField = 'SPED_COD_INC_TRIB'
                            DataSource = DtmCadBasicos.dsEmpresa
                            Items.Strings = (
                              
                                '1 '#8211' Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
                                'egime n'#227'o-cumulativo;'
                              
                                '2 '#8211' Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
                                'egime cumulativo;'
                              
                                '3 '#8211' Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia nos regimes n'#227'o-cum' +
                                'ulativo e cumulativo.')
                            ParentBackground = True
                            TabOrder = 0
                            Values.Strings = (
                              '1'
                              '2'
                              '3')
                          end
                        end
                        object TabSheet22: TTabSheet
                          Caption = 'M'#233'todo de Apropria'#231#227'o de Cr'#233'ditos'
                          ImageIndex = 1
                          object DBRadioGroup4: TDBRadioGroup
                            Left = 0
                            Top = 0
                            Width = 697
                            Height = 149
                            Align = alClient
                            Caption = 
                              'Indicador de m'#233'todo de apropria'#231#227'o de cr'#233'ditos comuns no caso de' +
                              ' incid'#234'ncia no regime n'#227'o-cumulativo (1 ou 3):'
                            DataField = 'SPED_IND_APRO_CRED'
                            DataSource = DtmCadBasicos.dsEmpresa
                            Items.Strings = (
                              '1 '#8211' M'#233'todo de Apropria'#231#227'o Direta;'
                              '2 '#8211' M'#233'todo de Rateio Proporcional (Receita Bruta)')
                            ParentBackground = True
                            TabOrder = 0
                            Values.Strings = (
                              '1'
                              '2')
                          end
                        end
                        object TabSheet23: TTabSheet
                          Caption = 'Contribui'#231#227'o Apurada'
                          ImageIndex = 2
                          object DBRadioGroup5: TDBRadioGroup
                            Left = 0
                            Top = 0
                            Width = 697
                            Height = 149
                            Align = alClient
                            Caption = 'Indicador do Tipo de Contribui'#231#227'o Apurada'
                            DataField = 'SPED_COD_TIPO_CONT'
                            DataSource = DtmCadBasicos.dsEmpresa
                            Items.Strings = (
                              '1 '#8211' Apura'#231#227'o da Contribui'#231#227'o Exclusivamente a Al'#237'quota B'#225'sica'
                              
                                '2 '#8211' Apura'#231#227'o da Contribui'#231#227'o a Al'#237'quotas Espec'#237'ficas (Diferencia' +
                                'das e/ou por Unidade de Medida de Produto)')
                            ParentBackground = True
                            TabOrder = 0
                            Values.Strings = (
                              '1'
                              '2')
                          end
                        end
                        object TabSheet24: TTabSheet
                          Caption = 'Crit'#233'rio de Escritura'#231#227'o e Apura'#231#227'o'
                          ImageIndex = 3
                          object Label270: TLabel
                            Left = 0
                            Top = 0
                            Width = 697
                            Height = 26
                            Align = alTop
                            Caption = 
                              'C'#243'digo indicador do crit'#233'rio de escritura'#231#227'o e apura'#231#227'o adotado,' +
                              ' no caso de incid'#234'ncia exclusivamente no regime cumulativo (COD_' +
                              'INC_TRIB = 2), pela pessoa jur'#237'dica submetida ao regime de tribu' +
                              'ta'#231#227'o com base no lucro presumido'
                            WordWrap = True
                            ExplicitWidth = 692
                          end
                          object DBRadioGroup6: TDBRadioGroup
                            Left = 0
                            Top = 26
                            Width = 697
                            Height = 123
                            Align = alClient
                            DataField = 'SPED_IND_REG_CUM'
                            DataSource = DtmCadBasicos.dsEmpresa
                            Items.Strings = (
                              '1 '#8211' Regime de Caixa '#8211' Escritura'#231#227'o consolidada (Registro F500);'
                              
                                '2 '#8211' Regime de Compet'#234'ncia - Escritura'#231#227'o consolidada (Registro F' +
                                '550);'
                              
                                '9 '#8211' Regime de Compet'#234'ncia - Escritura'#231#227'o detalhada, com base nos' +
                                ' registros dos Blocos '#8220'A'#8221', '#8220'C'#8221', '#8220'D'#8221' e '#8220'F'#8221'.')
                            ParentBackground = True
                            TabOrder = 0
                            Values.Strings = (
                              '1'
                              '2'
                              '9')
                          end
                        end
                        object TabSheet41: TTabSheet
                          Caption = 'Outros'
                          ImageIndex = 4
                          object Panel22: TPanel
                            Left = 0
                            Top = 0
                            Width = 697
                            Height = 149
                            Align = alClient
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label422: TLabel
                              Left = 201
                              Top = 44
                              Width = 370
                              Height = 13
                              Caption = 
                                'Gerar valor l'#237'quido nos registros do EFD Contribui'#231#245'es (exceto c' +
                                'upons fiscais)'
                            end
                            object Label418: TLabel
                              Left = 296
                              Top = 17
                              Width = 275
                              Height = 13
                              Caption = 'Apresentar valor l'#237'quido dos cupons no arquivo eletr'#244'nico'
                            end
                            object Label438: TLabel
                              Left = 329
                              Top = 71
                              Width = 242
                              Height = 13
                              Caption = 'Codigo da Receita ref a contribuicao do PIS(M205)'
                              FocusControl = DBEdit235
                            end
                            object Label439: TLabel
                              Left = 307
                              Top = 98
                              Width = 264
                              Height = 13
                              Caption = 'Codigo da Receita ref a contribuicao do COFINS(M605)'
                              FocusControl = DBEdit236
                            end
                            object DBComboBox134: TDBComboBox
                              Left = 577
                              Top = 14
                              Width = 109
                              Height = 21
                              DataField = 'SPED_C481_LIQ'
                              DataSource = DtmCadBasicos.dsEmpresa
                              ItemHeight = 13
                              Items.Strings = (
                                'Sim'
                                'N'#227'o')
                              TabOrder = 0
                            end
                            object DBComboBox137: TDBComboBox
                              Left = 577
                              Top = 41
                              Width = 109
                              Height = 21
                              DataField = 'SPED_REGISTROS_LIQ'
                              DataSource = DtmCadBasicos.dsEmpresa
                              ItemHeight = 13
                              Items.Strings = (
                                'Sim'
                                'N'#227'o')
                              TabOrder = 1
                            end
                            object DBEdit235: TDBEdit
                              Left = 577
                              Top = 68
                              Width = 109
                              Height = 21
                              DataField = 'SPED_P_COD_REC_PIS'
                              DataSource = DtmCadBasicos.dsEmpresa
                              TabOrder = 2
                            end
                            object DBEdit236: TDBEdit
                              Left = 577
                              Top = 95
                              Width = 109
                              Height = 21
                              DataField = 'SPED_P_COD_REC_COFINS'
                              DataSource = DtmCadBasicos.dsEmpresa
                              TabOrder = 3
                            end
                          end
                        end
                      end
                    end
                  end
                  object TabSheet32: TTabSheet
                    Caption = 'EFD ICMS IPI'
                    ImageIndex = 1
                    object GroupBox30: TGroupBox
                      Left = 0
                      Top = 45
                      Width = 732
                      Height = 260
                      Align = alClient
                      Caption = 'SPED Fiscal'
                      TabOrder = 0
                      object Label348: TLabel
                        Left = 324
                        Top = 65
                        Width = 246
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Apurar Substitui'#231#227'o tribut'#225'ria no Arquivo eletronico'
                      end
                      object Label351: TLabel
                        Left = 466
                        Top = 119
                        Width = 104
                        Height = 13
                        Alignment = taRightJustify
                        Caption = ' Dia Vencimento ICMS'
                        FocusControl = DBEdit203
                      end
                      object Label352: TLabel
                        Left = 285
                        Top = 173
                        Width = 285
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Codigo de receita referente '#224' obriga'#231#227'o (E116 - COD_REC)'
                        FocusControl = DBEdit204
                      end
                      object Label353: TLabel
                        Left = 293
                        Top = 200
                        Width = 277
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Codigo obriga'#231#227'o a recolher de ICMS ST(E250 - COD_OR)'
                        FocusControl = DBEdit205
                      end
                      object Label354: TLabel
                        Left = 305
                        Top = 146
                        Width = 265
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Codigo obriga'#231#227'o a recolher de ICMS (E116 - COD_OR)'
                        FocusControl = DBEdit206
                      end
                      object Label355: TLabel
                        Left = 285
                        Top = 227
                        Width = 285
                        Height = 13
                        Hint = 
                          'C'#243'digo de receita referente '#224' obriga'#231#227'o, pr'#243'prio da unidade da f' +
                          'edera'#231#227'o do contribuinte substitu'#237'do'
                        Alignment = taRightJustify
                        Caption = 'Codigo de receita referente '#224' obriga'#231#227'o (E250 - COD_REC)'
                        FocusControl = DBEdit207
                      end
                      object Label424: TLabel
                        Left = 394
                        Top = 92
                        Width = 176
                        Height = 13
                        Caption = 'Apurar ST e IPI em Outras Despesas'
                      end
                      object DBComboBox97: TDBComboBox
                        Left = 576
                        Top = 62
                        Width = 145
                        Height = 21
                        DataField = 'SPED_APURAR_ST'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Sim'
                          'N'#227'o')
                        TabOrder = 1
                      end
                      object DBRadioGroup7: TDBRadioGroup
                        Left = 426
                        Top = 9
                        Width = 296
                        Height = 38
                        Caption = 'Indicador de per'#237'odo de apura'#231#227'o do IPI'
                        Columns = 2
                        DataField = 'IND_APUR_IPI'
                        DataSource = DtmCadBasicos.dsEmpresa
                        Items.Strings = (
                          '0 - Mensal;'
                          '1 - Decendial')
                        ParentBackground = True
                        TabOrder = 0
                        Values.Strings = (
                          '0'
                          '1')
                      end
                      object DBEdit203: TDBEdit
                        Left = 576
                        Top = 116
                        Width = 145
                        Height = 21
                        DataField = 'SPED_F_DIA_VENC_ICMS'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 2
                      end
                      object DBEdit204: TDBEdit
                        Left = 576
                        Top = 170
                        Width = 145
                        Height = 21
                        DataField = 'SPED_F_COD_REC_E116'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 4
                      end
                      object DBEdit205: TDBEdit
                        Left = 576
                        Top = 197
                        Width = 145
                        Height = 21
                        DataField = 'SPED_F_COD_OB_REC_E250'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 5
                      end
                      object DBEdit206: TDBEdit
                        Left = 576
                        Top = 143
                        Width = 145
                        Height = 21
                        DataField = 'SPED_F_COD_OB_REC_E116'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 3
                      end
                      object DBEdit207: TDBEdit
                        Left = 576
                        Top = 224
                        Width = 145
                        Height = 21
                        Hint = 
                          'C'#243'digo de receita referente '#224' obriga'#231#227'o, pr'#243'prio da unidade da f' +
                          'edera'#231#227'o do contribuinte substitu'#237'do'
                        DataField = 'SPED_F_COD_REC_E250'
                        DataSource = DtmCadBasicos.dsEmpresa
                        TabOrder = 6
                      end
                      object DBComboBox138: TDBComboBox
                        Left = 576
                        Top = 89
                        Width = 145
                        Height = 21
                        DataField = 'SPED_STIPI_OUTD'
                        DataSource = DtmCadBasicos.dsEmpresa
                        ItemHeight = 13
                        Items.Strings = (
                          'Sim'
                          'N'#227'o')
                        TabOrder = 7
                      end
                    end
                    object DBRadioGroup1: TDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 732
                      Height = 45
                      Hint = 'Sped Fiscal. Indicador do Perfil da Empresa.'
                      Align = alTop
                      Caption = 'Perfil'
                      Columns = 3
                      DataField = 'SPED_IND_PERFIL'
                      DataSource = DtmCadBasicos.dsEmpresa
                      Items.Strings = (
                        'A'
                        'B'
                        'C')
                      ParentBackground = True
                      TabOrder = 1
                      Values.Strings = (
                        'A'
                        'B'
                        'C')
                    end
                  end
                end
              end
              object TabSheet13: TTabSheet
                Caption = 'Relat'#243'rio'
                ImageIndex = 7
                object QuickRep1: TQuickRep
                  Left = -7
                  Top = -24
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicos.cdsEmpresa
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
                  OnPreview = QuickRep1Preview
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
                  ReportTitle = 'Informa'#231#245'e da Empresa'
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoom100
                  PreviewDefaultSaveType = stQRP
                  object PageHeaderBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 75
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
                      198.437500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 245
                      Top = 14
                      Width = 233
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        648.229166666666800000
                        37.041666666666670000
                        616.479166666666800000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Informa'#231#245'es da Empresa'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 14
                    end
                    object QRHRule1: TQRHRule
                      Left = 2
                      Top = 65
                      Width = 713
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        5.291666666666667000
                        171.979166666666700000
                        1886.479166666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 2
                      Top = 40
                      Width = 713
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        5.291666666666667000
                        105.833333333333300000
                        1886.479166666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRSysData1: TQRSysData
                      Left = 94
                      Top = 52
                      Width = 69
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        137.583333333333300000
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
                    object QRLabel17: TQRLabel
                      Left = 20
                      Top = 52
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        52.916666666666670000
                        137.583333333333300000
                        179.916666666666700000)
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
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 113
                    Width = 718
                    Height = 346
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
                      915.458333333333200000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRLabel2: TQRLabel
                      Left = 38
                      Top = 6
                      Width = 50
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        100.541666666666700000
                        15.875000000000000000
                        132.291666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'digo:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel3: TQRLabel
                      Left = 27
                      Top = 28
                      Width = 60
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        71.437500000000000000
                        74.083333333333340000
                        158.750000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Empresa:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel4: TQRLabel
                      Left = 23
                      Top = 50
                      Width = 65
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        60.854166666666680000
                        132.291666666666700000
                        171.979166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Endere'#231'o:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel5: TQRLabel
                      Left = 33
                      Top = 73
                      Width = 55
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        87.312500000000000000
                        193.145833333333300000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'N'#250'mero:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel6: TQRLabel
                      Left = 48
                      Top = 118
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        127.000000000000000000
                        312.208333333333400000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Bairro'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel7: TQRLabel
                      Left = 38
                      Top = 95
                      Width = 50
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        100.541666666666700000
                        251.354166666666700000
                        132.291666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Cidade:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel8: TQRLabel
                      Left = 56
                      Top = 140
                      Width = 31
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        148.166666666666700000
                        370.416666666666700000
                        82.020833333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'CEP:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel9: TQRLabel
                      Left = 65
                      Top = 163
                      Width = 22
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        171.979166666666700000
                        431.270833333333400000
                        58.208333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'UF:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel10: TQRLabel
                      Left = 50
                      Top = 185
                      Width = 37
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        132.291666666666700000
                        489.479166666666700000
                        97.895833333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Fone:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel11: TQRLabel
                      Left = 49
                      Top = 207
                      Width = 39
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        129.645833333333300000
                        547.687500000000000000
                        103.187500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'CNPJ:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel12: TQRLabel
                      Left = 28
                      Top = 230
                      Width = 60
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        74.083333333333340000
                        608.541666666666800000
                        158.750000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Insc. Est.:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel13: TQRLabel
                      Left = 19
                      Top = 252
                      Width = 69
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        50.270833333333330000
                        666.750000000000000000
                        182.562500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Insc. Mun.:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel14: TQRLabel
                      Left = 7
                      Top = 275
                      Width = 81
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        18.520833333333330000
                        727.604166666666800000
                        214.312500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Propriet'#225'rio:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel15: TQRLabel
                      Left = 51
                      Top = 297
                      Width = 37
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        134.937500000000000000
                        785.812500000000000000
                        97.895833333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Filial:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel16: TQRLabel
                      Left = 45
                      Top = 320
                      Width = 45
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        119.062500000000000000
                        846.666666666666600000
                        119.062500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'E-mail:'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText1: TQRDBText
                      Left = 94
                      Top = 6
                      Width = 101
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        15.875000000000000000
                        267.229166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'COD_EMPRESA'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 94
                      Top = 28
                      Width = 76
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        74.083333333333340000
                        201.083333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'NOME_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText3: TQRDBText
                      Left = 94
                      Top = 51
                      Width = 110
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        134.937500000000000000
                        291.041666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'ENDERECO_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText4: TQRDBText
                      Left = 94
                      Top = 73
                      Width = 92
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        193.145833333333300000
                        243.416666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'NUMERO_END'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText5: TQRDBText
                      Left = 93
                      Top = 95
                      Width = 85
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        246.062500000000000000
                        251.354166666666700000
                        224.895833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'CIDADE_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText6: TQRDBText
                      Left = 94
                      Top = 118
                      Width = 86
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        312.208333333333400000
                        227.541666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'BAIRRO_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText7: TQRDBText
                      Left = 93
                      Top = 140
                      Width = 64
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        246.062500000000000000
                        370.416666666666700000
                        169.333333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'CEP_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText8: TQRDBText
                      Left = 93
                      Top = 163
                      Width = 64
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        246.062500000000000000
                        431.270833333333400000
                        169.333333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.qrUF
                      DataField = 'NOME_UF'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText9: TQRDBText
                      Left = 94
                      Top = 185
                      Width = 105
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        489.479166666666700000
                        277.812500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'TELEFONE_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText10: TQRDBText
                      Left = 94
                      Top = 207
                      Width = 70
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        547.687500000000000000
                        185.208333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'CNPJ_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText11: TQRDBText
                      Left = 94
                      Top = 230
                      Width = 49
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        608.541666666666800000
                        129.645833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'IE_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText12: TQRDBText
                      Left = 94
                      Top = 252
                      Width = 51
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        666.750000000000000000
                        134.937500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'IM_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText13: TQRDBText
                      Left = 94
                      Top = 275
                      Width = 74
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        727.604166666666800000
                        195.791666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'PROP_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText14: TQRDBText
                      Left = 94
                      Top = 297
                      Width = 38
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        785.812500000000000000
                        100.541666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'FILIAL'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText15: TQRDBText
                      Left = 94
                      Top = 320
                      Width = 76
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        248.708333333333300000
                        846.666666666666600000
                        201.083333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsEmpresa
                      DataField = 'EMAIL_EMP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                end
              end
              object TabSheet20: TTabSheet
                Caption = 'Contas de Liga'#231#227'o'
                ImageIndex = 9
                object PageControl5: TPageControl
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 455
                  ActivePage = TabSheet25
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  OnEnter = PageControl5Enter
                  object TabSheet25: TTabSheet
                    Caption = 'Financeiro'
                    OnShow = TabSheet25Show
                    object GroupBox20: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      Caption = 'Contas de Liga'#231#227'o  do Plano de Contas Financeiro'
                      TabOrder = 0
                      OnEnter = GroupBox20Enter
                      object Label239: TLabel
                        Left = 89
                        Top = 38
                        Width = 48
                        Height = 13
                        Caption = 'Empresa :'
                      end
                      object Label240: TLabel
                        Left = 143
                        Top = 38
                        Width = 49
                        Height = 13
                        Caption = 'Empresa'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object GroupBox23: TGroupBox
                        Left = 2
                        Top = 15
                        Width = 763
                        Height = 407
                        Align = alClient
                        Caption = ' Dados das Contas de Liga'#231#227'o '
                        TabOrder = 0
                        object Label241: TLabel
                          Left = 7
                          Top = 42
                          Width = 200
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' da Conta Venda Produtos (ENTRADA):'
                        end
                        object Label242: TLabel
                          Left = 352
                          Top = 42
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label243: TLabel
                          Left = 15
                          Top = 69
                          Width = 192
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' de Conta Venda Servi'#231'o (ENTRADA):'
                        end
                        object Label244: TLabel
                          Left = 352
                          Top = 69
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label245: TLabel
                          Left = 31
                          Top = 96
                          Width = 176
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Compra Produtos (SA'#205'DA):'
                        end
                        object Label246: TLabel
                          Left = 352
                          Top = 96
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label247: TLabel
                          Left = 36
                          Top = 123
                          Width = 171
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Compra Ve'#237'culos (SA'#205'DA):'
                        end
                        object Label248: TLabel
                          Left = 352
                          Top = 123
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label249: TLabel
                          Left = 43
                          Top = 150
                          Width = 164
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Sa'#237'da Cheques (SA'#205'DA):'
                        end
                        object Label250: TLabel
                          Left = 352
                          Top = 150
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label251: TLabel
                          Left = 9
                          Top = 177
                          Width = 199
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Sa'#237'da Cr'#233'ditos Padr'#227'o (SA'#205'DA):'
                        end
                        object Label252: TLabel
                          Left = 352
                          Top = 177
                          Width = 129
                          Height = 13
                          Caption = 'Controle Correspondente :'
                        end
                        object Label253: TLabel
                          Left = 54
                          Top = 204
                          Width = 154
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta ICMS Ve'#237'culo (SA'#205'DA):'
                        end
                        object Label254: TLabel
                          Left = 314
                          Top = 204
                          Width = 167
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta PIS/COFINS V. (SA'#205'DA) :'
                        end
                        object Label255: TLabel
                          Left = 326
                          Top = 231
                          Width = 155
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Desc. Prest. (SA'#205'DA) :'
                        end
                        object Label256: TLabel
                          Left = 38
                          Top = 259
                          Width = 170
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Juros Prest. (ENTRADA) :'
                        end
                        object Label262: TLabel
                          Left = 26
                          Top = 284
                          Width = 181
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta da tarifa banc'#225'ria (SA'#205'DA) :'
                        end
                        object Label276: TLabel
                          Left = 334
                          Top = 286
                          Width = 147
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Lanc. diferen'#231'a CTP:'
                        end
                        object Label398: TLabel
                          Left = 9
                          Top = 314
                          Width = 197
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta de Sobra de Caixa (ENTRADA):'
                        end
                        object Label399: TLabel
                          Left = 292
                          Top = 314
                          Width = 189
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta de Quebra de Caixa (SA'#205'DA):'
                        end
                        object Label457: TLabel
                          Left = 37
                          Top = 232
                          Width = 171
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Desc. Prest. (ENTRADA) :'
                        end
                        object Label458: TLabel
                          Left = 327
                          Top = 258
                          Width = 154
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Juros Prest. (SA'#205'DA) :'
                        end
                        object Label459: TLabel
                          Left = 59
                          Top = 340
                          Width = 147
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Sa'#237'da Vales (SA'#205'DA):'
                        end
                        object Label460: TLabel
                          Left = 282
                          Top = 334
                          Width = 199
                          Height = 26
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Sa'#237'da Tarifa Intermediador Pag (SA'#205'DA):'
                          WordWrap = True
                        end
                        object lbEntradaDescDesp: TLabel
                          Left = 58
                          Top = 363
                          Width = 149
                          Height = 26
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Desc. Desp. Resumo Financeiro (ENTRADA):'
                          WordWrap = True
                        end
                        object Label462: TLabel
                          Left = 288
                          Top = 365
                          Width = 192
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'N'#186' Conta Frete Entrada NF (ENTRADA):'
                        end
                        object Label463: TLabel
                          Left = 568
                          Top = 42
                          Width = 116
                          Height = 26
                          Caption = 'N'#186' Conta Transfer'#234'ncia de Saldo (SA'#205'DA):'
                          WordWrap = True
                        end
                        object Label464: TLabel
                          Left = 568
                          Top = 87
                          Width = 116
                          Height = 26
                          Caption = 'N'#186' Conta Transferencia de Saldo (ENTRADA):'
                          WordWrap = True
                        end
                        object Label465: TLabel
                          Left = 568
                          Top = 137
                          Width = 105
                          Height = 26
                          Caption = 'Controle Lan'#231'amento Recibo :'
                          WordWrap = True
                        end
                        object DBEdit161: TDBEdit
                          Left = 214
                          Top = 39
                          Width = 60
                          Height = 21
                          DataField = 'NCON_V_PROD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 0
                          OnKeyDown = DBEdit161KeyDown
                        end
                        object DBEdit162: TDBEdit
                          Left = 487
                          Top = 39
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_V_PROD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 1
                          OnKeyDown = DBEdit162KeyDown
                        end
                        object DBEdit163: TDBEdit
                          Left = 214
                          Top = 66
                          Width = 60
                          Height = 21
                          DataField = 'NCON_V_SERV'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 2
                          OnKeyDown = DBEdit163KeyDown
                        end
                        object DBEdit164: TDBEdit
                          Left = 487
                          Top = 66
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_V_SERV'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 3
                          OnKeyDown = DBEdit164KeyDown
                        end
                        object DBEdit165: TDBEdit
                          Left = 214
                          Top = 93
                          Width = 60
                          Height = 21
                          DataField = 'NCON_C_PROD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 4
                          OnKeyDown = DBEdit165KeyDown
                        end
                        object DBEdit166: TDBEdit
                          Left = 487
                          Top = 93
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_C_PROD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 5
                          OnKeyDown = DBEdit166KeyDown
                        end
                        object DBEdit167: TDBEdit
                          Left = 213
                          Top = 120
                          Width = 61
                          Height = 21
                          DataField = 'NCON_C_VEIC'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 6
                          OnKeyDown = DBEdit167KeyDown
                        end
                        object DBEdit168: TDBEdit
                          Left = 487
                          Top = 120
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_C_VEIC'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 7
                          OnKeyDown = DBEdit168KeyDown
                        end
                        object DBEdit169: TDBEdit
                          Left = 213
                          Top = 147
                          Width = 61
                          Height = 21
                          DataField = 'NCON_S_CHQ'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 8
                          OnKeyDown = DBEdit169KeyDown
                        end
                        object DBEdit170: TDBEdit
                          Left = 487
                          Top = 147
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_S_CHQ'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 9
                          OnKeyDown = DBEdit170KeyDown
                        end
                        object DBEdit171: TDBEdit
                          Left = 214
                          Top = 174
                          Width = 60
                          Height = 21
                          DataField = 'NCON_S_CRD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 10
                          OnKeyDown = DBEdit171KeyDown
                        end
                        object DBEdit172: TDBEdit
                          Left = 487
                          Top = 174
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_S_CRD'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 11
                          OnKeyDown = DBEdit172KeyDown
                        end
                        object DBEdit173: TDBEdit
                          Left = 213
                          Top = 201
                          Width = 61
                          Height = 21
                          DataField = 'CONTA_ICM'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 12
                          OnKeyDown = DBEdit173KeyDown
                        end
                        object DBEdit174: TDBEdit
                          Left = 487
                          Top = 201
                          Width = 60
                          Height = 21
                          DataField = 'CONTA_PIS'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 13
                          OnKeyDown = DBEdit174KeyDown
                        end
                        object DBEdit175: TDBEdit
                          Left = 487
                          Top = 228
                          Width = 60
                          Height = 21
                          DataField = 'NCON_D_PREST'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 15
                          OnKeyDown = DBEdit175KeyDown
                        end
                        object DBEdit176: TDBEdit
                          Left = 214
                          Top = 256
                          Width = 60
                          Height = 21
                          DataField = 'NCON_J_PREST'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 16
                          OnKeyDown = DBEdit176KeyDown
                        end
                        object DBEdit178: TDBEdit
                          Left = 213
                          Top = 284
                          Width = 61
                          Height = 21
                          DataField = 'NCON_TARIFABANCARIA'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 18
                          OnKeyDown = DBEdit178KeyDown
                        end
                        object DBEdit189: TDBEdit
                          Left = 487
                          Top = 284
                          Width = 60
                          Height = 21
                          Hint = 
                            'Conta padr'#227'o de entrada para lan'#231'ar poss'#237'veis diferen'#231'as ao quit' +
                            'ar contas a pagar.'
                          DataField = 'NCON_LANCDIFCTP'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 19
                        end
                        object DBEdit219: TDBEdit
                          Left = 213
                          Top = 311
                          Width = 61
                          Height = 21
                          DataField = 'NCON_SOBRA'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 20
                          OnKeyDown = DBEdit219KeyDown
                        end
                        object DBEdit220: TDBEdit
                          Left = 487
                          Top = 311
                          Width = 60
                          Height = 21
                          Hint = 
                            'Conta padr'#227'o de entrada para lan'#231'ar poss'#237'veis diferen'#231'as ao quit' +
                            'ar contas a pagar.'
                          DataField = 'NCON_QUEBRA'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 21
                          OnKeyDown = DBEdit220KeyDown
                        end
                        object DBEdit243: TDBEdit
                          Left = 214
                          Top = 229
                          Width = 60
                          Height = 21
                          DataField = 'NCON_ED_PREST'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 14
                          OnKeyDown = DBEdit243KeyDown
                        end
                        object DBEdit244: TDBEdit
                          Left = 487
                          Top = 255
                          Width = 60
                          Height = 21
                          DataField = 'NCON_SJ_PREST'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 17
                          OnKeyDown = DBEdit244KeyDown
                        end
                        object DBEdit245: TDBEdit
                          Left = 213
                          Top = 337
                          Width = 61
                          Height = 21
                          DataField = 'NCON_S_VALE'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 22
                          OnKeyDown = DBEdit245KeyDown
                        end
                        object DBEdit14: TDBEdit
                          Left = 487
                          Top = 337
                          Width = 60
                          Height = 21
                          DataField = 'NCON_TARIFAINTERMPAG'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 23
                          OnKeyDown = DBEdit14KeyDown
                        end
                        object DBEditEntradaDescDesp: TDBEdit
                          Left = 213
                          Top = 362
                          Width = 61
                          Height = 21
                          Hint = 
                            'Conta padr'#227'o de entrada para lan'#231'ar poss'#237'veis descontos concedid' +
                            'os ao quitar cr'#233'ditos'
                          DataField = 'NCON_ENT_DESCDESP'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 24
                          OnKeyDown = DBEditEntradaDescDespKeyDown
                        end
                        object DBEdit246: TDBEdit
                          Left = 486
                          Top = 362
                          Width = 60
                          Height = 21
                          DataField = 'NCON_C_FRETE'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 25
                          OnKeyDown = DBEdit246KeyDown
                        end
                        object DBEdit247: TDBEdit
                          Left = 690
                          Top = 45
                          Width = 60
                          Height = 21
                          DataField = 'NCON_S_TRANSF'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 26
                          OnKeyDown = DBEdit247KeyDown
                        end
                        object DBEdit248: TDBEdit
                          Left = 690
                          Top = 90
                          Width = 60
                          Height = 21
                          DataField = 'NCON_E_TRANSF'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 27
                          OnKeyDown = DBEdit248KeyDown
                        end
                        object DBEdit249: TDBEdit
                          Left = 690
                          Top = 140
                          Width = 60
                          Height = 21
                          DataField = 'CONTR_REC'
                          DataSource = DtmCadBasicos.dsContaLig
                          TabOrder = 28
                          OnKeyDown = DBEdit248KeyDown
                        end
                      end
                    end
                  end
                  object TabSheet26: TTabSheet
                    Caption = 'Cont'#225'bil'
                    ImageIndex = 1
                    object GroupBox24: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 767
                      Height = 424
                      Align = alClient
                      Caption = 'Contas de Liga'#231#227'o do Plano de Contas Cont'#225'bil'
                      TabOrder = 0
                      OnEnter = GroupBox24Enter
                      object Label271: TLabel
                        Left = 195
                        Top = 40
                        Width = 247
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Conta Cont'#225'bil Anal'#237'tica de Estoque de Mercadorias'
                        FocusControl = DBEdit185
                      end
                      object Label272: TLabel
                        Left = 213
                        Top = 67
                        Width = 229
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Conta Cont'#225'bil Anal'#237'tica de CMV de Mercadorias'
                        FocusControl = DBEdit186
                      end
                      object Label273: TLabel
                        Left = 197
                        Top = 94
                        Width = 245
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Conta Cont'#225'bil Anal'#237'tica de Estoque Ve'#237'culos Novos'
                        FocusControl = DBEdit187
                      end
                      object Label274: TLabel
                        Left = 234
                        Top = 121
                        Width = 208
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Conta Cont'#225'bil Anal'#237'tica de Ve'#237'culos Usados'
                        FocusControl = DBEdit188
                      end
                      object DBEdit185: TDBEdit
                        Left = 448
                        Top = 37
                        Width = 300
                        Height = 21
                        DataField = 'COD_CTA_ESTOQUE'
                        DataSource = DtmCadBasicos.dsCtLigContabil
                        TabOrder = 0
                        OnKeyDown = DBEdit185KeyDown
                      end
                      object DBEdit186: TDBEdit
                        Left = 448
                        Top = 64
                        Width = 300
                        Height = 21
                        DataField = 'COD_CTA_CMV'
                        DataSource = DtmCadBasicos.dsCtLigContabil
                        TabOrder = 1
                        OnKeyDown = DBEdit185KeyDown
                      end
                      object DBEdit187: TDBEdit
                        Left = 448
                        Top = 91
                        Width = 300
                        Height = 21
                        DataField = 'COD_CTA_EST_VEIC_NOVO'
                        DataSource = DtmCadBasicos.dsCtLigContabil
                        TabOrder = 2
                        OnKeyDown = DBEdit185KeyDown
                      end
                      object DBEdit188: TDBEdit
                        Left = 448
                        Top = 118
                        Width = 300
                        Height = 21
                        DataField = 'COD_CTA_EST_VEIC_SEMI'
                        DataSource = DtmCadBasicos.dsCtLigContabil
                        TabOrder = 3
                        OnKeyDown = DBEdit185KeyDown
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 486
              ExplicitTop = 486
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS079]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS080]'
              end
              inherited BitBtn6: TBitBtn
                Left = 607
                ExplicitLeft = 607
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
          inherited GroupBox3: TGroupBox
            object SpeedButton55: TSpeedButton [6]
              Left = 656
              Top = 45
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton55Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS072]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS073]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Height = 461
            ExplicitHeight = 461
            inherited Splitter1: TSplitter
              Height = 400
              ExplicitTop = 57
              ExplicitHeight = 382
            end
            inherited DBGrid1: TDBGrid
              Height = 400
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS074]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS075]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS081]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS077]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Inscri'#231#227'o Susbtituto Tribut'#225'rio - [BAS082]'
                Caption = 'ST'
                Font.Charset = ANSI_CHARSET
                Font.Height = -16
                Font.Name = 'Times New Roman'
                ParentFont = False
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 405
                Hint = 'Abrir Acesso a Cadastros em Outras Empresas'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000010000107B10001084
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
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E2D2D
                  6E6E6E6E6E6E6E6E6E6E6E6E6E1D0D0707070707072D79622D6E6E6E6E6E6E6E
                  6E6E6E6E2401120211111111006279792D2D1A6E6E6E6E6E6E6E6E6E03120811
                  1619310B280B627979622D6E6E6E6E6E6E6E6E6E0A050C161B31182247103962
                  79792D2D6E6E6E6E6E6E6E6E3004161B23391E6767273920627978622D752D6E
                  6E6E6E6E6E0616203915587A7A2C31251B6279797579752D6E6E6E6E6E6E0618
                  0F2F53535726292A18096279797979752D6E6E6E6E6E6E0E133B42423C1C1F0B
                  146E2D6279797979752D6E6E6E6E6E35485C5D5D5C3E176E6E6E627979752D79
                  79756E6E6E6E6E4263686F6F6963346E6E6E6E6279626279756E6E6E6E6E3A63
                  7070707070705D336E6E6E6E627979756E6E6E6E6E6E49707171717171716A21
                  6E6E6E6E6E62626E6E6E6E6E6E366A717272767672726B2B6E6E6E6E6E6E6E6E
                  6E6E6E6E6E526B7273767476747672326E6E6E6E6E6E6E6E6E6E6E6E6E446474
                  7777776D656D6D2E6E6E6E6E6E6E6E6E6E6E6E6E6E513F545A5A494B4C4A5633
                  6E6E6E6E6E6E6E6E6E6E6E6E6E36384D5059666C5E55376E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E384C5960605F5B4E336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E40
                  4F59616043336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E4641453D366E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E}
                OnClick = SpeedButton7Click
                ExplicitLeft = 405
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Abrir Cadastro de DNA - [BAS083]'
                Caption = 'DNA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clGreen
                Font.Height = -16
                Font.Name = 'Arial Narrow'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Configurar Caixa Unificado - [BAS351]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4BCA6B8712FAC5309A94A00A948
                  00A74800A74800AD5301AD5200A74800A74800A94800A94A00AC530AB87332FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAD5400AB5100
                  DAA673F2CDA9F9DDBFFFE4C9FFEDD7BB6C1CBA671AFFEDD7FFE6CCF9DDC1F4CF
                  ADE0AB7AAE5600AD5400FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFA94B00EBC49AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC8745C98544FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFF5D2B1AD5511FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFB35F1ADAA66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
                  9A60D69A62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3B182B66D33FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF7F44BB6C1CFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFE1AD7DDEA977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1742CC0
                  8B5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA4D00
                  C6813DFEE3CBFFFFFFFFFFFFFFFFFFA44300A44300FFFFFFFFFFFFFFFFFFFEE6
                  C9C98543A94B00FF00FFFF00FFB56210B56210B56210B56210B56210B56210BB
                  7530FF00FFD3B9A0AD570AA74800A23E00EDC59DFFFFFFFCE0C5FEE4C6FFFFFF
                  E6B88BA23E00A74800AE570FD4BDA6FF00FFFF00FFB56210B56210B56210B562
                  10B56210B56210B56210BC7834FF00FFFF00FFFF00FFBB7B48FFFFFFB55F0DB0
                  5801B05903B86515FFFFF4BC804CFF00FFFF00FFFF00FFFF00FF888888FFFFFF
                  E3E3E3E3E3E3B56210B56210B56210B56210B56210B56210BE7C3BD2B79CFF00
                  FFBE7C3DD79C65FFFFFFFFFFFFD9A36CC08448FF00FFFF00FFFF00FFFF00FFFF
                  00FF888888FFFFFFE3E3E3E3E3E3B56210B56210B56210B56210B56210B56210
                  B56210CEAB88FF00FFB05903FFFFFFFFFFFFFFFFFFFFFFFFB35C07FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B56210B56210B56210B5
                  6210B56210B56210B56210FF00FFBE804CE8BE95FFFFFFFFFFFFFFFFFFFFFFFF
                  EDC59DBF8354FF00FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B562
                  10B56210B56210B56210B56210B56210BB732DFF00FFA84A05FFFEEDFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF9AA500EFF00FFFF00FFFF00FFFF00FF888888FFFFFF
                  E3E3E3E3E3E3B56210B56210B56210B56210B56210B56210C1874DFF00FFA644
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA64400FF00FFFF00FFFF00FFFF
                  00FF888888FFFFFFE3E3E3E3E3E3B56210B56210B56210B56210B56210B56210
                  C28951FF00FFAD5400A94800B86512CD894AEDC499FFFFFFC47D36AB5100FF00
                  FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B56210B56210B56210B5
                  6210B56210B56210BD7A38FF00FFAE5500AD5400AD5200AB4E00A94A00A64700
                  AB5100AE5500FF00FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B562
                  10B56210B56210B56210B56210B56210B56313FF00FFC38C58AE5500AE5500AE
                  5500AE5500AE5400AE5500C39060FF00FFFF00FFFF00FFFF00FF888888FFFFFF
                  E3E3E3E3E3E3B56210B56210FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FF00
                  FFC69668B05C0CAE5500AE5500B05C0CC7976AFF00FFFF00FFFF00FFFF00FFFF
                  00FF888888FFFFFFE3E3E3E3E3E3B56210B56210FFFFFFFFFFF8FFFFF8FFFFF8
                  FFFFF8FFFFF8F4F4EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B56210B56210FFFFFFFF
                  FFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FBFBFBBF7F41BF7F41BA7027
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B562
                  10B56210FFFFFFFFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFF8FFFFFFB5
                  6210B56210B56210FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888FFFFFF
                  E3E3E3E3E3E3B56210B56210FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFB56210B56210B56210FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF888888FFFFFFE3E3E3E3E3E3B56210B56210B56210B56210B56210B56210
                  B56210B56210B56210B56210B56210B56210B56210B56210FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B56210B56210B56210B5
                  6210B56210B56210B56210B56210B56210B56210B56210B56210B56210B56210
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB56210B56210B56210B562
                  10B56210B56210B56210B56210B56210B56210B56210B56210B56210B56210B5
                  6210B56210B56210FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'Configurar replica'#231#227'o interna (Antiga) - [BAS411]'
                Glyph.Data = {
                  96010000424D9601000000000000760000002800000018000000180000000100
                  04000000000020010000C40E0000C40E00001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF88883333
                  333333FFFFFFFFFFF78887BBB88B3333FFFFFFF333887888B888B333FFFFFFF3
                  38888888888BB3333FFFFFF3388BB8888888B3333FFFFFF3388BBB8FF8877333
                  3FFFFFF3388BBBB8FFF887333FFFFFF3388BBBBB8FFFFF877FFFFFF3388BBBBB
                  88FFFFF866FFFFF3388888888FFFF86776FFFFF338887337888FFF877FFFFFF3
                  333BBBBB888888F866FFFFF3388BBBBBB88888888666FFF3388BBBBBB8888777
                  7666FFF3388BBBBBB88BB3337FF6FFF3388BBBBBB888B3333FFFFFF3388BBBBB
                  B888B3333FFFFFF3388BBBBBB888B3333FFFFFF3388BBBBB8888B3333FFFFFF3
                  38FFFFF888888BB33FFFFFF33FFFFFF8888888B33FFFFFF338FFFFFF888FF8B3
                  3FFFFFFF3337888888887333FFFFFFFFFF333333333333FFFFFF}
                OnClick = SpeedButton12Click
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS078]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 400
              ExplicitHeight = 400
              inherited ScrollBox2: TScrollBox
                Height = 383
                ExplicitHeight = 383
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 534
        end
        object tsSubstitutoTributario: TTabSheet
          Caption = 'tsSubstitutoTributario'
          ImageIndex = 2
          object pnSubstitutoTributario: TPanel
            Left = 3
            Top = 3
            Width = 638
            Height = 254
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object pnSTCadastro: TPanel
              Left = 10
              Top = 10
              Width = 615
              Height = 233
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label310: TLabel
                Left = 205
                Top = 24
                Width = 220
                Height = 13
                Caption = 'Identifica'#231#227'o do processo ou ato concess'#243'rio.'
                FocusControl = DBEdit150
              end
              object Label311: TLabel
                Left = 205
                Top = 64
                Width = 95
                Height = 13
                Caption = 'Indicador da origem'
              end
              object DBEdit150: TDBEdit
                Left = 205
                Top = 40
                Width = 199
                Height = 21
                DataField = 'INSCRICAO'
                DataSource = DtmCadBasicos.dsSTEmp
                TabOrder = 0
              end
              object DBComboBox44: TDBComboBox
                Tag = 1
                Left = 205
                Top = 83
                Width = 199
                Height = 21
                Style = csDropDownList
                DataField = 'SIGLA_UF'
                DataSource = DtmCadBasicos.dsSTEmp
                ItemHeight = 13
                Items.Strings = (
                  'AC'
                  'AL'
                  'AM'
                  'AP'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MG'
                  'MS'
                  'MT'
                  'PA'
                  'PB'
                  'PE'
                  'PI'
                  'PR'
                  'RJ'
                  'RN'
                  'RO'
                  'RR'
                  'RS'
                  'SC'
                  'SE'
                  'SP'
                  'TO')
                TabOrder = 1
              end
              object Panel55: TPanel
                Left = 12
                Top = 177
                Width = 589
                Height = 41
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 2
                object btSalvarST: TBitBtn
                  Left = 225
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Clique neste bot'#227'o para salvar o item'
                  Caption = 'Salvar'
                  TabOrder = 0
                  OnClick = btSalvarSTClick
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
                object btCancelarST: TBitBtn
                  Left = 306
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = btCancelarSTClick
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
            object pnSTConsulta: TPanel
              Left = 432
              Top = -52
              Width = 615
              Height = 233
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'pnSTConsulta'
              TabOrder = 1
              object GroupBox45: TGroupBox
                Left = 12
                Top = 8
                Width = 589
                Height = 153
                Caption = 'Processos Referenciados'
                TabOrder = 0
                object DBGrid17: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 585
                  Height = 136
                  Align = alClient
                  DataSource = DtmCadBasicos.dsSTEmp
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SIGLA_UF'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'INSCRICAO'
                      Width = 64
                      Visible = True
                    end>
                end
              end
              object Panel56: TPanel
                Left = 12
                Top = 177
                Width = 589
                Height = 41
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object SpeedButton22: TSpeedButton
                  Left = 18
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'Voltar'
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
                  OnClick = SpeedButton22Click
                end
                object btNovoST: TBitBtn
                  Left = 185
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'Novo'
                  TabOrder = 0
                  OnClick = btNovoSTClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                    AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                    090909090909090909090900000000000000000000000000000009000B0B0505
                    0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                    0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                    0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                    0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                    0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                    00000000000A080A000009090000000000000000000A0A0A0009090909090909
                    0909090909090909090909090909090909090909090909090909}
                end
                object btAlterarST: TBitBtn
                  Left = 266
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'Alterar'
                  TabOrder = 1
                  OnClick = btAlterarSTClick
                  Glyph.Data = {
                    6E030000424D6E030000000000006E0200002800000010000000100000000100
                    08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                    FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                    5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                    5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                    8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                    2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                    C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                    3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                    EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                    E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                    CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                    8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                    BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                    6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                    F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                    F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                    A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                    DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                    B400010B9900010A95002732D000000081000202020202020202020202020202
                    020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                    02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                    02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                    020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                    02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                    02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                    878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                    848B403A3A3A3A3A3A3A3A2C0202028C8902}
                end
                object btRemoverST: TBitBtn
                  Left = 347
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'Remover'
                  TabOrder = 2
                  OnClick = btRemoverSTClick
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
              end
            end
          end
        end
        object tsCadastrosAcess: TTabSheet
          Caption = 'tsCadastrosAcess'
          ImageIndex = 4
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 534
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox32: TGroupBox
              Left = 6
              Top = 6
              Width = 771
              Height = 105
              Align = alTop
              Caption = 'Empresa'
              TabOrder = 0
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 767
                Height = 88
                Align = alClient
                DataSource = DtmCadBasicos.dsEmpSenha
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_EMPRESA'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO_EMP'
                    Width = 434
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CGC_EMP'
                    Width = 203
                    Visible = True
                  end>
              end
            end
            object GroupBox33: TGroupBox
              Left = 6
              Top = 111
              Width = 771
              Height = 376
              Align = alClient
              Caption = 'Usu'#225'rios'
              TabOrder = 1
              object DBGrid5: TDBGrid
                Left = 2
                Top = 15
                Width = 767
                Height = 359
                Align = alClient
                DataSource = DtmCadBasicos.dsCadastrosEmp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CADASTRO'
                    Width = 313
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL_INCLUSAO'
                    Width = 116
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL_ALTERACAO'
                    Width = 116
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL_EXCLUSAO'
                    Width = 128
                    Visible = True
                  end>
              end
            end
            object Panel12: TPanel
              Left = 6
              Top = 487
              Width = 771
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn15: TBitBtn
                Left = 268
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Incluir'
                TabOrder = 0
                OnClick = BitBtn15Click
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
              object BitBtn16: TBitBtn
                Left = 349
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Alterar'
                TabOrder = 1
                OnClick = BitBtn16Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B0000000100000001000000000000CE63
                  00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                  A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                  C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                  1818181818181818181818010101010101010101010101010101180119191716
                  1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                  17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                  1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                  191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                  19191919091505020C0118011919191919191919190700140001180101010101
                  0101010101041414030118180101010101010101010108080618181818181818
                  1818181818181818181818181818181818181818181818181818}
              end
              object BitBtn17: TBitBtn
                Left = 430
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
                TabOrder = 2
                OnClick = BitBtn17Click
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
            end
          end
          object pnCadastroAcesso: TPanel
            Left = 72
            Top = 83
            Width = 638
            Height = 345
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 1
            Visible = False
            object Panel14: TPanel
              Left = 6
              Top = 6
              Width = 626
              Height = 333
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 12
              TabOrder = 0
              object Label384: TLabel
                Left = 39
                Top = 29
                Width = 94
                Height = 13
                Caption = 'Acesso ao cadastro'
              end
              object Panel15: TPanel
                Left = 12
                Top = 276
                Width = 598
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 3
                object BitBtn18: TBitBtn
                  Left = 219
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Clique neste bot'#227'o para salvar o item'
                  Caption = 'Salvar'
                  TabOrder = 0
                  OnClick = BitBtn18Click
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
                object BitBtn19: TBitBtn
                  Left = 300
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = BitBtn19Click
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
              object DBRadioGroup8: TDBRadioGroup
                Left = 12
                Top = 72
                Width = 598
                Height = 49
                Caption = 'N'#237'vel de Inclus'#227'o'
                Columns = 11
                DataField = 'NIVEL_INCLUSAO'
                DataSource = DtmCadBasicos.dsCadastrosEmp
                Items.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10')
                ParentBackground = True
                TabOrder = 0
              end
              object DBRadioGroup9: TDBRadioGroup
                Left = 12
                Top = 127
                Width = 598
                Height = 49
                Caption = 'N'#237'vel de Altera'#231#227'o'
                Columns = 11
                DataField = 'NIVEL_ALTERACAO'
                DataSource = DtmCadBasicos.dsCadastrosEmp
                Items.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10')
                ParentBackground = True
                TabOrder = 1
              end
              object DBRadioGroup10: TDBRadioGroup
                Left = 12
                Top = 182
                Width = 598
                Height = 49
                Caption = 'N'#237'vel de Exclus'#227'o'
                Columns = 11
                DataField = 'NIVEL_EXCLUSAO'
                DataSource = DtmCadBasicos.dsCadastrosEmp
                Items.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6'
                  '7'
                  '8'
                  '9'
                  '10')
                ParentBackground = True
                TabOrder = 2
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 139
                Top = 26
                Width = 470
                Height = 21
                DataField = 'CADASTRO'
                DataSource = DtmCadBasicos.dsCadastrosEmp
                KeyField = 'NOME_TABELA'
                ListField = 'NOME_TABELA'
                ListSource = DtmCadBasicos.dsCadastrosEmpTabelas
                TabOrder = 4
              end
            end
          end
        end
        object tsReplicacaoInterna: TTabSheet
          Caption = 'tsReplicacaoInterna'
          ImageIndex = 5
          object pnReplicacaoInterna: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 233
            Align = alTop
            BevelOuter = bvSpace
            BorderWidth = 6
            TabOrder = 0
            object Panel24: TPanel
              Left = 7
              Top = 185
              Width = 769
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label456: TLabel
                Left = 61
                Top = 9
                Width = 100
                Height = 13
                Caption = 'Empresas habilitadas'
              end
              object BitBtn22: TBitBtn
                Left = 285
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Incluir'
                TabOrder = 0
                OnClick = BitBtn22Click
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
              object BitBtn23: TBitBtn
                Left = 366
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Remover'
                TabOrder = 1
                OnClick = BitBtn23Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FE00FEFE00FE
                  FE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00
                  FEFE00FEFE00FEFE00FEFE00FEFE00FE001B86001B8600187600176E00176E00
                  176E00176E00176E00176E00176E00176E00176EFE00FEFE00FEFE00FE0024AE
                  012AC70029C50026BA0025B40024AE0024AE0024AE0024AE0024AE0024AE0024
                  AE001F9600176EFE00FEFE00FE012AC70030EA002EDD002EDD042ED0012AC700
                  29C50026BA0026BA0026BA0029C50029C50025B400176EFE00FEFE00FE042ED0
                  0033F40030EA002EDD042ED0012AC70029C50029C50026BA0026BA0025B40029
                  C50024AE00176EFE00FEFE00FE042ED0083AF90033F40030EA002EE1002EDD01
                  2AC7012AC7012AC70026BA0026BA0026BA0024AE00176EFE00FEFE00FE002EDD
                  2A56FE1142FC0033F40030EA002EDD002EDD042ED0012AC7012AC70026BA0029
                  C50024AE00176EFE00FEFE00FE042ED05175FE214FFD0033F4FBFCFEFBFCFEFB
                  FCFEFBFCFEFBFCFEFBFCFE012AC70029C50024AE00176EFE00FEFE00FE042ED0
                  5175FE2A56FE0D3FFBFBFCFEFBFCFEFBFCFEFBFCFEFBFCFEFBFCFE042ED0012A
                  C70026BA001876FE00FEFE00FE002EDD5175FE365FFE1142FC0033F40033F400
                  33F40033F40030E7002EE1002EDD002EDD0026BA001B86FE00FEFE00FE042ED0
                  9AAAE64269FE214FFD214FFD0D3FFB0033F40033F40033F40030EA0030E7002E
                  E1012AC7001F96FE00FEFE00FE042ED09AAAE65175FE2A56FE214FFD214FFD0D
                  3FFB0D3FFB0033F40033F40030EA0030EA002EDD00219EFE00FEFE00FE002EDD
                  9AAAE69AAAE65175FE5175FE5175FE365FFE2A56FE0D3FFB0033F40033F40033
                  F4002EE10024AEFE00FEFE00FE042ED05175FE9AAAE69AAAE69AAAE69AAAE651
                  75FE365FFE214FFD083AF90033F40033F40030EA0026BAFE00FEFE00FEFE00FE
                  0033F41142FC214FFD1142FC1142FC0033F40033F40030E7002EDD002EDD002E
                  DD0029C5FE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE
                  00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FEFE00FE}
              end
              object BitBtn24: TBitBtn
                Left = 666
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
                TabOrder = 2
                OnClick = BitBtn24Click
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
              object Panel23: TPanel
                Left = 15
                Top = 9
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
            object GroupBox36: TGroupBox
              Left = 7
              Top = 7
              Width = 769
              Height = 178
              Align = alClient
              Caption = 'Empresas'
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 765
                Height = 161
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid3DrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_EMPRESA'
                    Title.Caption = 'Cod Empresa'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO_EMP'
                    Title.Caption = 'Empresa'
                    Width = 350
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CGC_EMP'
                    Title.Caption = 'CNPJ/CPF'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EMP_REPL_INTERNA'
                    Title.Caption = 'Responsavel'
                    Width = 65
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 34
      Top = 128
      Width = 10
      Height = 10
      ExplicitLeft = 34
      ExplicitTop = 128
      ExplicitWidth = 10
      ExplicitHeight = 10
      inherited bMarketingHW: TBitBtn
        Top = -12
        Width = 8
        ExplicitTop = -12
        ExplicitWidth = 8
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 569
    ExplicitTop = 569
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 604
    Top = 65531
  end
  inherited PopupMenu2: TPopupMenu
    Left = 566
    Top = 65533
  end
  inherited Timer1: TTimer
    Left = 494
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 462
    Top = 65531
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Executavel|*.exe'
    Left = 528
    Top = 65532
  end
end
