inherited FrmCadTipoServ: TFrmCadTipoServ
  Left = 246
  Top = 50
  Caption = 'Tipo de Servi'#231'os'
  ClientHeight = 641
  ClientWidth = 903
  Scaled = False
  ExplicitWidth = 919
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 903
    Height = 622
    ExplicitWidth = 903
    ExplicitHeight = 622
    inherited Splitter2: TSplitter
      Height = 620
      ExplicitHeight = 591
    end
    inherited PanelLeft: TPanel
      Width = 898
      Height = 620
      ExplicitWidth = 898
      ExplicitHeight = 620
      inherited PageControl1: TPageControl
        Width = 896
        Height = 618
        ActivePage = tsAlterDadosLote
        ExplicitWidth = 896
        ExplicitHeight = 618
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 888
          ExplicitHeight = 587
          inherited ScrollBox1: TScrollBox
            Width = 888
            Height = 587
            ExplicitWidth = 888
            ExplicitHeight = 587
            inherited PageControl3: TPageControl
              Width = 888
              Height = 539
              ActivePage = tsPadNacional
              OnChange = PageControl3Change
              ExplicitWidth = 888
              ExplicitHeight = 539
              inherited TabSheet3: TTabSheet
                Caption = 'Dados do Tipo Servi'#231'o'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 880
                ExplicitHeight = 508
                inherited ScrollBox3: TScrollBox
                  Width = 880
                  Height = 508
                  ExplicitWidth = 880
                  ExplicitHeight = 508
                  inherited GroupBox1: TGroupBox
                    Width = 859
                    Height = 520
                    Caption = ''
                    ExplicitWidth = 859
                    ExplicitHeight = 520
                    object Label6: TLabel
                      Left = 63
                      Top = 18
                      Width = 44
                      Height = 13
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 45
                      Top = 45
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 73
                      Top = 99
                      Width = 34
                      Height = 13
                      Caption = 'Valor:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 70
                      Top = 72
                      Width = 37
                      Height = 13
                      Caption = 'CFOP:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 661
                      Top = 126
                      Width = 32
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'TMO:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 352
                      Top = 99
                      Width = 75
                      Height = 13
                      Caption = 'Aliquota ISS:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 16
                      Top = 180
                      Width = 91
                      Height = 13
                      Caption = 'Origem Servi'#231'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 342
                      Top = 153
                      Width = 85
                      Height = 13
                      Caption = 'Alt. Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 336
                      Top = 126
                      Width = 91
                      Height = 13
                      Caption = 'Tmo Simult'#226'nio:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 20
                      Top = 207
                      Width = 87
                      Height = 13
                      Caption = 'Esp'#233'cie V/Ap.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 8
                      Top = 153
                      Width = 99
                      Height = 13
                      Caption = 'Alt. Valor Cupom:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label17: TLabel
                      Left = 593
                      Top = 153
                      Width = 100
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Servico Garantia:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 606
                      Top = 99
                      Width = 87
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Servi'#231'o Isento:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 16
                      Top = 126
                      Width = 91
                      Height = 13
                      Caption = 'N'#227'o Incid'#234'ncia:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 518
                      Top = 180
                      Width = 175
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Serv. de Proprietario/Terceiro:'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label24: TLabel
                      Left = 641
                      Top = 204
                      Width = 52
                      Height = 13
                      Caption = 'Unidade:'
                      FocusControl = DBEdit8
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label38: TLabel
                      Left = 281
                      Top = 180
                      Width = 146
                      Height = 13
                      Caption = 'Seq. Revis'#227'o(ex.: 01,02):'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label40: TLabel
                      Left = 211
                      Top = 18
                      Width = 122
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Empresa do Servi'#231'o: '
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label158: TLabel
                      Left = 26
                      Top = 234
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Venda Online:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 108
                      Top = 15
                      Width = 65
                      Height = 21
                      Hint = 'C'#243'digo do Servi'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'COD_SERVICO'
                      DataSource = dtmProdutos.dsTipoServ
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 108
                      Top = 42
                      Width = 669
                      Height = 21
                      Hint = 'Descri'#231#227'o do Servi'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'DESC_SERVICO'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 2
                      OnEnter = DBEdit2Enter
                      OnExit = DBEdit2Exit
                    end
                    object DBEdit3: TDBEdit
                      Left = 108
                      Top = 96
                      Width = 121
                      Height = 21
                      Hint = 'Valor do Servi'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'VALOR_SERVICO'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 5
                    end
                    object DBEdit4: TDBEdit
                      Left = 694
                      Top = 123
                      Width = 84
                      Height = 21
                      Hint = 'TMO'
                      CharCase = ecUpperCase
                      DataField = 'TMO'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 10
                    end
                    object DBEdit5: TDBEdit
                      Left = 428
                      Top = 96
                      Width = 86
                      Height = 21
                      Hint = 'Aliquota de iss do servi'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'ALIQ_ISS'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 6
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 428
                      Top = 150
                      Width = 86
                      Height = 21
                      Hint = 'Altera descri'#231#227'o do servi'#231'o na venda '
                      CharCase = ecUpperCase
                      DataField = 'ALT_DESC'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 12
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 428
                      Top = 123
                      Width = 86
                      Height = 21
                      Hint = 'TMO simult'#226'neo'
                      CharCase = ecUpperCase
                      DataField = 'TMOSERVSIMULT'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 9
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 108
                      Top = 204
                      Width = 406
                      Height = 21
                      Hint = 'Esp'#233'cie para Segmenta'#231#227'o de servi'#231'os'
                      DataField = 'COD_ESPE_SEG'
                      DataSource = dtmProdutos.dsTipoServ
                      DropDownRows = 8
                      KeyField = 'CODIGO_ESP'
                      ListField = 'DESCRICAO_ESP'
                      ListSource = dtmProdutos.dsEspecieSeg
                      TabOrder = 17
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 694
                      Top = 150
                      Width = 84
                      Height = 21
                      Hint = 'Servi'#231'o pago pela Honda'
                      CharCase = ecUpperCase
                      DataField = 'SHONDA'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 13
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 108
                      Top = 150
                      Width = 77
                      Height = 21
                      Hint = 'Altera valor do servi'#231'o na venda'
                      CharCase = ecUpperCase
                      DataField = 'ALTCOD'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 11
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 188
                      Top = 69
                      Width = 589
                      Height = 21
                      Hint = 'Natureza de Opera'#231#227'o'
                      DataField = 'CODIGO_NOP'
                      DataSource = dtmProdutos.dsTipoServ
                      KeyField = 'CODIGO_NOP'
                      ListField = 'DESCRICAO_NOP'
                      ListSource = dtmProdutos.dsCFOP
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 108
                      Top = 69
                      Width = 77
                      Height = 21
                      Hint = 'C'#243'digo da Natureza de Opera'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_NOP'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 3
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 694
                      Top = 177
                      Width = 84
                      Height = 21
                      Hint = 'Servi'#231'o ou Produto de Terceiro'
                      CharCase = ecUpperCase
                      DataField = 'SERV_PROP_TERC'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'PROPRIO'
                        'SERVI'#199'O')
                      TabOrder = 16
                      OnKeyPress = DBComboBox6KeyPress
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 694
                      Top = 96
                      Width = 84
                      Height = 21
                      Hint = 'Servi'#231'o Isento'
                      CharCase = ecUpperCase
                      DataField = 'ISENTO_SERV'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 7
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBComboBox8: TDBComboBox
                      Left = 108
                      Top = 123
                      Width = 77
                      Height = 21
                      Hint = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'N_INCIDENCIA_SERV'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 8
                      OnKeyPress = DBComboBoxKeyPress
                    end
                    object DBEdit8: TDBEdit
                      Left = 694
                      Top = 201
                      Width = 86
                      Height = 21
                      DataField = 'UNIDADE'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 18
                    end
                    object DBEdit12: TDBEdit
                      Left = 428
                      Top = 177
                      Width = 86
                      Height = 21
                      Hint = 'TMO'
                      CharCase = ecUpperCase
                      DataField = 'SEQ_REVISAO'
                      DataSource = dtmProdutos.dsTipoServ
                      TabOrder = 15
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 330
                      Top = 15
                      Width = 447
                      Height = 21
                      Hint = 
                        'Preencha corretamente pois este servi'#231'o s'#243' poder'#225' ser usado pela' +
                        ' empresa informada!'
                      DataField = 'COD_EMPRESA'
                      DataSource = dtmProdutos.dsTipoServ
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmProdutos.dsEmpresa
                      TabOrder = 1
                      Visible = False
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 108
                      Top = 177
                      Width = 145
                      Height = 21
                      Hint = 'Origem servi'#231'o'
                      DataField = 'STIPO'
                      DataSource = dtmProdutos.dsTipoServ
                      DropDownRows = 8
                      KeyField = 'SIGLA'
                      ListField = 'SIGLA_DESCRICAO'
                      ListSource = dtmProdutos.dsTipoTipoServ
                      TabOrder = 14
                      OnExit = DBLookupComboBox5Exit
                    end
                    object DBComboBox22: TDBComboBox
                      Left = 108
                      Top = 231
                      Width = 90
                      Height = 21
                      Hint = 'Sincronizar venda online'
                      CharCase = ecUpperCase
                      DataField = 'SINC_HW_CLOUD'
                      DataSource = dtmProdutos.dsTipoServ
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 19
                    end
                  end
                end
              end
              object tsComercioAberto: TTabSheet
                Caption = 'Com'#233'rcio Aberto'
                ImageIndex = 2
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 880
                  Height = 508
                  Align = alClient
                  TabOrder = 0
                  object GroupBox80: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 876
                    Height = 57
                    Align = alTop
                    Caption = 'Tipo de Servi'#231'o'
                    TabOrder = 0
                    object DBText62: TDBText
                      Left = 32
                      Top = 24
                      Width = 55
                      Height = 13
                      AutoSize = True
                      DataField = 'DESC_SERVICO'
                      DataSource = dtmProdutos.dsTipoServ
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object lbIdComercioAberto: TLabel
                      Left = 583
                      Top = 24
                      Width = 113
                      Height = 13
                      BiDiMode = bdLeftToRight
                      Caption = 'Id Com'#233'rcio Aberto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBiDiMode = False
                      ParentFont = False
                    end
                    object DBTextIdComercioAberto: TDBText
                      Left = 702
                      Top = 24
                      Width = 53
                      Height = 17
                      DataField = 'ID_COMERCIO_ABERTO'
                      DataSource = dtmProdutos.dsTipoServ
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                  object GroupBoxDadosCA: TGroupBox
                    Left = 0
                    Top = 57
                    Width = 876
                    Height = 447
                    Align = alClient
                    Caption = 'Com'#233'rcio Aberto'
                    TabOrder = 1
                    object pnDadosCA: TPanel
                      Left = 2
                      Top = 15
                      Width = 872
                      Height = 397
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      OnEnter = pnDadosCAEnter
                      object PageControlCA: TPageControl
                        Left = 0
                        Top = 0
                        Width = 872
                        Height = 360
                        ActivePage = TabSheetCA1
                        Align = alClient
                        TabOrder = 0
                        object TabSheetCA1: TTabSheet
                          Caption = 'TabSheetCA1'
                          object ScrollBox5: TScrollBox
                            Left = 0
                            Top = 0
                            Width = 864
                            Height = 332
                            Align = alClient
                            BevelInner = bvNone
                            BevelOuter = bvNone
                            BorderStyle = bsNone
                            Color = clBtnFace
                            ParentColor = False
                            TabOrder = 0
                            object pnDescricaoHTMLCA: TPanel
                              Left = 0
                              Top = 69
                              Width = 864
                              Height = 263
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Panel80: TPanel
                                Left = 0
                                Top = 0
                                Width = 112
                                Height = 263
                                Align = alLeft
                                BevelOuter = bvNone
                                TabOrder = 0
                                object Label427: TLabel
                                  Left = 69
                                  Top = 3
                                  Width = 41
                                  Height = 13
                                  Caption = 'Dados:'
                                  Font.Charset = DEFAULT_CHARSET
                                  Font.Color = clWindowText
                                  Font.Height = -11
                                  Font.Name = 'MS Sans Serif'
                                  Font.Style = [fsBold]
                                  ParentFont = False
                                end
                              end
                              object Panel81: TPanel
                                Left = 112
                                Top = 0
                                Width = 730
                                Height = 263
                                Align = alClient
                                BevelKind = bkTile
                                BevelOuter = bvNone
                                TabOrder = 1
                                object pnOpcoesHtml: TPanel
                                  Left = 0
                                  Top = 0
                                  Width = 34
                                  Height = 259
                                  Align = alLeft
                                  BevelKind = bkTile
                                  BevelOuter = bvNone
                                  TabOrder = 0
                                  object SpeedButtonAlterarHtmlCA: TSpeedButton
                                    Left = 0
                                    Top = 0
                                    Width = 30
                                    Height = 255
                                    Hint = 'Editar Html'
                                    Align = alClient
                                    Flat = True
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
                                    OnClick = SpeedButtonAlterarHtmlCAClick
                                    ExplicitLeft = 3
                                    ExplicitTop = 4
                                    ExplicitWidth = 25
                                    ExplicitHeight = 54
                                  end
                                end
                                object WebBrowserCA: TWebBrowser
                                  Left = 34
                                  Top = 0
                                  Width = 692
                                  Height = 259
                                  Align = alClient
                                  TabOrder = 1
                                  ExplicitWidth = 621
                                  ControlData = {
                                    4C00000085470000C51A00000000000000000000000000000000000000000000
                                    000000004C000000000000000000000001000000E0D057007335CF11AE690800
                                    2B2E126208000000000000004C0000000114020000000000C000000000000046
                                    8000000000000000000000000000000000000000000000000000000000000000
                                    00000000000000000100000000000000000000000000000000000000}
                                end
                              end
                              object Panel79: TPanel
                                Left = 842
                                Top = 0
                                Width = 22
                                Height = 263
                                Align = alRight
                                BevelOuter = bvNone
                                TabOrder = 2
                              end
                            end
                            object pnDescricaoServCA: TPanel
                              Left = 0
                              Top = 0
                              Width = 864
                              Height = 69
                              Align = alTop
                              BevelOuter = bvNone
                              TabOrder = 1
                              object Label462: TLabel
                                Left = 48
                                Top = 11
                                Width = 62
                                Height = 13
                                Caption = 'Descri'#231#227'o:'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -11
                                Font.Name = 'MS Sans Serif'
                                Font.Style = [fsBold]
                                ParentFont = False
                              end
                              object Label471: TLabel
                                Left = 69
                                Top = 41
                                Width = 41
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'Enviar:'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -11
                                Font.Name = 'MS Sans Serif'
                                Font.Style = [fsBold]
                                ParentFont = False
                              end
                              object Label41: TLabel
                                Left = 270
                                Top = 41
                                Width = 105
                                Height = 13
                                Alignment = taRightJustify
                                Caption = 'Pre'#231'o a Combinar:'
                                Font.Charset = DEFAULT_CHARSET
                                Font.Color = clWindowText
                                Font.Height = -11
                                Font.Name = 'MS Sans Serif'
                                Font.Style = [fsBold]
                                ParentFont = False
                              end
                              object DBEditDescrCA: TDBEdit
                                Left = 112
                                Top = 8
                                Width = 625
                                Height = 21
                                DataField = 'DESC_SERV_RES'
                                DataSource = dtmProdutos.dsTipoServ
                                TabOrder = 0
                              end
                              object DBComboBoxEnvCA: TDBComboBox
                                Left = 112
                                Top = 38
                                Width = 90
                                Height = 21
                                Style = csDropDownList
                                DataField = 'ENV_COMERCIO_ABERTO'
                                DataSource = dtmProdutos.dsTipoServ
                                ItemHeight = 13
                                Items.Strings = (
                                  'SIM'
                                  'N'#195'O')
                                TabOrder = 1
                              end
                              object DBComboBoxPrecoCombinarCA: TDBComboBox
                                Left = 379
                                Top = 38
                                Width = 90
                                Height = 21
                                Style = csDropDownList
                                DataField = 'PRECO_A_COMBINAR_CA'
                                DataSource = dtmProdutos.dsTipoServ
                                ItemHeight = 13
                                Items.Strings = (
                                  'SIM'
                                  'N'#195'O')
                                TabOrder = 2
                              end
                            end
                          end
                        end
                      end
                      object pnOpcoesDadosCA: TPanel
                        Left = 0
                        Top = 360
                        Width = 872
                        Height = 37
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object btnOKAlterarDadosCA: TBitBtn
                          Left = 304
                          Top = 4
                          Width = 75
                          Height = 25
                          Hint = 'OK - [BAS431]'
                          Caption = '&OK'
                          TabOrder = 0
                          OnClick = btnOKAlterarDadosCAClick
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
                        object btnCancAlterarDadosCA: TBitBtn
                          Left = 385
                          Top = 4
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar'
                          Caption = '&Cancela'
                          TabOrder = 1
                          OnClick = btnCancAlterarDadosCAClick
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
                    object pnButtonAlterDadosCA: TPanel
                      Left = 2
                      Top = 412
                      Width = 872
                      Height = 33
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 1
                      object btnAlterarDadosCA: TBitBtn
                        Left = 290
                        Top = 2
                        Width = 183
                        Height = 25
                        Hint = 'Alterar Dados Com'#233'rcio Aberto - [BAS430]'
                        Caption = 'Alterar'
                        TabOrder = 0
                        OnClick = btnAlterarDadosCAClick
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
                    end
                  end
                end
              end
              object tsRelTipoServ: TTabSheet
                Caption = 'tsRelTipoServ'
                ImageIndex = 1
                object qrpTipoServ: TQuickRep
                  Left = 1
                  Top = 0
                  Width = 816
                  Height = 1056
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = dtmProdutos.cdsTipoServ
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
                  OnPreview = qrpTipoServPreview
                  Options = [FirstPageHeader, LastPageFooter]
                  Page.Columns = 1
                  Page.Orientation = poPortrait
                  Page.PaperSize = Letter
                  Page.Values = (
                    100.000000000000000000
                    2794.000000000000000000
                    100.000000000000000000
                    2159.000000000000000000
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
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsNormal
                  PrevInitialZoom = qrZoomToFit
                  PreviewDefaultSaveType = stQRP
                  object QRBand2: TQRBand
                    Left = 38
                    Top = 162
                    Width = 740
                    Height = 25
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
                      66.145833333333330000
                      1957.916666666667000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText2: TQRDBText
                      Left = 24
                      Top = 0
                      Width = 55
                      Height = 19
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        50.270833333333330000
                        63.500000000000000000
                        0.000000000000000000
                        145.520833333333300000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmProdutos.cdsTipoServ
                      DataField = 'COD_SERVICO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 11
                    end
                    object QRDBText3: TQRDBText
                      Left = 112
                      Top = 0
                      Width = 117
                      Height = 19
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        50.270833333333330000
                        296.333333333333300000
                        0.000000000000000000
                        309.562500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmProdutos.cdsTipoServ
                      DataField = 'DESC_SERVICO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 11
                    end
                    object QRDBText4: TQRDBText
                      Left = 590
                      Top = 3
                      Width = 129
                      Height = 19
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        50.270833333333330000
                        1561.041666666667000000
                        7.937500000000000000
                        341.312500000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmProdutos.cdsTipoServ
                      DataField = 'VALOR_SERVICO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 11
                    end
                  end
                  object QRBand3: TQRBand
                    Left = 38
                    Top = 187
                    Width = 740
                    Height = 32
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
                      84.666666666666670000
                      1957.916666666667000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageFooter
                    object QRShape3: TQRShape
                      Left = 5
                      Top = 7
                      Width = 731
                      Height = 3
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        7.937500000000000000
                        13.229166666666700000
                        18.520833333333300000
                        1934.104166666670000000)
                      Brush.Color = clBlack
                      Shape = qrsRectangle
                      VertAdjust = 0
                    end
                    object QRLabel8: TQRLabel
                      Left = 4
                      Top = 11
                      Width = 210
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        10.583333333333330000
                        29.104166666666670000
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
                  end
                  object QRBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 740
                    Height = 124
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    AlignToBottom = False
                    BeforePrint = QRBand1BeforePrint
                    Color = clWhite
                    TransparentBand = False
                    ForceNewColumn = False
                    ForceNewPage = False
                    Size.Values = (
                      328.083333333333300000
                      1957.916666666667000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 2
                      Top = 35
                      Width = 335
                      Height = 24
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        63.500000000000000000
                        5.291666666666667000
                        92.604166666666680000
                        886.354166666666800000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'Cadastro de Tipo de Servi'#231'os'
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
                      Left = 631
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
                        1669.520833333333000000
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
                      Left = 688
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
                        1820.333333333333000000
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
                    object QRShape1: TQRShape
                      Left = 3
                      Top = 79
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
                        209.020833333333000000
                        1942.041666666670000000)
                      Brush.Color = clBlack
                      Shape = qrsRectangle
                      VertAdjust = 0
                    end
                    object QRShape2: TQRShape
                      Left = 3
                      Top = 115
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
                        304.270833333333000000
                        1942.041666666670000000)
                      Brush.Color = clBlack
                      Shape = qrsRectangle
                      VertAdjust = 0
                    end
                    object QRLabel4: TQRLabel
                      Left = 24
                      Top = 86
                      Width = 68
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666670000
                        63.500000000000000000
                        227.541666666666700000
                        179.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'digo'
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
                    object QRLabel5: TQRLabel
                      Left = 113
                      Top = 86
                      Width = 95
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666670000
                        298.979166666666700000
                        227.541666666666700000
                        251.354166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Descri'#231#227'o'
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
                    object QRLabel6: TQRLabel
                      Left = 664
                      Top = 91
                      Width = 55
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666670000
                        1756.833333333333000000
                        240.770833333333300000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Valor '
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
                    object lbEmpresa: TQRLabel
                      Left = 3
                      Top = 1
                      Width = 67
                      Height = 32
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        84.666666666666670000
                        7.937500000000000000
                        2.645833333333333000
                        177.270833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Nome'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 18
                    end
                  end
                end
              end
              object tsPadNacional: TTabSheet
                Caption = 'Dados Fiscais'
                ImageIndex = 3
                object Label44: TLabel
                  Left = 35
                  Top = 19
                  Width = 130
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo Tributacao Nacional'
                  FocusControl = DBEdit14
                end
                object Label45: TLabel
                  Left = 32
                  Top = 46
                  Width = 133
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo Tributacao Municipal'
                  FocusControl = DBEdit15
                end
                object Label46: TLabel
                  Left = 110
                  Top = 73
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo NBS'
                  FocusControl = DBEdit16
                end
                object Label18: TLabel
                  Left = 103
                  Top = 100
                  Width = 59
                  Height = 13
                  Caption = 'CNAE NFSe'
                  FocusControl = DBEdit7
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label26: TLabel
                  Left = 259
                  Top = 100
                  Width = 251
                  Height = 13
                  Caption = '(Verificar CNAE Definido pela NFSe do seu Munic'#237'pio)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clHotLight
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label25: TLabel
                  Left = 78
                  Top = 154
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'C'#243'digo LC 116/03'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label27: TLabel
                  Left = 84
                  Top = 181
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'ISS Retido NFSe'
                  FocusControl = DBEdit9
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label215: TLabel
                  Left = 254
                  Top = 181
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
                object Label160: TLabel
                  Left = 89
                  Top = 209
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST PISCOFINS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label28: TLabel
                  Left = 48
                  Top = 235
                  Width = 117
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST PISCOFINS Entrada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label30: TLabel
                  Left = 25
                  Top = 262
                  Width = 140
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Natureza Receita PISCOFINS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object linkVerCorrelFiscal: TLabel
                  Left = 697
                  Top = 154
                  Width = 96
                  Height = 13
                  Cursor = crHandPoint
                  Caption = 'Ver correla'#231#227'o fiscal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  OnClick = linkVerCorrelFiscalClick
                end
                object lbCIndOp: TLabel
                  Left = 8
                  Top = 127
                  Width = 154
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cod Ind Opera'#231#227'o Fornecimento'
                  FocusControl = edCIndOp
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbInfoCIndOp: TLabel
                  Left = 259
                  Top = 127
                  Width = 240
                  Height = 13
                  Alignment = taCenter
                  Caption = 'Campo cIndOp para o IBSCBS no Layout Nacional'
                  FocusControl = edCIndOp
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object DBEdit14: TDBEdit
                  Left = 171
                  Top = 16
                  Width = 82
                  Height = 21
                  DataField = 'CTRIBNAC'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 0
                end
                object DBEdit15: TDBEdit
                  Left = 171
                  Top = 43
                  Width = 43
                  Height = 21
                  DataField = 'CTRIBMUN'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 1
                end
                object DBEdit16: TDBEdit
                  Left = 171
                  Top = 70
                  Width = 82
                  Height = 21
                  DataField = 'CNBS'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 2
                end
                object DBEdit7: TDBEdit
                  Left = 171
                  Top = 97
                  Width = 82
                  Height = 21
                  DataField = 'CNAE_SERV'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 3
                end
                object DBLookupComboBox3: TDBLookupComboBox
                  Left = 171
                  Top = 151
                  Width = 520
                  Height = 21
                  DataField = 'NFS_SERVICO'
                  DataSource = dtmProdutos.dsTipoServ
                  KeyField = 'COD_TPSERVICO'
                  ListField = 'COD_TPSERVICO;DESC_TPSERVICO'
                  ListSource = dtmProdutos.DtTipoServicoLC
                  TabOrder = 4
                  OnExit = DBLookupComboBox3Exit
                end
                object DBEdit9: TDBEdit
                  Left = 171
                  Top = 178
                  Width = 77
                  Height = 21
                  DataField = 'ISS_RETIDO'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 5
                end
                object DBComboBox12: TDBComboBox
                  Left = 171
                  Top = 205
                  Width = 520
                  Height = 21
                  DataField = 'CST_PIS'
                  DataSource = dtmProdutos.dsTipoServ
                  ItemHeight = 13
                  TabOrder = 6
                  OnExit = DBComboBox12Exit
                end
                object DBComboBox11: TDBComboBox
                  Left = 171
                  Top = 232
                  Width = 520
                  Height = 21
                  DataField = 'CST_PIS_ENT'
                  DataSource = dtmProdutos.dsTipoServ
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
                  TabOrder = 7
                  OnExit = DBComboBox11Exit
                end
                object DBComboBox15: TDBComboBox
                  Left = 171
                  Top = 259
                  Width = 520
                  Height = 21
                  DataField = 'NAT_REC'
                  DataSource = dtmProdutos.dsTipoServ
                  ItemHeight = 13
                  TabOrder = 8
                  OnEnter = DBComboBox15Enter
                end
                object edCIndOp: TDBEdit
                  Left = 171
                  Top = 124
                  Width = 82
                  Height = 21
                  DataField = 'CINDOP'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 9
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'TabSheet6'
                ImageIndex = 4
                object Label23: TLabel
                  Left = 15
                  Top = 234
                  Width = 92
                  Height = 13
                  Caption = 'C'#243'd. Trib. NF-e:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object Label39: TLabel
                  Left = 652
                  Top = 234
                  Width = 41
                  Height = 13
                  Caption = 'CTISS:'
                  FocusControl = DBEdit13
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label21: TLabel
                  Left = 560
                  Top = 207
                  Width = 133
                  Height = 13
                  Caption = 'Arredondar ou Truncar:'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label161: TLabel
                  Left = 40
                  Top = 275
                  Width = 67
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST COFINS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 40
                  Top = 329
                  Width = 67
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST COFINS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 32
                  Top = 262
                  Width = 133
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Al'#237'quota de reten'#231#227'o do IR:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Label37: TLabel
                  Left = 476
                  Top = 262
                  Width = 132
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Teto para a Base de c'#225'lculo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object DBComboBox10: TDBComboBox
                  Left = 108
                  Top = 231
                  Width = 145
                  Height = 21
                  DataField = 'CODIGO_TRIBUTACAO'
                  DataSource = dtmProdutos.dsTipoServ
                  ItemHeight = 13
                  Items.Strings = (
                    'N '#8211' NORMAL'
                    'R '#8211' RETIDA'
                    'S '#8211'SUBSTITUTA'
                    'I '#8211' ISENTA')
                  TabOrder = 0
                  Visible = False
                end
                object DBEdit13: TDBEdit
                  Left = 694
                  Top = 231
                  Width = 84
                  Height = 21
                  Hint = 'C'#243'digo de Tributa'#231#227'o no Municipio'
                  DataField = 'CTISS'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 1
                  OnExit = DBEdit13Exit
                end
                object DBComboBox9: TDBComboBox
                  Left = 694
                  Top = 204
                  Width = 84
                  Height = 21
                  Hint = 'Arredondar ou Truncar'
                  CharCase = ecUpperCase
                  DataField = 'ARREDONDAR_TRUNCAR'
                  DataSource = dtmProdutos.dsTipoServ
                  ItemHeight = 13
                  Items.Strings = (
                    'TRUNCAR'
                    'ARREDONDAR')
                  TabOrder = 2
                  OnKeyPress = DBComboBox9KeyPress
                end
                object DBComboBox14: TDBComboBox
                  Left = 108
                  Top = 272
                  Width = 670
                  Height = 21
                  DataField = 'CST_COFINS'
                  DataSource = dtmProdutos.dsTipoServ
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
                  TabOrder = 3
                  OnExit = DBComboBox14Exit
                end
                object DBComboBox13: TDBComboBox
                  Left = 108
                  Top = 326
                  Width = 670
                  Height = 21
                  DataField = 'CST_COFINS_ENT'
                  DataSource = dtmProdutos.dsTipoServ
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
                  TabOrder = 4
                  OnExit = DBComboBox13Exit
                end
                object DBEdit10: TDBEdit
                  Left = 171
                  Top = 259
                  Width = 77
                  Height = 21
                  Hint = 'Imposto de Renda retido na fonte'
                  DataField = 'IRRF_SERVICO'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 5
                end
                object DBEdit11: TDBEdit
                  Left = 614
                  Top = 259
                  Width = 77
                  Height = 21
                  Hint = 'Valor Teto Imposto de Renda'
                  DataField = 'VL_TETO_IRRF'
                  DataSource = dtmProdutos.dsTipoServ
                  TabOrder = 6
                end
              end
            end
            inherited Panel3: TPanel
              Top = 539
              Width = 888
              ExplicitTop = 539
              ExplicitWidth = 888
              inherited LabelSeq: TLabel
                Top = 19
                ExplicitTop = 19
              end
              object btOpcoes: TSpeedButton [1]
                Left = 479
                Top = 13
                Width = 23
                Height = 25
                Caption = '...'
                OnClick = btOpcoesClick
              end
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS020]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS021]'
              end
              inherited CheckCadSeq: TCheckBox
                Top = 18
                ExplicitTop = 18
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
          ExplicitWidth = 888
          ExplicitHeight = 587
          inherited GroupBox3: TGroupBox
            Width = 888
            ExplicitWidth = 888
            inherited imgInformation: TImage
              Left = 862
              ExplicitLeft = 791
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 840
              Top = 13
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
              OnClick = SpeedButton59Click
            end
            object btSelectAll: TSpeedButton [7]
              Left = 604
              Top = 44
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
            object btUnSelectAll: TSpeedButton [8]
              Left = 631
              Top = 44
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
              Hint = 'Clique para pesquisar - [BAS084]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro  - [BAS015]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            object ckLixeira: TCheckBox
              Left = 692
              Top = 9
              Width = 76
              Height = 17
              Hint = 'Lixeira'
              Caption = 'Lixeira (F6)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = ckLixeiraClick
            end
          end
          inherited Panel1: TPanel
            Width = 888
            Height = 514
            ExplicitWidth = 888
            ExplicitHeight = 514
            inherited Splitter1: TSplitter
              Height = 453
              ExplicitHeight = 416
            end
            inherited DBGrid1: TDBGrid
              Width = 595
              Height = 453
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_SERVICO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_SERVICO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_SERVICO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SHONDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTCOD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_CAD_TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOD_TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TMO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_ISS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_ESPE_SEG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_NOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TMOSERVSIMULT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_DESC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERV_PROP_TERC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISENTO_SERV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_INCIDENCIA_SERV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARREDONDAR_TRUNCAR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASSE_SERV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASSE_QTD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASSE_POP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLASSE_ATL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DMD'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 884
              ExplicitWidth = 884
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS016]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS017]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS086]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS019]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Defini'#231#227'o de classes de servi'#231'os - [BAS087]'
                Glyph.Data = {
                  6E060000424D6E060000000000002E0400002800000018000000180000000100
                  08000000000040020000120B0000120B0000FE000000FE00000000000000FFFF
                  FF002F2EFF003736D1004946FE004B49E9003C3AB4003D3CAB00605EE2006362
                  E6006968ED007372FE006E6DEA006A69E1006F6EE200362FE000625EE1008F8C
                  FB008280B000CFCDFA00ACABCA00AAA9BF00CCC9F8009391B2008F89D300938C
                  D400908BBB008B87AB00ADACB400C7C5D300AAA5C000EAE9EE00BAAFCF00D3C9
                  DC00FF00FF00C6BCC500744F690086778100FEECF500E3DDDE00FEE8EB00AD69
                  6900B4747400AA6D6D00A76B6B00DC989700D9979700D9989800D5959500C78C
                  8C00CA909000CE898700CC8C8A005B414000FEE5E40067403D00CEC2C1007335
                  2E0068413D00FEE1DE005F3F3800FEDCD500FED8CA00FFFCFB00B2847200AB83
                  7300A67E6D00BB4A0000CC580000FFF8F300E7A9700083685000755E4900FFEF
                  E100FFF4EA00FFF7F000F6B67500D8A36E00F6BC8300B6926D00E6BD9300FFD5
                  AA00FFDDBA00FFDEBC00FFE7CF00FFEBD700FFF7EF00EDB57A00EEB87B00FECB
                  9600FBC99500F4C49000E9BB8A00DCB18200D7AC7F00EFC08E00C49E7500F4C6
                  9600FED1A000FFD5A700FFD9B100FEDAB200FFDCB600FEDDB800FEDEBB00FFE0
                  BE00FEE2C400FEE3C600FFE6CB00FEE5CA00FFEBD500FFEDDA00FFEFDD00FEF0
                  E100FEF3E7009A7F5F00FFE2C100FFE5C600FFE6C900FFEAD100FEE9D100FEED
                  D900FFF0DE00FEEFDE00FFF2E300FFF3E500FFF4E700FFF8F000FFD09200F4C7
                  8C00F7CE9A00FFEFDA00FFF7ED00FFFCF800F8D09800FFFBF500F4CF9600E6DA
                  C700FFFAF200FFDCA100E6D5B800A3937300FFFEFC00FAE3AD00DED4BD00EAE2
                  CE008F887600BDB08A00887F6500FBEFBA00FFF7C200FFF8C40056544700FFFB
                  DA00FFFAC900FEFCCF00FFFFD000D7D7B000FFFFD300FFFFD500AFAF9300FFFF
                  D800B5B59900E7E7C700FFFFDD00FFFFEB00FFFFEF00FFFFF300FFFFF400FFFF
                  F600FFFFFB0056574C0053602C0037383400535A51001F4A1700236D1800216A
                  1800379C2900379C2A0029961C00268C1E003B3C3B002A6C2C00E3EEEB002852
                  4C00FCFFFF00C9CACA0077B2B400FAFEFF00109AC1001588AB001E8FB5000E3C
                  4C001E566B0004A6ED00055F8E00CBE3EF0035546C00F8FCFF00BBD0E300CEDA
                  E5002C2D2E000759CF000024AC001628D5001D2EC900020FA000282DEE003941
                  EB00000289001717FF001818FF001B1BFF001C1CFF002626FF002024CD002828
                  FB002C2CFE003030FC002F2FF7003333FF003232F4002C2CD5003535FF003737
                  FE003838FF003939E5004141FF004242FA003E3EE5004747FF004848FF004444
                  E9004242E0004C4DFE004142D4003E3EBB003C3CAD004141BA003E3EA9004C4D
                  CE005C5CED005858D9006565F700484AAC006A6AFB004E4FB1005050B2004B4C
                  A6007575FF007979FF007A7AC6009797D8002222222222222222222222222222
                  2222222222222222222222222222222222222222222222222222222222222222
                  2222222243434343434343434343434343434343434343432222222243017E7A
                  6E6CB467646362614FB05D5F5A5959432222222243017F4A4955B46A68645150
                  CAC1AE735E5B594322222222430185454A71B4546B53655192C4C63547605C43
                  2222222243B3B4B4B4B4B4B4B4B4B4B4B5B9332A3CAFB1432222222243010101
                  3F87B47D7077766966B7342E2B3748432222222243010101018EB45672706E6D
                  74B440312F2C3A4322222222430101010101B4875672706E6CB4674232302939
                  222222224313FBE7DAD9CE0B164B727B6EB47452412D25BFBE22222243D1E6ED
                  F8F706DFD0C2B4B4B4B4B4B4B4ACC0C3CCD22222EBF1129038149117EEDE1145
                  4AB479546B53BCCBCDCF22E8F3159A86574682A5BB07E1138AB47C6F786B6924
                  D82222F4FC9F96958F815888991B03FA3FB4847D837775432222E2091DA49C9C
                  9C978B4C4E89F00426B228363B3D3E432222E80DC9BAA19EA0B6B6B6B623F90F
                  44444444444444432222E80EC8BDA9A1A2B6AD944D1EF50F4343434343434322
                  2222E00C210101A7A19DAB8D808CEF022222222222222222222222F618A80101
                  AAA6A398931AE3222222222222222222222222E40A20A801BAC7019B1CEC0222
                  222222222222222222222222E7F21927B8C51FFDEADB22222222222222222222
                  2222222222DDE5051008E9DCD7222222222222222222222222222222222222D6
                  D5D4D3222222222222222222222222222222}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 462
                Hint = 'Adicionar Servi'#231'o para Box espec'#237'fico- [BAS242]'
                Glyph.Data = {
                  CE020000424DCE020000000000008E0000002800000018000000180000000100
                  08000000000040020000520B0000520B000016000000160000000B233800001C
                  4800002A6A000031730000387300003884000638840000408400004884000040
                  8F0000488F00004898000058AB00006AAB000073AB000058B6000073B6000048
                  C0000084C000FF00FF001CC0FF00FFFFFF001300000000000000000000000000
                  0000000000131313131300121212121212121212121212121212121208001313
                  1313001212121212121212121212121212121212080800131313001212121212
                  1212121212121212121212120808080013130012121212121212121212121212
                  1212121208080808001300121212121212121212121212121212121208080808
                  0800001212121212121212121212121212121212080808080800001212121212
                  1212121212121212121212120808080808000012121212121212121212121212
                  1212121208080808080000121212121212121212121212121212121208080808
                  0800001212121212121212121212121212121212080808080800001414141414
                  141414141414141414141414080808080800130008080808080D0E1212121212
                  12121212140808080800131300080808080D0E12121212121212121212140808
                  0800131313000808080D0E121212121212121212121214080800131313130008
                  080D10121212121212121212121212140800131313131300080D0D1212121212
                  12121212121212121400131313131313000B0B0F0F0C0F0F0C0C0C0C0C0C0C11
                  11001313131313130103050909090A0A0907070A0A0706080013131313131313
                  0103020303030303030303040207060013131313000000000000010101010101
                  0101010102080013131313001212121212121212121212121212121202001313
                  1313130012121212121212121212121212121212001313131313130001010101
                  010101010101010101010101131313131313}
                OnClick = SpeedButton7Click
                ExplicitLeft = 462
              end
              inherited SpeedButton8: TSpeedButton
                Left = 405
                Hint = 'Adicionar Mec'#226'nico Espec'#237'fico para servi'#231'o - [BAS219]'
                Glyph.Data = {
                  D6050000424DD605000000000000960300002800000018000000180000000100
                  08000000000040020000120B0000120B0000D8000000D800000000000000FFFF
                  FF00FF00FF00FFFCFD00D7999800FEEEED00FDDFDC00FEE3E000F5634D00F990
                  8000FAA69A00FDDAD500FDEEEC00F0624800F2644A00F8694F00F76A5200FAA3
                  9300F7DDD900F7705700F8735900FA9A8800F6BDB100E45D3B00E85F4000EF6E
                  4E00F7785A00F97B5E00EC846A00E05C3800F57A5900FA7E5C00FB836000FA82
                  6200FD886600F9A68E00D1998A00C64C2700C54B2700D95B3200FD866000FB86
                  6200FC896600FB886600FB896600FD8B6800FC8A6800FB896700FB8A6700FC8B
                  6900FB8C6800D4552900D96F4900D88D7200CE552500C8521E00C85B2A00D98D
                  6A00C14F1700884524008745240005710A0008750D0024B53B0029BA430029B9
                  42002ABA44002FBE4A002FBF4C002EBD4A002FBE4B0033C1500034C2520035C3
                  540037C5570038C658003AC75A003BC85C003CC95E003DCA5F003FCC630040CC
                  640041CD660045D06B0046D16C0049D471004AD573004BD675004ED878004FD8
                  7A0050D97B0052DB7F0051DA7D0054DC800056DF840056DE830057DF850057DF
                  860058E08700A9ABAB00167FA400167EA2001888AF001886AC001780A500167C
                  A000167C9F002583AF002C88B30027739600328DB7006DADCB0070AFCC000063
                  9600006395000062940000609200034F7500034E740004547D00044F7600044F
                  7500044D7300096D9F00096A9C0007557B000A6EA10007517700095881001373
                  A2001B79A70016638900166388002281AE002583B0002582AF002985B1002E89
                  B40005537D00076698000A5882000B5881003BA0DE003799DE003AA1E60042AA
                  F20048B1F70046ADF2004CB4FD004BB3FC004AB2F9004FB7FF001D73B100379D
                  E8003694DA003DA4F30044ABFB0047AEFD0046ADFC0046ADFB0048AFFD0047AE
                  FC0047AEFB0049B0FF004AB1FD004AB2FD0049B0FC004DB4FF004DB4FE003EA4
                  FB003FA5FC003FA6FB0041A8FC0041A7FB0041A8FB0043AAFE0042A9FB0043AA
                  FB0045ACFD001E7BD2002C91EC00379CFA00379DFA0039A0FC00399FF9003AA0
                  FB003AA1FB003BA0FB003CA2FB001D83EC003294F7003395F8003396F8003395
                  F7003498F9003497F800399EFD002E8AF0002E8BEF00308EF300308FF3001E7F
                  ED00207AE600217EE900227EE8002B85EB00297FE200A7B1BD00196FDE001F76
                  E3002678E200637EA90090959E00FEFEFE00F1F1F100EDEDED00020202020202
                  0202020202020202023E3E3E3E02020202020202020202020202020202020202
                  023E413F3E02020202020202020202020202020202020202023E43423E020202
                  02020202020202020202020202020202023E48443E0202020202023B3B3B3B3B
                  3B3B3B3B3B020202023E4C493E02020202023B3A1D0D0810131B0F093E3E3E3E
                  3E3E504D3E3E3E3E3E3E3B37170E1421321F150A3E62605B585553514E4A4745
                  403E3B36181A2E302938070B3E6262615D595654524F4B48463E3B33192D2F2C
                  381103053E3D3D3D3E3E5A573E3D3D3D3E3D02271E312B203806D50C3923353B
                  023E5F5C3E02020202020226262A283816D7D6123822343C023E625E3E020202
                  0202020202261C04CFD4632438252502023E62623E0202020202020202D36768
                  656A696402020202023E62623E0202020202020266BDC9CBCCCAD0D166020202
                  023E3E3E3E02020202020277B3C7C1C3C3BEC8CDD26602020202020202020202
                  0202028AB4C4BBBCBCBAB6C0C5CE660202020202020202020202727898AAAEB0
                  B0ADA9B9C2C6660202020202020202020202737A9AB2A3A0A29E9CABB7BF6602
                  020202020202020202027179998F7F91A5A6A1B1A9B566020202020202020202
                  02027B7E7D7675909495A69FACB8660202020202020202020202856B817C7D92
                  97A8A49DAF66020202020202020202020202026E6F87848E9396A7A39B660202
                  0202020202020202020202866F70896D838D8C80660202020202020202020202
                  0202020202866C88828B74020202020202020202020202020202}
                OnClick = SpeedButton8Click
                ExplicitLeft = 405
              end
              inherited SpeedButton11: TSpeedButton
                Left = 519
                Hint = 'Enviar Produtos Com'#233'rcio Aberto - [BAS430]'
                Glyph.Data = {
                  36100000424D3610000000000000360000002800000020000000200000000100
                  20000000000000100000C40E0000C40E0000000000000000000014B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FCFF14B9FBFF14B5F6FF14B3F2FF14B3
                  F2FF14B4F3FF14B7F8FF14BAFCFF14B9FBFF14B9FBFF14B3F2FF14B2F1FF14B3
                  F1FF14B2F1FF14B4F3FF14B9FBFF14B9FBFF14B9FBFF14B3F2FF14B3F1FF14B3
                  F1FF14B3F1FF14B3F1FF14B3F1FF14B3F1FF14B3F2FF14B7F9FF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14BDFFFF159FD4FF177294FF194E62FF1A3A45FF1A38
                  42FF1A4251FF185E79FF1689B5FF14B6F6FF14C1FFFF194454FF1A2D33FF1A2E
                  35FF1A2E35FF1A3742FF15B0EDFF14BAFCFF15B3F1FF1A353EFF1A2F36FF1A2E
                  35FF1A2E35FF1A2E35FF1A2E35FF1A2E36FF1A3D4AFF15A4DDFF14B9FBFF14B9
                  FBFF14B9FBFF14BAFCFF177295FF1A2A30FF1B1B1AFF1B1B1AFF1B1C1BFF1B1C
                  1BFF1B1C1BFF1B1A19FF1B2021FF1A414FFF15B2EFFF18789DFF1B1411FF1B1C
                  1CFF1B1C1CFF1B1612FF17779CFF14BEFFFF15AFEDFF1B2325FF1B1C1CFF1B1C
                  1CFF1B1C1CFF1B1C1CFF1B1C1CFF1B1C1BFF194758FF14BDFFFF14B9FBFF14B9
                  FBFF14BBFEFF17769BFF1B1512FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1B1AFF1B282CFF15A7DFFF1B292EFF1B1D
                  1DFF1B1D1DFF1B1C1BFF1B2529FF14BFFFFF15B0EEFF1B2325FF1B1C1CFF1B1D
                  1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1A17FF1691C1FF14BCFFFF14B9FBFF14BE
                  FFFF168CBBFF1C1512FF1B1D1DFF1B1D1DFF1B1D1DFF1B1A19FF1B1613FF1B1A
                  1AFF1B1715FF1B1D1DFF1B1D1DFF1B1D1DFF1B1A18FF195269FF195B75FF1B1C
                  1CFF1B1D1DFF1B1D1DFF1B1715FF1681A9FF14BCFEFF186482FF194D61FF1B1A
                  19FF1B1D1DFF1B1D1DFF1B1B1AFF1A323BFF14C1FFFF14B9FBFF14B9FBFF14BA
                  FBFF1A333CFF1B1C1CFF1B1D1DFF1B1D1DFF1B1C1BFF1A3C48FF1693C3FF159E
                  D4FF177091FF1B1E1DFF1B1D1DFF1B1D1DFF1B1D1DFF1A2A30FF186F91FF1B22
                  24FF1B1D1DFF1B1D1DFF1B1D1DFF1A3B47FF14BAFBFF14BFFFFF185E79FF1B19
                  17FF1B1D1DFF1B1D1DFF1B130FFF168AB5FF14BCFFFF14B9FBFF14BAFDFF1597
                  C9FF1B2528FF1B1D1DFF1B1D1DFF1B1D1DFF1A2D34FF15ACE8FF14BAFDFF14B9
                  FBFF14C2FFFF17769BFF1B1816FF1B1D1DFF1B1D1DFF1B1C1BFF177294FF1A2E
                  35FF1B1D1DFF1B1D1DFF1B1D1DFF1B2629FF1694C6FF14B7F6FF1C1A18FF1B1D
                  1CFF1B1D1DFF1B1C1CFF1B2D35FF14B5F4FF14B9FBFF14B9FBFF14BBFDFF1782
                  ACFF1B2022FF1B1D1DFF1B1D1DFF1B1A1AFF185D77FF14C2FFFF14B9FBFF14B9
                  FBFF14B9FBFF14C0FFFF1B2021FF1B1C1CFF1B1D1DFF1B1B1BFF194D61FF1771
                  92FF1B1614FF1B1D1DFF1B1D1DFF1B1B1AFF186A89FF186885FF1B1815FF1B1D
                  1DFF1B1D1DFF1B1B1AFF186989FF14B8F9FF14B9FBFF14B9FBFF14BBFDFF167F
                  A8FF1B2021FF1B1D1DFF1B1D1DFF1B1918FF177698FF14BEFFFF14B9FBFF14B9
                  FBFF14B9FBFF14C3FFFF1B282DFF1B1C1BFF1B1D1DFF1B1C1BFF1A3F4CFF14B3
                  F2FF1B2022FF1B1C1CFF1B1D1DFF1B1D1CFF1B2C32FF1B2428FF1B1D1CFF1B1D
                  1DFF1B1D1DFF1B272BFF1697CAFF14B9FCFF14B9FBFF14B9FBFF14BBFDFF1687
                  B4FF1B2224FF1B1D1DFF1B1D1DFF1B1B1BFF185165FF14C0FFFF14B9FBFF14B9
                  FBFF14B9FBFF14BDFFFF176682FF1B1B1AFF1B1D1DFF1B1B1BFF194A5CFF14B7
                  F8FF186A8BFF1B1816FF1B1D1DFF1B1D1DFF1B1D1CFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1A3E4CFF14BCFEFF14B9FBFF14B9FBFF14B9FBFF14BAFCFF15A6
                  DFFF1B2629FF1B1D1DFF1B1D1DFF1B1D1DFF1B2326FF168BB9FF14C0FFFF14C1
                  FFFF14C0FFFF14B9FBFF14BAFCFF176684FF1B1B19FF1B1B1AFF186886FF14B8
                  FAFF15A4DCFF1B2326FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1815FF1784AEFF14BEFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14C0
                  FFFF194B5EFF1B1B1AFF1B1D1DFF1B1D1DFF1B1D1DFF1B2527FF194352FF194E
                  63FF195C75FF14B9FBFF14B9FBFF14BAFCFF176683FF1B1A19FF1694C5FF14BA
                  FCFF14B5F5FF194E60FF1B1C1CFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1C
                  1BFF1B282DFF14BEFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14BA
                  FDFF14B2EFFF1B2326FF1B1C1BFF1B1D1DFF1B1D1DFF1B1D1DFF1B1C1CFF1B1C
                  1BFF1B1613FF19556CFF14B9FBFF14B9FCFF14BFFFFF1598CAFF14BBFDFF14B9
                  FBFF14BBFEFF167EA5FF1B1F20FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B16
                  14FF17779DFF14BDFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14BCFFFF1598CCFF1A2E34FF1B1917FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1B1613FF185268FF14AEECFF14B9FBFF14BCFFFF14B9FBFF14B9
                  FBFF14B9FCFF14B3F2FF1B2A30FF1B1D1CFF1B1D1DFF1B1D1DFF1B1C1CFF1B27
                  2CFF15B0EFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14BAFCFF15A8E2FF19546AFF1B130EFF1B1817FF1B1B1AFF1B1B
                  1AFF1B1A19FF1B1714FF1B2528FF159ACFFF14BAFCFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14BFFFFF186A8BFF1C120DFF1B1714FF1B1714FF1B1511FF1860
                  7BFF14B8F9FF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14BEFFFF15ABE6FF187193FF194F65FF194A
                  5CFF185B75FF1786B0FF14BCFFFF14BBFEFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14BCFFFF15BAFBFF15BBFBFF15BBFBFF15BBFBFF14BB
                  FDFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14BAFDFF14BFFFFF14C2FFFF14C3
                  FFFF14C1FFFF14BDFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FCFF14B9FCFF14B9FCFF14B9FCFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 519
              end
              inherited SpeedButton12: TSpeedButton
                Left = 576
                Hint = 'Copiar Tipo de Servi'#231'o - [BAS531]'
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
                OnClick = SpeedButton12Click
                ExplicitLeft = 576
              end
              inherited SpeedButton23: TSpeedButton
                Left = 747
                Enabled = False
                ExplicitLeft = 747
              end
              inherited SpeedButton24: TSpeedButton
                Left = 690
                Hint = 'Atualizar informa'#231#245'es dos tipos de servi'#231'os'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton24Click
                ExplicitLeft = 690
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS018]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Left = 747
                Enabled = False
                ExplicitLeft = 747
              end
              object SpeedButton9: TSpeedButton
                Left = 349
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Definir tipo de servi'#231'os por empresa - [BAS530]'
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton9Click
              end
              object btAlterarDadosFiscais: TSpeedButton
                Left = 633
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Alterar Dados Fiscais - [BAS551]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFEFE1D1FCF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFAC6410B06B1ACA9B65E7D1B9FDFCFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB620DAB620DAB620DAB620DB16C
                  1DCA9B65E6D0B6FEFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DFB6ECBF6BF4DEB7AB620DAB620D
                  AB620DAB620DAB620DAB620DAB620DB47327CFA675EBDAC6FFFEFEFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0CD8CE29B19DA
                  9518AB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620D
                  B6772DD4AE82F1E5D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADEFFFE
                  F9F0CD8CE29B19DA9518AB620DAB620DAB620DAB620DAB620DAB620DAB620DAB
                  620DAB620DAB620DAB620DAB620DAD6613FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE652FFE75AEABF51E29B19DA9518AB620DAB620DAB620DAB620DAB62
                  0DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE650FFE650E6B731E29B19DA9518AB620DAB620D
                  AB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB62
                  0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650FFE650E6B731E29B19DA
                  9518AB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620D
                  AB620DAB620DAB620DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650FFE6
                  50E6B731E29B19DA9518AB620DAB620DAB620DAB620DAB620DAB620DAB620DAB
                  620DAB620DAB620DAB620DAB620DAB620DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE650FFE650E6B731E29B19DA9518AC630DAB620DAB620DAB620DAB62
                  0DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE650FFE650E6B731E29B19E19A19D08B16BD7812
                  AF680EAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB620DAB62
                  0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650FFE650E6B731E29B19E2
                  9B19E29B19E19A19DD9819D08B16BD7812B0670EAB620DAB620DAB620DAB620D
                  AB620DAB620DAB620DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE650FFE6
                  50EBC83EE2A320E29B19E29B19E29B19E29B19E29B19E19A19DB9719CB8715BA
                  7511AE660EAB620DAB620DAB620DAB620DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE650FFE650FEE550F9E04EEECF42E6B731E3A320E29B19E29B19E29B
                  19E29B19E29B19E19A19DB9619C88414C18539B06B1AAC6410FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFE653FFE650FFE650FFE650FFE650FEE550F9E04E
                  EDCD41E6B32DE3A01EE29B19E29B19E29B19E29B19E29B19F0CD8CFCF9F6EFE1
                  D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE2FFF2A4FFE967FFE650FF
                  E650FFE650FFE650FFE650FEE550F8DE4CEDCA3FE6B32DE29F1DE29B19E29B19
                  F0CD8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFBE1FFF2A7FFE967FFE650FFE650FFE650FFE650FFE650FDE44FF5
                  DC4CF6E0B9ECBF6BF6DFB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF9D6FFF19BFFE860FFE6
                  50FFE650FFE650FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFCFFF8CCFFEF90FFE75AFFE652FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9FFFADEFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = btAlterarDadosFiscaisClick
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 453
              ExplicitHeight = 453
              inherited ScrollBox2: TScrollBox
                Height = 436
                ExplicitHeight = 436
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 888
          ExplicitHeight = 587
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object GroupBox68: TGroupBox
            Left = 0
            Top = 0
            Width = 888
            Height = 73
            Cursor = crMultiDrag
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Tipo de Servi'#231'o'
            Ctl3D = True
            ParentBiDiMode = False
            ParentCtl3D = False
            TabOrder = 0
            object DBText27: TDBText
              Left = 88
              Top = 24
              Width = 55
              Height = 13
              Alignment = taCenter
              AutoSize = True
              BiDiMode = bdLeftToRight
              DataField = 'DESC_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              Transparent = False
            end
            object DBText28: TDBText
              Left = 54
              Top = 47
              Width = 100
              Height = 17
              DataField = 'COD_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText29: TDBText
              Left = 214
              Top = 47
              Width = 72
              Height = 17
              DataField = 'CODIGO_NOP'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label201: TLabel
              Left = 8
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
            object Label202: TLabel
              Left = 177
              Top = 47
              Width = 31
              Height = 13
              Caption = 'CFOP:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText30: TDBText
              Left = 358
              Top = 47
              Width = 68
              Height = 17
              DataField = 'VALOR_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label203: TLabel
              Left = 319
              Top = 47
              Width = 32
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Valor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label216: TLabel
              Left = 477
              Top = 47
              Width = 49
              Height = 13
              Caption = 'Unidade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText32: TDBText
              Left = 533
              Top = 48
              Width = 88
              Height = 17
              DataField = 'UNIDADE'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText33: TDBText
              Left = 682
              Top = 47
              Width = 83
              Height = 17
              DataField = 'TMO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label218: TLabel
              Left = 644
              Top = 47
              Width = 28
              Height = 13
              Caption = 'TMO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object GroupBox4: TGroupBox
            Left = 0
            Top = 73
            Width = 888
            Height = 514
            Align = alClient
            Caption = 'Tipo de Servi'#231'os por Mec'#226'nicos'
            TabOrder = 1
            object BitBtn9: TBitBtn
              Left = 260
              Top = 375
              Width = 75
              Height = 25
              Hint = 'Adicionar Mec'#226'nico - [BAS220]'
              Caption = '&Adicinar'
              TabOrder = 0
              OnClick = BitBtn9Click
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
            object BitBtn10: TBitBtn
              Left = 607
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Remover Mec'#226'nico - [BAS221]'
              Caption = '&Remover'
              TabOrder = 1
              OnClick = BitBtn10Click
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
            object BitBtn11: TBitBtn
              Left = 688
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              TabOrder = 2
              OnClick = BitBtn11Click
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
            object GroupBox5: TGroupBox
              Left = 18
              Top = 24
              Width = 336
              Height = 345
              Caption = 'Mec'#226'nicos'
              TabOrder = 3
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 332
                Height = 328
                Hint = '[Ins : Incluir] - Usu'#225'rios do Sistema'
                Align = alClient
                DataSource = dtmProdutos.dsUsuario
                Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_VENDEDOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_VENDEDOR'
                    Visible = True
                  end>
              end
            end
            object GroupBox6: TGroupBox
              Left = 368
              Top = 24
              Width = 397
              Height = 345
              Caption = 'Mec'#226'nicos Adicionados'
              TabOrder = 4
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 393
                Height = 328
                Hint = '[Ins : Incluir] - Usu'#225'rios do Sistema'
                Align = alClient
                DataSource = dtmProdutos.dsMecanicoServ
                Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_VENDEDOR'
                    Title.Caption = ' '
                    Width = 39
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_VENDEDOR'
                    Title.Caption = 'Mec'#226'nico'
                    Width = 130
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'USUARIO_AUTORIZOU'
                    Title.Caption = 'Usu'#225'rio que Autorizou'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_EXECAO'
                    Title.Caption = 'Data Autoriza'#231#227'o'
                    Width = 90
                    Visible = True
                  end>
              end
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 4
          object GroupBox7: TGroupBox
            Left = 0
            Top = 0
            Width = 888
            Height = 73
            Cursor = crMultiDrag
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Tipo de Servi'#231'o'
            Ctl3D = True
            ParentBiDiMode = False
            ParentCtl3D = False
            TabOrder = 0
            object DBText1: TDBText
              Left = 88
              Top = 24
              Width = 48
              Height = 13
              Alignment = taCenter
              AutoSize = True
              BiDiMode = bdLeftToRight
              DataField = 'DESC_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              Transparent = False
            end
            object DBText2: TDBText
              Left = 54
              Top = 47
              Width = 100
              Height = 17
              DataField = 'COD_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 214
              Top = 47
              Width = 72
              Height = 17
              DataField = 'CODIGO_NOP'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label31: TLabel
              Left = 8
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
            object Label32: TLabel
              Left = 177
              Top = 47
              Width = 31
              Height = 13
              Caption = 'CFOP:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText4: TDBText
              Left = 358
              Top = 47
              Width = 68
              Height = 17
              DataField = 'VALOR_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 319
              Top = 47
              Width = 32
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Valor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label34: TLabel
              Left = 477
              Top = 47
              Width = 49
              Height = 13
              Caption = 'Unidade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText5: TDBText
              Left = 533
              Top = 48
              Width = 88
              Height = 17
              DataField = 'UNIDADE'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText6: TDBText
              Left = 682
              Top = 47
              Width = 83
              Height = 17
              DataField = 'TMO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 644
              Top = 47
              Width = 28
              Height = 13
              Caption = 'TMO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object GroupBox8: TGroupBox
            Left = 0
            Top = 73
            Width = 888
            Height = 514
            Align = alClient
            Caption = 'Tipo de Servi'#231'os por Box'
            TabOrder = 1
            object BitBtn7: TBitBtn
              Left = 260
              Top = 375
              Width = 75
              Height = 25
              Hint = 'Adicionar Box - [BAS243]'
              Caption = '&Adicinar'
              TabOrder = 0
              OnClick = BitBtn7Click
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
            object BitBtn8: TBitBtn
              Left = 607
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Remover Box - [BAS244]'
              Caption = '&Remover'
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
              Left = 688
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              TabOrder = 2
              OnClick = BitBtn11Click
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
            object GroupBox9: TGroupBox
              Left = 18
              Top = 24
              Width = 336
              Height = 345
              Caption = 'Box'
              TabOrder = 3
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 332
                Height = 328
                Hint = '[Ins : Incluir] - Usu'#225'rios do Sistema'
                Align = alClient
                DataSource = dtmProdutos.dsBox
                Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_BOX'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_BOX'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TMO_SERVICOS'
                    Visible = True
                  end>
              end
            end
            object GroupBox10: TGroupBox
              Left = 368
              Top = 24
              Width = 397
              Height = 345
              Caption = 'Box Adicionados'
              TabOrder = 4
              object DBGrid5: TDBGrid
                Left = 2
                Top = 15
                Width = 393
                Height = 328
                Hint = '[Ins : Incluir] - Usu'#225'rios do Sistema'
                Align = alClient
                DataSource = dtmProdutos.dsBoxServ
                Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_BOX'
                    Title.Caption = ' '
                    Width = 20
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_BOX'
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 140
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'USUARIO_AUTORIZOU'
                    Title.Caption = 'Usu'#225'rio que Autorizou'
                    Width = 130
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_EXECAO'
                    Title.Caption = 'Data Autoriza'#231#227'o'
                    Width = 90
                    Visible = True
                  end>
              end
            end
          end
        end
        object tsDadosComercioAberto: TTabSheet
          Caption = 'tsDadosComercioAberto'
          ImageIndex = 5
          object pnDadosComercioAberto: TPanel
            Left = 3
            Top = 3
            Width = 310
            Height = 118
            TabOrder = 0
            object pnButtonComercioAberto: TPanel
              Left = 1
              Top = 82
              Width = 308
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object pnOKDadosComercioAberto: TBitBtn
                Left = 74
                Top = 3
                Width = 75
                Height = 25
                Hint = 'OK - [BAS431]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = pnOKDadosComercioAbertoClick
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
              object pnCancDadosComercioAberto: TBitBtn
                Left = 155
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = pnCancDadosComercioAbertoClick
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
            object RadioGroupOpcoesComercioAberto: TRadioGroup
              Left = 1
              Top = 1
              Width = 308
              Height = 81
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Enviar Tipo de Servi'#231'o'
                'Remover Tipo de Servi'#231'o')
              TabOrder = 0
            end
          end
        end
        object tsMultiempresa: TTabSheet
          Caption = 'tsMultiempresa'
          ImageIndex = 6
          object pnMultiempresa: TPanel
            Left = 1
            Top = 3
            Width = 704
            Height = 286
            TabOrder = 0
            OnEnter = pnMultiempresaEnter
            object pnMultiempresaBottom: TPanel
              Left = 1
              Top = 251
              Width = 702
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btnMultiempresaOK: TBitBtn
                Left = 271
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK - [BAS530]'
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
            object DBGridMultiempresa: TDBGrid
              Left = 1
              Top = 73
              Width = 702
              Height = 178
              Align = alClient
              DataSource = dtmProdutos.dsEmpresaTipoServ
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridMultiempresaCellClick
              OnDrawColumnCell = DBGridMultiempresaDrawColumnCell
              OnKeyDown = DBGridMultiempresaKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
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
            object Panel4: TPanel
              Left = 1
              Top = 1
              Width = 702
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'DEFINIR TIPO DE SERVI'#199'OS POR EMPRESA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object pnDefinirTipoServicoPorEmpresaTop: TPanel
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
              TabOrder = 3
              object SpeedButtonMultiempresaSel: TSpeedButton
                Left = 643
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Selecionar todas'
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
                OnClick = SpeedButtonMultiempresaSelClick
              end
              object SpeedButtonMultiempresaDesm: TSpeedButton
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
                OnClick = SpeedButtonMultiempresaDesmClick
              end
            end
          end
        end
        object tsCadTipoServ: TTabSheet
          Caption = 'tsCadTipoServ'
          ImageIndex = 7
          object pnCadTipoServ: TPanel
            Left = 3
            Top = 3
            Width = 454
            Height = 126
            TabOrder = 0
            OnEnter = pnCadTipoServEnter
            object Label42: TLabel
              Left = 27
              Top = 24
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descri'#231#227'o:'
            end
            object Label43: TLabel
              Left = 51
              Top = 56
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sigla:'
            end
            object EditDescricaoTipoTipoServ: TEdit
              Left = 83
              Top = 21
              Width = 350
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 80
              TabOrder = 0
              Text = 'EDIT1'
            end
            object EditSiglaTipoTipoServ: TEdit
              Left = 83
              Top = 53
              Width = 38
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 1
              TabOrder = 1
              Text = 'EDIT2'
            end
            object Panel5: TPanel
              Left = 1
              Top = 91
              Width = 452
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object btnCadTipoServOK: TBitBtn
                Left = 146
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnCadTipoServOKClick
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
              object btnCadTipoServCancel: TBitBtn
                Left = 227
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnCadTipoServCancelClick
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
        end
        object tsAlterDadosServ: TTabSheet
          Caption = 'tsAlterDadosServ'
          ImageIndex = 8
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 888
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosServ: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosServClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 888
            Height = 57
            Align = alTop
            Caption = 'Tipo de Servi'#231'o'
            TabOrder = 1
            object DBText7: TDBText
              Left = 32
              Top = 24
              Width = 48
              Height = 13
              AutoSize = True
              DataField = 'DESC_SERVICO'
              DataSource = dtmProdutos.dsTipoServ
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btVoltarDadosServ2: TBitBtn
              Left = 726
              Top = 19
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosServClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 167
            Width = 888
            Height = 420
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object pnCenterAlterDadosProd: TPanel
              Left = 0
              Top = 0
              Width = 884
              Height = 72
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarServico: TSpeedButton
                Left = 55
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [BAS016]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarServicoClick
              end
              object SpeedBSelTodos: TSpeedButton
                Left = 834
                Top = 8
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
                OnClick = SpeedBSelTodosClick
              end
              object SpeedBDesmarcarTodos: TSpeedButton
                Left = 860
                Top = 8
                Width = 23
                Height = 21
                Hint = '[ F4 ] - Desfazer sele'#231#227'o'
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
                OnClick = SpeedBDesmarcarTodosClick
              end
              object SpeedButtonAlterarProduto2: TSpeedButton
                Left = 2
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [BAS560]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarProduto2Click
              end
              object lbCorLote: TLabel
                Left = 687
                Top = 4
                Width = 96
                Height = 13
                Caption = 'Produtos sem grupo'
              end
              object btExcluirRegistro: TSpeedButton
                Left = 108
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Enviar para Lixeira -  [BAS085]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
                  FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object btLixeiraVazia: TSpeedButton
                Left = 161
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Lixeira vazia'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000C30E0000C30E00000001000000010000009C0000089C
                  080010A5100018A5180021A5210029AD290031AD310039B5390042B542004AB5
                  4A0052BD52005ABD5A0063C65A006BC6630073C66300EFB56B007BC66B007373
                  7300EFB57300F7B57300F7BD73007BC6730073CE73007B7B7B00F7BD7B008CCE
                  7B00F7BD8400F7C68400FFC6840094CE84008CD684008C8C8C00EFBD8C00F7C6
                  8C00FFC68C0094D68C00949494009C9C9400A5A59400B5AD9400F7C69400FFC6
                  9400F7CE9400FFCE940094D694009CD69400BDD694009CDE9400B5DE94009C9C
                  9C00A5A59C00ADAD9C00C6B59C00D6BD9C00DEBD9C00FFCE9C00CED69C00FFD6
                  9C00B5DE9C00C6DE9C00CEDE9C00A5A5A500ADADA500BDBDA500C6BDA500D6C6
                  A500EFD6A500FFD6A500ADDEA500D6DEA500F7DEA500ADADAD00B5B5AD00C6C6
                  AD00D6C6AD00DEC6AD00FFD6AD00FFDEAD00D6E7AD00B5B5B500C6BDB500D6C6
                  B500DEC6B500D6CEB500E7CEB500E7DEB500FFDEB500C6E7B500DEE7B500E7E7
                  B500EFE7B500FFE7B500D6CEBD00DECEBD00FFE7BD00CEEFBD00DEEFBD00F7EF
                  BD00FFEFBD00CEEFC600D6EFC600DEEFC600F7EFC600FFEFC600F7EFCE00FFF7
                  CE00FFF7D600FFFFD600E7F7DE00FFF7DE00FFFFDE00F7FFE700FFFFE700FFFF
                  EF00FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373737373
                  73495353534033482573737373737373737373737373735E5E5E5E5B5656565E
                  673F2647737373737373737373735E5E675E564D4D5656565E67676724737373
                  7373737373735E675E5E564C43594E676A6D6D696748737373737373735C5E69
                  5E5B4D433758061907082C6F6A673E737373737373210F5E69694D4343380000
                  0000000A6D6E674F7373737373211212185E69695E2E0000010C09011E5E4224
                  7373737373211A1A1A1A1A212A2E0000026C6F4405612A31737373735C212121
                  2121212143380402000B71682D2E28254773737321292929292929295E3B5960
                  574472706D3A37263D73737321373737373737374D15666A5F06080B2D683727
                  3D73737321434343434343434C0E1D696E150000086743342473735C4D565656
                  565656565645020D5F2D000008675641247373215E5E5E5E5E5E5E5E5E5E1000
                  0100000008675E551F73732167676767676767676767660E0301020708696768
                  1F7373216A6A6A6A6A6A6A6A6A6A6A6A6457636F236A6A6A177373216E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E177373216E6E6E6E6E6E6E6E6A5E5B46
                  4656676A6E6E6E6E17737354696B6B6B6A695E2A1A120F121212181B46696E6E
                  17737373512121212151351A121212121218181A1A215B6E1173737373737373
                  737373737373351A18181A1A1B21214C11737373737373737373737373737373
                  4A201A1B21212929117373737373737373737373737373737373412121222928
                  31737373737373737373737373737373737373734B2035507373}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton25Click
              end
              object btRestaurarRegistro: TSpeedButton
                Left = 215
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Recuperar registro - [BAS019]'
                Flat = True
                Glyph.Data = {
                  72040000424D7204000000000000320200002800000018000000180000000100
                  08000000000040020000120B0000120B00007F0000007F00000000000000FFFF
                  FF00FF00FF0000520200005101000051020000500100004F0100015703000156
                  03000155030001540300015302000153030001520200025A0400025904000258
                  040002570300025704000159040001580400025C0500025B0500037909000372
                  080003630700047D0A00047A0A0003600600035F070006910D00056209000562
                  0A00058F0D00058E0D00058C0D0006900E00068F0F00068E0E00079111000790
                  1000056A0B000896120007790E0009931300076A0E000A961400086A0F000A96
                  15000B9617000C9717000A7D13000A7B14000D991B00096D11000A7413000E9A
                  1C000A6E13000F9D1F00109F1F000C741700119F22000E841B000D7919000D78
                  180012A022000D761800108B1D000F831B000F7E1C001398230013A3270014A4
                  260015A7280016A72B0016A62A001181200018AA2D0018A92D00169528001383
                  23001689270019AB2F00169229001AAA31001CAF35001CAD33001BA531001A9F
                  2F0018952C00178C2A001FB439001FB43B001C9932001C99340022B63E001C98
                  33001F9C37001FA1390025BD440025BB430023AA400021A13B0022A03C0027B1
                  440027BC48002CC64F002CC44F0027AF45002CC14E0028B0470028AD470028AC
                  46002DBF4F002DC452002FBD540035D05E0036D05F0035CC5F0038D3640035CA
                  5F003CD86A003CD76A003BD1680042E2760041DC720002020202020202020202
                  0202020202020202020202020202020202020902020202020202020202020202
                  0202020202020202020909020202020202020202020202020202020202020202
                  02091102020202020202020202020202020202020202020202112A1302020202
                  02020202020202020202020202020202020F4010020202020202020202020202
                  0202020202020202020F5E1A0202020202020202060602020202020202020202
                  02146F410D020202020202020920060202020202020202020215746313020202
                  020202020A1820060202020202020202020A7079430D02020202020204681820
                  0602020202020202020D527D6D210A0202020202066226182004020202020202
                  02023A7C7B69371D090E0504075F2B23193006020202020202020B617E78725A
                  38343545502C2F2523183D06020202020202020A717A76736A60564F483B3229
                  24221B5B0A020202020202020B6777756C655D574C42362D27241F1C0A020202
                  02020202020B4D666E6B645C53493B332822510C02020202020202020202090D
                  46545958554E3E3931410602020202020202020202020202090B0D0A16474A3C
                  2E0602020202020202020202020202020202020212444B1E0302020202020202
                  020202020202020202020202103F170D02020202020202020202020202020202
                  0202020208090902020202020202020202020202020202020202020209090202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton5Click
              end
              object btLixeiraCheia: TSpeedButton
                Left = 162
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Ver registros da lixeira - [BAS018]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFEFFFFFFFFFFFFFFFFFEFFE8E8E0D1D1C9DDDCDFDEDFE1B7BEC2CCCDCEE3D9
                  DDF6EBEEFFF8FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBC3C0B6CBC8B8D7CFB8EAE3B3E3E1B0
                  D0D1A4BFBF9FB2AE9D95928B98A097BDCDC1FCFAFDFFFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2D0F8EFD9F7E7CDFB
                  E4C6FBE6B4FDE3B4EDD1AADBBEA1EAD2BAF8EED5DFE1C2B0B899948883B8AEAD
                  FEFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFCFCF5F8F5
                  D5FCEFCCFDE6C5FDE0C3E6CBBADBB4AEE8B5B7FAD2D0DFB5A7FCDDC3FDE4C3FD
                  E8C8F7EBDCC2B8AE8E867ED1D0CEFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFDE1D7B6FEF6CDFDEAC3FDE3C4EACDB6D4C5B4D4BBB6DFC0C0D6C7BBE5EA
                  CAEBF6D3F4FBD9F7F9DFE9F5D4F4F4D9ECE3D18F897FCBD0CCFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEF7D4BC93E9CFA2FFF1CDEAD2BCE4CFC5DCC9C6D5C1C1
                  D6D5C566975E5AC45D28AA2D2BA3344EAC54B2E4ADE9FCD0FCF9DBF1EADA9691
                  8BFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D7DCB588D9B082F4D3B5F5E1D8DE
                  D1D7F1CEDFE4C5D0D3DDC552A44D05990700A200019202178B191F8527B3DFA0
                  FBFCD3FEEFD8A99B92E5E7E4FFFFFFFFFFFFFFFFFFFFFFFFF8DEBBE7B78AF2C5
                  9CFFF0D8ECE0DFE2DCE7F7D9D8EECDC4C9D4A7369B040995000498046CC96AAA
                  D8A649AF57478D39EFF7C3DDC6A4B5A293DBD9D8FDF2FDFFFFFFFFFFFFFFFFFD
                  F7C8ACE9B99AFCEFD9F0F3EAEDEBEEFAE8EFF6D4CBCFAEA1BBCE963499011391
                  03009E0555B75DEAF8EADDF6DD8CBB79AEC789D6D190BEAE89CDCACCECE5ECFF
                  FFFFFFFFFFFFF8ECF1C1A8F4D3B7FFFFEFF7FEFAF9F4F8FDE2F1DE9CBAD3C2B6
                  D7E7C1B7CAA585B77B55B74F50A846C6E5B8E6F7DFDCFAC6B0BF8CEFDBA4D7BA
                  9BBBB1B5E8DDE8FDFDFDFFFFFFF6EADBE8C5ADFDF0D7FBFEEEFAFEFCFFF9FDE2
                  B4C1E09DBACEBBB0B3CA9EE3EFD1F1E9E0F6F1E59CC38EA1E497BCE3B5CAF3B5
                  E4E9C2FEDDB6F3C7B3AD9DA1F2FFF0FFFFFFFFFFFFEFDDD0E8D1B9FFFEE7F7FC
                  EEFBFEFBFAE9EBCB9C9FD5ACA1DFB4AFC8CCA788C479DDF9D2FBEAF6A5BDA509
                  85141E841D2C841CCFEDB4F4D6AEFECFBFA99398F3FCEDFFFFFFFFFFFFE7D7C8
                  F6EAD0FEFFE7F8FFEFF9FCF5D5C3C1D0A9A5D2B2A6E6B3BDE4E0C841973966CA
                  68D4FAD4D1FFD621A92B0198020F9608BDFBAEE7DCA9FFD8C0AC9697EDF3E4FF
                  FEFFFFFFFFE8DCC9FEF9DEFFFEE5FCFEEDF9F8ECE5D8CDF8E8E0FDE2F3E2CBD9
                  CBD2C5A9DCA71C841C139D131FA319198B0E069A05049304B3FAADEEEDB8FEE0
                  C1AD9B97EFF2E5FFFEFFFFFFFFF2E6CEFFFFE0FFFDDFFEFDEAFCFBEBFDFCE9FE
                  FEECFCF5FDE3EDE9DEE7E1DFE0DE9FCA9C1B8F1911900929851824921D208B1E
                  C2F2C0F4EFC6FFEBCAB2AA9DE2EBDAFFFFFFFFFFFFFFFADFFDFAD6FEFCDCFDF8
                  DDFAF9E5F8FBE4F1FCE0E5FFE4EAFFEAF7FAF6F1DEEDF0E9ECD8F9D5A2DCA199
                  D898CEFFC795CC92D3E9D1FFF8DDFFF5D5BABAA7D3E0CCFFFFFFFFFFFFFFFFF0
                  F6FDDDF3FDD9F7FEDBFAFDE2F4FCE7EEFEEEDEFFF3E7FFFAF5FFFCFCFAF8F2EE
                  E8F5F8EBF9FFF3F5FFF1F3FDF9F3FBF2F5F8E8FFFEE5FDFADDCBC9B4CFCEC0FF
                  FCFFFFFFFFFFFCE3FDFDDBFDFEDAFFFED9FAF8D8F2FCE3ECFEECE7FDF8E7F8F4
                  EFF3EFFAF3EFEDE1DBEEE2DAF9EFE7FEFCF4F9F8F4FFFEF7FEFDE7FFFEE2FEFC
                  E0D5D3C1B8B8B1FFFFFFFFFFFFF6EDD4FDF8DBFFFCDAFFFADBFCF8E0EDF5E0D9
                  F3E0DDF0EBEAF6F4FAFBFAFFFCFBECE1E0DACBC8F9EFECFFFDF7F1E5D3D9C8AF
                  F8EBCAFFFBD7FFFEDEE7E4D1ADB0AEFFFFFFFFFFFFFCFAF2EDE0CEF4DFCCF8E5
                  D3F0E8D8D5E7D8D8FBF0E5FFFEEAFFFFF1FFFFF5FDFCEBF0EFD8DBDBF9FCFCFA
                  FCF8EBCEAADEBA8DE2C18EF0D6A2FFF8CFF7F0D9A7A59FFFFEFFFFFFFFFFFFFF
                  FFFEFFFFFFFFFFFEFFFFFCFFD8EEEDCFFAF8D4FEFCD7FFFDDCFEFEDDFEFDD9FB
                  FBCDF0EFDAFCFCDFFAF4E8C494F2C184F7C685F3C587F1CD99FCEBCCADA296FF
                  FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3F4FAD0F5F8C8EEEFC9F2F2
                  CDF8F7CCFAFACDFEFFCAFEFFC2F9FABDE8E3DDBE90F3C289FDCA8AFAC98BF8CE
                  9AE0C4A2C5B7A8FFFDFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF5FFFFDBF5F7CEF0F2C7F3F7C2F4F9C2F8FD98C5C7DCC8A9E9C59C
                  EDC394F4C898E8C29ADEC6ACF2EAE1FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDCF8FDCFF4FCBFEBF6B0
                  D6DDFDFBEDFDF3DBF6E4C3F4DDBAF8E8C9FDF4E4FFF4FFFFFFFF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton25Click
              end
              object SpeedButton68: TSpeedButton
                Left = 857
                Top = 40
                Width = 23
                Height = 21
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
                OnClick = SpeedButton68Click
              end
              object pnCorLote: TPanel
                Left = 614
                Top = 4
                Width = 49
                Height = 13
                BevelOuter = bvNone
                Color = 13303807
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 534
                Top = 3
                Width = 299
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ckPermOpcaoMarcadasClick
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 9
          object ScrollBoxAlterDadosLote: TScrollBox
            Left = 0
            Top = 0
            Width = 888
            Height = 558
            Align = alClient
            TabOrder = 0
            object GroupBox12: TGroupBox
              Left = 0
              Top = 0
              Width = 884
              Height = 550
              Align = alTop
              Caption = 'ATUALIZAR INFORMA'#199#213'ES DO TIPO DE SERVI'#199'O'
              TabOrder = 0
              object Label473: TLabel
                Left = 8
                Top = 13
                Width = 881
                Height = 13
                Caption = 
                  'Dados  do Produto        -                    -                 ' +
                  '   -                    -                    -                  ' +
                  '  -                    -                    -                   ' +
                  ' -                    -                    -                    ' +
                  '-                    '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label47: TLabel
                Left = 8
                Top = 248
                Width = 863
                Height = 13
                Caption = 
                  'Dados  Fiscais        -                    -                    ' +
                  '-                    -                    -                    -' +
                  '                    -                    -                    - ' +
                  '                   -                    -                    -  ' +
                  '                  -'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object pnVendaOnline: TPanel
                Left = 1
                Top = 223
                Width = 280
                Height = 28
                TabOrder = 14
                object lbVendaOnline: TLabel
                  Left = 119
                  Top = 7
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Venda Online'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clMenuText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckVendaOnline: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 27
                  Height = 17
                  TabOrder = 0
                  OnClick = ckVendaOnlineClick
                end
                object cbVendaOnline: TComboBox
                  Left = 188
                  Top = 4
                  Width = 80
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 1
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnCFOP: TPanel
                Left = 1
                Top = 25
                Width = 562
                Height = 28
                TabOrder = 0
                object lbGrupoProd: TLabel
                  Left = 155
                  Top = 7
                  Width = 27
                  Height = 13
                  Caption = 'CFOP'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckCFOP: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 27
                  Height = 17
                  TabOrder = 0
                  OnClick = ckCFOPClick
                end
                object EdCodCFOP: TEditHw
                  Left = 188
                  Top = 4
                  Width = 42
                  Height = 21
                  TabOrder = 1
                  Text = '0'
                  OnExit = EdCodCFOPExit
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object DBLCfop: TDBLookupComboBox
                  Left = 231
                  Top = 4
                  Width = 250
                  Height = 21
                  KeyField = 'CODIGO_NOP'
                  ListField = 'DESCRICAO_NOP'
                  ListSource = dtmProdutos.dsCFOP
                  TabOrder = 2
                  OnExit = DBLCfopExit
                end
              end
              object pnAliqIss: TPanel
                Left = 565
                Top = 25
                Width = 280
                Height = 28
                TabOrder = 1
                object lbAliqIss: TLabel
                  Left = 124
                  Top = 7
                  Width = 58
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Aliquota ISS'
                end
                object ckAliqIss: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 40
                  Height = 17
                  TabOrder = 0
                  OnClick = ckAliqIssClick
                end
                object EdAliqIss: TEditHw
                  Left = 188
                  Top = 4
                  Width = 47
                  Height = 21
                  TabOrder = 1
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
              end
              object pnServicoIsento: TPanel
                Left = 1
                Top = 53
                Width = 280
                Height = 28
                TabOrder = 2
                object lbServicoIsento: TLabel
                  Left = 113
                  Top = 7
                  Width = 69
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Servi'#231'o Isento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox22: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckServicoIsento: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckServicoIsentoClick
                end
                object cbServicoIsento: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Servi'#231'o Isento'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnNaoIncidencia: TPanel
                Left = 283
                Top = 53
                Width = 280
                Height = 28
                TabOrder = 3
                object lbNaoIncidencia: TLabel
                  Left = 112
                  Top = 7
                  Width = 70
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N'#227'o Incid'#234'ncia'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox2: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckNaoIncidencia: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNaoIncidenciaClick
                end
                object cbNaoIncidencia: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'N'#227'o Incid'#234'ncia no Servi'#231'o'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnTmoSimultaneo: TPanel
                Left = 1
                Top = 81
                Width = 280
                Height = 28
                TabOrder = 4
                object lbTmoSimultaneo: TLabel
                  Left = 107
                  Top = 7
                  Width = 75
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tmo Simult'#226'neo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox4: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckTmoSimultaneo: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTmoSimultaneoClick
                end
                object cbTmoSimultaneo: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'TMO simult'#226'neo'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnTmo: TPanel
                Left = 283
                Top = 81
                Width = 280
                Height = 28
                TabOrder = 5
                object lbTmo: TLabel
                  Left = 160
                  Top = 6
                  Width = 22
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'TMO'
                end
                object EdTmo: TEditHw
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  TabOrder = 1
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object ckTmo: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 40
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTmoClick
                end
              end
              object pnAltValorCupom: TPanel
                Left = 1
                Top = 109
                Width = 280
                Height = 28
                TabOrder = 6
                object lbAltValorCupom: TLabel
                  Left = 102
                  Top = 7
                  Width = 80
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Alt. Valor Cupom'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox5: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckAltValorCupom: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckAltValorCupomClick
                end
                object cbAltValorCupom: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Altera valor do servi'#231'o na venda'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnAltDescricao: TPanel
                Left = 283
                Top = 109
                Width = 280
                Height = 28
                TabOrder = 7
                object lbAltDescricao: TLabel
                  Left = 116
                  Top = 7
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Alt. Descri'#231#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox6: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckAltDescricao: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckAltDescricaoClick
                end
                object cbAltDescricao: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Produto para consumo ou n'#227'o'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnServicoGarantia: TPanel
                Left = 565
                Top = 109
                Width = 280
                Height = 28
                TabOrder = 8
                object lbServicoGarantia: TLabel
                  Left = 103
                  Top = 7
                  Width = 79
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Servi'#231'o Garantia'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox7: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckServicoGarantia: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckServicoGarantiaClick
                end
                object cbServicoGarantia: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Servi'#231'o pago pela Honda'
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = ' '
                  Items.Strings = (
                    ' '
                    'N'
                    'S')
                end
              end
              object pnOrigemServ: TPanel
                Left = 1
                Top = 138
                Width = 343
                Height = 28
                TabOrder = 9
                object lbOrigemServ: TLabel
                  Left = 110
                  Top = 7
                  Width = 72
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Origem Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox8: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckOrigemServ: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckOrigemServClick
                end
                object DbLOrigemServ: TDBLookupComboBox
                  Left = 188
                  Top = 4
                  Width = 145
                  Height = 21
                  Hint = 'Origem servi'#231'o'
                  DropDownRows = 8
                  KeyField = 'SIGLA'
                  ListField = 'SIGLA_DESCRICAO'
                  ListSource = dtmProdutos.dsTipoTipoServ
                  TabOrder = 2
                end
              end
              object pnSeqRevisao: TPanel
                Left = 1
                Top = 167
                Width = 280
                Height = 28
                TabOrder = 10
                object lbSeqRevisao: TLabel
                  Left = 60
                  Top = 7
                  Width = 122
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Seq. Revis'#227'o(ex.: 01,02)'
                end
                object EdSeqRevisao: TEditHw
                  Left = 188
                  Top = 3
                  Width = 47
                  Height = 21
                  TabOrder = 1
                  Text = '0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object ckSeqRevisao: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 32
                  Height = 17
                  TabOrder = 0
                  OnClick = ckSeqRevisaoClick
                end
              end
              object pnServPropTerc: TPanel
                Left = 283
                Top = 167
                Width = 280
                Height = 28
                TabOrder = 11
                object lbServPropTerc: TLabel
                  Left = 63
                  Top = 7
                  Width = 119
                  Height = 13
                  Caption = 'Serv ou Prod de Terceiro'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox9: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckServPropTerc: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 36
                  Height = 17
                  TabOrder = 0
                  OnClick = ckServPropTercClick
                end
                object cbServPropTerc: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Servi'#231'o ou Produto de Terceiro'
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 2
                  Items.Strings = (
                    ' '
                    'PROPRIO'
                    'SERVI'#199'O')
                end
              end
              object pnEspecieVap: TPanel
                Left = 1
                Top = 195
                Width = 562
                Height = 28
                TabOrder = 12
                object lbEspecieVap: TLabel
                  Left = 116
                  Top = 7
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Esp'#233'cie V/Ap.'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox10: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckEspecieVap: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 45
                  Height = 17
                  TabOrder = 0
                  OnClick = ckEspecieVapClick
                end
                object DbLEspecieVap: TDBLookupComboBox
                  Left = 188
                  Top = 4
                  Width = 362
                  Height = 21
                  Hint = 'Esp'#233'cie para Segmenta'#231#227'o de servi'#231'os'
                  DropDownRows = 8
                  KeyField = 'CODIGO_ESP'
                  ListField = 'DESCRICAO_ESP'
                  ListSource = dtmProdutos.dsEspecieSeg
                  TabOrder = 2
                end
              end
              object pnUnidade: TPanel
                Left = 565
                Top = 195
                Width = 280
                Height = 28
                TabOrder = 13
                object lbObsEtiq: TLabel
                  Left = 143
                  Top = 7
                  Width = 39
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Unidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox25: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckUnidade: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 60
                  Height = 17
                  TabOrder = 0
                  OnClick = ckUnidadeClick
                end
                object EdUnidade: TEdit
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Observa'#231#227'o para Etiqueta'
                  CharCase = ecUpperCase
                  MaxLength = 150
                  TabOrder = 2
                end
              end
              object pnCnaeServ: TPanel
                Left = 1
                Top = 260
                Width = 280
                Height = 28
                TabOrder = 15
                object lbCnaeServ: TLabel
                  Left = 117
                  Top = 7
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CNAE Servi'#231'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckCnaeServ: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckCnaeServClick
                end
                object edCnaeServ: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 4
                  Width = 61
                  Height = 21
                  EditMask = '0000-0/00;0;_'
                  MaxLength = 9
                  TabOrder = 1
                end
              end
              object pnLc116: TPanel
                Left = 1
                Top = 288
                Width = 562
                Height = 28
                TabOrder = 18
                object lbLc116: TLabel
                  Left = 133
                  Top = 7
                  Width = 49
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'LC 116/03'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckLc116: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckLc116Click
                end
                object DBLLc116: TDBLookupComboBox
                  Left = 188
                  Top = 4
                  Width = 362
                  Height = 21
                  KeyField = 'COD_TPSERVICO'
                  ListField = 'COD_TPSERVICO;DESC_TPSERVICO'
                  ListSource = dtmProdutos.DtTipoServicoLC
                  TabOrder = 1
                end
              end
              object pnTribNac: TPanel
                Left = 283
                Top = 260
                Width = 280
                Height = 28
                TabOrder = 16
                object lbTribNac: TLabel
                  Left = 99
                  Top = 7
                  Width = 83
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cod Trib Nacional'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckTribNac: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTribNacClick
                end
                object edTribNac: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 4
                  Width = 53
                  Height = 21
                  EditMask = '99.99.99;0;_'
                  MaxLength = 8
                  TabOrder = 1
                end
              end
              object pnTribMun: TPanel
                Left = 565
                Top = 260
                Width = 280
                Height = 28
                TabOrder = 17
                object lbTribMun: TLabel
                  Left = 96
                  Top = 7
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cod Trib Municipal'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckTribMun: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTribMunClick
                end
                object edTribMun: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 3
                  Width = 27
                  Height = 21
                  Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
                  EditMask = '999;0;_'
                  MaxLength = 3
                  TabOrder = 1
                end
              end
              object pnNbs: TPanel
                Left = 1
                Top = 316
                Width = 280
                Height = 28
                TabOrder = 19
                object lbNbs: TLabel
                  Left = 163
                  Top = 7
                  Width = 19
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'NBS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckNbs: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNbsClick
                end
                object edNBS: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Informe parte da descri'#231#227'o do NCM para localizar'
                  EditMask = '9.9999.99.99;0;_'
                  MaxLength = 12
                  TabOrder = 1
                end
              end
              object pnIndOp: TPanel
                Left = 283
                Top = 316
                Width = 280
                Height = 28
                TabOrder = 20
                object lbIndOp: TLabel
                  Left = 117
                  Top = 7
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cod Ind Oper'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckIndOp: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 31
                  Height = 17
                  TabOrder = 0
                  OnClick = ckIndOpClick
                end
                object edIndOp: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 3
                  Width = 72
                  Height = 21
                  EditMask = '999999;0;_'
                  MaxLength = 6
                  TabOrder = 1
                end
              end
              object pnIssRetido: TPanel
                Left = 1
                Top = 344
                Width = 280
                Height = 28
                TabOrder = 21
                object lbIssRetido: TLabel
                  Left = 134
                  Top = 7
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Iss Retido'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lbInfIssRetido: TLabel
                  Left = 43
                  Top = 7
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
                object ckIssRetido: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 19
                  Height = 17
                  TabOrder = 0
                  OnClick = ckIssRetidoClick
                end
                object edIssRetido: TMaskEdit
                  AlignWithMargins = True
                  Left = 188
                  Top = 3
                  Width = 25
                  Height = 21
                  Hint = 'Iss Retido'
                  EditMask = '9;0;_'
                  MaxLength = 1
                  TabOrder = 1
                end
              end
              object pnCstPisCofins: TPanel
                Left = 1
                Top = 400
                Width = 844
                Height = 28
                TabOrder = 22
                object lbCstPisCofins: TLabel
                  Left = 106
                  Top = 7
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST PISCOFINS'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckCstPisCofins: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 19
                  Height = 17
                  TabOrder = 0
                  OnClick = ckCstPisCofinsClick
                end
                object cbCstPisCofins: TComboBox
                  Left = 188
                  Top = 4
                  Width = 644
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'cbCstPisCofins'
                end
              end
              object pnCstPisCofinsEnt: TPanel
                Left = 1
                Top = 372
                Width = 844
                Height = 28
                TabOrder = 23
                object lbCstPisCofinsEnt: TLabel
                  Left = 65
                  Top = 7
                  Width = 117
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST PISCOFINS Entrada'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object ckCstPisCofinsEnt: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 19
                  Height = 17
                  TabOrder = 0
                  OnClick = ckCstPisCofinsEntClick
                end
                object cbCstPisCofinsEnt: TComboBox
                  Left = 188
                  Top = 4
                  Width = 644
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'cbCstPisCofinsEnt'
                end
              end
            end
          end
          object Panel119: TPanel
            Left = 0
            Top = 558
            Width = 888
            Height = 29
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object btSalvarServLote: TBitBtn
              Left = 364
              Top = 0
              Width = 75
              Height = 25
              Hint = 'OK - [BAS561]'
              Caption = '&OK'
              TabOrder = 0
              OnClick = btSalvarServLoteClick
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
            object btnCancServLote: TBitBtn
              Left = 445
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Cancelar'
              Caption = '&Cancela'
              TabOrder = 1
              OnClick = btnCancServLoteClick
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
            object btSairServLote: TBitBtn
              Left = 604
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Sair'
              Caption = '&Sair'
              TabOrder = 2
              OnClick = BitBtn2Click
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
    inherited PanelFlash: TPanel
      Left = 672
      Top = 549
      Height = 622
      ExplicitLeft = 672
      ExplicitTop = 549
      ExplicitHeight = 622
      inherited bMarketingHW: TBitBtn
        Top = 600
        ExplicitTop = 600
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 622
    Width = 903
    ExplicitTop = 622
    ExplicitWidth = 903
  end
  inherited pnStatusProcessamento: TPanel
    Top = 538
    ExplicitTop = 538
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = 10
      ExplicitTop = 26
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    object MarcarTodosTipoServico: TMenuItem
      Caption = 'Marcar Todos Tipo de Servi'#231'o'
      OnClick = MarcarTodosTipoServicoClick
    end
    object DesmarcaTodosTipoServico: TMenuItem
      Caption = 'Desmarcar Todos Tipo de Servi'#231'o'
      OnClick = DesmarcaTodosTipoServicoClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 222
    Top = 547
  end
  inherited Timer1: TTimer
    Left = 182
    Top = 547
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 150
    Top = 547
  end
end
