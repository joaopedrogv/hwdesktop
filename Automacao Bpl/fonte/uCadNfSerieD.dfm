inherited frmCadNfSerieD: TfrmCadNfSerieD
  Left = 236
  Top = 113
  Caption = 'Registro de Avulsa. Notas Fiscais S'#233'rie D'
  ClientHeight = 595
  ClientWidth = 720
  ExplicitWidth = 728
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 720
    Height = 576
    ExplicitWidth = 720
    ExplicitHeight = 576
    inherited Splitter2: TSplitter
      Height = 574
      ExplicitLeft = 721
      ExplicitHeight = 544
    end
    inherited PanelLeft: TPanel
      Width = 715
      Height = 574
      ExplicitWidth = 715
      ExplicitHeight = 574
      inherited PageControl1: TPageControl
        Width = 713
        Height = 572
        ExplicitWidth = 713
        ExplicitHeight = 572
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 705
          ExplicitHeight = 541
          inherited ScrollBox1: TScrollBox
            Width = 705
            Height = 541
            ExplicitWidth = 705
            ExplicitHeight = 541
            inherited PageControl3: TPageControl
              Width = 705
              Height = 493
              ExplicitWidth = 705
              ExplicitHeight = 493
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 697
                ExplicitHeight = 462
                inherited ScrollBox3: TScrollBox
                  Width = 697
                  Height = 462
                  VertScrollBar.Position = 43
                  ExplicitWidth = 697
                  ExplicitHeight = 462
                  inherited GroupBox1: TGroupBox
                    Left = 105
                    Top = 341
                    Width = 108
                    Height = 17
                    Align = alNone
                    Caption = 'Cliente / Cabe'#231'alho'
                    Visible = False
                    ExplicitLeft = 105
                    ExplicitTop = 341
                    ExplicitWidth = 108
                    ExplicitHeight = 17
                  end
                  object Panel4: TPanel
                    Left = 0
                    Top = -43
                    Width = 697
                    Height = 484
                    BevelOuter = bvNone
                    TabOrder = 1
                    object GroupBox4: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 697
                      Height = 104
                      Align = alTop
                      Caption = 'Cabe'#231'alho'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object Label9: TLabel
                        Left = 54
                        Top = 31
                        Width = 44
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'N'#250'mero'
                        FocusControl = DBEdit1
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label11: TLabel
                        Left = 287
                        Top = 31
                        Width = 44
                        Height = 13
                        Caption = 'Cliente:'
                        FocusControl = DBEdit4
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label6: TLabel
                        Left = 272
                        Top = 58
                        Width = 59
                        Height = 13
                        Caption = 'Vendedor:'
                        FocusControl = DBEdit4
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label8: TLabel
                        Left = 66
                        Top = 85
                        Width = 32
                        Height = 13
                        Caption = 'S'#233'rie:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label10: TLabel
                        Left = 40
                        Top = 58
                        Width = 58
                        Height = 13
                        Caption = 'Sub-S'#233'rie:'
                        FocusControl = DBEdit6
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label12: TLabel
                        Left = 287
                        Top = 85
                        Width = 44
                        Height = 13
                        Caption = 'Modelo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit1: TDBEdit
                        Left = 104
                        Top = 23
                        Width = 67
                        Height = 21
                        DataField = 'NUMERONOTA'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 0
                      end
                      object DBEdit4: TDBEdit
                        Left = 337
                        Top = 23
                        Width = 50
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 1
                        OnExit = DBEdit4Exit
                        OnKeyDown = DBEdit4KeyDown
                      end
                      object DBLookupComboBox14: TDBLookupComboBox
                        Left = 393
                        Top = 23
                        Width = 287
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = dtmNfSerieD.dsClientes
                        ParentFont = False
                        TabOrder = 2
                      end
                      object DBLookupComboBox16: TDBLookupComboBox
                        Left = 337
                        Top = 50
                        Width = 343
                        Height = 21
                        DataField = 'COD_VENDEDOR'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = dtmNfSerieD.dsColaborador
                        ParentFont = False
                        TabOrder = 4
                      end
                      object DBEdit6: TDBEdit
                        Left = 104
                        Top = 50
                        Width = 67
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'SUBSERIE'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 3
                      end
                      object DBComboBox1: TDBComboBox
                        Left = 337
                        Top = 77
                        Width = 343
                        Height = 21
                        DataField = 'MODELO'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ItemHeight = 0
                        Items.Strings = (
                          '02 - Nota Fiscal de Venda a Consumidor'
                          '04 - Nota Fiscal de Produtor')
                        ParentFont = False
                        TabOrder = 6
                        OnExit = DBComboBox1Exit
                      end
                      object DBComboBox2: TDBComboBox
                        Left = 104
                        Top = 77
                        Width = 113
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'SERIE'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ItemHeight = 0
                        Items.Strings = (
                          'D  - SERIE D'
                          'U  - SERIE '#218'NICA'
                          'DU - SERIE D-'#218'NICA')
                        ParentFont = False
                        TabOrder = 5
                        OnExit = DBComboBox2Exit
                      end
                    end
                    object GroupBox5: TGroupBox
                      Left = 0
                      Top = 104
                      Width = 697
                      Height = 311
                      Align = alTop
                      Caption = 'Itens / Produtos'
                      TabOrder = 1
                      object Panel5: TPanel
                        Left = 2
                        Top = 15
                        Width = 693
                        Height = 110
                        Align = alTop
                        BevelOuter = bvNone
                        Enabled = False
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                        TabOrder = 0
                        object Label16: TLabel
                          Left = 496
                          Top = 67
                          Width = 64
                          Height = 13
                          Caption = 'Valor Total:'
                          FocusControl = DBEdit16
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label15: TLabel
                          Left = 480
                          Top = 40
                          Width = 80
                          Height = 13
                          Caption = 'Valor Unit'#225'rio:'
                          FocusControl = DBEdit15
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label18: TLabel
                          Left = 271
                          Top = 13
                          Width = 58
                          Height = 13
                          Caption = 'Descri'#231#227'o:'
                          FocusControl = DBEdit18
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label17: TLabel
                          Left = 279
                          Top = 67
                          Width = 50
                          Height = 13
                          Caption = 'Al'#237'quota:'
                          FocusControl = DBEdit17
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label14: TLabel
                          Left = 261
                          Top = 40
                          Width = 68
                          Height = 13
                          Caption = 'Quantidade:'
                          FocusControl = DBEdit14
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label13: TLabel
                          Left = 4
                          Top = 13
                          Width = 92
                          Height = 13
                          Caption = 'Num Fabrica'#231#227'o:'
                          FocusControl = DBEdit13
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label19: TLabel
                          Left = 69
                          Top = 40
                          Width = 27
                          Height = 13
                          Caption = 'Tipo:'
                          FocusControl = DBEdit19
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label20: TLabel
                          Left = 58
                          Top = 67
                          Width = 38
                          Height = 13
                          Caption = 'Marca:'
                          FocusControl = DBEdit20
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label26: TLabel
                          Left = 501
                          Top = 94
                          Width = 59
                          Height = 13
                          Caption = 'Qualidade:'
                          FocusControl = DBEdit3
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label27: TLabel
                          Left = 284
                          Top = 94
                          Width = 45
                          Height = 13
                          Caption = 'Esp'#233'cie:'
                          FocusControl = DBEdit5
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label28: TLabel
                          Left = 52
                          Top = 94
                          Width = 44
                          Height = 13
                          Caption = 'Modelo:'
                          FocusControl = DBEdit12
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit16: TDBEdit
                          Left = 566
                          Top = 59
                          Width = 112
                          Height = 21
                          DataField = 'VL_TOT_ITEM'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 7
                        end
                        object DBEdit15: TDBEdit
                          Left = 566
                          Top = 32
                          Width = 112
                          Height = 21
                          DataField = 'VL_UN_ITEM'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 4
                          OnExit = DBEdit15Exit
                        end
                        object DBEdit18: TDBEdit
                          Left = 335
                          Top = 5
                          Width = 343
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'DESC_PROD'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 1
                        end
                        object DBEdit14: TDBEdit
                          Left = 335
                          Top = 32
                          Width = 89
                          Height = 21
                          DataField = 'QUANTID_ITEM'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 3
                          OnExit = DBEdit14Exit
                        end
                        object DBEdit17: TDBEdit
                          Left = 335
                          Top = 59
                          Width = 89
                          Height = 21
                          DataField = 'ALIQUOTA'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 6
                        end
                        object DBEdit20: TDBEdit
                          Left = 102
                          Top = 59
                          Width = 89
                          Height = 21
                          DataField = 'MARCA'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 5
                        end
                        object DBEdit19: TDBEdit
                          Left = 102
                          Top = 32
                          Width = 89
                          Height = 21
                          DataField = 'TIPO'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 2
                        end
                        object DBEdit13: TDBEdit
                          Left = 102
                          Top = 5
                          Width = 89
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'NUM_FAB_PROD'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 0
                          OnExit = DBEdit13Exit
                          OnKeyDown = DBEdit13KeyDown
                        end
                        object DBEdit3: TDBEdit
                          Left = 566
                          Top = 86
                          Width = 112
                          Height = 21
                          DataField = 'QUALIDADE'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 10
                          OnExit = DBEdit3Exit
                        end
                        object DBEdit5: TDBEdit
                          Left = 335
                          Top = 86
                          Width = 89
                          Height = 21
                          DataField = 'ESPECIE'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 9
                        end
                        object DBEdit12: TDBEdit
                          Left = 102
                          Top = 86
                          Width = 89
                          Height = 21
                          DataField = 'MODELO'
                          DataSource = dtmNfSerieD.dsItNFSD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 8
                        end
                      end
                      object Panel9: TPanel
                        Left = 11
                        Top = 128
                        Width = 673
                        Height = 41
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn64: TBitBtn
                          Left = 335
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Incluir Registro - [NSD007]'
                          Caption = '&Incluir'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 0
                          OnClick = BitBtn64Click
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
                        object BitBtn65: TBitBtn
                          Left = 416
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Salvar Registro - [NSD008]'
                          Caption = '&Salva'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 1
                          OnClick = BitBtn65Click
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
                        object BitBtn66: TBitBtn
                          Left = 497
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Editar Registro - [NSD009]'
                          Caption = '&Alterar'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 2
                          OnClick = BitBtn66Click
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
                        object BitBtn67: TBitBtn
                          Left = 578
                          Top = 6
                          Width = 75
                          Height = 25
                          Hint = 'Cancelar Registro - [NSD010]'
                          Caption = '&Cancela'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          TabOrder = 3
                          OnClick = BitBtn67Click
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
                      object GroupBox6: TGroupBox
                        Left = 2
                        Top = 172
                        Width = 693
                        Height = 137
                        Align = alBottom
                        TabOrder = 2
                        object DBGrid2: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 689
                          Height = 120
                          Align = alClient
                          DataSource = dtmNfSerieD.dsItNFSD
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'NITEM'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESC_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QUANTID_ITEM'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VL_UN_ITEM'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'NUM_FAB_PROD'
                              Width = 64
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VL_TOT_ITEM'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'GRUPO_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_PROD'
                              Width = 64
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'ALIQUOTA'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'ISENTO'
                              Width = 64
                              Visible = True
                            end>
                        end
                      end
                    end
                    object GroupBox7: TGroupBox
                      Left = 0
                      Top = 415
                      Width = 697
                      Height = 68
                      Align = alTop
                      Caption = 'Calculo de Impostos'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                      object Label21: TLabel
                        Left = 498
                        Top = 24
                        Width = 67
                        Height = 13
                        Caption = 'Valor Total:'
                        FocusControl = DBEdit7
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label22: TLabel
                        Left = 36
                        Top = 21
                        Width = 62
                        Height = 13
                        Caption = 'Base ICMS:'
                        FocusControl = DBEdit8
                      end
                      object Label23: TLabel
                        Left = 34
                        Top = 48
                        Width = 64
                        Height = 13
                        Caption = 'Valor ICMS:'
                        FocusControl = DBEdit9
                      end
                      object Label24: TLabel
                        Left = 225
                        Top = 21
                        Width = 106
                        Height = 13
                        Caption = 'Isenta ou N'#227'o Trib:'
                        FocusControl = DBEdit10
                      end
                      object Label25: TLabel
                        Left = 290
                        Top = 48
                        Width = 41
                        Height = 13
                        Caption = 'Outras:'
                        FocusControl = DBEdit11
                      end
                      object SpeedButton9: TSpeedButton
                        Left = 432
                        Top = 16
                        Width = 23
                        Height = 22
                        Flat = True
                        Glyph.Data = {
                          76010000424D7601000000000000760000002800000020000000100000000100
                          04000000000000010000120B0000120B00001000000000000000000000000000
                          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                          333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
                          03333377777777777F33333003333330033333377FF333377F33333300333333
                          0333333377FF33337F3333333003333303333333377FF3337333333333003333
                          333333333377FF3333333333333003333333333333377FF33333333333330033
                          3333333333337733333333333330033333333333333773333333333333003333
                          33333333337733333F3333333003333303333333377333337F33333300333333
                          03333333773333337F33333003333330033333377FFFFFF77F33330000000000
                          0333337777777777733333333333333333333333333333333333}
                        NumGlyphs = 2
                        OnClick = SpeedButton9Click
                      end
                      object Label7: TLabel
                        Left = 480
                        Top = 48
                        Width = 82
                        Height = 13
                        Caption = 'Data Emiss'#227'o:'
                        FocusControl = DBEdit2
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit7: TDBEdit
                        Left = 568
                        Top = 13
                        Width = 112
                        Height = 21
                        DataField = 'VALOR_GERAL'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 4
                      end
                      object DBEdit8: TDBEdit
                        Left = 104
                        Top = 13
                        Width = 89
                        Height = 21
                        DataField = 'B_CALC_ICMS'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 0
                      end
                      object DBEdit9: TDBEdit
                        Left = 104
                        Top = 40
                        Width = 89
                        Height = 21
                        DataField = 'VALOR_ICMS'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 1
                      end
                      object DBEdit10: TDBEdit
                        Left = 337
                        Top = 13
                        Width = 89
                        Height = 21
                        DataField = 'ISENTA_N_TRIB'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 2
                      end
                      object DBEdit11: TDBEdit
                        Left = 337
                        Top = 40
                        Width = 89
                        Height = 21
                        DataField = 'OUTRAS'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        ReadOnly = True
                        TabOrder = 3
                      end
                      object DBEdit2: TDBEdit
                        Left = 568
                        Top = 40
                        Width = 112
                        Height = 21
                        DataField = 'DATAEMISSAO'
                        DataSource = dtmNfSerieD.dsNFSD
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 5
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 493
              Width = 705
              ExplicitTop = 493
              ExplicitWidth = 705
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [NSD006]'
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
          ExplicitWidth = 705
          ExplicitHeight = 541
          inherited GroupBox3: TGroupBox
            Width = 705
            ExplicitWidth = 705
            inherited imgInformation: TImage
              Left = 679
              ExplicitLeft = 684
            end
            object SpeedButton59: TSpeedButton [6]
              Left = 650
              Top = 48
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [NSD005]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [NSD001]'
            end
          end
          inherited Panel1: TPanel
            Width = 705
            Height = 468
            ExplicitWidth = 705
            ExplicitHeight = 468
            inherited Splitter1: TSplitter
              Height = 407
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 412
              Height = 407
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NUMERONOTA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAEMISSAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUBSERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_GERAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'B_CALC_ICMS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICMS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISENTA_N_TRIB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OUTRAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQUOTA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODELO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATAENTRADA'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 701
              ExplicitWidth = 701
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [NSD003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [NSD004]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton4Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [NSD004]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Reabrir Documento - [NSD013]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230B0000230B00000001000000010000009C00000073
                  0800B5848400EFCE9400C6A59C00EFCE9C00C6ADA500BDD6A500F7D6A500F7D6
                  AD00F7D6B500F7DEB500F7DEBD00F7DEC600F7E7C600F7E7CE00F7E7D600FFEF
                  DE00FFF7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313130412
                  12121210100F0F0F0D0D0D0B09090505021313131313041212121210100F0F0F
                  0D0D0D0B0909050502131313131304121010100F0F0F0D0D0D0B0B0905050505
                  02131313131306121110100F0F0D0C0C0A090905050503030213131313130610
                  1110100F0D0D0C0A0909050505030303021313131313061011100F0D0D0C0A09
                  0905050505030303021313131313040F10100D0C0C0A09090505050503030303
                  021313131313040F0F0D0D0C0A0909050505050303030303021313130113040D
                  0E0D0C0A090905050505030303030303021313130001020D0E0C0B0A09080505
                  0503030303030303021301010000010202020202020202020202020202020202
                  0213000000000001131313131313131313131313131313131313000000000007
                  1313131313131313131313131313131313131313000007131313131313131313
                  1313131313131313131313130007020202020202020202020202020202020202
                  021313131313040D0E0C0B0A090805050503030303030303021313131313040D
                  0E0D0C0A090905050505030303030303021313131313040F0F0D0D0C0A090905
                  0505050303030303021313131313060F10100D0C0C0A09090505050503030303
                  021313131313061011100F0D0D0C0A0909050505050303030213131313130610
                  1110100F0D0D0C0A090905050503030302131313131304121110100F0F0D0C0C
                  0A0909050505030302131313131304121212100F0F0F0D0D0D0B0B0905050505
                  021313131313041212121210100F0F0F0D0D0D0B090905050213}
                OnClick = SpeedButton6Click
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
                OnClick = SpeedButton25Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 407
              ExplicitHeight = 407
              inherited ScrollBox2: TScrollBox
                Height = 390
                ExplicitHeight = 390
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 705
          ExplicitHeight = 541
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 724
      Width = 3
      Height = 574
      ExplicitLeft = 724
      ExplicitWidth = 3
      ExplicitHeight = 574
      inherited bMarketingHW: TBitBtn
        Top = 552
        Width = 1
        ExplicitTop = 552
        ExplicitWidth = 1
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 576
    Width = 720
    ExplicitTop = 576
    ExplicitWidth = 720
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 196
    Top = 9
  end
end
