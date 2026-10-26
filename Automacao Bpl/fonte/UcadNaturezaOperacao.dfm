inherited frmCadNaturezaOperacao: TfrmCadNaturezaOperacao
  Left = 278
  Caption = 'Natureza de Opera'#231#227'o'
  ClientHeight = 592
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 573
    BevelOuter = bvNone
    ExplicitHeight = 573
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 573
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 573
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 573
      object Image1: TImage [0]
        Left = 96
        Top = 16
        Width = 105
        Height = 105
      end
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 573
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 573
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 542
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 542
            ExplicitWidth = 787
            ExplicitHeight = 542
            inherited PageControl3: TPageControl
              Width = 787
              Height = 494
              ActivePage = tsCadastro
              ExplicitWidth = 787
              ExplicitHeight = 494
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de  Natureza de Opera'#231#227'o'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 463
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 463
                  ExplicitWidth = 779
                  ExplicitHeight = 463
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    Height = 458
                    Caption = 'Dados Natureza de Opera'#231#227'o'
                    ExplicitWidth = 775
                    ExplicitHeight = 458
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Relat'#243'rios'
                ImageIndex = 1
                object QuickRep1: TQuickRep
                  Left = 1
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicos.cdsNatOperacao
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
                  ReportTitle = 'Relat'#243'rio de Natureza de Opera'#231#227'p'
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoomToFit
                  PreviewDefaultSaveType = stQRP
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 129
                    Width = 718
                    Height = 21
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
                      55.562500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 78
                      Top = 2
                      Width = 87
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        206.375000000000000000
                        5.291666666666667000
                        230.187500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsNatOperacao
                      DataField = 'CODIGO_NOP'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 231
                      Top = 2
                      Width = 112
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        611.187500000000000000
                        5.291666666666667000
                        296.333333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsNatOperacao
                      DataField = 'DESCRICAO_NOP'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                  object TitleBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 91
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
                      240.770833333333300000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel9: TQRLabel
                      Left = 186
                      Top = 16
                      Width = 398
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        492.125000000000000000
                        42.333333333333340000
                        1053.041666666667000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'RELAT'#211'RIO DE NATUREZA DE OPERA'#199#195'O'
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
                      Left = 0
                      Top = 59
                      Width = 703
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        156.104166666666700000
                        1860.020833333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 84
                      Width = 702
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        222.250000000000000000
                        1857.375000000000000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRLabel1: TQRLabel
                      Left = 78
                      Top = 68
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        206.375000000000000000
                        179.916666666666700000
                        121.708333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'digo'
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
                    object QRLabel2: TQRLabel
                      Left = 231
                      Top = 68
                      Width = 63
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        611.187500000000000000
                        179.916666666666700000
                        166.687500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Descri'#231#227'o'
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
                      Left = 3
                      Top = 44
                      Width = 65
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        7.937500000000000000
                        116.416666666666700000
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
                      Left = 87
                      Top = 45
                      Width = 69
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        230.187500000000000000
                        119.062500000000000000
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
                    object QRLabel4: TQRLabel
                      Left = 608
                      Top = 45
                      Width = 47
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1608.666666666667000000
                        119.062500000000000000
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
                      Left = 659
                      Top = 45
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1743.604166666667000000
                        119.062500000000000000
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
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 2
                object PageControl2: TPageControl
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 463
                  ActivePage = TabSheet5
                  Align = alClient
                  Style = tsFlatButtons
                  TabOrder = 0
                  object TabSheet5: TTabSheet
                    Caption = 'Cadastro'
                    object Label6: TLabel
                      Left = 100
                      Top = 20
                      Width = 78
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'C'#243'digo do CFOP'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 132
                      Top = 47
                      Width = 46
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descri'#231#227'o'
                      FocusControl = DBEdit2
                    end
                    object DBEdit1: TDBEdit
                      Left = 183
                      Top = 17
                      Width = 134
                      Height = 21
                      Hint = 'C'#243'digo do CFOP'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_NOP'
                      DataSource = DtmCadBasicos.dsNatOperacao
                      TabOrder = 0
                      OnExit = DBEdit1Exit
                    end
                    object DBEdit2: TDBEdit
                      Left = 183
                      Top = 44
                      Width = 491
                      Height = 21
                      Hint = 'Descri'#231#227'o do CFOP'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO_NOP'
                      DataSource = DtmCadBasicos.dsNatOperacao
                      TabOrder = 1
                    end
                  end
                  object TabSheet6: TTabSheet
                    Caption = 'Configura'#231#245'es'
                    ImageIndex = 1
                    object ScrollBox4: TScrollBox
                      Left = 0
                      Top = 0
                      Width = 771
                      Height = 432
                      Align = alClient
                      BevelInner = bvNone
                      BevelOuter = bvNone
                      BorderStyle = bsNone
                      Ctl3D = True
                      ParentCtl3D = False
                      TabOrder = 0
                      object GroupBox5: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 754
                        Height = 97
                        Align = alTop
                        Caption = 'Entradas'
                        TabOrder = 0
                        object Label15: TLabel
                          Left = 13
                          Top = 19
                          Width = 185
                          Height = 13
                          Caption = 'C'#243'digo do CFOP de Convers'#227'o no XML'
                          FocusControl = DBEdit3
                        end
                        object Label13: TLabel
                          Left = 393
                          Top = 19
                          Width = 104
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Mostrar Rel. Compras'
                        end
                        object Label11: TLabel
                          Left = 129
                          Top = 46
                          Width = 69
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Calcular Custo'
                        end
                        object Label23: TLabel
                          Left = 8
                          Top = 73
                          Width = 491
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 
                            'CFOP de retorno de mercadorias (Devolu'#231#245'es, Retornos, etc).Ativa' +
                            ' a baixa dos creditos no Financeiro'
                        end
                        object Label29: TLabel
                          Left = 460
                          Top = 46
                          Width = 37
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Compra'
                        end
                        object DBEdit3: TDBEdit
                          Left = 204
                          Top = 16
                          Width = 144
                          Height = 21
                          Hint = 'C'#243'digo do CFOP de Convers'#227'o Usado na Entrada de Mercadorias'
                          CharCase = ecUpperCase
                          DataField = 'CFOP_CONV'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 0
                          OnExit = DBEdit1Exit
                        end
                        object DBComboBox6: TDBComboBox
                          Left = 503
                          Top = 16
                          Width = 144
                          Height = 21
                          Hint = 'Mostrar Rel. Compras'
                          CharCase = ecUpperCase
                          DataField = 'MOSTRAR_REL_COMPRAS'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 2
                        end
                        object DBComboBox4: TDBComboBox
                          Left = 204
                          Top = 43
                          Width = 145
                          Height = 21
                          Hint = 'Calcular Custo'
                          CharCase = ecUpperCase
                          DataField = 'CALC_CUSTO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 1
                        end
                        object DBComboBox14: TDBComboBox
                          Left = 503
                          Top = 70
                          Width = 144
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'USA_BX_RETORNO_FIN'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'NAO')
                          TabOrder = 4
                        end
                        object DBComboBox20: TDBComboBox
                          Left = 503
                          Top = 43
                          Width = 144
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'COMPRA'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 3
                        end
                      end
                      object GroupBox6: TGroupBox
                        Left = 0
                        Top = 97
                        Width = 754
                        Height = 187
                        Align = alTop
                        Caption = 'Sa'#237'das'
                        TabOrder = 1
                        object Label8: TLabel
                          Left = 125
                          Top = 19
                          Width = 73
                          Height = 13
                          Alignment = taRightJustify
                          BiDiMode = bdLeftToRight
                          Caption = 'Pre'#231'o de Custo'
                          ParentBiDiMode = False
                        end
                        object Label9: TLabel
                          Left = 12
                          Top = 46
                          Width = 186
                          Height = 13
                          Hint = 
                            'O sistema ir'#225' calcular o ICMS caso tenha al'#237'quota no produto e a' +
                            'dicionar o valor calculado ao valor do custo para compor o valor' +
                            ' do item'
                          Alignment = taRightJustify
                          Caption = '*Sa'#237'da com Imposto(Pre'#231'o Custo=Sim)'
                        end
                        object Label10: TLabel
                          Left = 120
                          Top = 73
                          Width = 78
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Sem Imposto NF'
                        end
                        object Label12: TLabel
                          Left = 414
                          Top = 19
                          Width = 83
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Al'#237'q. Saida Venda'
                          FocusControl = DBEdit7
                        end
                        object Label21: TLabel
                          Left = 407
                          Top = 46
                          Width = 90
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo Venda Padr'#227'o'
                        end
                        object Label24: TLabel
                          Left = 435
                          Top = 73
                          Width = 62
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Faturamento'
                        end
                        object Label28: TLabel
                          Left = 32
                          Top = 100
                          Width = 168
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Informa'#231#227'o Complementar para NF'
                          FocusControl = DBEdit11
                        end
                        object Label31: TLabel
                          Left = 401
                          Top = 100
                          Width = 96
                          Height = 13
                          Hint = 
                            'Ao confirmar a NF n'#227'o restringe o pedido para emiss'#227'o das notas ' +
                            'de Faturamento. Pode-se usar em remessas e venda futura'
                          Alignment = taRightJustify
                          Caption = 'Sem V'#237'nculo Pedidos'
                        end
                        object DBComboBox1: TDBComboBox
                          Left = 204
                          Top = 16
                          Width = 145
                          Height = 21
                          Hint = 'Pre'#231'o de Custo'
                          CharCase = ecUpperCase
                          DataField = 'PRECC'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 0
                        end
                        object DBComboBox2: TDBComboBox
                          Left = 204
                          Top = 43
                          Width = 145
                          Height = 21
                          Hint = 'Sa'#237'da com Imposto'
                          CharCase = ecUpperCase
                          DataField = 'COMIMP'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 1
                        end
                        object DBComboBox3: TDBComboBox
                          Left = 204
                          Top = 70
                          Width = 145
                          Height = 21
                          Hint = 'Sem imposto na NF'
                          CharCase = ecUpperCase
                          DataField = 'SEM_IMPOSTO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 2
                        end
                        object DBEdit7: TDBEdit
                          Left = 503
                          Top = 16
                          Width = 82
                          Height = 21
                          Hint = 'Al'#237'quota Sa'#237'da Venda'
                          CharCase = ecUpperCase
                          DataField = 'ALIQ_INT_SAID'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 5
                        end
                        object DBComboBox12: TDBComboBox
                          Left = 503
                          Top = 43
                          Width = 144
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPV'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 6
                        end
                        object DBComboBox15: TDBComboBox
                          Left = 503
                          Top = 70
                          Width = 145
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'FATURAMENTO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 7
                        end
                        object DBEdit11: TDBEdit
                          Left = 204
                          Top = 97
                          Width = 142
                          Height = 21
                          Hint = 
                            'Informa'#231#227'o Complementar para impress'#227'o nas notas fiscais de sa'#237'd' +
                            'a'
                          DataField = 'COD_INF'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 3
                          OnExit = DBEdit11Exit
                          OnKeyDown = DBEdit11KeyDown
                        end
                        object Memo3: TMemo
                          Left = 204
                          Top = 124
                          Width = 443
                          Height = 53
                          Hint = 
                            'Informa'#231#227'o Complementar para impress'#227'o nas notas fiscais de sa'#237'd' +
                            'a'
                          Enabled = False
                          ReadOnly = True
                          TabOrder = 4
                        end
                        object DBComboBox21: TDBComboBox
                          Left = 503
                          Top = 97
                          Width = 145
                          Height = 21
                          Hint = 
                            'Ao confirmar a NF n'#227'o restringe o pedido para emiss'#227'o das notas ' +
                            'de Faturamento. Pode-se usar em remessas e venda futura'
                          CharCase = ecUpperCase
                          DataField = 'SEMVINCULO_VND'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 8
                        end
                      end
                      object GroupBox7: TGroupBox
                        Left = 0
                        Top = 284
                        Width = 754
                        Height = 73
                        Align = alTop
                        Caption = 'Entradas e Sa'#237'das'
                        TabOrder = 2
                        object Label26: TLabel
                          Left = 87
                          Top = 19
                          Width = 111
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'CFOP de Devolu'#231#227'o NF'
                        end
                        object imgDevolucao: TImage
                          Left = 352
                          Top = 15
                          Width = 24
                          Height = 24
                          Cursor = crHelp
                          Picture.Data = {
                            055449636F6E0000010001001818000001002000880900001600000028000000
                            1800000030000000010020000000000060090000000000000000000000000000
                            00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                            0000000000000000000000000000000000000000000000000000000000000021
                            0000002700000000000000000000000000000000000000000000000000000000
                            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                            00000000000000000000000000000000000000000000000000000023170B0088
                            27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                            000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                            B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                            FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                            0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                            C29667E0502700210A0600000000000000000000000000000000000000000000
                            FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                            150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                            996F44E20000003A000000000000000000000000020100000301000003010000
                            FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                            BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                            C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                            FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                            FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                            FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                            FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                            FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                            FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                            FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                            FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                            E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                            FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                            FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                            E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                            FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                            FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                            FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                            FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                            FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                            FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                            FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                            FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                            FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                            FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                            FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                            FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                            FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                            FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                            FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                            FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                            FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                            FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                            FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                            FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                            FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                            FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                            FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                            E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                            FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                            FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                            EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                            FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                            E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                            FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                            FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                            894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                            C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                            FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                            8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                            8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                            FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                            E0000F00C0000700800007008000030080000100800001008000010080000100
                            8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                            FFFFFF00}
                        end
                        object Label14: TLabel
                          Left = 422
                          Top = 19
                          Width = 75
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Alterar Estoque'
                        end
                        object Label22: TLabel
                          Left = 113
                          Top = 46
                          Width = 85
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Tipo de Opera'#231#227'o'
                        end
                        object DBComboBox16: TDBComboBox
                          Left = 204
                          Top = 16
                          Width = 144
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'DEVOLUCAO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 0
                        end
                        object DBComboBox5: TDBComboBox
                          Left = 503
                          Top = 16
                          Width = 145
                          Height = 21
                          Hint = 'Alterar Estoque'
                          CharCase = ecUpperCase
                          DataField = 'ALT_EST'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            'SIM'
                            'N'#195'O')
                          TabOrder = 1
                        end
                        object DBComboBox13: TDBComboBox
                          Left = 204
                          Top = 43
                          Width = 444
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPV_VEICULO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          TabOrder = 2
                        end
                      end
                      object groupVeiculos: TGroupBox
                        Left = 0
                        Top = 357
                        Width = 754
                        Height = 45
                        Align = alTop
                        Caption = 'Ve'#237'culos'
                        TabOrder = 3
                        object Label27: TLabel
                          Left = 141
                          Top = 19
                          Width = 59
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Novo/Usado'
                        end
                        object Label25: TLabel
                          Left = 423
                          Top = 19
                          Width = 74
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Ordem Exibi'#231#227'o'
                        end
                        object DBComboBox19: TDBComboBox
                          Left = 206
                          Top = 16
                          Width = 143
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPO_OPERACAO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            ''
                            'N - NOVO'
                            'U - USADO')
                          TabOrder = 0
                        end
                        object DBEdit6: TDBEdit
                          Left = 503
                          Top = 16
                          Width = 145
                          Height = 21
                          Hint = 'Ordem de exibi'#231#227'o'
                          DataField = 'ORDEMEXIBICAO'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 1
                          OnExit = DBEdit11Exit
                          OnKeyDown = DBEdit11KeyDown
                        end
                      end
                      object GroupBox10: TGroupBox
                        Left = 0
                        Top = 402
                        Width = 754
                        Height = 44
                        Align = alTop
                        Caption = 'Cadastro Produto Importa'#231#227'o XML'
                        TabOrder = 4
                        object Label32: TLabel
                          Left = 103
                          Top = 22
                          Width = 95
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'CFOP Intraestadual'
                        end
                        object Label33: TLabel
                          Left = 362
                          Top = 22
                          Width = 135
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'CFOP Interestadual N Contr'
                        end
                        object DBEdit8: TDBEdit
                          Left = 204
                          Top = 19
                          Width = 142
                          Height = 21
                          Hint = 'CFOP Intraestadual'
                          DataField = 'CFOP_CONV_SAIDA_INTRA'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 0
                        end
                        object DBEdit9: TDBEdit
                          Left = 503
                          Top = 19
                          Width = 144
                          Height = 21
                          Hint = 'CFOP Interestadual N'#227'o Contribuinte'
                          DataField = 'CFOP_CONV_SAIDA_INTER'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          TabOrder = 1
                        end
                      end
                    end
                  end
                  object TabSheet7: TTabSheet
                    Caption = 'Fiscal'
                    ImageIndex = 2
                    object GroupBox8: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 771
                      Height = 169
                      Align = alTop
                      Caption = 'EFD Contribui'#231#245'es'
                      TabOrder = 0
                      object Label18: TLabel
                        Left = 21
                        Top = 29
                        Width = 168
                        Height = 13
                        Caption = 'Gerador de Cr'#233'dito de PIS/COFINS'
                      end
                      object Label19: TLabel
                        Left = 20
                        Top = 56
                        Width = 169
                        Height = 13
                        Caption = 'Gerador de Receita de PIS/COFINS'
                      end
                      object Label20: TLabel
                        Left = 41
                        Top = 83
                        Width = 148
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'CFOP de Devolu'#231#227'o para SPED'
                      end
                      object DBComboBox9: TDBComboBox
                        Left = 195
                        Top = 26
                        Width = 144
                        Height = 21
                        DataField = 'CREDITO_PIS_COFINS'
                        DataSource = DtmCadBasicos.dsNatOperacao
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 0
                      end
                      object DBComboBox10: TDBComboBox
                        Left = 195
                        Top = 53
                        Width = 144
                        Height = 21
                        DataField = 'RECEITA_PIS_COFINS'
                        DataSource = DtmCadBasicos.dsNatOperacao
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'NAO')
                        TabOrder = 1
                      end
                      object DBComboBox11: TDBComboBox
                        Left = 195
                        Top = 80
                        Width = 144
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'DEVOLUCAO_SPED'
                        DataSource = DtmCadBasicos.dsNatOperacao
                        ItemHeight = 13
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                        TabOrder = 2
                      end
                      object GroupBox4: TGroupBox
                        Left = 41
                        Top = 113
                        Width = 609
                        Height = 44
                        Caption = 'Natureza da Base de C'#225'lculo de Cr'#233'dito - SPED PIS/COFINS'
                        TabOrder = 3
                        object DBComboBox8: TDBComboBox
                          Left = 10
                          Top = 16
                          Width = 596
                          Height = 21
                          DataField = 'NAT_BC_CRED'
                          DataSource = DtmCadBasicos.dsNatOperacao
                          ItemHeight = 13
                          Items.Strings = (
                            '01 - aquisi'#231#227'o de bens para revenda'
                            '02 - aquisi'#231#227'o de bens utilizados como insumo'
                            '03 - aquisi'#231#227'o de servi'#231'os utilizados como insumo'
                            '04 - energia el'#233'trica e t'#233'rmica, inclusive sob a forma de vapor'
                            '05 - alugu'#233'is de pr'#233'dios'
                            '06 - alugu'#233'is de m'#225'quinas e equipamentos'
                            '07 - armazenagem de mercadoria e frete na opera'#231#227'o de venda'
                            '08 - contrapresta'#231#245'es de arrendamento mercantil'
                            
                              '09 - m'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                              'imobilizado (cr'#233'dito sobre encargos de deprecia'#231#227'o).'
                            
                              '10 - m'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                              'imobilizado (cr'#233'dito com base no valor de aquisi'#231#227'o).'
                            
                              '11 - amortiza'#231#227'o e deprecia'#231#227'o de edifica'#231#245'es e benfeitorias em ' +
                              'im'#243'veis'
                            '12 - devolu'#231#227'o de vendas sujeitas '#224' incid'#234'ncia n'#227'o-cumulativa'
                            '13 - outras opera'#231#245'es com direito a cr'#233'dito'
                            '14 - atividade de transporte de cargas '#8211' subcontrata'#231#227'o'
                            
                              '15 - atividade imobili'#225'ria '#8211' custo incorrido de unidade imobili'#225 +
                              'ria'
                            
                              '16 - atividade imobili'#225'ria '#8211' custo or'#231'ado de unidade n'#227'o conclu'#237 +
                              'da'
                            
                              '17 - atividade de presta'#231#227'o de servi'#231'os de limpeza, conserva'#231#227'o ' +
                              'e manuten'#231#227'o '#8211' vale-transporte, vale-refei'#231#227'o ou vale-alimenta'#231#227 +
                              'o, fardamento ou uniforme.'
                            '18 - estoque de abertura de bens')
                          TabOrder = 0
                        end
                      end
                    end
                    object GroupBox9: TGroupBox
                      Left = 0
                      Top = 169
                      Width = 771
                      Height = 56
                      Align = alTop
                      Caption = 'EFD Contribui'#231#245'es e EDF ICMS IPI'
                      TabOrder = 1
                      object imgDevolucaoSPED: TImage
                        Left = 345
                        Top = 83
                        Width = 24
                        Height = 24
                        Cursor = crHelp
                        Picture.Data = {
                          055449636F6E0000010001001818000001002000880900001600000028000000
                          1800000030000000010020000000000060090000000000000000000000000000
                          00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000021
                          0000002700000000000000000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          00000000000000000000000000000000000000000000000000000023170B0088
                          27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                          B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                          C29667E0502700210A0600000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                          150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                          996F44E20000003A000000000000000000000000020100000301000003010000
                          FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                          BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                          C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                          FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                          FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                          FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                          FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                          FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                          FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                          FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                          FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                          E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                          FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                          FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                          E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                          FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                          FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                          FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                          FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                          FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                          FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                          FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                          FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                          FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                          FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                          FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                          FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                          FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                          FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                          FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                          FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                          FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                          FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                          FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                          FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                          FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                          FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                          FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                          E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                          FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                          FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                          EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                          FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                          E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                          FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                          894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                          C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                          8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                          8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                          E0000F00C0000700800007008000030080000100800001008000010080000100
                          8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                          FFFFFF00}
                      end
                      object Label30: TLabel
                        Left = 118
                        Top = 22
                        Width = 71
                        Height = 13
                        Caption = 'Conta Cont'#225'bil'
                      end
                      object edCodContaContabil: TEdit
                        Left = 195
                        Top = 19
                        Width = 144
                        Height = 21
                        TabOrder = 0
                        Text = 'edCodContaContabil'
                        OnExit = edCodContaContabilExit
                        OnKeyDown = edCodContaContabilKeyDown
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 494
              Width = 787
              ExplicitTop = 494
              ExplicitWidth = 787
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS069]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS070]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 542
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 765
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS062]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS063]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 469
            ExplicitWidth = 787
            ExplicitHeight = 469
            inherited Splitter1: TSplitter
              Height = 408
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 408
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_NOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_NOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMIMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEM_IMPOSTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CALC_CUSTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_INT_SAID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_EST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MOSTRAR_REL_COMPRAS'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS064]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS065]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS071]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS067]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Regras de Entrada de Nota fiscal por CFOP e CST - [BAS194]'
                Glyph.Data = {
                  FA030000424DFA03000000000000BA0100002800000018000000180000000100
                  08000000000040020000120B0000120B0000610000006100000000000000FFFF
                  FF00FF00FF006D413D008E5D590080504B007547400073453F00784A41007D4D
                  420080514400865545008A594700905E490095644B009A684D00A6725100A06D
                  4F00D1926D00BC4B0000B0795400AA765200B27E5600BA835800B7815700FF81
                  0000FEFBF800D5812700FAEFE000FCF4EA00FFFCF800EEC58900EEC78E00FFD9
                  A100F2D4A900FBF0E000FBF2E500EBC18000EBC28200EDC48400EBC48600EDC6
                  8900EDC68A00EEC98C00EEC98F00EECA9100EECB9100EFCC9600EFCC9700EFCE
                  9900F0CF9C00F0D09C00EFCF9C00F2D3A100F0D1A100F0D3A300F2D5A600F2D5
                  A700F0D4A600F3D8AC00F3D8AD00F2D8AF00F3DAB200F3DAB400F4DEBA00F6E1
                  C000F6E3C600F8E7CC00F7E6CC00F8EAD300F8EAD400FAEDD900FAF0E000FCF7
                  EF00F3DCB200F3DCB400F4E0BC00F6E2C000F7E5C700F6E5C700F7E7CC00FAED
                  D700FAEED900FAF0DE00FBF3E500FCF7EE00F8EBD300FCF6EA00FCF8F000FEFC
                  F800FFFEFC00F8EED900FCF8EF00FEFBF400FCFAF4000081000000BDFF000202
                  02070404040404040404040404040404040405020202020202033F3D2236312D
                  2A27252525252525252505020202020202073F3C383633302D2B1F2826252525
                  25250502020202020207411B1B1B1B1B1B1B1B1B1B1B1B1B1B25050202020202
                  0206434E4D404B3B3A35342F2D20292C28260502020202020208521B1B1B1B1B
                  1B1B1B1B1B1B1B1B1B29050202020202020954234745504E41404A3C39353337
                  302E050202020202020A5C1B1B1B1B1B1B1B1B1B1B1B1B1B1B32050202020202
                  020B595D5C57241C5256504F41403E4C3C39050202020202020C011313131313
                  1313521B1B1B1B1B1B3F050202020202020D0113191919191913545352465051
                  4241050202020202020E0113606060191913581B1B1B1B1B1B44050202020202
                  020F01135F5F5F6060131A5E491D5455485B050202020202021101135F5F5F5F
                  2113011B1B1B1B1B1B54050202020202021001132121212121130101015A5901
                  5E4905020202020202150113131313131313011B1B1B1B1B1B1E050202020202
                  0214010101010101010101010101010101010502020202020216010101010101
                  0101010101010101010105020202020202180113131313131313131313131313
                  1301050202020202021701131313131313131313131313131301050202020202
                  0217010101010101010101010101010101010502020202020217121212121212
                  1212121212121212121212020202020202020202020202020202020202020202
                  020202020202020202020202020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Descri'#231#227'o Adicional de Natureza de Opera'#231#227'o - [BAS214]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000430F0000430F00000001000000010000CE630000D66B
                  0000D6730000DE7B0000D6730800D6731000D67B2100E7A563006B6B6B008484
                  84009C9C9C00FFD6A500FFD6AD00FFDEB500FFDEBD00FFE7C600FFE7CE00D6D6
                  D600FFEFD600FFEFDE00FFF7E700FFF7EF00FFFFF700FF00FF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00171717171717
                  1717171717171717171717171717171717171717171717171717171717171717
                  1717171717171717171717170000000000000000000000000000000000000000
                  17171717001815151412131212100F0F0E0D0D0C0C0B0B001717171700181800
                  000015110A0A0A0A0A090908080C0B0017171717001818070300161515151212
                  0F0F0E0D0D0C0C0017171717001818070700181815151512120F0F0D0D0D0C00
                  1717171700181818181818181815151512120F0F0F0D0D001717171700181818
                  18181818181818151512120F0F0F0D001717171700181800000018110A0A0A0A
                  0A090908080F0F001717171700181807030018181818181818151512120F0F00
                  171717170018180707001818181818181818151512120F001717171700181818
                  1818181818181818181815151512120017171717001818181818181818181616
                  18151815151212001717171700181800000018110A0A0A0A0A09090808151200
                  1717171700181807030018181818181818151615151512001717171701181807
                  0700181818181818181615151515150017171717011818181818181818181818
                  1815161514141500171717170203030303030303030303030303030303030300
                  1717171700000000000000000000000000000000000000071717171717050505
                  0505050505050505050505050504061717171717171717171717171717171717
                  1717171717171717171717171717171717171717171717171717171717171717
                  1717171717171717171717171717171717171717171717171717}
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
                Hint = 'Ver registros da lixeira - [BAS068]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 408
              ExplicitHeight = 408
              inherited ScrollBox2: TScrollBox
                Height = 391
                ExplicitHeight = 391
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 542
        end
        object tsRegrasCFOPCST: TTabSheet
          Caption = 'tsRegrasCFOPCST'
          ImageIndex = 2
          object pnRegrasCFOPCST: TPanel
            Left = 3
            Top = 3
            Width = 462
            Height = 374
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid16: TDBGrid
              Left = 8
              Top = 10
              Width = 441
              Height = 303
              DataSource = DtmCadBasicos.dsRegCFOPCST
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
                  FieldName = 'CFOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ICMS_OBRIGATORIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICMSST_OBRIGATORIO'
                  Visible = True
                end>
            end
            object Panel10: TPanel
              Left = 8
              Top = 319
              Width = 441
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              OnEnter = Panel19Enter
              object BitBtn41: TBitBtn
                Left = 262
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [BAS196]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = BitBtn41Click
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
              object BitBtn81: TBitBtn
                Left = 100
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [BAS195]'
                Caption = 'Novo'
                TabOrder = 1
                OnClick = BitBtn81Click
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
              object BitBtn82: TBitBtn
                Left = 181
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Excluir Registro - [BAS197]'
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = BitBtn82Click
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
              object BitBtn83: TBitBtn
                Left = 352
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                TabOrder = 3
                OnClick = BitBtn83Click
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
            object Panel16: TPanel
              Left = 8
              Top = 10
              Width = 441
              Height = 303
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              object Label174: TLabel
                Left = 163
                Top = 69
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'CFOP:'
                FocusControl = DBEdit25
              end
              object Label175: TLabel
                Left = 171
                Top = 96
                Width = 23
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST:'
              end
              object Label176: TLabel
                Left = 119
                Top = 123
                Width = 75
                Height = 13
                Alignment = taRightJustify
                Caption = 'Destacar ICMS:'
              end
              object Label177: TLabel
                Left = 104
                Top = 150
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = 'Destacar ICMS ST:'
              end
              object DBEdit25: TDBEdit
                Left = 200
                Top = 66
                Width = 64
                Height = 21
                DataField = 'CFOP'
                DataSource = DtmCadBasicos.dsRegCFOPCST
                TabOrder = 0
                OnEnter = DBEdit25Enter
              end
              object DBComboBox17: TDBComboBox
                Left = 200
                Top = 120
                Width = 64
                Height = 21
                DataField = 'ICMS_OBRIGATORIO'
                DataSource = DtmCadBasicos.dsRegCFOPCST
                ItemHeight = 13
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                TabOrder = 2
                OnEnter = DBComboBox17Enter
              end
              object DBComboBox18: TDBComboBox
                Left = 200
                Top = 147
                Width = 64
                Height = 21
                DataField = 'ICMSST_OBRIGATORIO'
                DataSource = DtmCadBasicos.dsRegCFOPCST
                ItemHeight = 13
                Items.Strings = (
                  'Sim'
                  'N'#227'o')
                TabOrder = 3
                OnEnter = DBComboBox18Enter
              end
              object Panel19: TPanel
                Left = 32
                Top = 249
                Width = 373
                Height = 41
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 4
                OnEnter = Panel19Enter
                object BitBtn84: TBitBtn
                  Left = 190
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Cancelar Registro'
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = BitBtn84Click
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
                object BitBtn87: TBitBtn
                  Left = 104
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Salvar Registro -[BAS198]'
                  Caption = 'Salvar'
                  TabOrder = 0
                  OnClick = BitBtn87Click
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
              object Memo2: TMemo
                Left = 32
                Top = 184
                Width = 373
                Height = 59
                BorderStyle = bsNone
                Color = clBtnFace
                Enabled = False
                TabOrder = 5
              end
              object DBComboBox7: TDBComboBox
                Left = 200
                Top = 93
                Width = 64
                Height = 21
                Style = csDropDownList
                DataField = 'CST'
                DataSource = DtmCadBasicos.dsRegCFOPCST
                ItemHeight = 13
                Items.Strings = (
                  '00'
                  '02 '
                  '10 '
                  '15'
                  '20 '
                  '30 '
                  '40 '
                  '41 '
                  '50 '
                  '53'
                  '51 '
                  '60'
                  '61 '
                  '70 '
                  '90 ')
                TabOrder = 1
                OnEnter = DBComboBox7Enter
              end
            end
          end
        end
        object tsDecricaoNatOp: TTabSheet
          Caption = 'tsDecricaoNatOp'
          ImageIndex = 4
          object pnDescricaoNatOp: TPanel
            Left = 3
            Top = 3
            Width = 676
            Height = 220
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 8
              Top = 10
              Width = 657
              Height = 151
              DataSource = DtmCadBasicos.dsDescNatOp
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
                  FieldName = 'CODIGO_NOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_NOP'
                  Visible = True
                end>
            end
            object Panel5: TPanel
              Left = 8
              Top = 167
              Width = 657
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              OnEnter = Panel19Enter
              object BitBtn7: TBitBtn
                Left = 370
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Editar Registro - [BAS216]'
                Caption = 'Alterar'
                TabOrder = 0
                OnClick = BitBtn7Click
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
              object BitBtn8: TBitBtn
                Left = 208
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Novo Registro - [BAS215]'
                Caption = 'Novo'
                TabOrder = 1
                OnClick = BitBtn8Click
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
              object BitBtn9: TBitBtn
                Left = 289
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Excluir Registro - [BAS217]'
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = BitBtn9Click
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
              object BitBtn10: TBitBtn
                Left = 568
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                TabOrder = 3
                OnClick = BitBtn10Click
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
            object Panel6: TPanel
              Left = 8
              Top = 10
              Width = 657
              Height = 151
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              object Label16: TLabel
                Left = 95
                Top = 21
                Width = 27
                Height = 13
                Alignment = taRightJustify
                Caption = 'CFOP'
                FocusControl = DBEdit4
              end
              object Label17: TLabel
                Left = 76
                Top = 48
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'Descri'#231#227'o'
                FocusControl = DBEdit5
              end
              object DBEdit4: TDBEdit
                Left = 128
                Top = 18
                Width = 64
                Height = 21
                DataField = 'CODIGO_NOP'
                DataSource = DtmCadBasicos.dsDescNatOp
                Enabled = False
                TabOrder = 0
              end
              object Panel7: TPanel
                Left = 10
                Top = 96
                Width = 633
                Height = 41
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                OnEnter = Panel19Enter
                object BitBtn11: TBitBtn
                  Left = 320
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Cancelar Registro'
                  Caption = 'Cancelar'
                  TabOrder = 1
                  OnClick = BitBtn11Click
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
                object BitBtn12: TBitBtn
                  Left = 234
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Salvar Registro - [BAS218]'
                  Caption = 'Salvar'
                  TabOrder = 0
                  OnClick = BitBtn12Click
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
              object DBEdit5: TDBEdit
                Left = 128
                Top = 45
                Width = 473
                Height = 21
                CharCase = ecUpperCase
                DataField = 'DESCRICAO_NOP'
                DataSource = DtmCadBasicos.dsDescNatOp
                TabOrder = 2
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 573
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 573
      inherited bMarketingHW: TBitBtn
        Top = 551
        ExplicitTop = 551
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 573
    ExplicitTop = 573
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited Timer1: TTimer
    Left = 598
    Top = 219
  end
end
