inherited FrmCadNBM: TFrmCadNBM
  Left = 335
  Top = 59
  Caption = 'NCM / SH'
  ClientHeight = 612
  ExplicitWidth = 806
  ExplicitHeight = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 593
    ExplicitHeight = 593
    inherited Splitter2: TSplitter
      Height = 591
      ExplicitHeight = 591
    end
    inherited PanelLeft: TPanel
      Height = 591
      ExplicitHeight = 591
      inherited PageControl1: TPageControl
        Height = 589
        ExplicitHeight = 589
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 558
          inherited ScrollBox1: TScrollBox
            Height = 558
            ExplicitHeight = 558
            inherited PageControl3: TPageControl
              Height = 510
              ExplicitHeight = 510
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de Rela'#231#227'o NBM x NCM'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 479
                inherited ScrollBox3: TScrollBox
                  Height = 479
                  VertScrollBar.Position = 107
                  ExplicitHeight = 479
                  inherited GroupBox1: TGroupBox
                    Top = -107
                    Width = 754
                    Height = 582
                    Caption = ''
                    ExplicitTop = -107
                    ExplicitWidth = 754
                    ExplicitHeight = 582
                    object Label6: TLabel
                      Left = 153
                      Top = 24
                      Width = 62
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo NCM:'
                      FocusControl = DBEdit3
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 140
                      Top = 51
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o NCM:'
                      FocusControl = DBEdit4
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 172
                      Top = 78
                      Width = 43
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unidade:'
                      FocusControl = DBEdit1
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 190
                      Top = 153
                      Width = 25
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'MVA:'
                      FocusControl = DBEdit2
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 122
                      Top = 180
                      Width = 93
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'MVA Interestadual:'
                      FocusControl = DBEdit9
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label17: TLabel
                      Left = 147
                      Top = 207
                      Width = 68
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'ICMS Interno:'
                      FocusControl = DBEdit10
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 144
                      Top = 261
                      Width = 71
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CST PIS Sa'#237'da:'
                    end
                    object Label21: TLabel
                      Left = 122
                      Top = 288
                      Width = 93
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CST COFINS Sa'#237'da:'
                    end
                    object Label22: TLabel
                      Left = 130
                      Top = 315
                      Width = 83
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CST PIS Entrada:'
                    end
                    object Label23: TLabel
                      Left = 110
                      Top = 342
                      Width = 105
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CST COFINS Entrada:'
                    end
                    object Label24: TLabel
                      Left = 21
                      Top = 396
                      Width = 194
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliq PIS Diferenciada ou Por quantidade:'
                      FocusControl = DBEdit15
                    end
                    object Label25: TLabel
                      Left = 332
                      Top = 396
                      Width = 183
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliq COFINS Difer. ou Por quantidade:'
                      FocusControl = DBEdit16
                    end
                    object Label26: TLabel
                      Left = 114
                      Top = 234
                      Width = 101
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Calcular ST na Sa'#237'da:'
                    end
                    object Label28: TLabel
                      Left = 47
                      Top = 450
                      Width = 168
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Informa'#231#227'o Complementar para NF'
                      FocusControl = DBEdit11
                    end
                    object Label29: TLabel
                      Left = 117
                      Top = 369
                      Width = 98
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Natureza da Receita'
                    end
                    object Label33: TLabel
                      Left = 89
                      Top = 425
                      Width = 126
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Al'#237'quota de Cr'#233'dito do PIS'
                      FocusControl = DBEdit12
                    end
                    object Label34: TLabel
                      Left = 367
                      Top = 425
                      Width = 148
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Al'#237'quota de Cr'#233'dito do COFINS'
                      FocusControl = DBEdit13
                    end
                    object Label35: TLabel
                      Left = 52
                      Top = 476
                      Width = 163
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliq Produtos e Servi'#231'os Nacionais'
                      FocusControl = DBEdit11
                    end
                    object Label36: TLabel
                      Left = 42
                      Top = 501
                      Width = 173
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliq Produtos e Servi'#231'os Importados'
                      FocusControl = DBEdit11
                    end
                    object Label37: TLabel
                      Left = 4
                      Top = 102
                      Width = 211
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Modalidade de determina'#231#227'o BC do ICMS ST'
                    end
                    object Label38: TLabel
                      Left = 34
                      Top = 126
                      Width = 181
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor da determina'#231#227'o BC do ICMS ST'
                    end
                    object Label39: TLabel
                      Left = 327
                      Top = 529
                      Width = 159
                      Height = 13
                      Caption = 'Codigo de enquadramento do IPI'
                      FocusControl = DBEdit20
                    end
                    object Label40: TLabel
                      Left = 227
                      Top = 556
                      Width = 259
                      Height = 13
                      Caption = 'Codigo Especificador da Substituicao Tributaria - CEST'
                      FocusControl = DBEdit21
                    end
                    object Label43: TLabel
                      Left = 154
                      Top = 526
                      Width = 61
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aliquota FCP'
                      FocusControl = DBEdit11
                    end
                    object DBEdit3: TDBEdit
                      Left = 221
                      Top = 21
                      Width = 64
                      Height = 21
                      DataField = 'COD_NCM'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 221
                      Top = 48
                      Width = 364
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOME_NCM'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 1
                    end
                    object DBEdit1: TDBEdit
                      Left = 221
                      Top = 75
                      Width = 64
                      Height = 21
                      DataField = 'REFERENCIA'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 2
                    end
                    object DBEdit2: TDBEdit
                      Left = 221
                      Top = 150
                      Width = 64
                      Height = 21
                      DataField = 'MVA'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 6
                    end
                    object DBEdit9: TDBEdit
                      Left = 221
                      Top = 177
                      Width = 64
                      Height = 21
                      DataField = 'MVA_INTER'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 7
                    end
                    object DBEdit10: TDBEdit
                      Left = 221
                      Top = 204
                      Width = 64
                      Height = 21
                      DataField = 'ALIQ_INTRA'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 8
                    end
                    object DBEdit15: TDBEdit
                      Left = 221
                      Top = 393
                      Width = 64
                      Height = 21
                      DataField = 'ALIQ_PIS_DIFERENCIADA'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 15
                    end
                    object DBEdit16: TDBEdit
                      Left = 520
                      Top = 393
                      Width = 65
                      Height = 21
                      DataField = 'ALIQ_COFINS_DIFERENCIADA'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 16
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 221
                      Top = 258
                      Width = 364
                      Height = 21
                      DataField = 'CST_PIS'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                        '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                        
                          '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                          'roduto'
                        '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                        '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                        '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                        '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                        '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                        '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                        '49 - Outras Opera'#231#245'es de Sa'#237'da'
                        '99 - Outras Opera'#231#245'es')
                      TabOrder = 10
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 221
                      Top = 285
                      Width = 364
                      Height = 21
                      DataField = 'CST_COFINS'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                        '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                        
                          '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                          'roduto'
                        '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                        '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                        '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                        '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                        '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                        '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                        '49 - Outras Opera'#231#245'es de Sa'#237'da'
                        '99 - Outras Opera'#231#245'es')
                      TabOrder = 11
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 221
                      Top = 312
                      Width = 364
                      Height = 21
                      DataField = 'CST_PIS_ENT'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        
                          '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita Tributada no Mercado Interno'
                        
                          '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita N'#227'o Tributada no Mercado Interno'
                        
                          '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita de Exporta'#231#227'o'
                        
                          '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                          'ributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                        
                          '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita Tributada no Mercado Interno'
                        
                          '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                        
                          '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita de Exporta'#231#227'o'
                        
                          '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                          #231#227'o'
                        '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                        '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                        '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                        '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                        '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                        '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                        '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                        '98 - Outras Opera'#231#245'es de Entrada'
                        '99 - Outras Opera'#231#245'es')
                      TabOrder = 12
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 221
                      Top = 339
                      Width = 364
                      Height = 21
                      DataField = 'CST_COFINS_ENT'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        
                          '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita Tributada no Mercado Interno'
                        
                          '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita N'#227'o Tributada no Mercado Interno'
                        
                          '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita de Exporta'#231#227'o'
                        
                          '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                          'ributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                        
                          '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita Tributada no Mercado Interno'
                        
                          '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                        
                          '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita de Exporta'#231#227'o'
                        
                          '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                          #231#227'o'
                        '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                        '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                        '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                        '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                        '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                        '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                        '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                        '98 - Outras Opera'#231#245'es de Entrada'
                        '99 - Outras Opera'#231#245'es')
                      TabOrder = 13
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 221
                      Top = 231
                      Width = 64
                      Height = 21
                      DataField = 'CALC_ST_SAIDA'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                      TabOrder = 9
                    end
                    object DBEdit11: TDBEdit
                      Left = 221
                      Top = 447
                      Width = 65
                      Height = 21
                      Hint = 
                        'Informa'#231#227'o Complementar para impress'#227'o nas notas fiscais de sa'#237'd' +
                        'a'
                      DataField = 'COD_INF'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 19
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                    object Memo1: TMemo
                      Left = 292
                      Top = 447
                      Width = 294
                      Height = 73
                      Hint = 
                        'Informa'#231#227'o Complementar para impress'#227'o nas notas fiscais de sa'#237'd' +
                        'a'
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 20
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 221
                      Top = 366
                      Width = 364
                      Height = 21
                      DataField = 'NAT_REC'
                      DataSource = dtmProdutos.dsNBM
                      ItemHeight = 13
                      Items.Strings = (
                        
                          '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita Tributada no Mercado Interno'
                        
                          '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita N'#227'o Tributada no Mercado Interno'
                        
                          '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                          ' Receita de Exporta'#231#227'o'
                        
                          '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                          'ributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                          'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                        
                          '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita Tributada no Mercado Interno'
                        
                          '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                        
                          '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                          'vamente a Receita de Exporta'#231#227'o'
                        
                          '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                        
                          '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                        
                          '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                          'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                          #231#227'o'
                        '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                        '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                        '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                        '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                        '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                        '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                        '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                        '98 - Outras Opera'#231#245'es de Entrada'
                        '99 - Outras Opera'#231#245'es')
                      TabOrder = 14
                      OnEnter = DBComboBox6Enter
                    end
                    object DBEdit12: TDBEdit
                      Left = 221
                      Top = 420
                      Width = 64
                      Height = 21
                      DataField = 'ALIQ_CRED_PIS'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 17
                    end
                    object DBEdit13: TDBEdit
                      Left = 520
                      Top = 420
                      Width = 65
                      Height = 21
                      DataField = 'ALIQ_CRED_COFINS'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 18
                    end
                    object DBEdit14: TDBEdit
                      Left = 221
                      Top = 473
                      Width = 65
                      Height = 21
                      Hint = 'Al'#237'quotas para os produtos e servi'#231'os nacionais'
                      DataField = 'ALIQNAC'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 21
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                    object DBEdit17: TDBEdit
                      Left = 221
                      Top = 499
                      Width = 65
                      Height = 21
                      Hint = 'Al'#237'quota m'#233'dia para os produtos e servi'#231'os importados'
                      DataField = 'ALIQIMP'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 22
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                    object DBEdit18: TDBEdit
                      Left = 221
                      Top = 123
                      Width = 65
                      Height = 21
                      Hint = 'Valor de determina'#231#227'o da BC do ICMS ST'
                      DataField = 'VLBCST'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 5
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                    object ComboBox9: TComboBox
                      Left = 222
                      Top = 99
                      Width = 365
                      Height = 21
                      Hint = 'Modalidade de determina'#231#227'o da BC do icms st'
                      ItemHeight = 13
                      TabOrder = 4
                      Text = 'ComboBox9'
                      OnExit = ComboBox9Exit
                      OnKeyPress = ComboBox9KeyPress
                      Items.Strings = (
                        '0 - Pre'#231'o tabelado ou m'#225'ximo sugerido;'
                        '4 - Margem Valor Agregado (%);')
                    end
                    object DBEdit19: TDBEdit
                      Left = 521
                      Top = 75
                      Width = 64
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NVE'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 3
                      Visible = False
                    end
                    object groupNVE: TGroupBox
                      Left = 308
                      Top = 124
                      Width = 279
                      Height = 128
                      Caption = 'NVE - Nomenclatura de Valor Aduaneiro e Estat'#237'stica'
                      TabOrder = 26
                      object spBtAutXMLAdicionar: TSpeedButton
                        Left = 2
                        Top = 82
                        Width = 275
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
                        Top = 104
                        Width = 275
                        Height = 22
                        Align = alBottom
                        Caption = 'Remover'
                        Flat = True
                        OnClick = spBtAutXMLRemoverClick
                        ExplicitLeft = 200
                        ExplicitTop = 88
                        ExplicitWidth = 23
                      end
                      object lbxNVE: TListBox
                        Left = 2
                        Top = 15
                        Width = 275
                        Height = 67
                        Align = alClient
                        ItemHeight = 13
                        TabOrder = 0
                      end
                    end
                    object DBEdit20: TDBEdit
                      Left = 492
                      Top = 526
                      Width = 95
                      Height = 21
                      DataField = 'CENQ_IPI_NFE'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 24
                    end
                    object DBEdit21: TDBEdit
                      Left = 492
                      Top = 553
                      Width = 95
                      Height = 21
                      DataField = 'CEST'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 25
                    end
                    object DBEdit23: TDBEdit
                      Left = 221
                      Top = 524
                      Width = 65
                      Height = 21
                      Hint = 'Al'#237'quota m'#233'dia para os produtos e servi'#231'os importados'
                      DataField = 'FCP_ALIQ'
                      DataSource = dtmProdutos.dsNBM
                      TabOrder = 23
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Rela'#231#227'o entre NBM e Estado da Empresa'
                ImageIndex = 1
                OnExit = TabSheet4Exit
                OnShow = TabSheet4Show
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 479
                  Align = alClient
                  TabOrder = 0
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 241
                    Align = alTop
                    Caption = 'Cadastro de Rela'#231#227'o entre NBM e Estados'
                    TabOrder = 0
                    object Label10: TLabel
                      Left = 203
                      Top = 222
                      Width = 29
                      Height = 13
                      Caption = 'ICMS:'
                      FocusControl = DBEdit8
                    end
                    object Label11: TLabel
                      Left = 11
                      Top = 222
                      Width = 55
                      Height = 13
                      Caption = 'Perc Subst:'
                      FocusControl = DBEdit7
                    end
                    object Label12: TLabel
                      Left = 209
                      Top = 195
                      Width = 23
                      Height = 13
                      Caption = 'CST:'
                      FocusControl = DBEdit6
                    end
                    object Label13: TLabel
                      Left = 5
                      Top = 195
                      Width = 61
                      Height = 13
                      Caption = 'C'#243'digo NBM:'
                      FocusControl = DBEdit5
                    end
                    object Label14: TLabel
                      Left = 29
                      Top = 168
                      Width = 37
                      Height = 13
                      Caption = 'Estado:'
                    end
                    object Label41: TLabel
                      Left = 309
                      Top = 222
                      Width = 211
                      Height = 13
                      Caption = 'Percentual do Fundo de Combate a Pobreza'
                      FocusControl = DBEdit22
                    end
                    object DBGrid2: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 137
                      Hint = 
                        'Quaisquer altera'#231#245'es em algum c'#243'digo de barras somente ser'#225' efet' +
                        'ivamente confirmada ap'#243's confirma'#231#227'o nas modifica'#231'oes do produto' +
                        '.'
                      Align = alTop
                      DataSource = dtmProdutos.dsNbmUF
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
                          FieldName = 'COD_NBM'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_UF'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ALIQ'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'MVA'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CST'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PFCP'
                          Visible = True
                        end>
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 72
                      Top = 160
                      Width = 231
                      Height = 21
                      DataField = 'CODIGO_UF'
                      DataSource = dtmProdutos.dsNbmUF
                      DropDownRows = 10
                      KeyField = 'CODIGO_UF'
                      ListField = 'NOME_UF'
                      ListSource = dtmProdutos.dsNBMEstados
                      TabOrder = 1
                    end
                    object DBEdit5: TDBEdit
                      Left = 72
                      Top = 187
                      Width = 64
                      Height = 21
                      DataField = 'COD_NBM'
                      DataSource = dtmProdutos.dsNbmUF
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object DBEdit6: TDBEdit
                      Left = 238
                      Top = 187
                      Width = 65
                      Height = 21
                      DataField = 'CST'
                      DataSource = dtmProdutos.dsNbmUF
                      Enabled = False
                      TabOrder = 3
                    end
                    object DBEdit7: TDBEdit
                      Left = 72
                      Top = 214
                      Width = 64
                      Height = 21
                      DataField = 'MVA'
                      DataSource = dtmProdutos.dsNbmUF
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBEdit8: TDBEdit
                      Left = 239
                      Top = 214
                      Width = 64
                      Height = 21
                      DataField = 'ALIQ'
                      DataSource = dtmProdutos.dsNbmUF
                      Enabled = False
                      TabOrder = 5
                    end
                    object DBEdit22: TDBEdit
                      Left = 526
                      Top = 214
                      Width = 64
                      Height = 21
                      DataField = 'PFCP'
                      DataSource = dtmProdutos.dsNbmUF
                      TabOrder = 6
                    end
                  end
                  object GroupBox10: TGroupBox
                    Left = 0
                    Top = 241
                    Width = 771
                    Height = 38
                    Align = alTop
                    TabOrder = 1
                    object BitBtn7: TBitBtn
                      Left = 4
                      Top = 9
                      Width = 75
                      Height = 25
                      Hint = 'Incluir Registro - [PRO059]'
                      Caption = '&Incluir'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
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
                      Left = 82
                      Top = 9
                      Width = 75
                      Height = 25
                      Hint = 'Salvar Registro - [PRO060]'
                      Caption = '&Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      OnClick = BitBtn8Click
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
                    object BitBtn9: TBitBtn
                      Left = 163
                      Top = 9
                      Width = 75
                      Height = 25
                      Hint = 'Alterar Registro - [PRO061]'
                      Caption = '&Alterar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = BitBtn9Click
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
                    object BitBtn10: TBitBtn
                      Left = 243
                      Top = 9
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar Registro - [PRO062]'
                      Caption = '&Cancelar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnClick = BitBtn10Click
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
                    object BitBtn11: TBitBtn
                      Left = 323
                      Top = 9
                      Width = 75
                      Height = 25
                      Hint = 'Excluir Registro - [PRO063]'
                      Caption = '&Deletar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnClick = BitBtn11Click
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
                      Left = 424
                      Top = 9
                      Width = 75
                      Height = 25
                      Caption = 'Sair'
                      TabOrder = 5
                      OnClick = BitBtn12Click
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
                end
              end
            end
            inherited Panel3: TPanel
              Top = 510
              ExplicitTop = 510
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [PRO056]'
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
          ExplicitWidth = 783
          ExplicitHeight = 558
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO050]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO051]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Height = 485
            ExplicitHeight = 485
            inherited Splitter1: TSplitter
              Height = 424
              ExplicitHeight = 427
            end
            inherited DBGrid1: TDBGrid
              Height = 424
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO052]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO053]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Rela'#231#227'o entre NBM e Estado da Empresa - [PRO058]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000010000212121000018
                  290029292900393939005A39390042424200181852005252520073635200315A
                  5A005A5A5A0094735A000039630063636300736B63004A6B6B006B6B6B007B73
                  6B00735A73007373730073737B007B7B7B0094847B00A5847B00BD9C7B006384
                  84008C8C8C009C948C00AD948C0094949400A59C940084849C009C9C9C00B5AD
                  9C00CEBD9C00849CA500A5A5A5009494AD00ADADAD00D6BDAD00FFE7AD00B59C
                  B500E7CEB500BDBDBD00D6C6BD009CADC600ADC6C600C6C6C600EFD6C600C6C6
                  CE00CECECE00FFDECE00D6D6D600F7E7D600DEDEDE00EFE7DE00D6DEE700DEE7
                  E700E7E7E700EFE7E700F7EFE700DEE7EF00EFEFEF00F7F7F700FFF7F700FFFF
                  F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424242424242
                  4242424242424242424242424242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424224000A42424242
                  42424242424242424242424242424242240210101A4242424242424242424242
                  424242424242422002152B241A4242424242424242424242424242424242420A
                  0A2B2B1A42424242424242424242424242420D1A1A4242030A1D1A4242424242
                  42424242424242424202110B080300241A2042424242424242424242201F1F20
                  07223335271B0705201F1F1F241F1F2B42424242010101020E241B1B1B201B03
                  010101010101010142424242090A1E07222B1C17182C2A0D060109141A1E0A04
                  424242420919370A2A2C2C2C2C2C2A1613201D262F37191242424242091F4313
                  22283C3E412A2A152636434343432509424242421F09432B1B28333C352A211A
                  4343413F43430F1F4242424223094340241D2A302A211A3E3F3E3E3E40430929
                  42424242230C433F3E2F24202020243F3E3E3E3E3E430929424242422E06413E
                  3A3A3A3A3E24243E3A3A3A3A3E410629424242422E063F3A3636363A3A24243A
                  3A3636363A3F0629424242422E0C2D322F2F2F2F322020322F2F2F2F322F0C2B
                  42424242422E24242B2B2B2B2B20202B2B2B2B2B24242B424242424242424242
                  2B242424242020242424242B4242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424242}
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Definir MVA ou PIS/COFINS por Grupo de NCM - [PRO161]'
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
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 
                  'Atualizar al'#237'quotas de tributa'#231#227'o m'#233'dia dos produtos e servi'#231'os ' +
                  '-[PRO265]'
                Glyph.Data = {
                  66060000424D660600000000000036000000280000002C0000000C0000000100
                  1800000000003006000000000000000000000000000000000000A28A8AA6A6A6
                  9798986A6D6D828687B3B6B6636565818383AAACAC7F8181868888515B5E3E5E
                  623A5B6139575D3742463C535637484B394A503B59603C5D653C585D323A3935
                  393A353B3D37484B3A61683D717B38606738494B384B4F3B636A3B6A743B4F55
                  3A3E423A50543B555A3A40443540443959613C6D763A6970375156333D3D1C73
                  749595958385854D51516C7070A6A9A94548476A6D6D9C9E9E6567686F717231
                  576029A6BA2094AB208B9E14414B20899B1762701B60702395AC23A2B92592A4
                  0E181D12191B11282E186A7B20A2BC22ABC51DA1BA196D7D1A62722393A725AB
                  C51B869B1338411D707D1F8495143038144B581C9DB422ACC521ABC21C879C0E
                  363B1C73749494968384854D50516B6F70A6A8A94547476A6C6D9B9D9E656768
                  6F7271305B6524AFC81A90A91C98AE166B7B1BB6D31B97B11B8398209BB41CA6
                  BF1DADC71C57671746531658651E9FB8177C9213525F197F951CA1B7186A7A18
                  62721C8CA31BB2CD17515E1976891B8DA31338421F94AD199FB5135967156C7B
                  1CA9C3166E7D1C73749494968384854D50516B6F70A6A8A94547486A6C6E9B9D
                  9F6567676E73712F5B6424ACC619859B1C9DB61CA6C11BACC81CADC91CAAC41E
                  93A81C9DB51FB4D01D89A12099B11D8DA51BA1BA124A560F1A1C144D5B1BA4BB
                  1A83971A889D1E9EB817879B153E461978881B8DA214414D1EB0CC16798A0D1A
                  1E1032391694AC1F92A61C73749494968384854D50516B6F70A6A8A94547486A
                  6C6E9B9D9F6567676F72712E5B6422ABC417798E1798B31CC4E51771851793AB
                  18BEDB1A879A1B98AF1EA6C0146C7F21B4CE1F97B01CA9C3186F811238411871
                  851DABC51C99B21CAFC916748815484F13343B1C84971B97AE164F5C1FA6BF19
                  94AA14404D1657651CA8C21A7B8D1C73749494968384864D50516B6F70A6A8A9
                  4547486A6C6D9B9D9E6567686F7271305D6228ADC41A6F801A8B9F27BCD81238
                  451862731FB3CF1976891E94A824C0DE23B3CD20A3BA195E681A87971EB5D021
                  AECC20B3CF1B82961869791EAFC71DACC82E92A1257A8E26BFDE21C3E22CA5B8
                  19677B22B9D41EB3CF1FB6D321A5BF1C4E5A1C73749494968384864D50516B6F
                  70A6A8A94547486A6C6D9C9E9E6668686F7171313C3F2141491E333815303718
                  39421F282818292C10313A122B30203C4527515B164149192A332024271D292D
                  224B551B5A691B444D1722251A23262B50572D697713383E102E3415424A1341
                  4A1339411B282A19373F265F6C2D606C1F383D1722241C73749494968384854D
                  50516B6F70A6A8A94547486A6C6D9B9D9E6566676E71714B4C4D7E8282757979
                  4E51526364647D7E7C4E50501A1D1D3D3F407A7A7A8C8F8D6A6C6C535454777B
                  7A70747473747326282A4A4E4E5A5D5C626363888988888C893C3D3E181F1D48
                  4D4B464A4B3A3C407C7F8053555565696A898C8B7C7E7E36393B1C7374949496
                  8384854D50516C6F70A6A8A9444748696C6D9B9D9E6566676F7171606262C1C3
                  C49E9FA0949596B6B7B7B9BBBB60636327292A797B7D8F9192686B6BB6B8B9A5
                  A7A8A4A6A6848787B5B8B7676668959898ADADAE9E9FA07C7C7E8F9090969898
                  282D2D767A7A898B8C8E9091D3D4D49FA0A0A1A2A27B7C7CA3A4A47F81801C73
                  749494968383854D50516C6F70A6A8A9444748696C6D9B9D9E6567677071715F
                  6161B4B6B68486869C9E9DC0C2C2B0B1B1525656292D2D848788767979353737
                  B8B9B9B7B9B98789895A5C5BB0B2B2868788ABADADBABBBB9EA0A05052526567
                  67B5B9B82E32317D8180BCBFBE949796B9BBBBACADAD9C9E9E4B4D4D8F909097
                  9998DC73739494958384854D51516C7070A6A8A9444747696C6D9B9D9E646666
                  6F71715E6060C4C6C6AFB1B1818383A0A3A2BBBDBD686C6C202424626566A1A3
                  A4A2A4A4A8A9A98587878082825658589EA0A04648487F8181959898919493A4
                  A6A6B0B2B26E72712429287D807FAAAEAD4B4F4E9A9D9D888A8A989A9AA7A9A9
                  ADAFAF5F6161A08382A0A0A09091916063637B7E7DAFB1B1585B5A787B7BA5A7
                  A87577787E80805052525E5F5F595B5B4245454C504F5E5F5F494C4B2C303138
                  3C3D5A5D5D6E6F6F4C4E4E434545484A4A3D3E3E4F5151333636434646484C4C
                  494E4D696B6B636464383B3B2D3231474A494C50503136354D50504547474F51
                  51686A6A5B5D5D383A3A}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Atualizar Anexo XV - [PRO179]'
                Caption = 'XV'
                Font.Color = clBlue
                Font.Height = -12
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 179
                Visible = False
                ExplicitLeft = 179
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 424
              ExplicitHeight = 424
              inherited ScrollBox2: TScrollBox
                Height = 407
                ExplicitHeight = 407
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 558
        end
        object tsDefinirMVA: TTabSheet
          Caption = 'tsDefinirMVA'
          ImageIndex = 2
          object Panel4: TPanel
            Left = 1
            Top = 0
            Width = 786
            Height = 555
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = Panel4Enter
            object GroupBox4: TGroupBox
              Left = 16
              Top = 327
              Width = 759
              Height = 187
              Caption = 'Grupo Selecionado'
              TabOrder = 0
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 755
                Height = 170
                Align = alClient
                DataSource = dtmProdutos.dsNBM
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
                    FieldName = 'COD_NCM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_NCM'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'USAR_MVA_AJUSTADO'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'REFERENCIA'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'MVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MVA_INTER'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_INTRA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CST_PIS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CST_COFINS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CST_PIS_ENT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CST_COFINS_ENT'
                    Visible = True
                  end
                  item
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'NAT_REC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_PIS_DIFERENCIADA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_COFINS_DIFERENCIADA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_CRED_PIS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALIQ_CRED_COFINS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CEST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CENQ_IPI_NFE'
                    Visible = True
                  end>
              end
            end
            object GroupBox5: TGroupBox
              Left = 16
              Top = 11
              Width = 185
              Height = 67
              Caption = 'Consultar Grupo'
              TabOrder = 1
              object BitBtn16: TBitBtn
                Left = 93
                Top = 23
                Width = 75
                Height = 25
                Caption = 'Consultar'
                TabOrder = 1
                OnClick = BitBtn16Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                  73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                  8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                  9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                  A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                  AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                  BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                  D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                  E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                  F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                  424242424242424242422B39180B42424242424242424242424243443C180B42
                  4242424242424242424242444438180B42424242424242424242424244433918
                  0A424242424242424242424242444335004201101A114242424242424242453D
                  05072F343434291942424242424242221A2D34343437403E0442424242424206
                  231C303437404146284242424242421B210F30373A414140310D42424242421F
                  20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                  2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                  4227312D21252314424242424242424242420E141B1B42424242}
              end
              object Edit1: TEdit
                Left = 14
                Top = 27
                Width = 73
                Height = 21
                TabOrder = 0
                Text = '99999999'
              end
            end
            object BitBtn31: TBitBtn
              Left = 702
              Top = 520
              Width = 75
              Height = 25
              Caption = 'Sair'
              TabOrder = 2
              OnClick = BitBtn31Click
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
            object Panel6: TPanel
              Left = 16
              Top = 84
              Width = 185
              Height = 48
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 3
              object Label32: TLabel
                Left = 14
                Top = 6
                Width = 153
                Height = 33
                Alignment = taCenter
                AutoSize = False
                Caption = 'Informar no m'#237'nimo 4 d'#237'gitos para consulta'
                WordWrap = True
              end
            end
            object GroupBox6: TGroupBox
              Left = 16
              Top = 138
              Width = 185
              Height = 135
              Caption = 'ICMS / MVA'
              TabOrder = 4
              object Label18: TLabel
                Left = 57
                Top = 28
                Width = 21
                Height = 13
                Alignment = taRightJustify
                Caption = 'MVA'
              end
              object Label19: TLabel
                Left = 15
                Top = 55
                Width = 63
                Height = 13
                Caption = 'MVA Interest'
              end
              object Label15: TLabel
                Left = 14
                Top = 82
                Width = 64
                Height = 13
                Alignment = taRightJustify
                Caption = 'ICMS Interno'
              end
              object EditHw1: TEditHw
                Left = 84
                Top = 25
                Width = 59
                Height = 21
                TabOrder = 0
                Text = '     0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object BitBtn13: TBitBtn
                Left = 149
                Top = 21
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO162]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BitBtn13Click
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
              object EditHw4: TEditHw
                Left = 84
                Top = 52
                Width = 59
                Height = 21
                TabOrder = 2
                Text = '     0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object BitBtn15: TBitBtn
                Left = 149
                Top = 48
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO163]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = BitBtn15Click
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
              object EditHw3: TEditHw
                Left = 84
                Top = 79
                Width = 59
                Height = 21
                TabOrder = 4
                Text = '         0,00'
                Formato = fFixed
                FormatSize = '0.2'
              end
              object BitBtn14: TBitBtn
                Left = 149
                Top = 75
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO164]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = BitBtn14Click
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
            object GroupBox8: TGroupBox
              Left = 207
              Top = 11
              Width = 568
              Height = 262
              Caption = 'PIS / COFINS'
              TabOrder = 5
              object Label160: TLabel
                Left = 37
                Top = 20
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST PIS Venda'
              end
              object Label161: TLabel
                Left = 15
                Top = 47
                Width = 93
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST COFINS Venda'
              end
              object Label162: TLabel
                Left = 29
                Top = 74
                Width = 79
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST PIS Entrada'
              end
              object Label163: TLabel
                Left = 7
                Top = 101
                Width = 101
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST COFINS Entrada'
              end
              object Label164: TLabel
                Left = 53
                Top = 155
                Width = 326
                Height = 13
                Alignment = taRightJustify
                Caption = 
                  'Aliquota de PIS (Diferenciada ou por Quantidade de Produto) Vend' +
                  'a'
              end
              object Label165: TLabel
                Left = 31
                Top = 182
                Width = 348
                Height = 13
                Alignment = taRightJustify
                Caption = 
                  'Aliquota de COFINS (Diferenciada ou por Quantidade de Produto) V' +
                  'enda'
              end
              object Label27: TLabel
                Left = 10
                Top = 128
                Width = 98
                Height = 13
                Alignment = taRightJustify
                Caption = 'Natureza da Receita'
              end
              object Label30: TLabel
                Left = 121
                Top = 206
                Width = 258
                Height = 13
                Alignment = taRightJustify
                Caption = 'Aliquota de PIS Cr'#233'dito( Ex: Carnes Bovinas e Su'#237'nas)'
              end
              object Label31: TLabel
                Left = 99
                Top = 233
                Width = 280
                Height = 13
                Alignment = taRightJustify
                Caption = 'Aliquota de COFINS Cr'#233'dito( Ex: Carnes Bovinas e Su'#237'nas)'
              end
              object BitBtn17: TBitBtn
                Left = 525
                Top = 13
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO165]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnClick = BitBtn17Click
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
              object BitBtn18: TBitBtn
                Left = 525
                Top = 40
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO166]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                OnClick = BitBtn18Click
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
                Left = 525
                Top = 67
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO167]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                OnClick = BitBtn19Click
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
              object BitBtn20: TBitBtn
                Left = 525
                Top = 94
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO168]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 12
                OnClick = BitBtn20Click
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
              object BitBtn21: TBitBtn
                Left = 525
                Top = 148
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO169]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 13
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
              object BitBtn22: TBitBtn
                Left = 525
                Top = 175
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO170]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                OnClick = BitBtn22Click
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
              object ComboBox4: TComboBox
                Left = 114
                Top = 17
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 0
                OnExit = ComboBox4Exit
                Items.Strings = (
                  '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                  '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                  
                    '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                    'roduto'
                  '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                  '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                  '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                  '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                  '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                  '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                  '49 - Outras Opera'#231#245'es de Sa'#237'da'
                  '99 - Outras Opera'#231#245'es')
              end
              object ComboBox5: TComboBox
                Left = 114
                Top = 44
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                OnExit = ComboBox5Exit
                Items.Strings = (
                  '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                  '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                  
                    '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                    'roduto'
                  '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                  '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                  '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                  '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                  '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                  '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                  '49 - Outras Opera'#231#245'es de Sa'#237'da'
                  '99 - Outras Opera'#231#245'es')
              end
              object ComboBox6: TComboBox
                Left = 114
                Top = 71
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 2
                OnExit = ComboBox6Exit
                Items.Strings = (
                  
                    '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita Tributada no Mercado Interno'
                  
                    '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita N'#227'o Tributada no Mercado Interno'
                  
                    '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita de Exporta'#231#227'o'
                  
                    '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                    'ributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                  
                    '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita Tributada no Mercado Interno'
                  
                    '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                  
                    '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita de Exporta'#231#227'o'
                  
                    '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                    #231#227'o'
                  '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                  '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                  '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                  '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                  '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                  '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                  '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                  '98 - Outras Opera'#231#245'es de Entrada'
                  '99 - Outras Opera'#231#245'es')
              end
              object ComboBox7: TComboBox
                Left = 114
                Top = 98
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                OnExit = ComboBox7Exit
                Items.Strings = (
                  
                    '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita Tributada no Mercado Interno'
                  
                    '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita N'#227'o Tributada no Mercado Interno'
                  
                    '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita de Exporta'#231#227'o'
                  
                    '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                    'ributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                  
                    '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita Tributada no Mercado Interno'
                  
                    '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                  
                    '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita de Exporta'#231#227'o'
                  
                    '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                    #231#227'o'
                  '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                  '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                  '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                  '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                  '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                  '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                  '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                  '98 - Outras Opera'#231#245'es de Entrada'
                  '99 - Outras Opera'#231#245'es')
              end
              object EditHw5: TEditHw
                Left = 385
                Top = 152
                Width = 134
                Height = 21
                Hint = 'Informar um valor negativo -1 para remover a aliquota'
                TabOrder = 5
                Text = '                              0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object EditHw6: TEditHw
                Left = 385
                Top = 179
                Width = 134
                Height = 21
                Hint = 'Informar um valor negativo -1 para remover a aliquota'
                TabOrder = 6
                Text = '                              0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object BitBtn24: TBitBtn
                Left = 525
                Top = 121
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO196]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 15
                OnClick = BitBtn24Click
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
              object ComboBox8: TComboBox
                Left = 114
                Top = 125
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Items.Strings = (
                  
                    '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita Tributada no Mercado Interno'
                  
                    '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita N'#227'o Tributada no Mercado Interno'
                  
                    '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                    ' Receita de Exporta'#231#227'o'
                  
                    '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                    'ributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                    'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                  
                    '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita Tributada no Mercado Interno'
                  
                    '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                  
                    '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                    'vamente a Receita de Exporta'#231#227'o'
                  
                    '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                  
                    '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                  
                    '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                    'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                    #231#227'o'
                  '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                  '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                  '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                  '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                  '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                  '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                  '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                  '98 - Outras Opera'#231#245'es de Entrada'
                  '99 - Outras Opera'#231#245'es')
              end
              object BitBtn25: TBitBtn
                Left = 525
                Top = 202
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO220]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 16
                OnClick = BitBtn25Click
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
              object BitBtn26: TBitBtn
                Left = 525
                Top = 229
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO221]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 17
                OnClick = BitBtn26Click
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
              object EditHw7: TEditHw
                Left = 385
                Top = 206
                Width = 134
                Height = 21
                Hint = 'Informar um valor negativo -1 para remover a aliquota'
                TabOrder = 7
                Text = '                              0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object EditHw8: TEditHw
                Left = 385
                Top = 233
                Width = 134
                Height = 21
                Hint = 'Informar um valor negativo -1 para remover a aliquota'
                TabOrder = 8
                Text = '                              0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
            end
            object BitBtn23: TBitBtn
              Left = 353
              Top = 520
              Width = 343
              Height = 25
              Hint = 
                'Altera nos produtos as defini'#231#245'es de PIS/COFINS pelo NCM - [PRO1' +
                '71]'
              Caption = 'Aplicar dados de PIS/COFINS nos Produtos de acordo o NCM'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = BitBtn23Click
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
            object BitBtn27: TBitBtn
              Left = 18
              Top = 520
              Width = 329
              Height = 25
              Hint = 'Altera nos produtos o MVA e Aliquota de ICMS - [PRO219]'
              Caption = 'Aplicar  ICMS Interno nos Produtos de acordo o NCM'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BitBtn27Click
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
            object GroupBox9: TGroupBox
              Left = 207
              Top = 279
              Width = 568
              Height = 42
              Caption = 'C'#243'digo de Enquadramento Legal do IPI'
              TabOrder = 8
              object BitBtn28: TBitBtn
                Left = 525
                Top = 11
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO165]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BitBtn28Click
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
              object ComboBox10: TComboBox
                Left = 114
                Top = 15
                Width = 405
                Height = 21
                ItemHeight = 13
                TabOrder = 1
              end
            end
            object GroupBox11: TGroupBox
              Left = 16
              Top = 279
              Width = 185
              Height = 42
              Caption = 'CEST'
              TabOrder = 9
              object MaskEdit4: TMaskEdit
                Left = 84
                Top = 15
                Width = 58
                Height = 21
                EditMask = '99.999.99;0;_'
                MaxLength = 9
                TabOrder = 0
              end
              object BitBtn29: TBitBtn
                Left = 149
                Top = 11
                Width = 28
                Height = 25
                Hint = 'Aplicar aos NCM'#39's Consultados Abaixo - [PRO162]'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BitBtn29Click
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
        end
        object tsDadosFiscais: TTabSheet
          Caption = 'tsDadosFiscais'
          ImageIndex = 4
          object pnDadosFiscais: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 449
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 6
              Top = 162
              Width = 767
              Height = 3
              Cursor = crVSplit
              Align = alBottom
              ExplicitTop = 167
              ExplicitWidth = 100
            end
            object Panel7: TPanel
              Left = 6
              Top = 6
              Width = 767
              Height = 156
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GroupBox13: TGroupBox
                Left = 177
                Top = 0
                Width = 590
                Height = 156
                Align = alClient
                Caption = 'Sele'#231#227'o de NCM'#39's'
                TabOrder = 0
                object DBGrid4: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 586
                  Height = 139
                  Align = alClient
                  DataSource = dtmProdutos.dsNBM
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnCellClick = DBGrid4CellClick
                  OnDrawColumnCell = DBGrid4DrawColumnCell
                  OnDblClick = DBGrid4DblClick
                  OnKeyDown = DBGrid4KeyDown
                  OnMouseUp = DBGrid4MouseUp
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SEL'
                      Title.Caption = '...'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_NCM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MVA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MVA_INTER'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQ_INTRA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CST_PIS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CST_COFINS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CST_PIS_ENT'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CST_COFINS_ENT'
                      Visible = True
                    end
                    item
                      Alignment = taRightJustify
                      Expanded = False
                      FieldName = 'NAT_REC'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQ_PIS_DIFERENCIADA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQ_COFINS_DIFERENCIADA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQ_CRED_PIS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'ALIQ_CRED_COFINS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CEST'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CENQ_IPI_NFE'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FCP_ALIQ'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME_NCM'
                      Width = 250
                      Visible = True
                    end>
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 177
                Height = 156
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object Panel5: TPanel
                  Left = 0
                  Top = 108
                  Width = 177
                  Height = 48
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label42: TLabel
                    Left = 14
                    Top = 6
                    Width = 153
                    Height = 33
                    Alignment = taCenter
                    AutoSize = False
                    Caption = 'Informar no m'#237'nimo 4 d'#237'gitos para consulta'
                    WordWrap = True
                  end
                end
                object GroupBox12: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 177
                  Height = 108
                  Align = alClient
                  Caption = 'Consultar Grupo'
                  TabOrder = 1
                  object btSelectAll: TSpeedButton
                    Left = 148
                    Top = 54
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
                  object btUnSelectAll: TSpeedButton
                    Left = 119
                    Top = 54
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
                  object SpeedButton9: TSpeedButton
                    Left = 148
                    Top = 78
                    Width = 23
                    Height = 22
                    Hint = 'Copiar'
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000220B0000220B000000010000000100008C5A5A009C6B
                      63009C6B6B00EFB56B00A57B7300B5847300C68C7B00BD848400B58C8C00FFD6
                      A500BDADAD00F7DEBD00D6C6C600F7DEC600FFDEC600FFE7C600EFDECE00F7DE
                      CE00F7E7CE00FFE7CE00EFE7D600F7E7D600FFE7D600FFEFD600EFDEDE00EFE7
                      DE00F7E7DE00F7EFDE00FFEFDE00FFF7DE00FFF7E700FFF7EF00FFFFEF00FFFF
                      F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00222222222208
                      000000000000000000222222222222081E1B1B1B1B1B1B120022222222222208
                      1B110D0D0D0D101000222222222222081E090909090909100022220800000008
                      1F0D0D0D0D0B1210012222081E1B1B081F120D0D0D0D1510022222081B110D08
                      2109090909090914042222081E0909082116161512161E18042222081F0D0D08
                      2323232121180C0A052222081F120D0823232321210808080822220821090908
                      2323232323080306222222082116160808080808080807222222220823232321
                      21180C0A05222222222222082323232121080808082222222222220823232323
                      2308030622222222222222080808080808080722222222222222}
                    OnClick = SpeedButton9Click
                  end
                  object BitBtn30: TBitBtn
                    Left = 93
                    Top = 23
                    Width = 75
                    Height = 25
                    Caption = 'Consultar'
                    TabOrder = 1
                    OnClick = BitBtn30Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                      73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                      8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                      9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                      A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                      AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                      BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                      D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                      E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                      F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                      424242424242424242422B39180B42424242424242424242424243443C180B42
                      4242424242424242424242444438180B42424242424242424242424244433918
                      0A424242424242424242424242444335004201101A114242424242424242453D
                      05072F343434291942424242424242221A2D34343437403E0442424242424206
                      231C303437404146284242424242421B210F30373A414140310D42424242421F
                      20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                      2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                      4227312D21252314424242424242424242420E141B1B42424242}
                  end
                  object Edit2: TEdit
                    Left = 14
                    Top = 27
                    Width = 73
                    Height = 21
                    TabOrder = 0
                    Text = '99999999'
                  end
                end
              end
            end
            object Panel8: TPanel
              Left = 6
              Top = 398
              Width = 767
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object check_ncm: TCheckBox
                Left = 24
                Top = 12
                Width = 113
                Height = 17
                Caption = 'Aplicar nos NCM'#39's'
                TabOrder = 0
              end
              object check_mercadorias: TCheckBox
                Left = 143
                Top = 12
                Width = 146
                Height = 17
                Caption = 'Aplicar nas Mercadorias'
                TabOrder = 1
              end
              object BitBtn32: TBitBtn
                Left = 324
                Top = 6
                Width = 115
                Height = 25
                Caption = 'Aplicar dados'
                TabOrder = 2
                OnClick = BitBtn32Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
              object BitBtn33: TBitBtn
                Left = 677
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
                ModalResult = 2
                TabOrder = 3
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
            object Panel9: TPanel
              Left = 6
              Top = 165
              Width = 767
              Height = 233
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object check_mva: TCheckBox
                Left = 49
                Top = 8
                Width = 40
                Height = 17
                Alignment = taLeftJustify
                Caption = 'MVA'
                TabOrder = 0
              end
              object check_mva_inter: TCheckBox
                Left = 23
                Top = 35
                Width = 66
                Height = 17
                Alignment = taLeftJustify
                Caption = 'MVA Inter'
                TabOrder = 2
              end
              object check_aliq_intra: TCheckBox
                Left = 6
                Top = 62
                Width = 83
                Height = 17
                Alignment = taLeftJustify
                Caption = 'ICMS Interno'
                TabOrder = 4
              end
              object check_fcp_aliq: TCheckBox
                Left = 14
                Top = 89
                Width = 75
                Height = 17
                Alignment = taLeftJustify
                Caption = 'FCP Interno'
                TabOrder = 6
              end
              object edmva: TEditHw
                Left = 95
                Top = 6
                Width = 59
                Height = 21
                TabOrder = 1
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edmva_inter: TEditHw
                Left = 96
                Top = 33
                Width = 59
                Height = 21
                TabOrder = 3
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edaliq_intra: TEditHw
                Left = 96
                Top = 60
                Width = 59
                Height = 21
                TabOrder = 5
                Text = '0,00'
                Formato = fFixed
                FormatSize = '0.2'
              end
              object edfcp_aliq: TEditHw
                Left = 96
                Top = 87
                Width = 59
                Height = 21
                TabOrder = 7
                Text = '0,00'
                Formato = fFixed
                FormatSize = '0.2'
              end
              object check_cest: TCheckBox
                Left = 45
                Top = 111
                Width = 44
                Height = 17
                Alignment = taLeftJustify
                Caption = 'CEST'
                TabOrder = 8
              end
              object edcest: TMaskEdit
                Left = 95
                Top = 112
                Width = 60
                Height = 21
                EditMask = '99.999.99;0;_'
                MaxLength = 9
                TabOrder = 9
              end
              object check_cst_piscofins: TCheckBox
                Left = 540
                Top = 8
                Width = 131
                Height = 17
                Alignment = taLeftJustify
                Caption = 'CST PIS/COFINS Saida'
                TabOrder = 10
              end
              object check_cst_piscofins_ent: TCheckBox
                Left = 530
                Top = 35
                Width = 141
                Height = 17
                Alignment = taLeftJustify
                Caption = 'PIS/COFINS CST Entrada'
                TabOrder = 12
              end
              object check_nat_rec: TCheckBox
                Left = 553
                Top = 62
                Width = 118
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Naturaza da Receita'
                TabOrder = 14
              end
              object check_aliq_pis_diferenciada: TCheckBox
                Left = 325
                Top = 89
                Width = 346
                Height = 17
                Alignment = taLeftJustify
                Caption = 
                  'Aliquota de PIS (Diferenciada ou por Quantidade de Produto) Vend' +
                  'a'
                TabOrder = 16
              end
              object check_aliq_cofins_diferenciad: TCheckBox
                Left = 303
                Top = 116
                Width = 368
                Height = 17
                Alignment = taLeftJustify
                Caption = 
                  'Aliquota de COFINS (Diferenciada ou por Quantidade de Produto) V' +
                  'enda'
                TabOrder = 18
              end
              object check_aliq_cred_pis: TCheckBox
                Left = 395
                Top = 143
                Width = 276
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Aliquota de PIS Cr'#233'dito( Ex: Carnes Bovinas e Su'#237'nas)'
                TabOrder = 20
              end
              object check_aliq_cred_cofins: TCheckBox
                Left = 373
                Top = 170
                Width = 298
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Aliquota de COFINS Cr'#233'dito( Ex: Carnes Bovinas e Su'#237'nas)'
                TabOrder = 22
              end
              object check_cenq_ipi_nfe: TCheckBox
                Left = 465
                Top = 197
                Width = 206
                Height = 17
                Alignment = taLeftJustify
                Caption = 'C'#243'digo de Enquadramento Legal do IPI'
                TabOrder = 24
              end
              object edaliq_pis_diferenciada: TEditHw
                Left = 677
                Top = 87
                Width = 75
                Height = 21
                TabOrder = 17
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edaliq_cofins_diferenciada: TEditHw
                Left = 677
                Top = 114
                Width = 75
                Height = 21
                TabOrder = 19
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edaliq_cred_pis: TEditHw
                Left = 677
                Top = 141
                Width = 75
                Height = 21
                TabOrder = 21
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edaliq_cred_cofins: TEditHw
                Left = 677
                Top = 168
                Width = 75
                Height = 21
                TabOrder = 23
                Text = '0,0000'
                Formato = fFixed
                FormatSize = '0.4'
              end
              object edcst_piscofins: TMaskEdit
                Left = 677
                Top = 6
                Width = 71
                Height = 21
                BiDiMode = bdLeftToRight
                EditMask = '99;0;_'
                MaxLength = 2
                ParentBiDiMode = False
                TabOrder = 11
              end
              object edcst_piscofins_ent: TMaskEdit
                Left = 677
                Top = 33
                Width = 71
                Height = 21
                EditMask = '99;0;_'
                MaxLength = 2
                TabOrder = 13
              end
              object ednat_rec: TMaskEdit
                Left = 677
                Top = 60
                Width = 69
                Height = 21
                EditMask = '999;0;_'
                MaxLength = 3
                TabOrder = 15
              end
              object edcenq_ipi_nfe: TMaskEdit
                Left = 677
                Top = 195
                Width = 73
                Height = 21
                BiDiMode = bdLeftToRight
                EditMask = '999;0;_'
                MaxLength = 3
                ParentBiDiMode = False
                TabOrder = 25
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 773
      Top = 439
      Width = 71
      Height = 94
      ExplicitLeft = 773
      ExplicitTop = 439
      ExplicitWidth = 71
      ExplicitHeight = 94
      inherited bMarketingHW: TBitBtn
        Top = 72
        Width = 69
        ExplicitTop = 72
        ExplicitWidth = 69
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 593
    ExplicitTop = 593
  end
  inherited pnStatusProcessamento: TPanel
    Left = 798
    Top = 310
    ExplicitLeft = 798
    ExplicitTop = 310
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 652
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 758
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 718
    Top = 3
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 686
    Top = 3
  end
end
