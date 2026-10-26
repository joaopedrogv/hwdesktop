inherited frmBuscaAudtioria_V2: TfrmBuscaAudtioria_V2
  Caption = 'Auditoria'
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
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Width = 791
                    ExplicitWidth = 791
                  end
                  object QuickRep1: TQuickRep
                    Left = -3
                    Top = 5
                    Width = 794
                    Height = 1123
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
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
                    PreviewInitialState = wsNormal
                    PrevInitialZoom = qrZoomToFit
                    PreviewDefaultSaveType = stQRP
                    object QRBand1: TQRBand
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
                        Left = 207
                        Top = 3
                        Width = 268
                        Height = 25
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          66.145833333333340000
                          547.687500000000000000
                          7.937500000000000000
                          709.083333333333400000)
                        Alignment = taCenter
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'RELAT'#211'RIO DE AUDITORIA'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -19
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 14
                      end
                      object QRHRule1: TQRHRule
                        Left = -1
                        Top = 59
                        Width = 722
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          26.458333333333330000
                          -2.645833333333333000
                          156.104166666666700000
                          1910.291666666667000000)
                        VertAdjust = 0
                        Pen.Width = 2
                      end
                      object QRHRule2: TQRHRule
                        Left = 0
                        Top = 84
                        Width = 721
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          26.458333333333330000
                          0.000000000000000000
                          222.250000000000000000
                          1907.645833333333000000)
                        VertAdjust = 0
                        Pen.Width = 2
                      end
                      object QRLabel3: TQRLabel
                        Left = 3
                        Top = 44
                        Width = 85
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
                          224.895833333333300000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Data/Hora:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
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
                        Width = 92
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
                          243.416666666666700000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        Color = clWhite
                        Data = qrsDateTime
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold, fsItalic]
                        ParentFont = False
                        Transparent = False
                        ExportAs = exptText
                        FontSize = 10
                      end
                      object QRLabel4: TQRLabel
                        Left = 608
                        Top = 45
                        Width = 62
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
                          164.041666666666700000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'P'#225'gina:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold, fsItalic]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 10
                      end
                      object QRLabel17: TQRLabel
                        Left = 3
                        Top = 67
                        Width = 144
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          7.937500000000000000
                          177.270833333333300000
                          381.000000000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'C'#243'digo da Empresa:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 10
                      end
                      object QRDBText1: TQRDBText
                        Left = 151
                        Top = 67
                        Width = 115
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          399.520833333333400000
                          177.270833333333300000
                          304.270833333333400000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'COD_EMPRESA'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 10
                      end
                      object QRSysData2: TQRSysData
                        Left = 666
                        Top = 45
                        Width = 64
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1762.125000000000000000
                          119.062500000000000000
                          169.333333333333300000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        Color = clWhite
                        Data = qrsPageNumber
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -13
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold, fsItalic]
                        ParentFont = False
                        Transparent = False
                        ExportAs = exptText
                        FontSize = 10
                      end
                    end
                    object DetailBand1: TQRBand
                      Left = 38
                      Top = 129
                      Width = 718
                      Height = 79
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
                        209.020833333333300000
                        1899.708333333333000000)
                      PreCaluculateBandHeight = False
                      KeepOnOnePage = False
                      BandType = rbDetail
                      object QRLabel1: TQRLabel
                        Left = 20
                        Top = 0
                        Width = 45
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          52.916666666666660000
                          0.000000000000000000
                          119.062500000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'C'#243'digo:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel10: TQRLabel
                        Left = -1
                        Top = 20
                        Width = 66
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          -2.645833333333333000
                          52.916666666666670000
                          174.625000000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Data/Hora:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel15: TQRLabel
                        Left = 30
                        Top = 38
                        Width = 35
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          79.375000000000000000
                          100.541666666666700000
                          92.604166666666680000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'A'#231#227'o:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel12: TQRLabel
                        Left = -1
                        Top = 56
                        Width = 66
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          -2.645833333333333000
                          148.166666666666700000
                          174.625000000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Mensagem:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel5: TQRLabel
                        Left = 156
                        Top = 0
                        Width = 76
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          412.750000000000100000
                          0.000000000000000000
                          201.083333333333300000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Endere'#231'o IP:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel13: TQRLabel
                        Left = 174
                        Top = 20
                        Width = 58
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          460.375000000000000000
                          52.916666666666670000
                          153.458333333333300000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Processo:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel6: TQRLabel
                        Left = 315
                        Top = 0
                        Width = 60
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          833.437500000000000000
                          0.000000000000000000
                          158.750000000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Serial HD:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel2: TQRLabel
                        Left = 302
                        Top = 20
                        Width = 73
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          799.041666666666800000
                          52.916666666666670000
                          193.145833333333300000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Computador:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel7: TQRLabel
                        Left = 433
                        Top = 0
                        Width = 49
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          1145.645833333333000000
                          0.000000000000000000
                          129.645833333333300000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Usu'#225'rio:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel8: TQRLabel
                        Left = 554
                        Top = 0
                        Width = 51
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          1465.791666666667000000
                          0.000000000000000000
                          134.937500000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Gerente:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel14: TQRLabel
                        Left = 560
                        Top = 20
                        Width = 45
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          1481.666666666667000000
                          52.916666666666670000
                          119.062500000000000000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Tabela:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRLabel16: TQRLabel
                        Left = 451
                        Top = 38
                        Width = 154
                        Height = 18
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          47.625000000000000000
                          1193.270833333333000000
                          100.541666666666700000
                          407.458333333333400000)
                        Alignment = taRightJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Caption = 'Cod. Tabela Movimentada:'
                        Color = clWhite
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 8
                      end
                      object QRDBText2: TQRDBText
                        Left = 68
                        Top = 1
                        Width = 43
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          179.916666666666700000
                          2.645833333333333000
                          113.770833333333300000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'CODIGO'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText3: TQRDBText
                        Left = 68
                        Top = 21
                        Width = 30
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          179.916666666666700000
                          55.562500000000000000
                          79.375000000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'DATA'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText4: TQRDBText
                        Left = 235
                        Top = 21
                        Width = 60
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          621.770833333333400000
                          55.562500000000000000
                          158.750000000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'PROCESSO'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText5: TQRDBText
                        Left = 378
                        Top = 21
                        Width = 110
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1000.125000000000000000
                          55.562500000000000000
                          291.041666666666700000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'NOMECOMPUTADOR'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText6: TQRDBText
                        Left = 608
                        Top = 21
                        Width = 42
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1608.666666666667000000
                          55.562500000000000000
                          111.125000000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'TABELA'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText7: TQRDBText
                        Left = 235
                        Top = 1
                        Width = 11
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          621.770833333333400000
                          2.645833333333333000
                          29.104166666666670000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'IP'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText8: TQRDBText
                        Left = 378
                        Top = 1
                        Width = 55
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1000.125000000000000000
                          2.645833333333333000
                          145.520833333333300000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'SERIALHD'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText9: TQRDBText
                        Left = 485
                        Top = 1
                        Width = 50
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1283.229166666667000000
                          2.645833333333333000
                          132.291666666666700000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'USUARIO'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText10: TQRDBText
                        Left = 608
                        Top = 1
                        Width = 149
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1608.666666666667000000
                          2.645833333333333000
                          394.229166666666700000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'USUARIOGERENTELIBEROU'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText11: TQRDBText
                        Left = 68
                        Top = 39
                        Width = 30
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          179.916666666666700000
                          103.187500000000000000
                          79.375000000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'ACAO'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText12: TQRDBText
                        Left = 608
                        Top = 39
                        Width = 88
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          1608.666666666667000000
                          103.187500000000000000
                          232.833333333333400000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'CODIGOTABMOV'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRDBText13: TQRDBText
                        Left = 68
                        Top = 57
                        Width = 63
                        Height = 17
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          44.979166666666670000
                          179.916666666666700000
                          150.812500000000000000
                          166.687500000000000000)
                        Alignment = taLeftJustify
                        AlignToBand = False
                        AutoSize = True
                        AutoStretch = False
                        Color = clWhite
                        DataField = 'MENSAGEM'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                        Transparent = False
                        WordWrap = True
                        ExportAs = exptText
                        FontSize = 7
                      end
                      object QRPShape1: TQRPShape
                        Left = 2
                        Top = 71
                        Width = 713
                        Height = 8
                        Frame.Color = clBlack
                        Frame.DrawTop = False
                        Frame.DrawBottom = False
                        Frame.DrawLeft = False
                        Frame.DrawRight = False
                        Size.Values = (
                          21.166666666666670000
                          5.291666666666667000
                          187.854166666666700000
                          1886.479166666667000000)
                        Pen.Style = psDot
                        Shape = qrpsHorLine
                        VertAdjust = 0
                        FixBottomPosition = False
                        StretchHeightWithBand = False
                      end
                    end
                  end
                end
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
            Height = 201
            ExplicitHeight = 201
            inherited imgInformation: TImage
              Height = 184
              ExplicitHeight = 184
            end
            inherited BitBtn2: TBitBtn
              TabOrder = 8
            end
            inherited BitBtn3: TBitBtn
              TabOrder = 10
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              TabOrder = 9
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              TabOrder = 11
            end
            object GroupBox4: TGroupBox
              Left = 2
              Top = 71
              Width = 775
              Height = 127
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
              OnExit = GroupBox4Exit
              object SpeedButton9: TSpeedButton
                Left = 346
                Top = 18
                Width = 23
                Height = 21
                Caption = 'E'
                Flat = True
                Visible = False
              end
              object SpeedButton10: TSpeedButton
                Left = 346
                Top = 45
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton13: TSpeedButton
                Left = 346
                Top = 99
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton14: TSpeedButton
                Left = 346
                Top = 72
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton15: TSpeedButton
                Left = 728
                Top = 18
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton16: TSpeedButton
                Left = 728
                Top = 45
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton17: TSpeedButton
                Left = 728
                Top = 72
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object SpeedButton18: TSpeedButton
                Left = 728
                Top = 98
                Width = 23
                Height = 21
                Caption = 'OU'
                Flat = True
                Visible = False
              end
              object Edit1: TEdit
                Left = 18
                Top = 18
                Width = 112
                Height = 21
                TabOrder = 0
                Text = 'Nome Computador'
                Visible = False
              end
              object Edit3: TEdit
                Left = 228
                Top = 18
                Width = 112
                Height = 21
                TabOrder = 1
                Text = 'Edit3'
                Visible = False
              end
              object ComboBox4: TComboBox
                Left = 136
                Top = 18
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 2
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit2: TEdit
                Left = 18
                Top = 45
                Width = 112
                Height = 21
                TabOrder = 3
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox5: TComboBox
                Left = 136
                Top = 45
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit4: TEdit
                Left = 228
                Top = 45
                Width = 112
                Height = 21
                TabOrder = 5
                Text = 'Edit3'
                Visible = False
              end
              object Edit5: TEdit
                Left = 18
                Top = 72
                Width = 112
                Height = 21
                TabOrder = 6
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox6: TComboBox
                Left = 136
                Top = 72
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 7
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit6: TEdit
                Left = 228
                Top = 72
                Width = 112
                Height = 21
                TabOrder = 8
                Text = 'Edit3'
                Visible = False
              end
              object Edit7: TEdit
                Left = 18
                Top = 99
                Width = 112
                Height = 21
                TabOrder = 9
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox7: TComboBox
                Left = 136
                Top = 99
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 10
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit8: TEdit
                Left = 228
                Top = 99
                Width = 112
                Height = 21
                TabOrder = 11
                Text = 'Edit3'
                Visible = False
              end
              object Edit9: TEdit
                Left = 400
                Top = 18
                Width = 112
                Height = 21
                TabOrder = 12
                Text = 'Nome Computador'
                Visible = False
              end
              object Edit10: TEdit
                Left = 610
                Top = 18
                Width = 112
                Height = 21
                TabOrder = 13
                Text = 'Edit3'
                Visible = False
              end
              object ComboBox8: TComboBox
                Left = 518
                Top = 18
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 14
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit11: TEdit
                Left = 400
                Top = 45
                Width = 112
                Height = 21
                TabOrder = 15
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox9: TComboBox
                Left = 518
                Top = 45
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 16
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit12: TEdit
                Left = 610
                Top = 45
                Width = 112
                Height = 21
                TabOrder = 17
                Text = 'Edit3'
                Visible = False
              end
              object Edit13: TEdit
                Left = 401
                Top = 72
                Width = 112
                Height = 21
                TabOrder = 18
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox10: TComboBox
                Left = 519
                Top = 72
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 19
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit14: TEdit
                Left = 611
                Top = 72
                Width = 112
                Height = 21
                TabOrder = 20
                Text = 'Edit3'
                Visible = False
              end
              object Edit15: TEdit
                Left = 401
                Top = 99
                Width = 112
                Height = 21
                TabOrder = 21
                Text = 'Nome Computador'
                Visible = False
              end
              object ComboBox11: TComboBox
                Left = 519
                Top = 99
                Width = 86
                Height = 21
                ItemHeight = 13
                TabOrder = 22
                Text = 'Esta Contido'
                Visible = False
              end
              object Edit16: TEdit
                Left = 611
                Top = 99
                Width = 112
                Height = 21
                TabOrder = 23
                Text = 'Edit3'
                Visible = False
              end
            end
            object BitBtn7: TBitBtn
              Left = 498
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Imprimir'
              Caption = '&Imprimir'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BitBtn3Click
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                10000300000000020000120B0000120B00000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                734EF75E104210429452AE358610861086108610861086108610861086108610
                AE35945210423146F75EAE358610861086108610861086108610861086108610
                AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
          end
          inherited Panel1: TPanel
            Top = 201
            Height = 309
            ExplicitTop = 201
            ExplicitHeight = 309
            inherited Splitter1: TSplitter
              Height = 248
              ExplicitHeight = 248
            end
            inherited DBGrid1: TDBGrid
              Height = 248
            end
            inherited Panel2: TPanel
              Enabled = False
              Visible = False
              inherited SpeedButton1: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton2: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
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
                Top = 3
                Enabled = False
                Visible = False
                ExplicitTop = 3
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 248
              ExplicitHeight = 248
              inherited ScrollBox2: TScrollBox
                Height = 231
                ExplicitHeight = 231
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
    object AdicionaraPesquisaAdicional: TMenuItem
      Caption = 'Adcionar a Pesquisa Adicional'
      RadioItem = True
      OnClick = AdicionaraPesquisaAdicionalClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Top = 155
  end
  inherited Timer1: TTimer
    Top = 155
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Top = 155
  end
  object PopupMenu3: TPopupMenu
    Left = 614
    Top = 82
    object Removeritemdapesquisa1: TMenuItem
      Caption = 'Remover item da pesquisa'
      OnClick = Removeritemdapesquisa1Click
    end
  end
end
