inherited frmCadImpressoras: TfrmCadImpressoras
  Caption = 'Impresoras CNIEE'
  Scaled = False
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
              ActivePage = TabSheet4
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de Impressoras_CNIEE'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 305
                    Caption = 'Cadastro de Impressoras'
                    ExplicitHeight = 305
                    object Label6: TLabel
                      Left = 60
                      Top = 51
                      Width = 69
                      Height = 13
                      Caption = 'Identifica'#231#227'o :'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 102
                      Top = 75
                      Width = 27
                      Height = 13
                      Caption = 'Tipo :'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 93
                      Top = 99
                      Width = 36
                      Height = 13
                      Caption = 'Marca :'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 88
                      Top = 123
                      Width = 41
                      Height = 13
                      Caption = 'Modelo :'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 89
                      Top = 147
                      Width = 40
                      Height = 13
                      Caption = 'Vers'#227'o :'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 26
                      Top = 171
                      Width = 103
                      Height = 13
                      Caption = 'Qtde Lacres ext. Sl. :'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 17
                      Top = 203
                      Width = 113
                      Height = 13
                      Caption = 'Qtde Lacres ext. Fab. :'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 79
                      Top = 225
                      Width = 52
                      Height = 13
                      Caption = 'Tem MFD ?'
                    end
                    object Label14: TLabel
                      Left = 245
                      Top = 225
                      Width = 58
                      Height = 13
                      Caption = 'Lacre MFD ?'
                    end
                    object Label15: TLabel
                      Left = 34
                      Top = 252
                      Width = 96
                      Height = 13
                      Caption = 'Ato Homologat'#243'rio :'
                      FocusControl = DBEdit10
                    end
                    object DBEdit1: TDBEdit
                      Left = 135
                      Top = 48
                      Width = 134
                      Height = 21
                      DataField = 'IDENTIFICACAO'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 135
                      Top = 72
                      Width = 264
                      Height = 21
                      DataField = 'TIPO_ECF'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 134
                      Top = 96
                      Width = 264
                      Height = 21
                      DataField = 'MARCA_ECF'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 134
                      Top = 120
                      Width = 363
                      Height = 21
                      DataField = 'MODELO_ECF'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 134
                      Top = 143
                      Width = 264
                      Height = 21
                      DataField = 'VERSAOSB'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 134
                      Top = 168
                      Width = 134
                      Height = 21
                      DataField = 'QTDELACRESEXTSL'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 135
                      Top = 195
                      Width = 134
                      Height = 21
                      DataField = 'QTDELACRESEXTFAB'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 6
                    end
                    object DBEdit10: TDBEdit
                      Left = 135
                      Top = 249
                      Width = 362
                      Height = 21
                      DataField = 'ATO_APROVACAO'
                      DataSource = DtmCadBasicos.dsImpressoras
                      TabOrder = 9
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 137
                      Top = 222
                      Width = 90
                      Height = 21
                      DataField = 'TEMFD'
                      DataSource = DtmCadBasicos.dsImpressoras
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 7
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 308
                      Top = 222
                      Width = 90
                      Height = 21
                      DataField = 'LACREMFD'
                      DataSource = DtmCadBasicos.dsImpressoras
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      TabOrder = 8
                      OnKeyPress = DBComboBox2KeyPress
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Relat'#243'rio'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object QuickRep1: TQuickRep
                  Left = 3
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicos.cdsImpressoras
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
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoomToFit
                  PreviewDefaultSaveType = stQRP
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 121
                    Width = 718
                    Height = 22
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
                      58.208333333333340000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 5
                      Top = 5
                      Width = 74
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        13.229166666666670000
                        13.229166666666670000
                        195.791666666666700000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'IDENTIFICACAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object s: TQRDBText
                      Left = 85
                      Top = 5
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        224.895833333333300000
                        13.229166666666670000
                        121.708333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'TIPO_ECF'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText3: TQRDBText
                      Left = 136
                      Top = 5
                      Width = 58
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        359.833333333333400000
                        13.229166666666670000
                        153.458333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'MARCA_ECF'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText4: TQRDBText
                      Left = 217
                      Top = 5
                      Width = 64
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        574.145833333333400000
                        13.229166666666670000
                        169.333333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'MODELO_ECF'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText5: TQRDBText
                      Left = 326
                      Top = 5
                      Width = 51
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        862.541666666666900000
                        13.229166666666670000
                        134.937500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'VERSAOSB'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText6: TQRDBText
                      Left = 469
                      Top = 5
                      Width = 90
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1240.895833333333000000
                        13.229166666666670000
                        238.125000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'QTDELACRESEXTSL'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText7: TQRDBText
                      Left = 409
                      Top = 5
                      Width = 97
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1082.145833333333000000
                        13.229166666666670000
                        256.645833333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'QTDELACRESEXTFAB'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText8: TQRDBText
                      Left = 501
                      Top = 5
                      Width = 32
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1325.562500000000000000
                        13.229166666666670000
                        84.666666666666680000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'TEMFD'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText9: TQRDBText
                      Left = 553
                      Top = 5
                      Width = 52
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1463.145833333333000000
                        13.229166666666670000
                        137.583333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'LACREMFD'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText10: TQRDBText
                      Left = 573
                      Top = 6
                      Width = 82
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1516.062500000000000000
                        15.875000000000000000
                        216.958333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsImpressoras
                      DataField = 'ATO_APROVACAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                  end
                  object ColumnHeaderBand1: TQRBand
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
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 0
                      Top = 1
                      Width = 190
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        2.645833333333333000
                        502.708333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Relat'#243'rio de Impressoras CNIEE'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -13
                      Font.Name = 'Arial'
                      Font.Style = [fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRSysData1: TQRSysData
                      Left = 69
                      Top = 18
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        182.562500000000000000
                        47.625000000000000000
                        179.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      Color = clWhite
                      Data = qrsDateTime
                      Transparent = False
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel2: TQRLabel
                      Left = 0
                      Top = 18
                      Width = 67
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        47.625000000000000000
                        177.270833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Data/Hora :'
                      Color = clWhite
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel3: TQRLabel
                      Left = 630
                      Top = 18
                      Width = 49
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1666.875000000000000000
                        47.625000000000000000
                        129.645833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'P'#225'gina :'
                      Color = clWhite
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRSysData2: TQRSysData
                      Left = 680
                      Top = 18
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1799.166666666667000000
                        47.625000000000000000
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
                    object QRLabel4: TQRLabel
                      Left = 11
                      Top = 44
                      Width = 59
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        29.104166666666670000
                        116.416666666666700000
                        156.104166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Identifica'#231#227'o'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRHRule1: TQRHRule
                      Left = 0
                      Top = 35
                      Width = 719
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        92.604166666666680000
                        1902.354166666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 78
                      Width = 719
                      Height = 3
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        7.937500000000000000
                        0.000000000000000000
                        206.375000000000000000
                        1902.354166666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRLabel5: TQRLabel
                      Left = 96
                      Top = 44
                      Width = 21
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        254.000000000000000000
                        116.416666666666700000
                        55.562500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Tipo'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel6: TQRLabel
                      Left = 157
                      Top = 44
                      Width = 27
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        415.395833333333400000
                        116.416666666666700000
                        71.437500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Marca'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel7: TQRLabel
                      Left = 248
                      Top = 44
                      Width = 34
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        656.166666666666800000
                        116.416666666666700000
                        89.958333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Modelo'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel8: TQRLabel
                      Left = 326
                      Top = 44
                      Width = 48
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        862.541666666666900000
                        116.416666666666700000
                        127.000000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Vers'#227'o SB'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel9: TQRLabel
                      Left = 385
                      Top = 44
                      Width = 55
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1018.645833333333000000
                        116.416666666666700000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Qtde Lacres'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel10: TQRLabel
                      Left = 385
                      Top = 59
                      Width = 30
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1018.645833333333000000
                        156.104166666666700000
                        79.375000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Ext SL'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel11: TQRLabel
                      Left = 445
                      Top = 44
                      Width = 55
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1177.395833333333000000
                        116.416666666666700000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Qtde Lacres'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel12: TQRLabel
                      Left = 445
                      Top = 60
                      Width = 35
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1177.395833333333000000
                        158.750000000000000000
                        92.604166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Ext Fab'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel13: TQRLabel
                      Left = 326
                      Top = 59
                      Width = 35
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        862.541666666666900000
                        156.104166666666700000
                        92.604166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'do ECF'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel14: TQRLabel
                      Left = 248
                      Top = 59
                      Width = 20
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        656.166666666666800000
                        156.104166666666700000
                        52.916666666666670000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'ECF'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel15: TQRLabel
                      Left = 157
                      Top = 59
                      Width = 20
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        415.395833333333400000
                        156.104166666666700000
                        52.916666666666670000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'ECF'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel16: TQRLabel
                      Left = 96
                      Top = 59
                      Width = 20
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        254.000000000000000000
                        156.104166666666700000
                        52.916666666666670000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'ECF'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel17: TQRLabel
                      Left = 0
                      Top = 59
                      Width = 23
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        156.104166666666700000
                        60.854166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Marca'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -8
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 6
                    end
                    object QRLabel18: TQRLabel
                      Left = 25
                      Top = 59
                      Width = 26
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        66.145833333333340000
                        156.104166666666700000
                        68.791666666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Modelo'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -8
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 6
                    end
                    object QRLabel19: TQRLabel
                      Left = 54
                      Top = 59
                      Width = 25
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        142.875000000000000000
                        156.104166666666700000
                        66.145833333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Vers'#227'o'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -8
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 6
                    end
                    object QRLabel20: TQRLabel
                      Left = 505
                      Top = 43
                      Width = 22
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1336.145833333333000000
                        113.770833333333300000
                        58.208333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Tem '
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel21: TQRLabel
                      Left = 505
                      Top = 59
                      Width = 29
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1336.145833333333000000
                        156.104166666666700000
                        76.729166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'MFD ?'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel22: TQRLabel
                      Left = 542
                      Top = 43
                      Width = 26
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1434.041666666667000000
                        113.770833333333300000
                        68.791666666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Lacre'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel23: TQRLabel
                      Left = 542
                      Top = 59
                      Width = 29
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1434.041666666667000000
                        156.104166666666700000
                        76.729166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'MFD ?'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel24: TQRLabel
                      Left = 622
                      Top = 43
                      Width = 29
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1645.708333333333000000
                        113.770833333333300000
                        76.729166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Ato de'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRLabel25: TQRLabel
                      Left = 622
                      Top = 59
                      Width = 48
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1645.708333333333000000
                        156.104166666666700000
                        127.000000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Aprova'#231#227'o'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                  end
                  object QRShape3: TQRShape
                    Left = 251
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      664.104166666666800000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape4: TQRShape
                    Left = 359
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      949.854166666666800000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape5: TQRShape
                    Left = 419
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      1108.604166666667000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape6: TQRShape
                    Left = 479
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      1267.354166666667000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape7: TQRShape
                    Left = 539
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      1426.104166666667000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape8: TQRShape
                    Left = 575
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      1521.354166666667000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape9: TQRShape
                    Left = 611
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      1616.604166666667000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape1: TQRShape
                    Left = 120
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      317.500000000000000000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRShape2: TQRShape
                    Left = 170
                    Top = 81
                    Width = 1
                    Height = 34
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      89.958333333333320000
                      449.791666666666700000
                      214.312500000000000000
                      2.645833333333333000)
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS303]'
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
              Hint = 'Clique para pesquisar - [BAS297]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS298]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsImpressoras
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS299]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS300]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS305]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 177
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS302]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS304]'
                OnClick = SpeedButton25Click
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
  inherited PopupMenu1: TPopupMenu
    Left = 692
    Top = 444
  end
  inherited PopupMenu2: TPopupMenu
    Left = 750
    Top = 446
  end
  inherited Timer1: TTimer
    Left = 718
    Top = 446
  end
end
