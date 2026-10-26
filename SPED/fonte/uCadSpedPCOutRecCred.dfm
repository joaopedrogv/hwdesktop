inherited frmCadSpedPCOutRecCred: TfrmCadSpedPCOutRecCred
  Caption = 'Outras Receitas Auferidas ou Cr'#233'ditos do SPED PIS/COFINS'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 758
                    Height = 819
                    Align = alTop
                    Caption = 'Cadastro de Outras Receitas Auferidas ou Cr'#233'ditos do PIS/COFINS'
                    TabOrder = 0
                    OnEnter = GroupBox4Enter
                    object Label6: TLabel
                      Left = 69
                      Top = 32
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 29
                      Top = 253
                      Width = 73
                      Height = 13
                      Caption = 'Data Opera'#231#227'o'
                      FocusControl = DBEdit5
                    end
                    object Label8: TLabel
                      Left = 548
                      Top = 253
                      Width = 84
                      Height = 13
                      Caption = 'Data Lan'#231'amento'
                      FocusControl = DBEdit6
                    end
                    object Label9: TLabel
                      Left = 262
                      Top = 253
                      Width = 89
                      Height = 13
                      Caption = 'Valor da Opera'#231#227'o'
                      FocusControl = DBEdit7
                    end
                    object Bevel1: TBevel
                      Left = 592
                      Top = 250
                      Width = 164
                      Height = 21
                      Shape = bsRightLine
                    end
                    object Bevel2: TBevel
                      Left = 10
                      Top = 250
                      Width = 204
                      Height = 21
                      Shape = bsLeftLine
                    end
                    object DBEdit1: TDBEdit
                      Left = 108
                      Top = 29
                      Width = 134
                      Height = 21
                      DataField = 'COD_REC_CRED'
                      DataSource = dtmSPED.dsOutRecCred
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBRadioGroup1: TDBRadioGroup
                      Left = 10
                      Top = 56
                      Width = 746
                      Height = 78
                      Caption = 'Indicador Tipo Opera'#231#227'o - Opera'#231#227'o Representativa de:'
                      DataField = 'IND_OPER'
                      DataSource = dtmSPED.dsOutRecCred
                      Items.Strings = (
                        
                          '0 '#8211' Aquisi'#231#227'o, Custos, Despesa ou Encargos, Sujeita '#224' Incid'#234'ncia' +
                          ' de Cr'#233'dito de PIS/Pasep ou Cofins (CST 50 a 66).'
                        
                          '1 '#8211' Receita Auferida Sujeita ao Pagamento da Contribui'#231#227'o para o' +
                          ' PIS/Pasep e da Cofins (CST 01, 02, 03 ou 05).'
                        
                          '2 - Receita Auferida N'#227'o Sujeita ao Pagamento da Contribui'#231#227'o pa' +
                          'ra o PIS/Pasep e da Cofins (CST 04, 06, 07, 08, 09, 49 ou 99).')
                      ParentBackground = True
                      TabOrder = 1
                      Values.Strings = (
                        '0'
                        '1'
                        '2')
                      OnExit = DBRadioGroup1Exit
                    end
                    object GroupBox5: TGroupBox
                      Left = 11
                      Top = 140
                      Width = 746
                      Height = 49
                      Caption = 'Participante - Preenchimento facultativo'
                      TabOrder = 2
                      object DBEdit2: TDBEdit
                        Left = 10
                        Top = 18
                        Width = 82
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 0
                        OnExit = DBEdit2Exit
                        OnKeyDown = DBEdit2KeyDown
                      end
                      object edNomeParticipante: TEdit
                        Left = 98
                        Top = 18
                        Width = 631
                        Height = 21
                        ReadOnly = True
                        TabOrder = 1
                        Text = 'edNomeParticipante'
                      end
                    end
                    object GroupBox6: TGroupBox
                      Left = 10
                      Top = 195
                      Width = 746
                      Height = 49
                      Caption = 'Item - C'#243'digo/Descri'#231#227'o- Preenchimento facultativo'
                      TabOrder = 3
                      object SpeedButton14: TSpeedButton
                        Left = 652
                        Top = 18
                        Width = 22
                        Height = 21
                        Hint = 'Pesquisar Item do Cadastro de Produtos'
                        Caption = 'P'
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButton14Click
                      end
                      object SpeedButton15: TSpeedButton
                        Left = 680
                        Top = 18
                        Width = 22
                        Height = 21
                        Hint = 'Pesquisar Item no Cadastro de Tipos de Servi'#231'os'
                        Caption = 'S'
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButton15Click
                      end
                      object SpeedButton17: TSpeedButton
                        Left = 708
                        Top = 18
                        Width = 22
                        Height = 21
                        Hint = 'Informar Item Avulso'
                        Caption = 'A'
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButton17Click
                      end
                      object SpeedButton16: TSpeedButton
                        Left = 624
                        Top = 18
                        Width = 22
                        Height = 21
                        Hint = 'Remover c'#243'digo e descri'#231#227'o'
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                          8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                          0404040404040404040404040404040404040404040404040404040404040404
                          0404040404040404040404010000000000000104040404040404040002020202
                          0202000004040404040404000202020202020001000404040404040100020202
                          0202000101000404040404040003030303030300010100040404040404000303
                          0303030300010100040404040404000303030303030001010004040404040400
                          0303030303030001000404040404040400030303030303000004040404040404
                          0400030303030303000404040404040404040100000000010104040404040404
                          0404040404040404040404040404040404040404040404040404}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = SpeedButton16Click
                      end
                      object DBEdit3: TDBEdit
                        Left = 10
                        Top = 18
                        Width = 82
                        Height = 21
                        DataField = 'COD_ITEM'
                        DataSource = dtmSPED.dsOutRecCred
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit4: TDBEdit
                        Left = 98
                        Top = 18
                        Width = 520
                        Height = 21
                        DataField = 'DESCR_ITEM'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 1
                      end
                    end
                    object DBEdit5: TDBEdit
                      Left = 108
                      Top = 250
                      Width = 102
                      Height = 21
                      DataField = 'DT_OPER'
                      DataSource = dtmSPED.dsOutRecCred
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 638
                      Top = 250
                      Width = 102
                      Height = 21
                      DataField = 'DATA_LANC'
                      DataSource = dtmSPED.dsOutRecCred
                      Enabled = False
                      TabOrder = 6
                    end
                    object DBEdit7: TDBEdit
                      Left = 357
                      Top = 250
                      Width = 102
                      Height = 21
                      DataField = 'VL_OPER'
                      DataSource = dtmSPED.dsOutRecCred
                      TabOrder = 5
                      OnExit = DBEdit8Exit
                    end
                    object GroupBox7: TGroupBox
                      Left = 10
                      Top = 275
                      Width = 746
                      Height = 70
                      Caption = 'PIS'
                      TabOrder = 7
                      object Label10: TLabel
                        Left = 73
                        Top = 17
                        Width = 19
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'CST'
                        ParentBiDiMode = False
                      end
                      object Label11: TLabel
                        Left = 17
                        Top = 44
                        Width = 75
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Base de C'#225'lculo'
                        FocusControl = DBEdit8
                        ParentBiDiMode = False
                      end
                      object Label12: TLabel
                        Left = 302
                        Top = 44
                        Width = 39
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Al'#237'quota'
                        FocusControl = DBEdit9
                        ParentBiDiMode = False
                      end
                      object Label13: TLabel
                        Left = 598
                        Top = 44
                        Width = 24
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Valor'
                        FocusControl = DBEdit10
                        ParentBiDiMode = False
                      end
                      object DBComboBox1: TDBComboBox
                        Left = 98
                        Top = 14
                        Width = 632
                        Height = 21
                        DataField = 'CST_PIS'
                        DataSource = dtmSPED.dsOutRecCred
                        ItemHeight = 0
                        TabOrder = 0
                        OnExit = DBComboBox1Exit
                      end
                      object DBEdit8: TDBEdit
                        Left = 98
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_BC_PIS'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 1
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit9: TDBEdit
                        Left = 347
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'ALIQ_PIS'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 2
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit10: TDBEdit
                        Left = 628
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_PIS'
                        DataSource = dtmSPED.dsOutRecCred
                        ReadOnly = True
                        TabOrder = 3
                      end
                    end
                    object GroupBox8: TGroupBox
                      Left = 10
                      Top = 347
                      Width = 746
                      Height = 70
                      Caption = 'COFINS'
                      TabOrder = 8
                      object Label14: TLabel
                        Left = 73
                        Top = 17
                        Width = 19
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'CST'
                        ParentBiDiMode = False
                      end
                      object Label15: TLabel
                        Left = 17
                        Top = 44
                        Width = 75
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Base de C'#225'lculo'
                        FocusControl = DBEdit11
                        ParentBiDiMode = False
                      end
                      object Label16: TLabel
                        Left = 302
                        Top = 44
                        Width = 39
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Al'#237'quota'
                        FocusControl = DBEdit12
                        ParentBiDiMode = False
                      end
                      object Label17: TLabel
                        Left = 598
                        Top = 44
                        Width = 24
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'Valor'
                        FocusControl = DBEdit13
                        ParentBiDiMode = False
                      end
                      object DBComboBox2: TDBComboBox
                        Left = 98
                        Top = 14
                        Width = 632
                        Height = 21
                        DataField = 'CST_COFINS'
                        DataSource = dtmSPED.dsOutRecCred
                        ItemHeight = 0
                        TabOrder = 0
                        OnExit = DBComboBox2Exit
                      end
                      object DBEdit11: TDBEdit
                        Left = 98
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_BC_COFINS'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 1
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit12: TDBEdit
                        Left = 347
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'ALIQ_COFINS'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 2
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit13: TDBEdit
                        Left = 628
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_COFINS'
                        DataSource = dtmSPED.dsOutRecCred
                        ReadOnly = True
                        TabOrder = 3
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 10
                      Top = 420
                      Width = 746
                      Height = 49
                      Caption = 'Natureza da Base de C'#225'lculo de Cr'#233'dito - SPED PIS/COFINS'
                      TabOrder = 9
                      object DBComboBox3: TDBComboBox
                        Left = 10
                        Top = 18
                        Width = 720
                        Height = 21
                        DataField = 'NAT_BC_CRED'
                        DataSource = dtmSPED.dsOutRecCred
                        ItemHeight = 0
                        Items.Strings = (
                          ''
                          '01 - Aquisi'#231#227'o de bens para revenda'
                          '02 - Aquisi'#231#227'o de bens utilizados como insumo'
                          '03 - Aquisi'#231#227'o de servi'#231'os utilizados como insumo'
                          '04 - Energia el'#233'trica e t'#233'rmica, inclusive sob a forma de vapor'
                          '05 - Alugu'#233'is de pr'#233'dios'
                          '06 - Alugu'#233'is de m'#225'quinas e equipamentos'
                          '07 - Armazenagem de mercadoria e frete na opera'#231#227'o de venda'
                          '08 - Contrapresta'#231#245'es de arrendamento mercantil'
                          
                            '09 - M'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                            'imobilizado (cr'#233'dito sobre encargos de deprecia'#231#227'o).'
                          
                            '10 - M'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                            'imobilizado (cr'#233'dito com base no valor de aquisi'#231#227'o).'
                          
                            '11 - Amortiza'#231#227'o e Deprecia'#231#227'o de edifica'#231#245'es e benfeitorias em ' +
                            'im'#243'veis'
                          '12 - Devolu'#231#227'o de Vendas Sujeitas '#224' Incid'#234'ncia N'#227'o-Cumulativa'
                          '13 - Outras Opera'#231#245'es com Direito a Cr'#233'dito'
                          '14 - Atividade de Transporte de Cargas - Subcontrata'#231#227'o'
                          
                            '15 - Atividade Imobili'#225'ria - Custo Incorrido de Unidade Imobili'#225 +
                            'ria'
                          
                            '16 - Atividade Imobili'#225'ria - Custo Or'#231'ado de unidade n'#227'o conclu'#237 +
                            'da'
                          
                            '17 - Atividade de Presta'#231#227'o de Servi'#231'os de Limpeza, Conserva'#231#227'o ' +
                            'e Manuten'#231#227'o - vale-transporte, vale-refei'#231#227'o ou vale-alimenta'#231#227 +
                            'o, fardamento ou uniforme.'
                          '18 - Estoque de abertura de bens')
                        TabOrder = 0
                        OnExit = DBComboBox3Exit
                      end
                    end
                    object GroupBox10: TGroupBox
                      Left = 10
                      Top = 521
                      Width = 746
                      Height = 49
                      Caption = 'C'#243'digo da conta anal'#237'tica cont'#225'bil debitada/creditada'
                      TabOrder = 11
                      object DBEdit14: TDBEdit
                        Left = 10
                        Top = 18
                        Width = 82
                        Height = 21
                        DataField = 'COD_CTA'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 0
                        OnExit = DBEdit14Exit
                        OnKeyDown = DBEdit14KeyDown
                      end
                      object edNomeConta: TEdit
                        Left = 98
                        Top = 18
                        Width = 632
                        Height = 21
                        ReadOnly = True
                        TabOrder = 1
                        Text = 'edNomeConta'
                      end
                    end
                    object GroupBox11: TGroupBox
                      Left = 10
                      Top = 576
                      Width = 746
                      Height = 49
                      Caption = 'C'#243'digo do Centro de Custos'
                      TabOrder = 12
                      object DBEdit16: TDBEdit
                        Left = 10
                        Top = 18
                        Width = 82
                        Height = 21
                        DataField = 'COD_CCUS'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 0
                        OnExit = DBEdit16Exit
                        OnKeyDown = DBEdit16KeyDown
                      end
                      object edNomeCusto: TEdit
                        Left = 98
                        Top = 18
                        Width = 632
                        Height = 21
                        ReadOnly = True
                        TabOrder = 1
                        Text = 'edNomeCusto'
                      end
                    end
                    object GroupBox12: TGroupBox
                      Left = 10
                      Top = 628
                      Width = 746
                      Height = 67
                      Caption = 'Descri'#231#227'o do Documento/Opera'#231#227'o'
                      TabOrder = 13
                      object DBMemo1: TDBMemo
                        Left = 10
                        Top = 18
                        Width = 720
                        Height = 41
                        DataField = 'DESC_DOC_OPER'
                        DataSource = dtmSPED.dsOutRecCred
                        TabOrder = 0
                        OnKeyPress = DBMemo1KeyPress
                      end
                    end
                    object GroupBox13: TGroupBox
                      Left = 10
                      Top = 698
                      Width = 746
                      Height = 110
                      Caption = 'Processos Referenciados'
                      TabOrder = 14
                      object Panel5: TPanel
                        Left = 1
                        Top = 15
                        Width = 742
                        Height = 93
                        BevelOuter = bvNone
                        TabOrder = 1
                        object Label18: TLabel
                          Left = 8
                          Top = 11
                          Width = 83
                          Height = 13
                          BiDiMode = bdRightToLeft
                          Caption = 'N'#250'mero Processo'
                          ParentBiDiMode = False
                        end
                        object Label19: TLabel
                          Left = 46
                          Top = 38
                          Width = 45
                          Height = 13
                          BiDiMode = bdRightToLeft
                          Caption = 'Indicador'
                          ParentBiDiMode = False
                        end
                        object Edit1: TEdit
                          Left = 97
                          Top = 8
                          Width = 102
                          Height = 21
                          TabOrder = 0
                          Text = 'Edit1'
                        end
                        object ComboBox4: TComboBox
                          Left = 97
                          Top = 35
                          Width = 632
                          Height = 21
                          ItemHeight = 0
                          ItemIndex = 0
                          TabOrder = 1
                          Text = '1 - Justi'#231'a Federal;'
                          OnExit = ComboBox4Exit
                          Items.Strings = (
                            '1 - Justi'#231'a Federal;'
                            '3 '#8211' Secretaria da Receita Federal do Brasil'
                            '9 '#8211' Outros.')
                        end
                        object BitBtn7: TBitBtn
                          Left = 297
                          Top = 62
                          Width = 75
                          Height = 25
                          Caption = 'Salvar'
                          TabOrder = 2
                          OnClick = BitBtn7Click
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
                        object BitBtn8: TBitBtn
                          Left = 378
                          Top = 62
                          Width = 75
                          Height = 25
                          Caption = 'Cancela'
                          TabOrder = 3
                          OnClick = BitBtn8Click
                          Glyph.Data = {
                            E6010000424DE60100000000000036000000280000000C0000000C0000000100
                            180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                            9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                            ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
                            A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
                            0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                            B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
                            01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                            0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
                            ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
                            39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
                            4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
                            DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
                            A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
                            5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FF7D7DE9A4A4EDFFFFFF}
                        end
                      end
                      object Panel4: TPanel
                        Left = -120
                        Top = 3
                        Width = 742
                        Height = 90
                        BevelOuter = bvNone
                        TabOrder = 0
                        object SpeedButton9: TSpeedButton
                          Left = 543
                          Top = 3
                          Width = 194
                          Height = 22
                          Caption = 'Referenciar A'#231#227'o Judicial'
                          OnClick = SpeedButton9Click
                        end
                        object SpeedButton10: TSpeedButton
                          Left = 543
                          Top = 31
                          Width = 194
                          Height = 22
                          Caption = 'Referenciar Processo Administrativo'
                          OnClick = SpeedButton10Click
                        end
                        object SpeedButton13: TSpeedButton
                          Left = 543
                          Top = 59
                          Width = 194
                          Height = 22
                          Caption = 'Remover Refer'#234'ncia'
                          OnClick = SpeedButton13Click
                        end
                        object DBGrid2: TDBGrid
                          Left = 10
                          Top = 3
                          Width = 527
                          Height = 78
                          DataSource = DataSource1
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'NUM_PROC'
                              Title.Caption = 'N'#250'mero do Processo ou Ato concess'#243'rio'
                              Width = 103
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'IND_PROC'
                              Title.Caption = 'Indicador da origem do processo'
                              Visible = True
                            end>
                        end
                      end
                    end
                    object DBRadioGroup2: TDBRadioGroup
                      Left = 10
                      Top = 470
                      Width = 746
                      Height = 49
                      Caption = 'Indicador da origem do cr'#233'dito'
                      Columns = 2
                      DataField = 'IND_ORIG_CRED'
                      DataSource = dtmSPED.dsOutRecCred
                      Items.Strings = (
                        '0 '#8211' Opera'#231#227'o no Mercado Interno'
                        '1 '#8211' Opera'#231#227'o de Importa'#231#227'o')
                      ParentBackground = True
                      TabOrder = 10
                      Values.Strings = (
                        '0'
                        '1')
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [SPED027]'
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
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [SPED023]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED024]'
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
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED025]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED026]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton4Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SPED028]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
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
                Hint = 'Ver registros da lixeira - [SPED029]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 660
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 766
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 726
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 694
    Top = 11
  end
  object DataSource1: TDataSource
    Left = 624
    Top = 16
  end
end
