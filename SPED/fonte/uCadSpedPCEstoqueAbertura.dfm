inherited frmCadSpedPCEstoqueAbertura: TfrmCadSpedPCEstoqueAbertura
  Caption = 'Cr'#233'dito de PIS/COFINS sobre o Estoque de Abertura'
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
              ActivePage = tsCadastro
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
                    Height = 490
                    Align = alTop
                    Caption = 'Cadastro de Cr'#233'dito de PIS/COFINS sobre o Estoque de Abertura'
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
                      Left = 49
                      Top = 122
                      Width = 53
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Data Inicial'
                      FocusControl = DBEdit5
                      ParentBiDiMode = False
                    end
                    object Label8: TLabel
                      Left = 548
                      Top = 30
                      Width = 84
                      Height = 13
                      Caption = 'Data Lan'#231'amento'
                      FocusControl = DBEdit6
                    end
                    object Label9: TLabel
                      Left = 463
                      Top = 122
                      Width = 169
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor Total do Estoque de Abertura'
                      FocusControl = DBEdit7
                      ParentBiDiMode = False
                    end
                    object Bevel2: TBevel
                      Left = 11
                      Top = 111
                      Width = 746
                      Height = 122
                      Shape = bsFrame
                    end
                    object Label20: TLabel
                      Left = 296
                      Top = 149
                      Width = 336
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 
                        'Parcela do estoque de abertura referente a bens sem direito a cr' +
                        #233'dito'
                      FocusControl = DBEdit2
                      ParentBiDiMode = False
                    end
                    object Label23: TLabel
                      Left = 54
                      Top = 149
                      Width = 48
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Data Final'
                      FocusControl = DBEdit15
                      ParentBiDiMode = False
                    end
                    object Label24: TLabel
                      Left = 320
                      Top = 176
                      Width = 312
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor da Base de C'#225'lculo do Cr'#233'dito sobre o Estoque de Abertura'
                      FocusControl = DBEdit17
                      ParentBiDiMode = False
                    end
                    object Label18: TLabel
                      Left = 284
                      Top = 203
                      Width = 348
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 
                        'Valor da Base de C'#225'lculo Mensal do Cr'#233'dito sobre o Estoque de Ab' +
                        'ertura'
                      FocusControl = DBEdit3
                      ParentBiDiMode = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 108
                      Top = 29
                      Width = 134
                      Height = 21
                      DataField = 'COD_ESTOQUE'
                      DataSource = dtmSPED.dsEstAb
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit5: TDBEdit
                      Left = 108
                      Top = 119
                      Width = 102
                      Height = 21
                      DataField = 'DATA_INICIAL'
                      DataSource = dtmSPED.dsEstAb
                      TabOrder = 3
                    end
                    object DBEdit6: TDBEdit
                      Left = 638
                      Top = 27
                      Width = 102
                      Height = 21
                      DataField = 'DATA_LANC'
                      DataSource = dtmSPED.dsEstAb
                      Enabled = False
                      TabOrder = 1
                    end
                    object DBEdit7: TDBEdit
                      Left = 638
                      Top = 119
                      Width = 102
                      Height = 21
                      DataField = 'VL_TOT_EST'
                      DataSource = dtmSPED.dsEstAb
                      TabOrder = 5
                      OnExit = DBEdit7Exit
                    end
                    object GroupBox7: TGroupBox
                      Left = 10
                      Top = 234
                      Width = 746
                      Height = 70
                      Caption = 'PIS'
                      TabOrder = 9
                      object Label10: TLabel
                        Left = 73
                        Top = 17
                        Width = 19
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'CST'
                        ParentBiDiMode = False
                      end
                      object Label12: TLabel
                        Left = 53
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
                        DataSource = dtmSPED.dsEstAb
                        ItemHeight = 0
                        Items.Strings = (
                          
                            '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                            ' Receita Tributada no Mercado Interno'
                          
                            '51 - Opera'#231#227'o com Direito a Cr'#233'dito '#8211' Vinculada Exclusivamente a' +
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
                            #231#227'o')
                        TabOrder = 0
                        OnExit = DBComboBox1Exit
                      end
                      object DBEdit9: TDBEdit
                        Left = 98
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'ALIQ_PIS'
                        DataSource = dtmSPED.dsEstAb
                        TabOrder = 1
                        OnExit = DBEdit7Exit
                      end
                      object DBEdit10: TDBEdit
                        Left = 628
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_PIS'
                        DataSource = dtmSPED.dsEstAb
                        ReadOnly = True
                        TabOrder = 2
                      end
                    end
                    object GroupBox8: TGroupBox
                      Left = 10
                      Top = 306
                      Width = 746
                      Height = 70
                      Caption = 'COFINS'
                      TabOrder = 10
                      object Label14: TLabel
                        Left = 73
                        Top = 17
                        Width = 19
                        Height = 13
                        BiDiMode = bdRightToLeft
                        Caption = 'CST'
                        ParentBiDiMode = False
                      end
                      object Label16: TLabel
                        Left = 53
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
                        DataSource = dtmSPED.dsEstAb
                        ItemHeight = 0
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
                            #231#227'o')
                        TabOrder = 0
                        OnExit = DBComboBox2Exit
                      end
                      object DBEdit12: TDBEdit
                        Left = 98
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'ALIQ_COFINS'
                        DataSource = dtmSPED.dsEstAb
                        TabOrder = 1
                        OnExit = DBEdit7Exit
                      end
                      object DBEdit13: TDBEdit
                        Left = 628
                        Top = 41
                        Width = 102
                        Height = 21
                        DataField = 'VL_COFINS'
                        DataSource = dtmSPED.dsEstAb
                        ReadOnly = True
                        TabOrder = 2
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 11
                      Top = 54
                      Width = 746
                      Height = 49
                      Caption = 'Natureza da Base de C'#225'lculo de Cr'#233'dito - SPED PIS/COFINS'
                      TabOrder = 2
                      object DBComboBox3: TDBComboBox
                        Left = 9
                        Top = 18
                        Width = 720
                        Height = 21
                        DataField = 'NAT_BC_CRED'
                        DataSource = dtmSPED.dsEstAb
                        Enabled = False
                        ItemHeight = 0
                        Items.Strings = (
                          
                            '10 - M'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                            'imobilizado (cr'#233'dito com base no valor de aquisi'#231#227'o).')
                        TabOrder = 0
                      end
                    end
                    object GroupBox10: TGroupBox
                      Left = 10
                      Top = 379
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
                        DataSource = dtmSPED.dsEstAb
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
                    object GroupBox12: TGroupBox
                      Left = 11
                      Top = 431
                      Width = 746
                      Height = 50
                      Caption = 'Descri'#231#227'o do estoque'
                      TabOrder = 12
                      object DBEdit4: TDBEdit
                        Left = 9
                        Top = 20
                        Width = 720
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DESC_EST'
                        DataSource = dtmSPED.dsEstAb
                        TabOrder = 0
                      end
                    end
                    object DBEdit2: TDBEdit
                      Left = 638
                      Top = 146
                      Width = 102
                      Height = 21
                      DataField = 'EST_IMP'
                      DataSource = dtmSPED.dsEstAb
                      TabOrder = 6
                      OnExit = DBEdit7Exit
                    end
                    object DBEdit15: TDBEdit
                      Left = 108
                      Top = 146
                      Width = 102
                      Height = 21
                      DataField = 'DATA_FINAL'
                      DataSource = dtmSPED.dsEstAb
                      Enabled = False
                      TabOrder = 4
                    end
                    object DBEdit17: TDBEdit
                      Left = 638
                      Top = 173
                      Width = 102
                      Height = 21
                      DataField = 'VL_BC_EST'
                      DataSource = dtmSPED.dsEstAb
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 7
                    end
                    object DBEdit3: TDBEdit
                      Left = 638
                      Top = 200
                      Width = 102
                      Height = 21
                      DataField = 'VL_BC_MEN_EST'
                      DataSource = dtmSPED.dsEstAb
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 8
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [SPED043]'
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
              Hint = 'Clique para pesquisar - [SPED039]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED040]'
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
                Hint = 'Editar Registro - [SPED041]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED042]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SPED044]'
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
                Hint = 'Ver registros da lixeira  - [SPED045]'
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
end
