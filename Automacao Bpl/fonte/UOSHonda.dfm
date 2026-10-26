object FrmOSHonda: TFrmOSHonda
  Left = 233
  Top = 94
  Caption = 'Os Honda'
  ClientHeight = 442
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = -9
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
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
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 1041
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
        2754.312500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRShape1: TQRShape
        Left = 8
        Top = 26
        Width = 710
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333000000
          21.166666666666700000
          68.791666666666700000
          1878.541666666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 8
        Top = 80
        Width = 391
        Height = 136
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          359.833333333333000000
          21.166666666666700000
          211.666666666667000000
          1034.520833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 399
        Top = 80
        Width = 319
        Height = 136
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          359.833333333333000000
          1055.687500000000000000
          211.666666666667000000
          844.020833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 123
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          325.437500000000000000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 248
        Top = 123
        Width = 14
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          325.437500000000000000
          37.041666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'UF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 16
        Top = 147
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          388.937500000000000000
          55.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tel.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 218
        Top = 147
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          576.791666666666800000
          388.937500000000000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fax.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 16
        Top = 171
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          452.437500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C.N.P.J N'#186'.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 216
        Top = 171
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          452.437500000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSC. EST. N'#186'.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 16
        Top = 195
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          515.937500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E-MAIL.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 416
        Top = 86
        Width = 289
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          227.541666666667000000
          764.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ORDEM DE SERVI'#199'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 409
        Top = 118
        Width = 19
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          312.208333333333400000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N.'#186':'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 409
        Top = 144
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          381.000000000000000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONDI'#199#195'O PAGAMENTO.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 409
        Top = 168
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          444.500000000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA EMISS'#195'O'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 584
        Top = 168
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          444.500000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VALIDADE.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 656
        Top = 168
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          444.500000000000000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 688
        Top = 168
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          444.500000000000000000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DIAS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 409
        Top = 192
        Width = 239
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          508.000000000000000000
          632.354166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OR'#199'AMENTO PR'#201'VIO A SER EMITIDO EM.:'
        Color = clWhite
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
      object QRLabel30: TQRLabel
        Left = 656
        Top = 192
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          508.000000000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '00/00/0000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 8
        Top = 216
        Width = 459
        Height = 127
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          336.020833333333000000
          21.166666666666700000
          571.500000000000000000
          1214.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel31: TQRLabel
        Left = 16
        Top = 227
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          600.604166666666800000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel32: TQRLabel
        Left = 16
        Top = 246
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          650.875000000000000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'END.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 16
        Top = 265
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          701.145833333333400000
          68.791666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CEP.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel34: TQRLabel
        Left = 16
        Top = 285
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          754.062500000000000000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CGC.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 16
        Top = 306
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          809.625000000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TEL.(RES.):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel36: TQRLabel
        Left = 64
        Top = 227
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          600.604166666666800000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NONONONONONO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel37: TQRLabel
        Left = 64
        Top = 246
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          650.875000000000000000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NONONONONONONON'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel38: TQRLabel
        Left = 64
        Top = 265
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          701.145833333333400000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '00000-000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel39: TQRLabel
        Left = 64
        Top = 285
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          754.062500000000000000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '00.000.000/0000-00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel40: TQRLabel
        Left = 88
        Top = 306
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          809.625000000000000000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(0XX00)5555-5555'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 206
        Top = 265
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          545.041666666666700000
          701.145833333333400000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CIDADE.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 254
        Top = 265
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          672.041666666666800000
          701.145833333333400000
          359.833333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NONONONONONONONONO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel43: TQRLabel
        Left = 398
        Top = 265
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1053.041666666667000000
          701.145833333333400000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ESTADO:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel44: TQRLabel
        Left = 446
        Top = 265
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1180.041666666667000000
          701.145833333333400000
          42.333333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel45: TQRLabel
        Left = 206
        Top = 285
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          545.041666666666700000
          754.062500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INSC. EST.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel46: TQRLabel
        Left = 262
        Top = 285
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          693.208333333333400000
          754.062500000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel47: TQRLabel
        Left = 206
        Top = 306
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          545.041666666666700000
          809.625000000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(COM.):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel48: TQRLabel
        Left = 248
        Top = 306
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          809.625000000000000000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(0XX00)5555-5555'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 467
        Top = 216
        Width = 80
        Height = 127
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          336.020833333333000000
          1235.604166666670000000
          571.500000000000000000
          211.666666666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel49: TQRLabel
        Left = 472
        Top = 222
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          587.375000000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TIPO DE SERVI'#199'O'
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
      object QRShape6: TQRShape
        Left = 470
        Top = 241
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          637.645833333333200000
          42.333333333333330000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel51: TQRLabel
        Left = 489
        Top = 242
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          640.291666666666800000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EXTERNO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 547
        Top = 216
        Width = 171
        Height = 318
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          841.375000000000000000
          1447.270833333330000000
          571.500000000000000000
          452.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel54: TQRLabel
        Left = 574
        Top = 219
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          579.437500000000000000
          272.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DADOS DO VE'#205'CULO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel55: TQRLabel
        Left = 550
        Top = 243
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          642.937500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'MODELO:'
        Color = clWhite
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
      object QRLabel56: TQRLabel
        Left = 550
        Top = 267
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          706.437500000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' MOTOR:'
        Color = clWhite
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
      object QRLabel57: TQRLabel
        Left = 550
        Top = 291
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          769.937500000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' CHASSI:'
        Color = clWhite
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
      object QRLabel58: TQRLabel
        Left = 550
        Top = 315
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          833.437500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ANO FABR.:'
        Color = clWhite
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
      object QRLabel59: TQRLabel
        Left = 550
        Top = 338
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          894.291666666666800000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'COR:'
        Color = clWhite
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
      object QRLabel60: TQRLabel
        Left = 550
        Top = 362
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          957.791666666666800000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLACA:'
        Color = clWhite
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
      object QRLabel61: TQRLabel
        Left = 550
        Top = 387
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          1023.937500000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'KM:'
        Color = clWhite
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
      object QRLabel62: TQRLabel
        Left = 550
        Top = 411
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          1087.437500000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DATA VENDA:'
        Color = clWhite
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
      object QRLabel63: TQRLabel
        Left = 550
        Top = 435
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          1150.937500000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONC. VENDEDORA:'
        Color = clWhite
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
      object QRLabel64: TQRLabel
        Left = 550
        Top = 459
        Width = 133
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          1214.437500000000000000
          351.895833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #218'LTIMA CONC. EXECUTANTE:'
        Color = clWhite
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
      object QRLabel65: TQRLabel
        Left = 550
        Top = 480
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1455.208333333333000000
          1270.000000000000000000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRISMA (N'#186'/COR):'
        Color = clWhite
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
      object QRLabel66: TQRLabel
        Left = 550
        Top = 502
        Width = 167
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1455.208333333330000000
          1328.208333333330000000
          441.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RECEPCIONISTA:'
        Color = clWhite
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
      object QRShape10: TQRShape
        Left = 8
        Top = 343
        Width = 539
        Height = 290
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          767.291666666667000000
          21.166666666666700000
          907.520833333333000000
          1426.104166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel67: TQRLabel
        Left = 12
        Top = 347
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          918.104166666666800000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ITEM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel68: TQRLabel
        Left = 52
        Top = 347
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          137.583333333333300000
          918.104166666666800000
          60.854166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TMO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel69: TQRLabel
        Left = 200
        Top = 347
        Width = 211
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          918.104166666666800000
          558.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCRI'#199#195'O DA SOLICITA'#199#195'O DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape11: TQRShape
        Left = 547
        Top = 534
        Width = 171
        Height = 99
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          261.937500000000000000
          1447.270833333330000000
          1412.875000000000000000
          452.437500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel70: TQRLabel
        Left = 561
        Top = 538
        Width = 152
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1484.312500000000000000
          1423.458333333333000000
          402.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQUISI'#199#195'O DE PE'#199'AS'
        Color = clWhite
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
      object QRShape12: TQRShape
        Left = 8
        Top = 633
        Width = 329
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333000000
          21.166666666666700000
          1674.812500000000000000
          870.479166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 337
        Top = 633
        Width = 96
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333000000
          891.645833333333000000
          1674.812500000000000000
          254.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 433
        Top = 633
        Width = 285
        Height = 246
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          650.875000000000000000
          1145.645833333330000000
          1674.812500000000000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 8
        Top = 706
        Width = 425
        Height = 98
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          259.291666666667000000
          21.166666666666700000
          1867.958333333330000000
          1124.479166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 8
        Top = 804
        Width = 425
        Height = 75
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          198.437500000000000000
          21.166666666666700000
          2127.250000000000000000
          1124.479166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 8
        Top = 879
        Width = 361
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333000000
          21.166666666666700000
          2325.687500000000000000
          955.145833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 369
        Top = 879
        Width = 349
        Height = 46
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          121.708333333333000000
          976.312500000000000000
          2325.687500000000000000
          923.395833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 8
        Top = 960
        Width = 710
        Height = 75
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          198.437500000000000000
          21.166666666666700000
          2540.000000000000000000
          1878.541666666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape20: TQRShape
        Left = 341
        Top = 661
        Width = 32
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333000000
          902.229166666667000000
          1748.895833333330000000
          84.666666666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape21: TQRShape
        Left = 362
        Top = 657
        Width = 30
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          957.791666666667000000
          1738.312500000000000000
          79.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape22: TQRShape
        Left = 362
        Top = 671
        Width = 21
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          957.791666666667000000
          1775.354166666670000000
          55.562500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape23: TQRShape
        Left = 362
        Top = 682
        Width = 21
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          957.791666666667000000
          1804.458333333330000000
          55.562500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape24: TQRShape
        Left = 362
        Top = 691
        Width = 21
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          957.791666666667000000
          1828.270833333330000000
          55.562500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 546
        Top = 553
        Width = 171
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1444.625000000000000000
          1463.145833333330000000
          452.437500000000000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape26: TQRShape
        Left = 546
        Top = 570
        Width = 171
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1444.625000000000000000
          1508.125000000000000000
          452.437500000000000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 546
        Top = 588
        Width = 171
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1444.625000000000000000
          1555.750000000000000000
          452.437500000000000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 546
        Top = 609
        Width = 171
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1444.625000000000000000
          1611.312500000000000000
          452.437500000000000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 635
        Top = 558
        Width = 2
        Height = 74
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          195.791666666667000000
          1680.104166666670000000
          1476.375000000000000000
          5.291666666666670000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel81: TQRLabel
        Left = 546
        Top = 635
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1444.625000000000000000
          1680.104166666667000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESPESAS'
        Color = clWhite
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
      object QRShape32: TQRShape
        Left = 434
        Top = 649
        Width = 283
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1148.291666666670000000
          1717.145833333330000000
          748.770833333333000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 434
        Top = 754
        Width = 283
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1148.291666666670000000
          1994.958333333330000000
          748.770833333333000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape36: TQRShape
        Left = 434
        Top = 834
        Width = 283
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1148.291666666670000000
          2206.625000000000000000
          748.770833333333000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 434
        Top = 854
        Width = 283
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1148.291666666670000000
          2259.541666666670000000
          748.770833333333000000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape37: TQRShape
        Left = 66
        Top = 858
        Width = 295
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          174.625000000000000000
          2270.125000000000000000
          780.520833333333000000)
        Pen.Mode = pmBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel105: TQRLabel
        Left = 31
        Top = 885
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          82.020833333333340000
          2341.562500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CAIXA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel106: TQRLabel
        Left = 19
        Top = 906
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          2397.125000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '___/___/___'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel107: TQRLabel
        Left = 215
        Top = 903
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          568.854166666666700000
          2389.187500000000000000
          84.666666666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VISTO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape39: TQRShape
        Left = 136
        Top = 894
        Width = 185
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          359.833333333333000000
          2365.375000000000000000
          489.479166666667000000)
        Pen.Mode = pmBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel108: TQRLabel
        Left = 378
        Top = 883
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1000.125000000000000000
          2336.270833333333000000
          328.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRODUTO RETIRADO EM '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel109: TQRLabel
        Left = 409
        Top = 903
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1082.145833333333000000
          2389.187500000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '___/___/___'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel111: TQRLabel
        Left = 22
        Top = 967
        Width = 362
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          58.208333333333340000
          2558.520833333333000000
          957.791666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'Prezado Cliente: apresente este comprovante para retirada de seu' +
          ' ve'#237'culo.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel112: TQRLabel
        Left = 22
        Top = 991
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          58.208333333333340000
          2622.020833333333000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Concession'#225'ria:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel114: TQRLabel
        Left = 254
        Top = 991
        Width = 4
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          672.041666666666800000
          2622.020833333333000000
          10.583333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '/'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel115: TQRLabel
        Left = 130
        Top = 1014
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          343.958333333333400000
          2682.875000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '___/___/___'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel116: TQRLabel
        Left = 22
        Top = 1013
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          58.208333333333340000
          2680.229166666667000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Previs'#227'o de entrega:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel117: TQRLabel
        Left = 214
        Top = 1015
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          566.208333333333400000
          2685.520833333333000000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #224's_______horas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel118: TQRLabel
        Left = 634
        Top = 967
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1677.458333333333000000
          2558.520833333333000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' '
        Color = clWhite
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
      object QRLabel119: TQRLabel
        Left = 658
        Top = 967
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1740.958333333333000000
          2558.520833333333000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 9
      end
      object QRLabel120: TQRLabel
        Left = 502
        Top = 991
        Width = 196
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          2622.020833333333000000
          518.583333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Prisma n'#186'/Cor:_____________________'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel121: TQRLabel
        Left = 502
        Top = 1011
        Width = 199
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          2674.937500000000000000
          526.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Consultor T'#233'cnico:__________________'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel52: TQRLabel
        Left = 489
        Top = 263
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          695.854166666666800000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GARANTIA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 470
        Top = 261
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          690.562500000000000000
          42.333333333333330000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 470
        Top = 280
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          740.833333333333200000
          42.333333333333330000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel53: TQRLabel
        Left = 489
        Top = 283
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          748.770833333333400000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INTERNO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape41: TQRShape
        Left = 8
        Top = 364
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          963.083333333333000000
          1426.104166666670000000)
        Brush.Color = clScrollBar
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 8
        Top = 382
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1010.708333333330000000
          1426.104166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape43: TQRShape
        Left = 8
        Top = 400
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1058.333333333330000000
          1426.104166666670000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 8
        Top = 418
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1105.958333333330000000
          1426.104166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 8
        Top = 436
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1153.583333333330000000
          1426.104166666670000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape46: TQRShape
        Left = 8
        Top = 454
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1201.208333333330000000
          1426.104166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape47: TQRShape
        Left = 8
        Top = 472
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1248.833333333330000000
          1426.104166666670000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape48: TQRShape
        Left = 8
        Top = 490
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1296.458333333330000000
          1426.104166666670000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape49: TQRShape
        Left = 8
        Top = 508
        Width = 539
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          21.166666666666700000
          1344.083333333330000000
          1426.104166666670000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 84
        Top = 343
        Width = 2
        Height = 165
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          436.562500000000000000
          222.250000000000000000
          907.520833333333000000
          5.291666666666670000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 43
        Top = 343
        Width = 2
        Height = 165
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          436.562500000000000000
          113.770833333333000000
          907.520833333333000000
          5.291666666666670000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape55: TQRShape
        Left = 433
        Top = 653
        Width = 285
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          1145.645833333330000000
          1727.729166666670000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape56: TQRShape
        Left = 433
        Top = 671
        Width = 285
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1145.645833333330000000
          1775.354166666670000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape57: TQRShape
        Left = 433
        Top = 689
        Width = 285
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1145.645833333330000000
          1822.979166666670000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape58: TQRShape
        Left = 433
        Top = 707
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1145.645833333330000000
          1870.604166666670000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape59: TQRShape
        Left = 433
        Top = 723
        Width = 285
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1145.645833333330000000
          1912.937500000000000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape60: TQRShape
        Left = 433
        Top = 758
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1145.645833333330000000
          2005.541666666670000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel88: TQRLabel
        Left = 436
        Top = 759
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          2008.187500000000000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PE'#199'AS'
        Color = clWhite
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
      object QRShape61: TQRShape
        Left = 433
        Top = 774
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1145.645833333330000000
          2047.875000000000000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel89: TQRLabel
        Left = 437
        Top = 776
        Width = 62
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1156.229166666667000000
          2053.166666666667000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ACESS'#211'RIOS'
        Color = clSilver
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
      object QRShape62: TQRShape
        Left = 433
        Top = 790
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1145.645833333330000000
          2090.208333333330000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel90: TQRLabel
        Left = 436
        Top = 792
        Width = 40
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1153.583333333333000000
          2095.500000000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OUTROS'
        Color = clWhite
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
      object QRShape63: TQRShape
        Left = 433
        Top = 806
        Width = 285
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1145.645833333330000000
          2132.541666666670000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel91: TQRLabel
        Left = 436
        Top = 807
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          2135.187500000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LUBRIFICANTES'
        Color = clSilver
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
      object QRShape64: TQRShape
        Left = 433
        Top = 822
        Width = 285
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1145.645833333330000000
          2174.875000000000000000
          754.062500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel92: TQRLabel
        Left = 437
        Top = 824
        Width = 70
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1156.229166666667000000
          2180.166666666667000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'COMBUST'#205'VEIS'
        Color = clWhite
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
      object QRShape34: TQRShape
        Left = 433
        Top = 740
        Width = 285
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1145.645833333330000000
          1957.916666666670000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape65: TQRShape
        Left = 433
        Top = 838
        Width = 285
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          1145.645833333330000000
          2217.208333333330000000
          754.062500000000000000)
        Brush.Color = clSilver
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel93: TQRLabel
        Left = 436
        Top = 841
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          2225.145833333333000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SUB-TOTAL PE'#199'AS'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape66: TQRShape
        Left = 433
        Top = 858
        Width = 285
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1145.645833333330000000
          2270.125000000000000000
          754.062500000000000000)
        Brush.Color = clGray
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel94: TQRLabel
        Left = 437
        Top = 861
        Width = 38
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1156.229166666667000000
          2278.062500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TOTAL'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRImage1: TQRImage
        Left = 28
        Top = 30
        Width = 85
        Height = 42
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          111.125000000000000000
          74.083333333333300000
          79.375000000000000000
          224.895833333333000000)
        Picture.Data = {
          0A544A504547496D616765A0B80000FFD8FFE000104A46494600010201012C01
          2C0000FFE10C224578696600004D4D002A000000080007011200030000000100
          010000011A00050000000100000062011B0005000000010000006A0128000300
          0000010002000001310002000000140000007201320002000000140000008687
          690004000000010000009C000000C80000012C000000010000012C0000000141
          646F62652050686F746F73686F7020372E3000323030333A31323A3034203131
          3A34363A35370000000003A00100030000000100010000A00200040000000100
          0001DBA003000400000001000000ED0000000000000006010300030000000100
          060000011A00050000000100000116011B0005000000010000011E0128000300
          00000100020000020100040000000100000126020200040000000100000AF400
          00000000000048000000010000004800000001FFD8FFE000104A464946000102
          01004800480000FFED000C41646F62655F434D0001FFEE000E41646F62650064
          8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
          131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
          110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0CFFC00011080040008003012200021101031101FFDD
          00040008FFC4013F000001050101010101010000000000000003000102040506
          0708090A0B010001050101010101010000000000000001000203040506070809
          0A0B1000010401030204020507060805030C3301000211030421123105415161
          1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
          3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
          85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
          B7C7D7E7F7110002020102040403040506070706053501000211032131120441
          51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
          250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
          94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
          8797A7B7C7FFDA000C03010002110311003F00F554924925292492494A492492
          5292492494A4942DB6AA6B75B73DB5D6C12E7BC86B40FE539CB9EEA5F5EBA563
          4B3081CFB7C5876D43E37B87BBFEB2CB536538C7E634CD8796CD98D62819F88F
          947F7A7F2C5E9164F55FACFD23A5B8D77586DC81FF0069E91BDFFDBFF0757FD7
          5EC5C4750FACFD6FAA59E8FAAEA5AFD1B8B8BB81703FBCE66EC8B7FF003DFF00
          C1A3748FA9BD4B32D67DAEB381864CBCBE05AE1CB99555F498F77FA4BBE87FC2
          284E7948D638DF8974E1F0AC5863EE739984055FB703EA97F85FA5FF005383DB
          F43EA37F54E9EDCFB6A1432F7134D60EE22B1EC6BAC7437DD639AFB3DBFE0FD3
          5A0A35D75D55B2AA9A195D6D0D631A200681B5AD68FE4A929C0200B365C9C928
          CA72308F04093C31FDD8FE8C54924922B1FFD0F5549249252924945EF656C2FB
          1C18C689739C60003B925253249739D4FEBD747C3DCCC69CDB1BA4D6436A9FFC
          30FF0063BFEB3EB2C4BFAAFD6DEB4D2FA9A7A7E0C49B67D0A8367E9BF36FDB6B
          FF00F419472CD11A0F51ED16F62F8673130253AC18CFE9E63C1FE2C3E77AEEA3
          D7BA4F4C96E664B19673E8B7DF61FF00ACD7BAC5CBF53FF1817B8ECE9B436969
          D05D91EE799FDCA18EDADFED5967FC52C438BD1315E4E666BF3AD997D782DF61
          77F2FA864FF3ADFDE7D2DDE8F8FD5F25CEF4FEAF74E662B87365159CAC883FBF
          936B1FB7FCD50CB348E9623E11F549D3C1F0CE5F18E2E096723F4F37F47E5E3F
          E0CBF59FF8DE682F6F4BFAC7D54FDAFA96E654CFFB519EF1456C9FDDA481E9FF
          00631D2663FD57C300E5E55DD52E1CD5883D3A67F77D77EC73FF00AF5DFF00F5
          B53B7EAF75CCADB93D6326BC56F2DB33EF97007F72B05EC67F537D48631FEAB6
          23FF0058CCC8EA6E6F35E2D7E9567CBD6B1DEE6FFC55E9955AD7D721FF00B96D
          0C824386390C8476C7C943D1FDDF7BD7FF00A539757FCE9C8C4ACD5D2B1F1FA5
          52792C68B2C3FF00197DDEDB3FB552E97EA874DCE717F58EAC6DB32AD1B31BD7
          24B9957D27BDAC77F33EBBFF003367F36CFF0084599D0F368CCEA0CC4E89D231
          F10B7DF6E5DE7D6B195823DFC6EF55DFE0BF4EF5DD2970C6CF1197101B0DA36E
          6FC4B38C7138618462965179272947273071F69CE3EE7CFF00ED9492492B0E32
          92492494FF00FFD1F5549249252971BF5F1F75997D3B0AFB3D0E9D7389B6D896
          876E635CFB07D1FD054EF519BBFAFF00E0D764AA753E9787D5311D8996CDD59F
          735C34731C3E8DB53BF35EDFF5FD1A6648994480D9E4B3C707310C9217117B7C
          D1E21C3C71FEB41E0BFCA18375B5F4EE98DC034BF69CCC902CB416E9BDB999CE
          66257EA7F3BFABB3D354ADAEABEC17756EA2725CC23F47517E55A44FB9B5DD66
          DC2A3FEDE7FF00C5ABBD4303EC1915F4DEBE0D9554D23A6F5067B7D83E8D373F
          6DAFFB1B1CFF00D2D5B2CBF07FED37EACF42181D49B63998FD1984B7FC23DAFC
          86907E8BD97E4DDF637B1DF9AFD8AA1076EDFA3FFA0C5E931CE1426240710B19
          A3C3FAC8FF00B6CF3C993FBF0E0FD52D8B9D802E1474AE8CDCACA33B4E5BCE4B
          C81AEEFB2D7B29AFFACC72D1BEBFAEB90C67DA6D6F4CC6FCD06DAF16B68FFAC3
          ACC8F6FF002D6797F5C6035BB368C168E6B66463E3C793ABC03EAAAF56074B76
          46FEA5D4EA2D3AB9F8EDBB22D2E91FE12CC7F4FF00B7BAC4ACEDA8FF00171044
          A112788704ABF4B872FC4327F812BFD5B60F47E8D5BF7E775CA1D6F27ECF5BF2
          5C7FEBDB9FFF0050A5455F576CC866361E367F54C9B0C56C7BD9431C7C7F47B6
          EAEB6FE7BEC6FB174783F52FEAE5F4B322ABAECCA6C12C7FAA034FFEC3B6A5B5
          D3BA274AE985C70719B4BDC21D66AE791FBA6DB0BECDBA7D1DCA58E126B4881F
          E31FF9DE968E6F8A62889013CF9320D0448872F8E32FFA97B79D9F4EE9D89D3F
          19B4E363D78F201B1B5EB2E8FCEB5C1B65DFF1962B6924AC81428387294A5232
          9126475249B2A4924925AA49249253FFD2F5549249252967F57EB58DD22B65B9
          55DCEA9E483654CDED691B768B4CFB3D4DDFA35A0B0FEB6E1F51EA1D39B83838
          E2E363C3DF617B5819E9B9AF6FB5FF00CE7A89B3244491BF4EACDCAC31CF3E38
          E5206391A9932F6F863D65C726BF5CEA5D2F3FA00BF2F1B25B8B9066ABBD1975
          4E1A51945BBBD8C7B9DFA2FF004DBFD3FF000AB00E07466742DDD432EE38EF27
          F66B6DC7DB7B5D0C7BECC267A8EF5706D6D9FA5A9FFA0FCFAFD1B15EC9FAB7D4
          5FD169A6AC5BFEDCEDACB58FCC2EA582B2DFD20A9CFF0049ECB767E8AADBFA0F
          EC27C9FABDD6EFC4E9B935D0CAF37A48655F667D8D736D6D46AB59757633DB5E
          EB19B5D559FF006E7FA482425236637E9ED276304B0628884398E08FBD23F3E2
          F4F0FF003663FCEF0F1CBF57EEFEE38BFB23A752FADB9B766F4EAED30CBB2710
          32B989FA4CB9FB3FB49B37A6F49C1C8763E4E6E531E3877D9416B9B2436EA9DE
          AFE92976DF6BDABA3EB747D64EBD8D5609E98DC160B058FBADBEBB002039B0D6
          D1B9FF009E98F41CDBB3C6364E11774D1895F4E178B981E052E36559E19F9AEF
          DDAD34E3E823E44898668F3C684B266119548CF1E3C9CBCF489F4CA13E1F9E5F
          E69A18D827A2751C7AB07A86539D9BB5F57A58C2CC7BC1F73B8BB63F655EEB6C
          67E92BABFC22DF3F5BB05B94FC238B98FCAAA77D2CA1CE7408F7EC6973BD376E
          6BBFB6B27A2F40EBF87D4F06BC9631F838175EFAEE0F1316D6EACEDAA7736BB2
          CDB67A7FE0FD47A25785F58AAFAC791D71BD35AE1733D3141C86348F6D55EE36
          00FF00F409F1E288D018DCB6A94AA3D5AD9C60CD33EE648669471194720C9870
          FB9978F871E397C9FE4A3C52FF0034EE74DFAC3D37A8E43F16A2FAB2AB9DF8F7
          B1D5D90227DAFF00EB2A56FD75E9145E68C9AF271EC6B836C165446DDDAB5CFF
          0071F6ECFD27FC5ACE6F49FAC27AE59F582CC260B87F3186DB9A65C6BFB2EEB6
          E86B7D2633DEFF00F08933EACF51B3A2E48CA379CDC8B4DD76307636DB2E25BF
          AC32F752EB2AADBFE8BD6FA1FA3FF088F1E4AD06A2FF004778FE8B10E5791120
          65901848631C232C0CB1E69FF3BEA8FCF8F1FEFF00C9FEB1EC010E01CD208224
          11C109D607D55A7AEE1630E9FD4F1C369A4134640B1AF812DDB8EEAC7BFDB2FF
          004ECFF47FA35BEA689B00D11E05CECF8862C92809C72007D3381128CA3D0FA5
          4924922C4FFFD9FFED10C250686F746F73686F7020332E30003842494D042500
          0000000010000000000000000000000000000000003842494D03ED0000000000
          10012C000000010002012C0000000100023842494D042600000000000E000000
          000000000000003F8000003842494D040D0000000000040000001E3842494D04
          190000000000040000001E3842494D03F3000000000009000000000000000001
          003842494D040A00000000000100003842494D271000000000000A0001000000
          00000000023842494D03F5000000000048002F66660001006C66660006000000
          000001002F6666000100A1999A0006000000000001003200000001005A000000
          06000000000001003500000001002D000000060000000000013842494D03F800
          00000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D04000000000000
          0200003842494D040200000000000200003842494D0408000000000010000000
          010000024000000240000000003842494D041E00000000000400000000384249
          4D041A00000000033F000000060000000000000000000000ED000001DB000000
          050068006F006E00640061000000010000000000000000000000000000000000
          0000010000000000000000000001DB000000ED00000000000000000000000000
          0000000100000000000000000000000000000000000000100000000100000000
          00006E756C6C0000000200000006626F756E64734F626A630000000100000000
          0000526374310000000400000000546F70206C6F6E6700000000000000004C65
          66746C6F6E67000000000000000042746F6D6C6F6E67000000ED000000005267
          68746C6F6E67000001DB00000006736C69636573566C4C73000000014F626A63
          00000001000000000005736C6963650000001200000007736C69636549446C6F
          6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
          67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
          656E6572617465640000000054797065656E756D0000000A45536C6963655479
          706500000000496D672000000006626F756E64734F626A630000000100000000
          0000526374310000000400000000546F70206C6F6E6700000000000000004C65
          66746C6F6E67000000000000000042746F6D6C6F6E67000000ED000000005267
          68746C6F6E67000001DB0000000375726C54455854000000010000000000006E
          756C6C54455854000000010000000000004D7367655445585400000001000000
          000006616C74546167544558540000000100000000000E63656C6C5465787449
          7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
          00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
          6C69676E0000000764656661756C740000000976657274416C69676E656E756D
          0000000F45536C69636556657274416C69676E0000000764656661756C740000
          000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
          6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
          0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
          746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
          6C6F6E6700000000003842494D0414000000000004000000023842494D040C00
          0000000B10000000010000008000000040000001800000600000000AF4001800
          01FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F43
          4D0001FFEE000E41646F626500648000000001FFDB0084000C08080809080C09
          090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D10
          0E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080040
          008003012200021101031101FFDD00040008FFC4013F00000105010101010101
          00000000000000030001020405060708090A0B01000105010101010101000000
          00000000010002030405060708090A0B1000010401030204020507060805030C
          33010002110304211231054151611322718132061491A1B14223241552C16233
          347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255
          E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696
          A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607
          070605350100021103213112044151617122130532819114A1B14223C152D1F0
          332462E1728292435315637334F1250616A2B283072635C2D2449354A3176445
          55367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F5566676
          8696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F
          00F554924925292492494A4924925292492494A4942DB6AA6B75B73DB5D6C12E
          7BC86B40FE539CB9EEA5F5EBA5634B3081CFB7C5876D43E37B87BBFEB2CB5365
          38C7E634CD8796CD98D62819F88F947F7A7F2C5E9164F55FACFD23A5B8D77586
          DC81FF0069E91BDFFDBFF0757FD75EC5C4750FACFD6FAA59E8FAAEA5AFD1B8B8
          BB81703FBCE66EC8B7FF003DFF00C1A3748FA9BD4B32D67DAEB381864CBCBE05
          AE1CB99555F498F77FA4BBE87FC2284E7948D638DF8974E1F0AC5863EE739984
          055FB703EA97F85FA5FF005383DBF43EA37F54E9EDCFB6A1432F7134D60EE22B
          1EC6BAC7437DD639AFB3DBFE0FD35A0A35D75D55B2AA9A195D6D0D631A200681
          B5AD68FE4A929C0200B365C9C928CA72308F04093C31FDD8FE8C54924922B1FF
          D0F5549249252924945EF656C2FB1C18C689739C60003B925253249739D4FEBD
          747C3DCCC69CDB1BA4D6436A9FFC30FF0063BFEB3EB2C4BFAAFD6DEB4D2FA9A7
          A7E0C49B67D0A8367E9BF36FDB6BFF00F419472CD11A0F51ED16F62F86731302
          53AC18CFE9E63C1FE2C3E77AEEA3D7BA4F4C96E664B19673E8B7DF61FF00ACD7
          BAC5CBF53FF1817B8ECE9B436969D05D91EE799FDCA18EDADFED5967FC52C438
          BD1315E4E666BF3AD997D782DF6177F2FA864FF3ADFDE7D2DDE8F8FD5F25CEF4
          FEAF74E662B87365159CAC883FBF936B1FB7FCD50CB348E9623E11F549D3C1F0
          CE5F18E2E096723F4F37F47E5E3FE0CBF59FF8DE682F6F4BFAC7D54FDAFA96E6
          54CFFB519EF1456C9FDDA481E9FF00631D2663FD57C300E5E55DD52E1CD5883D
          3A67F77D77EC73FF00AF5DFF00F5B53B7EAF75CCADB93D6326BC56F2DB33EF97
          007F72B05EC67F537D48631FEAB623FF0058CCC8EA6E6F35E2D7E9567CBD6B1D
          EE6FFC55E9955AD7D721FF00B96D0C824386390C8476C7C943D1FDDF7BD7FF00
          A539757FCE9C8C4ACD5D2B1F1FA552792C68B2C3FF00197DDEDB3FB552E97EA8
          74DCE717F58EAC6DB32AD1B31BD724B9957D27BDAC77F33EBBFF003367F36CFF
          0084599D0F368CCEA0CC4E89D231F10B7DF6E5DE7D6B195823DFC6EF55DFE0BF
          4EF5DD2970C6CF1197101B0DA36E6FC4B38C7138618462965179272947273071
          F69CE3EE7CFF00ED9492492B0E3292492494FF00FFD1F5549249252971BF5F1F
          75997D3B0AFB3D0E9D7389B6D896876E635CFB07D1FD054EF519BBFAFF00E0D7
          64AA753E9787D5311D8996CDD59F735C34731C3E8DB53BF35EDFF5FD1A664899
          4480D9E4B3C707310C9217117B7CD1E21C3C71FEB41E0BFCA18375B5F4EE98DC
          034BF69CCC902CB416E9BDB999CE66257EA7F3BFABB3D354ADAEABEC17756EA2
          725CC23F47517E55A44FB9B5DD66DC2A3FEDE7FF00C5ABBD4303EC1915F4DEBE
          0D9554D23A6F5067B7D83E8D373F6DAFFB1B1CFF00D2D5B2CBF07FED37EACF42
          181D49B63998FD1984B7FC23DAFC86907E8BD97E4DDF637B1DF9AFD8AA1076ED
          FA3FFA0C5E931CE1426240710B19A3C3FAC8FF00B6CF3C993FBF0E0FD52D8B9D
          802E1474AE8CDCACA33B4E5BCE4BC81AEEFB2D7B29AFFACC72D1BEBFAEB90C67
          DA6D6F4CC6FCD06DAF16B68FFAC3ACC8F6FF002D6797F5C6035BB368C168E6B6
          6463E3C793ABC03EAAAF56074B7646FEA5D4EA2D3AB9F8EDBB22D2E91FE12CC7
          F4FF00B7BAC4ACEDA8FF00171044A112788704ABF4B872FC4327F812BFD5B60F
          47E8D5BF7E775CA1D6F27ECF5BF25C7FEBDB9FFF0050A5455F576CC866361E36
          7F54C9B0C56C7BD9431C7C7F47B6EAEB6FE7BEC6FB174783F52FEAE5F4B322AB
          AECCA6C12C7FAA034FFEC3B6A5B5D3BA274AE985C70719B4BDC21D66AE791FBA
          6DB0BECDBA7D1DCA58E126B4881FE31FF9DE968E6F8A62889013CF9320D04488
          72F8E32FFA97B79D9F4EE9D89D3F19B4E363D78F201B1B5EB2E8FCEB5C1B65DF
          F1962B6924AC81428387294A52329126475249B2A4924925AA49249253FFD2F5
          549249252967F57EB58DD22B65B955DCEA9E483654CDED691B768B4CFB3D4DDF
          A35A0B0FEB6E1F51EA1D39B83838E2E363C3DF617B5819E9B9AF6FB5FF00CE7A
          89B3244491BF4EACDCAC31CF3E38E5206391A9932F6F863D65C726BF5CEA5D2F
          3FA00BF2F1B25B8B9066ABBD19754E1A51945BBBD8C7B9DFA2FF004DBFD3FF00
          0AB00E07466742DDD432EE38EF27F66B6DC7DB7B5D0C7BECC267A8EF5706D6D9
          FA5A9FFA0FCFAFD1B15EC9FAB7D45FD169A6AC5BFEDCEDACB58FCC2EA582B2DF
          D20A9CFF0049ECB767E8AADBFA0FEC27C9FABDD6EFC4E9B935D0CAF37A48655F
          667D8D736D6D46AB59757633DB5EEB19B5D559FF006E7FA482425236637E9ED2
          76304B0628884398E08FBD23F3E2F4F0FF003663FCEF0F1CBF57EEFEE38BFB23
          A752FADB9B766F4EAED30CBB271032B989FA4CB9FB3FB49B37A6F49C1C8763E4
          E6E531E3877D9416B9B2436EA9DEAFE92976DF6BDABA3EB747D64EBD8D5609E9
          8DC160B058FBADBEBB002039B0D6D1B9FF009E98F41CDBB3C6364E11774D1895
          F4E178B981E052E36559E19F9AEFDDAD34E3E823E44898668F3C684B26611954
          8CF1E3C9CBCF489F4CA13E1F9E5FE69A18D827A2751C7AB07A86539D9BB5F57A
          58C2CC7BC1F73B8BB63F655EEB6C67E92BABFC22DF3F5BB05B94FC238B98FCAA
          A77D2CA1CE7408F7EC6973BD376E6BBFB6B27A2F40EBF87D4F06BC9631F83817
          5EFAEE0F1316D6EACEDAA7736BB2CDB67A7FE0FD47A25785F58AAFAC791D71BD
          35AE1733D3141C86348F6D55EE3600FF00F409F1E288D018DCB6A94AA3D5AD9C
          60CD33EE648669471194720C9870FB9978F871E397C9FE4A3C52FF0034EE74DF
          AC3D37A8E43F16A2FAB2AB9DF8F7B1D5D90227DAFF00EB2A56FD75E9145E68C9
          AF271EC6B836C165446DDDAB5CFF0071F6ECFD27FC5ACE6F49FAC27AE59F582C
          C260B87F3186DB9A65C6BFB2EEB6E86B7D2633DEFF00F08933EACF51B3A2E48C
          A379CDC8B4DD76307636DB2E25BFAC32F752EB2AADBFE8BD6FA1FA3FF088F1E4
          AD06A2FF004778FE8B10E579112065901848631C232C0CB1E69FF3BEA8FCF8F1
          FEFF00C9FEB1EC010E01CD20822411C109D607D55A7AEE1630E9FD4F1C369A41
          34640B1AF812DDB8EEAC7BFDB2FF004ECFF47FA35BEA689B00D11E05CECF8862
          C92809C72007D3381128CA3D0FA54924922C4FFFD93842494D04210000000000
          5500000001010000000F00410064006F00620065002000500068006F0074006F
          00730068006F00700000001300410064006F00620065002000500068006F0074
          006F00730068006F007000200037002E003000000001003842494D0406000000
          0000070006000000010100FFE11248687474703A2F2F6E732E61646F62652E63
          6F6D2F7861702F312E302F003C3F787061636B657420626567696E3D27EFBBBF
          272069643D2757354D304D7043656869487A7265537A4E54637A6B633964273F
          3E0A3C3F61646F62652D7861702D66696C74657273206573633D224352223F3E
          0A3C783A7861706D65746120786D6C6E733A783D2761646F62653A6E733A6D65
          74612F2720783A786170746B3D27584D5020746F6F6C6B697420322E382E322D
          33332C206672616D65776F726B20312E35273E0A3C7264663A52444620786D6C
          6E733A7264663D27687474703A2F2F7777772E77332E6F72672F313939392F30
          322F32322D7264662D73796E7461782D6E73232720786D6C6E733A69583D2768
          7474703A2F2F6E732E61646F62652E636F6D2F69582F312E302F273E0A0A203C
          7264663A4465736372697074696F6E2061626F75743D27757569643A31393064
          313432392D323636302D313164382D616232352D623062623539613563663138
          270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E732E61646F6265
          2E636F6D2F7861702F312E302F6D6D2F273E0A20203C7861704D4D3A446F6375
          6D656E7449443E61646F62653A646F6369643A70686F746F73686F703A313930
          64313432372D323636302D313164382D616232352D6230626235396135636631
          383C2F7861704D4D3A446F63756D656E7449443E0A203C2F7264663A44657363
          72697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D657461
          3E0A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020200A2020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020200A202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020200A20202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020202020200A2020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20200A2020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020200A202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020200A20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020200A2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020200A202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020200A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020200A20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020200A20202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020200A2020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020200A202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020200A202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020200A20202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A3C3F787061636B657420656E643D2777273F3EFFE20C584943435F50524F
          46494C4500010100000C484C696E6F021000006D6E74725247422058595A2007
          CE00020009000600310000616373704D53465400000000494543207352474200
          00000000000000000000010000F6D6000100000000D32D485020200000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000011637072740000015000000033646573630000018400
          00006C77747074000001F000000014626B707400000204000000147258595A00
          000218000000146758595A0000022C000000146258595A000002400000001464
          6D6E640000025400000070646D6464000002C400000088767565640000034C00
          00008676696577000003D4000000246C756D69000003F8000000146D65617300
          00040C0000002474656368000004300000000C725452430000043C0000080C67
          5452430000043C0000080C625452430000043C0000080C746578740000000043
          6F70797269676874202863292031393938204865776C6574742D5061636B6172
          6420436F6D70616E790000646573630000000000000012735247422049454336
          313936362D322E31000000000000000000000012735247422049454336313936
          362D322E31000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000058595A200000000000
          00F35100010000000116CC58595A200000000000000000000000000000000058
          595A200000000000006FA2000038F50000039058595A20000000000000629900
          00B785000018DA58595A2000000000000024A000000F840000B6CF6465736300
          0000000000001649454320687474703A2F2F7777772E6965632E636800000000
          000000000000001649454320687474703A2F2F7777772E6965632E6368000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000064657363000000000000002E494543203631393636
          2D322E312044656661756C742052474220636F6C6F7572207370616365202D20
          7352474200000000000000000000002E4945432036313936362D322E31204465
          6661756C742052474220636F6C6F7572207370616365202D2073524742000000
          0000000000000000000000000000000000000064657363000000000000002C52
          65666572656E63652056696577696E6720436F6E646974696F6E20696E204945
          4336313936362D322E3100000000000000000000002C5265666572656E636520
          56696577696E6720436F6E646974696F6E20696E2049454336313936362D322E
          3100000000000000000000000000000000000000000000000000007669657700
          0000000013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158
          595A2000000000004C09560050000000571FE76D656173000000000000000100
          0000000000000000000000000000000000028F00000002736967200000000043
          52542063757276000000000000040000000005000A000F00140019001E002300
          28002D00320037003B00400045004A004F00540059005E00630068006D007200
          77007C00810086008B00900095009A009F00A400A900AE00B200B700BC00C100
          C600CB00D000D500DB00E000E500EB00F000F600FB01010107010D0113011901
          1F0125012B01320138013E0145014C0152015901600167016E0175017C018301
          8B0192019A01A101A901B101B901C101C901D101D901E101E901F201FA020302
          0C0214021D0226022F02380241024B0254025D02670271027A0284028E029802
          A202AC02B602C102CB02D502E002EB02F50300030B03160321032D0338034303
          4F035A03660372037E038A039603A203AE03BA03C703D303E003EC03F9040604
          130420042D043B0448045504630471047E048C049A04A804B604C404D304E104
          F004FE050D051C052B053A05490558056705770586059605A605B505C505D505
          E505F6060606160627063706480659066A067B068C069D06AF06C006D106E306
          F507070719072B073D074F076107740786079907AC07BF07D207E507F8080B08
          1F08320846085A086E0882089608AA08BE08D208E708FB09100925093A094F09
          640979098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0A
          C50ADC0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C
          430C5C0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30D
          DE0DF80E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F
          960FB30FCF0FEC1009102610431061107E109B10B910D710F511131131114F11
          6D118C11AA11C911E81207122612451264128412A312C312E313031323134313
          63138313A413C513E5140614271449146A148B14AD14CE14F015121534155615
          78159B15BD15E0160316261649166C168F16B216D616FA171D17411765178917
          AE17D217F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A
          041A2A1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C
          7B1CA31CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F
          131F3E1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121
          CE21FB22272255228222AF22DD230A23382366239423C223F0241F244D247C24
          AB24DA250925382568259725C725F726272657268726B726E827182749277A27
          AB27DC280D283F287128A228D429062938296B299D29D02A022A352A682A9B2A
          CF2B022B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E
          162E4C2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A31
          8231BA31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D835
          13354D358735C235FD3637367236AE36E937243760379C37D738143850388C38
          C839053942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653C
          A43CE33D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440
          A640E74129416A41AC41EE4230427242B542F7433A437D43C044034447448A44
          CE45124555459A45DE4622466746AB46F04735477B47C04805484B489148D749
          1D496349A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D
          934DDC4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E652
          31527C52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956
          F75744579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955B
          E55C355C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60
          FC614F61A261F56249629C62F06343639763EB6440649464E9653D659265E766
          3D669266E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6B
          A76BFF6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E071
          3A719571F0724B72A67301735D73B87414747074CC7528758575E1763E769B76
          F8775677B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817C
          E17D417DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282
          F4835783BA841D848084E3854785AB860E867286D7873B879F8804886988CE89
          33899989FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F
          9E9006906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C996
          34969F970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899C
          F79D649DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3
          E6A456A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB
          02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B2
          4BB2C2B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9
          C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC1
          67C1E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC9
          3AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD1
          3CD1BED23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D9
          6CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1
          CCE253E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA
          5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF3
          19F3A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC
          07FC98FD29FDBAFE4BFEDCFF6DFFFFFFEE000E41646F626500644000000001FF
          DB00840002020202020202020202030202020304030202030405040404040405
          06050505050505060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C01030303050405090606090D0A090A0D0F0E0E0E0E0F0F0C0C0C0C0C
          0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0CFFC000110800ED01DB03011100021101031101FFDD0004003CFFC4
          01A20000000701010101010000000000000000040503020601000708090A0B01
          00020203010101010100000000000000010002030405060708090A0B10000201
          0303020402060703040206027301020311040005211231415106136122718114
          3291A10715B14223C152D1E1331662F0247282F12543345392A2B26373C23544
          2793A3B33617546474C3D2E2082683090A181984944546A4B456D355281AF2E3
          F3C4D4E4F465758595A5B5C5D5E5F566768696A6B6C6D6E6F637475767778797
          A7B7C7D7E7F738485868788898A8B8C8D8E8F82939495969798999A9B9C9D9E9
          F92A3A4A5A6A7A8A9AAABACADAEAFA110002020102030505040506040803036D
          0100021103042112314105511361220671819132A1B1F014C1D1E12342155262
          72F1332434438216925325A263B2C20773D235E2448317549308090A18192636
          451A2764745537F2A3B3C32829D3E3F38494A4B4C4D4E4F465758595A5B5C5D5
          E5F5465666768696A6B6C6D6E6F6475767778797A7B7C7D7E7F7384858687888
          98A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADA
          EAFAFFDA000C03010002110311003F00FBF98ABB15762AEC55D8ABB15762AEC5
          5D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8A
          BB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55FFD0FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC558D79ABCE3E56F23E
          9526B5E6DD7ACFCBFA64551F59BC90273602BC235FB523782A024F86559B3431
          478A6400EC3B37B2B55DA59461D2E396499E9117F127901E6683E52D1BFE72BC
          7E667E68796BF2EBF2AB417974EBEBC2FADF9B75542B4B1B65335CB5BDB29057
          922154795BED11FBBAE6A21DAFF98CD1C5846C4EE4F775A1FAFE4FA46ABFE06B
          FC8FD97975FDA592A518FA71C3F9F2F4C78A5D689B2223903EA7DA59BC7C9DD8
          ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFFD1FBF98ABB1576
          2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC
          55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8
          ABB15762AEC55D8ABB15613E76FCC7F23FE5CE9E752F3A7996CB4180A968219D
          EB713F1EA20B74E52CA7D914E519F538F00B9C80FC773B7EC8EC1D776B64F0F4
          98A590F5207A47F5A47D31F890FCFF00FCCFFF009CF0BEB8FACE97F951A10D3E
          220A2F9A75845927FF005A0B405A35F6323357BA0CE7755DBE4ED845799FD5FA
          FE4FB5FB3DFF0001AC70AC9DA59388FF00A9C361FE74F99FF3447CA4F82BCCFE
          6FF3479D3527D63CD9AFDF7983527A81757D334A5149AF08C31A2283D154003B
          0CE7F2E69E53C53249F37DA3B3FB2F4BD9F8BC2D3638E38774457C4F79F33BBF
          433FE701BC8063B7F377E665E4146B82340D0A4614F81784F78E2BD416F4941A
          7661E39D1FB3DA7DA594FB87E9FD0F877FC1A7B6EE587B3E0797EF27EFDE301F
          EE8FC43F47F3A67C19D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABFFFD2FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABB15762AEC55E41F98FF9EFF95FF9591CA9E6AF3340
          3558D7927976C6975A839A0201850FEEEA0EC642AA7C730B53DA1874FF005CB7
          EE1B9FC7BDEA3B07D8DED4EDA20E9B11E0FE7CBD30FF004C79FBA3C47C9F9F5F
          999FF39CDE77F307AFA77E5D6991792B4B6AA8D5AE025D6A4E3C579030C351D4
          05723B38CE7755DBD927B621C23BF99FD41F6EF67FFE03DA1D2D64D74CE79FF3
          45C718FF007D2F9C477C5F13EAFACEAFE60BF9F55D7754BBD6753BA6E573A85E
          CCF3CCE7AFC5248598FDF9A39CE53372367CDF5AD2E930E9718C786118407211
          02207C025B917211BA6E9F79ABEA361A569D6ED77A86A77115A585AA6ED24D33
          88E345F766600618C4C8803996ACF9E1831CB2E435188249EE00593F00FE80FF
          002BBC8D69F96DE40F2B792AD0ABFE83B248EF275E92DD484CB7328D86CF2BB3
          0AF6CF44D26018314603A0FB7ABF137B45DB13ED7ED0CDAB97F949581DD11B44
          7C220067D990E95D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          FFD3FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8AA9CB3456F1493CF2A430C4A5E59A460AAAA372598D00030
          134CA31322044592F967F31FFE7307F28FC8827B4D2B506F3DEB718212C74565
          7B556DE9EADE9FDD01B6FE9FA847F2E6AB53DB3830EC0F11F2E5F3FED7D1BB07
          FE05DDAFDA752C91FCBE3EFC9F57C21F57FA6E11E6F807F327FE72F7F36FCFDE
          BD969DA8AF91B4296AA34FD159A3B87434DA5BC3FBD27C7870523AAE73BAAED9
          CF9B60784797EB7DABB03FE061D91D9753C91F1F20EB9378FC21F4FF00A6E23E
          6F96DDDE47792476924918B49231AB331DC924F527354FA28000A1C96E29762A
          EC55F7E7FCE127E4CCDADEBF27E6C6BD674D17CBCCF07955255DAE7503F0BCEB
          5EAB6EA48069F6CEC6A873A1EC2D171CBC690D872F7FECFBFDCF8AFF00C173DA
          B8E9F4E3B330CBF79937C95FC30E91F7CCFF00B11BED20FD52CEB1F9C5D8ABB1
          5762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157FFFD4FBF98ABB1576
          2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC
          55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AC3FCE1
          F981E4AF2058FE91F39799EC3CBD6C54B44B752812CB4EA21856B24A76E88A4E
          539B518F08B9C80769D97D89AEED4C9E1E9314B21F21B0FEB4BE98FC487C41F9
          8BFF0039E9A3D9FAF61F961E597D6271554F306B5CA0B6AFF3476B1912B8FF00
          5DE33FE4E68753ED0446D8A37E67F57F63EBDD85FF00018CD92A7DA397807F32
          1BCBE333E91F012F7BE12FCC0FCE8FCCCFCCE9643E6FF35DDDED8BB064D1216F
          ABD8253ECD2DA2E2848ECCC0B7BE68351AECDA8FAE448EEE9F27D93B13D93ECC
          EC603F2B863197F38FAA67FCE367E028793CB7315E89D8ABB15762AEC55F52FE
          417FCE3179A7F372FACF5AD660B8F2EFE5EC6E1EE75991784D7CAA778AC5587C
          5CBA1908E0BBFDA61C736BD9FD953D491296D0EFEFF77EB7CEBDB5FF00821697
          B0A12C5888C9A93CA23710F3C9DDFD5FA8F9036FD93D0B42D27CB3A369BE5FD0
          AC62D3747D22DD2DB4FB18451238D0500F124F524EE4EE7739DAE3C71C711188
          A01F95759ACCDACCD3CF9A4653992493D49FC72E43904DB26E33B15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15762AFF00FFD5FBF98ABB15762AEC
          55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8
          ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55A660A0B310AAA2ACC7600
          0EE71502DF37FE627FCE567E4EFE5E89ED9BCC03CD7AD4355FD0DA0F1BB21BC2
          4B80C204A1D882FC87F2E6B353DAFA7C3B5F11EE1BFDBC9EF7B0BFE06FDB3DAB
          52F0FC2C67F8B27A7E51FACF97A6BCDF087E61FF00CE6E7E67F9ABD7B2F28C16
          DE41D2A4AA892DA975A8329D883732A855AF8C71AB0FE6CD06A7B77364DA1E91
          F33F37D93B0FFE045D97A2A9EA89D44C77FA61FE941B3FE74883DCF90755D5B5
          5D72FEE354D6B52BAD5F52BA6E573A85ECCF3CF21E9579242CC7E939A69CE533
          72365F50D369B169B18C78602101C8440881EE0364BF22DEEC55D8ABB154DB45
          D075CF325FC5A5F97B47BDD73529BFBAB0B0824B999A9D4848D59A83C6992863
          964351049F271B57ADC1A4C672679C71C07591111F32FACFC87FF3847F9AFE68
          10DD799E5B2F2169D280D4BC61777BC4D0822DA06E236EA249108F0CDC69FB0B
          3E4DE7511F33F2FDAF9A76CFFC177B274571D3896A243F9BE987FA690FB63190
          7DB7F975FF00387BF945E449ADF51BFB19FCEFACC1464BAD6B83DB238EF1D9A2
          88BFE467323B1CDEE9BB1B061DC8E23E7FABFB5F22EDDFF828F6C769838E1218
          319E98EC488F399F57FA5E17D508891A2471A2C71C6A1638D4515546C0003A01
          9B67CE4924D9E6BB143B15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B15762AEC55FFFD6FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B1562DE6BF3C7943C8D60753F37F98EC3CBD6742637BC99636908EA228EBCE43
          EC809CAB367C7845CE400763D9BD91ACED2C9E1E9714B24BFA22EBDE790F7921
          F12FE627FCE79796B4D13D97E5A79766F31DD0AAC7AE6AC1AD6C81ECC96EA44F
          20F66311CD16A7DA08476C51BF33B0FD7F73EB9D87FF00019D4E6A9F686518C7
          F361EA9FC65F4C7E1C6F847F307F3DBF34FF00339A58BCD5E6CBA934C90EDA0D
          99FAA5801D81822E224A7632726F7CD06A75F9F51F5CB6EEE41F64EC4F637B2B
          B1E8E9B0813FE7CBD53FF4C797BA343C9E45986F4EEC55D8ABB15445A5A5DDFD
          CC367636B2DEDE5CB04B7B5811A492463D15514124FB0184024D061972C3144C
          E644623992680F797D35E43FF9C40FCE7F3AFA17379A247E4BD2A6DCDEEBAE60
          978F534B450D383E1CD147BE6D34FD8DA8CBB91C23CFF5737CFBB67FE0A1D8BD
          9D718E439E63A63DC7FA7DA1F227DCFB4BC87FF3833F965E5EF42EFCE3A8DFF9
          EAFE3DE4B6626C2C39751FB9858CA69FE54D43DD7B66EF4FD83861BCC991F90F
          C7C5F27ED9FF00830F69EAAE3A58C7044F5FAE7FE9A4387E50B1DEFAEFCBBE56
          F2D7946C174CF2BE8361E5FB05A7FA2D85BC702311D0B700391F73539B9C78A1
          88540003C9F30D7768EA75D93C4D464964977C8997DFCBE0F3BF3AFE7FFE507E
          5FB4D0798BCF16035086A1F48B1637D76187EC3C56C24319FF005F88CC6CFDA3
          830FD5217DC373F63BDEC8F627B63B528E0D3CB84FF14BD11F7832ABFF0036DF
          1F79E3FE73F107AD6DF973E492E7A45AC79824A0AFFCC1DB31AFB1330F9669B3
          FB43D3147E27F50FD6FA8F63FF00C054ED2D7EA3FCDC63FDFC87FBCF8BEBBFC8
          79FF0030F56F225979ABF333546BBF30F9B29A8DB696B0C76F0E9F62E2B6D0A4
          71AA9E4CA79B1725BE20A4FC39B8ECF3965884F29DE5BD770E8F987B670ECEC1
          AF969BB3E158B0FA4CACC8CE63EA9124F207D22A86D639BDA7339E4DD8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AFF00FFD7FBF98ABB
          15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB1576
          2AEC55D8ABB15762AEC55D8ABB15762AD1200249A01B927157CF1F987FF3949F
          93BF977EBDB5CF98D7CC9AD4355FD09A171BC9438D8AC9286104641EA1A40DFE
          49CD6EA7B5B4F83632B3DC37FD8F73D87FF03AED9ED6A94717858CFF00164F40
          F80FA8FC235E6F847F317FE7383F323CCDEBD97926CEDFC85A5BD556E52979A8
          BAF4A99A4411A547F247C87F39EB9A0D4F6EE6C9B631C23E65F65EC2FF00810F
          66E8EA7AB91D44FBBE8C7FE941B3F1951FE6BE3BD635BD67CC37F36ABAF6AB79
          AD6A7726B3EA17D33DC4CFDF79242CC7AF8E69679253372249F37D4B4BA4C3A5
          C631E1846101C844088F904AF22E43B15762ADAAB3305505998D1546E493D862
          A4D3DF7C87FF0038C7F9CDF981E84FA6F94E5D1B4AB8DD75AD6C9B08389DC3AA
          38333A9EC638D866C34FD97A8CDCA343BCEDFB5E2BB67FE083D8BD9771C9984E
          63F871FAE5EEB1E907FAD20FB47C87FF003817E54D38C179F987E67BAF325C2D
          19F48D307D4AD2BFCAF29E5338F75F4CE6EF4FECFC23BE495F90D87EBFB9F27E
          D9FF00833EAF2DC7438A3887F3A7EB97C06D11F1E37D91E4EFCB6F21FE5FDB0B
          5F26F9534ED0178F192E2DA11F58907FC5B70FCA593FD9B1CDDE1D2E2C22A110
          3F1DEF95F6AF6FEBFB525C5ABCD3C9E44FA47BA23D23E00311F3C7FCE40FE50F
          E5EFAD17987CEB62DA8C3C8368DA7B1BEBBE6BFB0D15BF3F4C9FF8B0A8F7CA73
          F68E0C3F5485F70DCFD8ED3B1FD89ED8ED5A38304B84FF0014BD11F7832ABFF3
          6DF1D79E3FE73F1CFAD6BF973E490A37116B1E6092A69D2BF53B6614F104CC7E
          59A5CFED0F4C51F89FD43F5BEA5D8FFF000151B4B5FA8FF3718FF7F21FEF3E2F
          8EBCF1F9F5F9B7F987EB45E65F3ADFC9A7CDB3E8F66C2CACCAF65682DC46AF4F
          17E47DF34B9FB433E7FAA46BBB90FB1F53EC7F633B23B2A8E9F047887F14BD73
          FF004D2B23FCDA0F20CC37A87D1BFF0038C1F9467F363F32ACA1D42D8CBE54F2
          C70D4FCCCE412922AB7EE2D49E959DC508FE40E474CD976568FF0033985FD31D
          CFEAF8BC27FC10FDA7FE43ECC9181ACD96E10EF1FCE9FF009A3FD918F7BF7000
          00000500D8019DDBF21378ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC5
          5D8ABB15762AEC55FFD0FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB1AF3479CBCA
          9E49D3DB55F36F986C3CBD602BC67BE9D22E640AF18D49E4EDFE4A827DB2ACB9
          E1885CC803CDD87677656AFB472787A6C52C92EE8826BDFD00F3341F147E62FF
          00CE7879534A17163F96DA04FE68BD5AAC7ADEA41AD2C01ECCB0ED3CA3C437A7
          F3CD1EA7B7E11DB10E23DE761FAFEE7D6BB0BFE035ABCF53D7E418A3FCD8FAA7
          F13F447E1C6F847F30FF003FBF35BF334CD0F99BCD7709A4CD51FE1ED3FF00D0
          EC789FD968A2A7AA3DE52E7DF341A9ED1CFA8FAA5B770D87E3DEFB2761FB15D9
          3D8F474F84718FE397AA7F33F4FF009BC21E37984F54EC55D8ABB157AE7917F2
          27F35FF318C52795FC997D3E9F2D08D66ED459D971DAA56E2E0A23D2BD10B1F6
          CCCD3E833E7FA226BBF90F99799ED9F6CBB27B26C6A33C4487F08F54FF00D2C6
          C8F8D0F37DA1E44FF9C04897D0BBFCC9F3934A681A5D13404E22BD68D7970A49
          1D88108F66CDDE9FD9EEB965F01FACFEA7C9FB67FE0D24DC74182BFA593FE222
          7EF99F73ECFF0022FE49FE577E5C085FCA7E4EB0B2BF8451759993EB37D5A509
          173397916BDC2903DB377A7D0E1C1F44403DFD7E6F9476CFB5BDABDAF63539E5
          289FE107861FE96340FC6CA57E77FF009C83FC9FFCBF59535FF3B58497F183FE
          E234E6FAF5DF21FB2D1DBF3F4C9EDEA151EF91CFDA3A7C3F5485F70DCFD8E476
          47B11DB1DA9470E9E4227F8A5E88FCE557FE6DBE3CF3C7FCE7E39F5AD7F2E7C9
          2146E22D63CC1254D3A57EA76CC29E20998FCB34B9FDA1E98A3F13FA87EB7D4B
          B1FF00E02A3696BF51FE6E31FEFE43FDE7C5F1D79E3F3EBF36FF0030FD68BCCB
          E75BF934F9B67D1ECD8595995ECAD05B88D5E9E2FC8FBE6973F6867CFF00548D
          77721F63EA7D8FEC676476551D3E08F10FE297AE7FE9A5647F9B41E41986F50E
          C55D8AAAC30CD733456F6F13DC5C5C3AC70411A9777773455551524926800C40
          BD8319CE3089948D01B927900FDCEFF9C71FCA54FCA2FCB6D3B48BC890799B59
          2352F34CC2848B99540583977581004EB4E5C987DACEF7B3347F96C2227EA3B9
          FC793F1EFB79ED31EDDED296589FDD43D38FFAA3F8BDF23BFBA8747BDE6C1E2D
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55FFD1
          FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AF9FBF30FF00E7277F27BF2E7D6B6D43CCA9AF6B
          30D41D0B43E37B3861D56475610C641EA1E453ED9AED4F6AE9F06C6567B86FFB
          1EDBB0FF00E07BDB1DAD52862F0E07F8F27A23F015C52F7C62479BE10FCC4FF9
          CE4FCC5F3119ECBC8DA7DAF91B4C6AAADE90B7BA8B2F4AFA9228892A3B2C648E
          CF9A0D4F6F659ED8C708F997D97B0FFE03FD9DA4A9EB2473CFBBE887C81E23F1
          951FE6BE37D6F5FD73CCBA84DAAF98758BDD73539FFBEBFBF9E4B899BC01790B
          1A0EC33499324B21B9124F9BEA9A4D160D1E318F04238E03A44088F904A722E4
          BB15762ACFBC97F95BF985F987308BC99E51D475D8F9FA725F43114B48DB6DA4
          B9938C2877E8CE332306932E7FA224FDDF3E4E97B5BDA2ECEECA17ABCD0C7E44
          FA8FBA22E47E01F657913FE701FCC37BE95DFE6279B6DB4380D19B47D1D7EB77
          257BABDC481228DBFD559066EB4FECF4CEF9255E437FC7DAF9576CFF00C1A34F
          8EE3A1C2721FE74FD31F8445C88F7983ED1F227FCE36FE4E7E5EFA53E91E4FB6
          D4B538A846B5AC7FA7DCF25FDB4F5818E26F78917379A7ECCD3E1FA6367BCEFF
          008F83E4FDB3EDF76CF6AD8CB9CC607F861E88FB8D6F21FD62513E77FF009C88
          FC9DFCBE12C3ADF9D2CAE3508053F436967EBF75C87EC325BF258CFF00C6465C
          39FB4B4F87EA90BEE1B9FB187647B0DDB3DAB470E09089FE29FA23EFB95717F9
          A0BE3BF3C7FCE7E5D49EB5AFE5CF9292DD4F2116B1AFC9CDE876045A5B305523
          AEF330F6F1D2E7F684F2C51F89FD43F5BEA5D8FF00F01580A96BF3DFF4718A1F
          E9E43FDE0F7BE3AF3C7E79FE6BFE627AD1F9A3CEBA85CD84D5E5A3DB38B4B2A7
          400DBDB88D1A836AB027DF34B9F5F9F3FD7235DDC87C83EA7D8FEC7764F6551D
          3E08890FE23EA9FF00A69591F0A0F26CC47A5762AEC55D8ABB1546E9DA76A1AB
          DF5AE99A558DC6A7A95F4822B3B0B58DA69A591BA2A4680B313E00618C4C8D01
          64B567CF8F0633932C8463116493400F32760FD45FF9C62FF9C509FC9D7963F9
          89F9976D1B7992DF8CDE5BF2C92245B07236B8B922AAD30FD8515119F8ABCE9C
          3ABECAEC83888CB97EAE83BBCCF9FDDEF7E76FF8217FC1263DA109687B3C9F08
          ED39F2E3FE8C7AF0779FE2E5F4DF17BF33A17C55D8ABB15762AEC55D8ABB1576
          2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2FBF98ABB15762AEC55D8
          ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC558F7997
          CDBE58F26E9EDAAF9AF5FB0F2FE9EB5A5D5F4E90AB11FB281882EDFE4A8272BC
          B9A1885CC803CDCEECFECCD576864F0B4D8E5925DD104FCFB8799D9F15FE62FF
          00CE76F93B47F5EC7F2E7439FCDD7CB554D62F8359E9EA7F996323D797A742B1
          FF00AD9A3D4F6FE38ED88711EF3B0FD7F73EB3D85FF01BD66A2A7AFC830C7F9B
          1A9CFE7F447E72F73E11FCC3FF009C86FCD9FCCDFAC41E61F354F6DA3CF507CB
          BA656CEC781DF83C719E5281FF0016B39F7CD06A7B473EA3EA96DDC361F8F7BE
          C9D87EC3F64763D4B0610663F8E7EB9FBC13B47FCD1178A660BD6BB15762AC9F
          CAFE4BF36F9DAFBF47794BCB9A8F98AF053D48AC6DDE6118269CA4651C517DD8
          8196E2C19329A84493E4EBFB47B5B49D9D0F13559638E3FD2205FB87327C86EF
          B03C87FF003827F985ADFA177E79D6AC7C9764F4692C21A6A17FE3C4AC6CB02D
          7C7D56A7F2E6E74FD81967BE42223E67F57DAF9776CFFC18FB3B4D71D1E39679
          779F443EDF51FF004A3DEFB3FC89FF003895F92DE4716F3BF974F9B755868C75
          2D7DC5D0E5ED6C025B800F4AC648F1CDDE9FB1F4F8BA711F3DFECE4F9476CFFC
          133B6BB4AE232F8303FC38FD3FECB79FFB203C993F9C7FE720BF25FF002D6136
          5A9F9BF4F37566BC22D034702F274E3B08FD2B60CB11F690A8CB73768E9F06C6
          43DC37FB9D77657B13DB5DAF2E3C782547F8E7E81EFB96F2FF003789F2079E3F
          E73F2EA4F5AD7F2E7C9496EA7908B58D7E4E6F43B022D2D982A91D779987B78E
          9B3FB4279628FC4FEA1FADF51EC7FF0080AC054B5F9EFF00A38C50FF004F21FE
          F07BDF1D79E3F3CFF35FF313D68FCD1E75D42E6C26AF2D1ED9C5A5953A006DED
          C468D41B55813EF9A5CFAFCF9FEB91AEEE43E41F53EC7F63BB27B2A8E9F04448
          7F11F54FFD34AC8F8507936623D2BB15762AEC55D8AB21F2FF0094BCD3E6CB9F
          A9F95FCB9A9F98AEAB46874EB596E597DDBD256E200DC93B0CB31E19E4350893
          EE0E0EBBB4F4BA18F1EA32C318EF94847EF2FA5FCA5FF3857F9D5E63F4A5D5AC
          B4EF26D9BEE5F54BA579B8F8AC36A2620FB395CDA61EC3D44F98111E67F53C07
          69FF00C167B13496314A59A5FD08D0FF004D3E1F98B7D3BE53FF009C06F24587
          A3379C7CE3AAF98A64A33DA69F1C7A7DB93DD18B7D62461DAAAC84F5DBA66D30
          FB3D8C7D7227DDB7EB7CF7B4BFE0D3AECB634B8218C77C899CBDFF00C111F112
          7D6FE46FCA9FCBCFCB680C3E4AF2A58E88EEBC26BE4532DDC8BB6D25CCC5E661
          515A16A7B66E34FA4C5807A2207DFF003E6F9976C7B49DA3DAF2BD5E694FB872
          88F7445447C9E85992E8DD8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC
          55D8ABB15762AEC55D8ABB157FFFD3FBF98ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15782FE61FFCE4AFE507E5B7AF6DAB
          799E3D5F5982A0F97F45E37B74187EC39461144DED2BA9CD7EA7B53060D8CACF
          70DCFE3DEF67D87EC076C76BD4B16230C67F8E7E88FBC5FAA43FAB12F847F317
          FE73A3CFDAF99EC7C83A5DB79274E6E48BA8CDC6F75161D39067510C751D8231
          1D9F341A9EDECB3DB18E11F33FA9F65EC2FF0080F767E96A7AD99CF2EE1E887D
          878A5FE9803FCD7C67AF798FCC1E69D425D5BCC9AD5EEBDA94DFDE5F5FCEF712
          52B5A06909200EC06C3349932CB21B9124F9BEABA2D069F458C62D3E38E380E9
          10223EC49720E5BB154D746D0B5BF31DFC5A5F97F48BDD73529FFB9B0B0824B8
          99BE491AB1FC3250C7299A8824F938DABD660D2633933CE3080EB22223E65F58
          F913FE7097F367CD020BAF32B59790F4D9082DF5E6FACDEF03FB4B6B01201FF2
          64910FB66E34FD859F26F2A88F3E7F2FDA1F35ED9FF82E76468AE3A7E2D44C7F
          37D30FF4F2FBE31907D9FE45FF009C2FFC9DF2908EEB5CB6BAF3CEA31D18CDAB
          49C2D55875296B070523DA52F9BBD3F6269F1EF2F51F3E5F2FD76F9476C7FC15
          FB675DE9C263823FD0172F8CE567FD288B39F32FE7D7E43FE5359FE88FF11695
          6ED635487CB1E5D892E1E36EBC3D2B41E9447FD72B97E5ED0D369870D8DBA0FD
          8E9FB3FD8CEDEEDC9F8BE14CF17F1E52637E773F54BFCD127C91E78FF9CFBD46
          7F5AD7F2EBC97158A1A88F57D7A4F5A5A1EE2D2DD955481D2B2B0F6F1D3E7F68
          49DB146BCCFEA1FADF4DEC7FF80AE38D4B5D9CCBFA38C50FF4F2DCFF00A58FBD
          F1F79D7F3C3F35FF00308CC9E69F3BEA577653D79E916F27D52C883D01B6B711
          C6D41B02CA4FBE69B3EBF3E6FAE46BBB90F907D47B27D90EC9ECAA3A6D3C0487
          F111C53FF4D2B90F8101E53988F48EC55D8ABB1544DA59DDDFDC4569636B35ED
          DCC78C36D02349239F0545049FA308892686EC32E58628994C8881D49A1F32F7
          BF297FCE2CFE7979BFD292DFC9171A259C8456FB5C75D3C283DCC3311391FEAC
          6736187B275397946879EDFB5E2BB4FF00E08DD85A0B12D409C874C7EBFB63E8
          F9C83EA1F28FFCFBFDCFA5379F3CFC17A7AFA76836F5F9F1BABA03E8AC19B5C3
          ECEFFAA4FE5FACFEA7CF3B4FFE0D8371A2D37BA590FF00BC87FC5BEA0F28FF00
          CE2A7E46F94046F1792E1F305E25395F6BAEDA816A74AC327FA38FF6310CDAE1
          EC9D362FE1B3E7BFECFB1F3CED3FF82476EEBEC1CE71C7BB18E0FF00643D7F39
          3DE62874AD0EC3D3822B4D1F4BB35AF08D52DE089477A0E2AA336004603B83C6
          4A7975392C994E67DF291FD25E37E6BFF9C95FC92F27095751F3F69F7F7516DF
          51D20B6A52961FB24DA89114FF00AEC330B376A69B173983EEDFEE7AAECDF603
          B735F471E9A5107ACFF763FD9D13F005F3479ABFE73FFCBB6FEA43E4BF21DFEA
          ADBAC77BAC5C4764808FDAF460170CC3D8BA9F974CD5E6F68603E8813EFDBF5B
          E81D9BFF00014D4CE8EAF51187940199FF004D2E0AF917AAFF00CE37FE61FE70
          7E71BDFF009F7CDCDA7F97BC8B0192CF41D0F4DB408350B8078C92BCD70D34BC
          21A71AA32867A8E8854E5F666A751AABC93A10E800E7F3EEFBDE6BDBCEC3EC7E
          C011D16978B26A0D4A7394BE88F40231E18DCB9EE0D46BF9C0BEB6CDC3E66EC5
          5D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8A
          BFFFD4FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762
          A91F987CCDE5DF29E9D26AFE67D6ECB40D322D9EF6FE74823E5D941722AC7B01
          B9CAF2658631C53200F373343D9FA9D76418B4F8E59267A44127ECE9E6F8BFF3
          0FFE73AFC8BA1FAF65F97DA3DCF9CEFD6AA9AA5CF2B1D3C1FE601D7D79287B70
          407B3669353DBF8A1B631C47BF90FD6FABF61FFC0735FA9A9EBA630C7F9A3D73
          FB3D31F7DCBDCF847F317FE723BF36FF00333D7B7D6FCCF2E9BA34F556F2F691
          CACECCA1EA92046324A3DA576CD06A7B4F3E7DA52A1DC361F8F7BECBD85EC1F6
          4763D4B0E212C83F8E7EB97BC5ED1FF340785E603D83B1544D9D95E6A375058E
          9F6935F5EDCB70B6B3B78DA596463D151101627D80C318991A1B96BCB9618A26
          73908C47324D01EF25F4EF917FE70F7F3A3CE7E9DC5F68D179274D7A1377AF39
          86623B85B44579811E0EA83DF369A7EC6D465DC8E11E7FAB9BE7BDB3FF00052E
          C5ECFB8C2673CFBB1EE3FD39A8FF00A532F73ECFF22FFCE0D7E587977D2BBF38
          EA37FE79BD8C55E0918D858546F5F4606329A7F953107BAE6F34FD83861BCC99
          1F90FC7C5F28ED8FF83076A6AEE3A58C7044F51EB9FF00A690E1F942FCDE93AB
          7E737FCE3B7E4958C9A3586ADA2E9AD6FF000B7977CB5025C4C5D474956D4155
          7F79594FBEF9933D6E9348384103CA3FB3F4BA1D37B29ED1FB4593C59C324AFF
          008F293115E5C7B91FD405F2C79E3FE73EF519FD6B5FCBAF25C56286A23D5F5E
          93D69687B8B4B765552074ACAC3DBC7539FDA1276C51AF33FA87EB7D1BB1FF00
          E02B8E352D76732FE8E3143FD3CB73FE963EF7C79E77FCEDFCD4FCC432A79AFC
          E9A8DF58CD5E5A442E2D6CA87B1B6B711C6D41B55949F7CD2E7D767CFF005C89
          1DDC87C83EA5D91EC8F65764D1D3608C643F888E29FF00A695C87C080F2BCC57
          A3762AEC55D8ABD47CA3F929F9AFE7AF49BCB1E43D5AFEDA6A18B51961FAADA3
          03DC5CDC98A23FF0599587439F37D1027EC1F32F3BDA7ED6F64F66DFE6351089
          1FC20F14BFD2C6E5F63EA1F28FFCE04F9F752F4A7F38F9AB4AF2C40D42F6B66A
          FA8DD01DD587EE6207DC48D9B5C3ECFE597D7211FB4BE77DA7FF00067D061B1A
          5C33CA7BE558E3FEFA5F3887D41E52FF009C27FC97F2F7A52EB36DA979CEED37
          66D4AE8C5072F1586D043B7B3B366D70F61E9E1F55CBDE7F53E79DA7FF0005BE
          DAD5D8C461863FD18DCBFD34F8BE6007D29A0F94BC9DE49B3922F2DF97749F2B
          D92256E0D8DB436AA546E5A46455AF4A92C73698F0E3C43D2044796CF03ADED3
          D6768CC1D4659E5974E29197CAFF0043CF7CD5FF003915F92BE4EF51357FCC2D
          2E6B98AA1ACB4D76D4660C3F6592D04BC4FF00AD4CC6CDDA5A7C5F54C7C37FB9
          DE766FB0BDB7DA147169A601EB21E18F7DCF86FE16F9A3CD7FF39F9E52B332C3
          E4CF24EA5AE48B554BCD4E68EC21AFF32A462E1D87B1E27E59ABCDED0C07D112
          7DFB7EB7BFECDFF80AEAF251D5EA218C7740199F99E003FD93E6AF357FCE6B7E
          767983D48B4ABDD37C9F6CF50134BB45925E3EF2DD99CD7DD42E6B3376E6A27C
          888FB87EBB7BFECDFF00812F626968E48CF31FE9CA87CA1C3F236F9B7CC5E74F
          37F9BE6FAC79A7CD1AAF98A50DC94EA37735C053FE42C8CC147B019ABCB9F265
          DE7227DE5EF743D93A3D047874D8618C7F46223F3A1BB19CADD83D7FF243F297
          54FCE3F3DE9FE58B3E76FA4C14BBF336AAA36B5B14601C82411EA3D78463F98D
          4FC20D33341A396AB2880E5D4F70797F6BFDA6C5D81A096A2546676847F9D33C
          BFCD1CE5E5E643F76B42D134BF2D68DA6797F44B34D3F48D1EDA3B4D3ECE31F0
          C7144A1547893B6E4EE4EE77CEFB1E38E3888C4500FC71ACD665D6669E7CD232
          9CC9249EA4FE3E09AE4DC6762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B15762AEC55D8ABB15762AEC55FFD5FBF98ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8AB11F3AF9EBCA9F977A15C798FCE1ACC1A369707C22496AD
          24B211511C31282F239ECAA09EFD329CFA88608F14CD0767D93D8DABED5CE306
          97199CCF77203BE47901E65F9B1F99BFF39D5E6CD5E5B9D3FF002C74A8BCADA6
          722B16BB7E8973A848BBD19626E50455F02243FE56731AAEDF9CB6C4384779E7
          FA87DAFBEFB3FF00F01CD260027DA133967FCC893180F8ED397BFD3EE7C4BE63
          F357997CDFA83EADE69D7AFF00CC1A8BD47D6EFE779DD41FD95E64F151D95680
          668F2E69E5373249F37D6F41D9BA6D063F0B4D8E38E3DD1007CEB99F33BA4195
          B9AB911E4748E3469249182C71A8AB331D80007527141200B3C9F42F913FE716
          7F3A3CFBE94F6BE557F2EE992D3FDCB6BE4D84746E8CB13299DC537AAC647BF4
          CD8E9FB27519B9468779DBF6FD8F0FDB3FF046EC5ECCB8CB378931FC38FD67E7
          F40F8C83ECEF22FF00CE07792F4910DEFE60F99AF3CD13C6A1E6D2EC47D42C81
          A7C4AF255A6703B1568FE59BBD3FB3F8E3BE4919790D87EBFB9F29ED8FF832EB
          73DC3438A3887494BD73F80DA23DC44DE9F73F9A7FF38C1F909692E9BA15CE89
          657B0A94974CF2DC2B7D7D2B2F549EE23E5F16DFEEF941CCB3ABD168C546AFFA
          3B9F9FEB2F3D8FD9CF6A3DA798C99864944FF1653C101E7189ADBFA912F9B7CF
          1FF39F7AC5CFAD6BF977E4C834C88D447ABEB921B898A9EE2DA0644461EF238F
          6CD5E7F686476C71AF33FA9EF7B1FF00E02D86152D767323FCDC63847FA69592
          3FCD8BE40F3BFE767E6A7E627AB1F9B3CEBA8DFD94B50FA4C2E2D6C883D8DB5B
          88E26A0DAACA4FBE69B3EBB3E7FAE448EEE43E41F50EC8F647B2BB2A8E9B0463
          21FC44714FFD34AE43E069E5998AF46EC55D8AB27F2DF92BCDFE71B8FAB7953C
          B1AA798A60DC5C69F6B2DC0434AFC6C8A5576EEC465B8B064CA6A1127DC1D7EB
          FB5B47D9F1E2D4E58631FD2908FCAF9FC1F4C7947FE7097F39FCC262975A834C
          F2659BD19DB51B9135C703FCB0DA09BE2F6764F7CDA61EC2D44FEAA88F3FD8F9
          FF0069FF00C173B174B63099E697F46351FF004D3E1DBCC093EA0F297FCE057E
          5FE99E94DE70F346ABE69B85DDEDAD5534EB527C0806694F85448B9B5C3ECFE2
          8FD7232FB03E79DA7FF067ED0CD634B86188779BC92FF7B1FF00625F4FF953F2
          67F29FC84A93796BC8BA3E9735A8E49A9C908B8BA403727EB772649BFE1F3698
          745830FD3003CFAFCCEEF9E7697B57DADDA66B51A8C9307F841E18FF00A48D47
          EC4BBCD5F9FF00F937E4CF5135DFCC2D256E62A892C6CA537F70AC3F65A1B413
          3A9FF580C8E6ED1D3E2FAA63E1BFDCDFD9BEC576CF6851C3A69D1EB21C11F9CF
          841F83E6AF367FCE7C791B4F1243E4EF286ABE649D6AAB737F247A75B9F065A7
          D624603C0A2FD19ACCDED0E28FD1127DFB7EB7BFECDFF80BEBB2D1D5678621DD
          10724BFDEC7E44BE69F357FCE6EFE746BDEA45A2C9A4F93AD9AA10E9F68279F8
          9FE696F0CEB5F7545F6DF3579BB77513FA6A3EE1FAEDEFFB37FE045D8BA6A398
          4F31FE94B863F2870FDA4BE6CF33F9FF00CF1E7594CBE6CF36EADE6135AA457D
          772CD1277A244CDC1057B28033599751932FD7227DE5EFBB3BB1343D9C2B4D86
          18FF00AB100FC4F33F12C4329766EC55D8ABB154E340D035AF34EB161A079774
          C9F58D675393D2B1D3ED979C923509341D8000924EC05492064F1E3964908C45
          92E2EB75B83458659F3CC42111649E43F1D0732760FDC2FF009C7FFC98B0FC97
          F23C1A39315DF99B552B77E6BD563DC4B714A2C51B100FA508F856BD4F26A02C
          46777D9DA21A5C7C3FC4799FC773F217B6DED5E4F6875C72EE3143D38E27A47B
          CFF4A5CCFC06F4F74CCF78E762AEC55D8ABB15762AEC55D8ABB15762AEC55D8A
          BB15762AEC55D8ABB15762AEC55D8ABFFFD6FBF98ABB15762AEC55D8ABB15762
          AEC55D8ABB15762AEC5528D7F5DD33CB1A1EAFE62D66E05AE95A1D9CD7DA85C1
          DF8C302177A0EE6836037276C864C831C4CA5C80B72B45A3CBACCF0C1885CE72
          1103CC9A0FC24FCE6FCE0F31FE7279B6E75FD6257B7D2ED99E2F2DE821AB158D
          A93B28036691800647EAC7C14281C0EB75B3D564E2972E83B83F63FB29ECBE9B
          D9FD20C1885CCD19CFACE5FF00123F863D079924F23CC37A77B3F90BFE71F3F3
          73F31D60B9F2E793EE934A9E8C9AEEA14B2B3287F6D249B89947FC630D99BA7E
          CECF9F78C76EF3B0FC7B9E53B6BDB7EC8EC92639F3C78C7F047D73F7111BE1FF
          003A9F68791BFE701F4BB6115EFE64F9CE4BE641CA6D1F434F421040A9E57738
          6665F1A4487DF37783D9E88DF2CAFC87EBFD8F9476C7FC1A32CEE1A0C023FD2C
          9B9FF491D81FF3A5EE7AA9F3AFFCE267FCE3DA3C1A1FE851AE5B06531E8F1FE9
          7D55987DA47BB264319AFECC92A8CCBF1F43A2FA6AFCBD47E7FB5E6FF927DADF
          6A8DE6F13C33FCF3E163F7886D7EF8C245E0BE78FF009CFBD62E7D6B5FCBBF26
          41A6446A23D5F5C90DC4C54F716D0322230F791C7B66BF3FB4323B638D799FD4
          F67D8FFF00016C30A96BB3991FE6E31C23FD34AC91FE6C5F1DF9DBF39BF343F3
          10C8BE6EF3A6A3A9DA4BF6B4A4905BD975A8FF0045804711A7895AFBE69B3EB7
          367FAE44F974F93EA7D91ECA765F64D7E57042321FC55C53FF004F2B97DAF31C
          C57A0762A8BB1B0BED4EEA2B2D36CA7D42F273C61B4B68DA595CF82A2024FD03
          0C6264680B2D79B363C3133C921188E649007CCBE81F28FF00CE28FE7979BFD2
          963F2749E5DB29295BDD7A45B00B5EE607ADC7DD11CD8E1EC8D4E5FE1A1E7B7E
          DFB1E23B53FE093D85A0B0738C921D318E3FF643D1FEC9F50794BFE7DFF00F4A
          6F3DF9FDE4AFF7DA6E836E129FEADDDD06AFD3066D70FB3A3FCA4FE5FACFEA7C
          F3B4FF00E0D92DC68F4C3CA590FF00BC857FBB7D41E52FF9C5CFC8FF0027FA52
          5AF922D75ABC8F7FAF6B6CDA8B123A1F4A6261047F9318CDAE1ECAD362E51B3E
          7BFEC7CF3B4FFE08BDB9AFB12D41844F4C7E8FB63EAF9C8B24F317E747E4CFE5
          DC02C356F3BE87A40B15E0BA358BADC4D101D145A59AC8EBEC388CB726BB4F80
          519015D07EA0E0687D93EDAED5971E2D3E49F17F1487083FE7CE81F9BE72F357
          FCE7A7E5D699EA45E53F2C6B1E699D2BC27B831E9D6ADE043B7AD2FDF10CD666
          F683147E88997D83F1F07BBECDFF0080C768E6A3A9CB0C43B85E497CBD31FF00
          64F99FCD5FF39C7F9C3ADFA916810E91E4EB76A88E4B4B6FAD5C807F9A4BB324
          64FB88C66AF376F6A27F4D47EDFBDF40ECDFF810763E9A8E733CC7CCF0C7E50A
          3FEC8BE6DF347E667E6179D4BFF8AFCE7AC6BB139A9B4BABB95ADC7FAB00611A
          FD0A33599755972FD7227E2F7BD9DECFF677677F8B608633DE2238BFD37D47E2
          583650EE1D8ABB15762AEC5533D2F45D675C9CDAE8BA4DEEB172284DBD94125C
          3EFD3E18D58F6C9421299A8827DCE3EA357874D1E2CD38C077C8888FB5ECFE5F
          FF009C62FCF6F3194369F975A8D846D42D2EAA62D37883DCA5DBC4FF0040527D
          B3371F656A67CA047BF6FBDE535BFF00042EC1D27D5AA848FF0042F27DB0121F
          6BE8BF267FCE02F9A2EE4867F3E79C6C346B5D9A4D3F4747BCB861DD0CB2AC31
          C67DC09066CF07B3D33FDE480F76FF008FB5E13B57FE0D3A5C60C74582533DF3
          2211F7D0E227FD8BEF4FCB2FC96FCBBFCA4B3683C9DA1AC17D3C623BFD7EE8FA
          F7F7036244939028A480782054AEFC6B9D0697438B4C3D037EFEAF8CFB41ED67
          68F6ECF8B5592E20D880DA11F747BFCE572F37AAE65BCDBB15762AEC55D8ABB1
          5762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD7FB
          F98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55F277FCE69EB573A4FE
          456AD6D6EEC835FD534FD3AE197AFA7EA1B9615A8A03E8007C46DD0E6A3B7266
          3A62075207E9FD0FA5FF00C09B491CFDBD094BFC9C2721EFAE1FF7CFC62CE25F
          AB5FA05FF3871F923E59D734FD57F377CF76D6F79A4E8771241A058DE806D55E
          D5165B8BD9D5BE1611D42A06D810CC454291D0F62E861307364E439776DD5F13
          FF0082A7B5DA9D3648765E8C98CF2006663F5548D4611EA2F99ADE881D4A7DF9
          95FF0039E3771DEDE697F957E5CB63630318A0F336B01D8CC0547A90DA218F80
          EEA646248FB48A76CB355ED01B231476EF3FA9C2EC0FF80D40C2393B4B29E23B
          9842B6F294CDDF9F081E523CDF16F9DBF39BF343F310C8BE6EF3A6A3A9DA4BF6
          B4A4905BD975A8FF0045804711A7895AFBE6933EB7367FAE44F974F93EB3D91E
          CA765F64D7E57042321FC55C53FF004F2B97DAF31CC57A0762AEC551961A76A1
          AADD4765A658DC6A37936D15A5AC4F34ADFEAA2024FDD863132340596ACD9F1E
          0899E4908C4752401F32FA7FF29FFE717BF3575DF34796352F327E5D5D5BF93A
          1D46D66D7A1D5A64D39E5B45915A58FD1775B8F892BD13E919B5D1F65679CE26
          50F4D8BBDB6FBDF3CF697FE089D95A6D2E5C7A7D5039CC6420600E4A956C6C0E
          0D8F79F817E9C5D79E3F217F26ECDF4FFD37E56F26476CA124D274E108BA217F
          9ADAD15E6735EA4A924FBE75273E974A2AE31F21CFE4377E7CC7D91DBFED04F8
          FC3CD989FE295F0FFA69D447CDE11E6AFF009CF0FCB1D2BD48BCAFA0EB3E6CB8
          4AFA733AA69F6AFE14925E728FA61CD7E6F6830C7E8065F60FD7F63D9766FF00
          C06BB533D1D464C784776F397C8547FD9BE69F367FCE74FE6C6B3EA45E59D3B4
          8F26DB9AFA73470FD7EE96BE325CD6234FF8C39ACCDDBF9E5F4011FB4FDBFA9E
          FF00B33FE03BD93A7A3A894F31EE27823F28FABFD9BE69F357E6BFE6579DFD45
          F3579E359D66DE5AF3B09AEA45B5DFAD2D90AC42BECB9ABCDABCD97EB913F1DB
          E4F7FD9BECDF6676757E5B4F8E0475111C5FE98DCBED79FE63BBB762AEC55D8A
          B2AD03C8BE75F3514FF0CF94759D7C3B711269F633DCA57DDA346029DC93B65B
          8F4F9327D3127DC1D76B7B6345A2FF0018CD8F1FF5A518FDE5EDFE5FFF009C42
          FCF9D7B83B7945342B77200B8D56F2DE0A78D625792614FF005333F1F636AA7F
          C35EF23FB5E435BFF04FEC0D2EC339C87BA1191FB6847FD93DC340FF009F7F79
          9E7E0DE69FCC1D334C1D64874BB49AF89F60F335AD3E7C4E6763F67667EB981E
          E17FA9E435BFF06CD2C7FC5B4D397F5E421F6478FEF7B7F97FFE704FF28B4D08
          FADEA7AF7992614F52392E23B580D3C120896415FF008C8733F1F60608FD449F
          B1E435BFF063ED7CDB61863C43C8194BE7235FEC5EE1A07FCE3C7E4979669FA2
          FF002D344765A14975084EA2EA47421EF5A7607DC1CCFC7D9BA6C7CA03E3BFDF
          6F21ADF6E7B7359FDE6AB27F9A7C31F2C7C219A6A7E6CFCBFF0023C1F56D5FCC
          7A0794ADE11516B73776B6406DB718D993AD36A0DF2E966C58451908FC40753A
          7ECDED0ED297162C597313D44653FB68BC735FFF009CB9FC85D07D441E723ADD
          CC7FF1EDA55A5C5C72FF0056531A427FE0F30B276C6961FC57EE07FB1EAB45FF
          00031EDFD551F038077CE518FD9665FEC598FE527E715A7E71DB6A3AD797FCAB
          ABE93E54B37F42D35DD5C430B5E5C291CD20862926AAA7ED39602BF0D09E5C6F
          D1EB46A819462447BCF5755ED37B2D3EC0947167CD09E696E610B3C31E865222
          3B9E91AE5BF2ABEC999AF2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55FFD0FBF98ABB15762AEC55D8AB
          B15762AEC55D8ABB15762AEC55F387FCE58F9527F367E4679BE2B487D7BDD044
          1AD5B205A9E3652069C8EE290190ED9ACED7C27269A55CC6FF002FD8F79FF034
          ED28E87B770191A8E4BC67FCF1E9FF0067C2FC40CE15FAF1FA65FF003871E66D
          27CE7F957F981F92579782C3589A0D41EC981A3C961AA41F579648C020968253
          56DC6CEB4EF9D4762E58E5C13C04D1DFE476FB1F9FFF00E0A9D9F97B3FB574DD
          AF08F140185F94F1CB8803E528F2FEA97E7A79CBC9DE61F21798F53F2AF9A34F
          7D3B58D2A531CF0B578BAFEC4B136C1D1C6EAC362339CCF8678666131443EE1D
          95DABA7ED3D34353A797142636F2EF07B88E4431EB7B79EEE68EDAD6092E6E26
          6E30C112977663D9554124FCB2A009D839D39C6113291000EA760F6FF29FFCE3
          4FE7779C7D3934DF20DFE9F68F426FB570BA6C614F4602E8C6EE3FD456CCFC3D
          97A9CBCA047BF6FBDE43B4FDBFEC3ECFB19353194BBA1FBC3FEC2C0F890F595F
          F9C57F2A79407A9F9C3F9E7E59F29CF16F3683A63FD76F48EE02C8629011DF8C
          2E2B999FC930C5FDF658C7C86E7F1F079A3FF047D5EBF6ECBECFCD981E539FA2
          1F6710F9CE2D8F31FF00CE1BF907E1D17C9FE63FCDCD4E0DE2D475794DA59B91
          E287D0D8F60D6CDB63E2F67E1FA632C87CF61FA3EE47E43DB2ED4FEFB3E2D1C0
          FF000C0714C7C7D5F664086BEFF9CCAF3669D692697F965E44F2B7E59696C291
          A5859ACF3A781E5C62809F9C3825DB7388AC508C0790FC0FB1B30FFC0AB49966
          327686A336AA7FD2950FF7D2FF0066F03F357E71FE6979DBD45F33F9F359D4ED
          E6AFA961F59686D4D7FE5DA1F4E2FF0085CD765D6E6CBF5CC9FBBE4F69D9BECB
          76576757E5F4F8E2475E1B97FA695CBED79AE633BF762AEC55E81E5DFCA8FCCC
          F36706F2EF90B5DD5617A52EE1B1985BEFD2B3B288C57DDB3231E93364FA604F
          C1D26BBDA5ECCD0FF7FA9C703DC6438BFD2DDFD8F74F2F7FCE157E79EB450EA1
          A5E97E5689C06F5354BF8DCD0FF91642E581F6207BD333F1F61EA67CC08FBCFE
          AB78FD77FC16BB0B4FF44E794FF4207EF9F007B8F97FFE7DF6DF049E6AFCC803
          FDF967A55857EE9E7947FC9ACCFC7ECEFF003E7F21F8FB9E3F5DFF0006D1CB4D
          A5F8CE5FEF623FDF3DC7CBFF00F384FF0091DA3088EA361AB79A654DD9B52BF7
          8D49FF0056C85B0A57B1AFBD733F1F61E9A3CC197BCFEAA78FD77FC16FB77517
          E1CA1887F4600FDB3E37B7687F949F951E4F45B8D1BC85E5ED25ADE8DFA40D94
          0665A7426E255693EF6CCEC7A3C18B78C00F87E9791D67B4DDADAF3C39753967
          7D388D7FA51B7D884D77F3BBF27FCAE0C7ABFE63797EDA48AAAD6705E4573327
          11D0C36E6471EDF0E0C9AED3E3E731F3FD4DBA3F647B635BBE2D2E537D4C4C47
          FA6950FB5E27AF7FCE6FFE49693C86992EB5E68715E0D61606142474A9BD7B66
          00FF00AA7307276EE9A3CAE5EE1FAE9EB745FF00021EDCCFFDE0C78BFAD2B3FE
          C04FEF788EBFFF003F04BA60F1F95FF2DA284FFBAEF354BF692BF38208929FF2
          3730327B447F821F33F8FBDEBB45FF0001288DF51AA27CA10AFF0065227FDCBC
          4F5FFF009CD4FCF4D679AD8EABA5F962370414D2F4F8D8D0F835E1B9607DC107
          307276E6A67C888FB87EBB7AED17FC09BB0B4FF5C2794FF4E67FDE700788EBFF
          009BDF9A5E69E6BAFF00E60EBFA8C322957B47BF992DC83D7F708CB1EFDFE1CC
          1C9ACCD93EA993F17AED17B31D95A2FEE74D8E2475E11C5FE988BFB5E76CCCCC
          598966635663B924F7398CEF40A7D2DFF38E5FF38F7AA7E73EBC2FB5349F4EF2
          068F28FD37ABA0E2D7120A30B3B663D5D81F8985422EE772A0ECFB33B3A5AA95
          9DA0399FD03F1B3E7FEDDFB718BD9FD3F063A96A663D31FE68FE7CBC8741FC47
          C8123ED2E8FA3E99E5FD2B4FD1345B28B4DD274A812DB4FB184718E28A31C555
          47B0EE773DF3B884230888C4500FC9FAAD565D565966CB2329CC9249E6494CB2
          4E3BB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B15762AEC55D8ABB157FFFD1FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC554A6861B9865B7B88966827468E785C06574614656076208343808BD8
          B284CC242513446E0BF107FE723BF23352FC9CF38DC35A5BC93F91B5E99E6F2C
          6A8012B186259ACA56ED245D054FC69461BF20BC2F69E80E9726DF49E47F43F5
          E7B07ED862EDFD18E2206A31803247BFFA63FA32FF00632DBB89E27E57F346BD
          E4CD7F4CF33796B51974AD6B49944D657911DC1A519581A86565255948A30241
          DB307165962909C4D10F5BDA3D9D83B434F3D3EA22278E62883F8D88E608DC1D
          C3F583F2E7CE7F939FF3969A4E9D6DE7EF2AD84DE7CF2A2896E3469A492272A4
          00F3DA491BA3C96ECDF6A362789A7207E163D769B3E9FB4A206488E38F4FD5E5
          E4FCD7DBDD95DB3EC36594B459A434F97612001F746608204C0E520058BE1237
          03CFDF997F9EFE7EFC8EF306A1E48F2B7E50F94BF2A9D1795BEA1676DF5C7BBB
          72488EE21B9096E92AB53ABC4483B3518119AED576865D248E38638C3EDBF3BD
          BEE7B7EC0F637B3FDA4D3C757A9D6E6D5F7894B84465D6328DCCC48F29015B8B
          043E56F367E78FE6DF9DFD45F3279FF57BBB696BEA69F04DF53B56AF8DBDA88A
          23F4AE6A736BF3E5FAA67EE1F20FA37667B21D91D9D474FA68023A91C52FF4D3
          E297DAF2ACC47A4762AEC55D8AB25D03C97E70F353AC7E59F2AEAFE617634034
          EB29EE46DD6A6246029DEBD32CC783264FA624FB83AFD6F6B68F442F519A18FF
          00AD211FBCBDD3CBDFF3887F9F1E6009237945341B67E971AB5DC1053E70ABC9
          30FA533618FB1B533FE1AF79FC178FD77FC13FB074BB78C721EE84652FB6847F
          D93DFF00C93FF387ADF973E61F2DF9CBF313F357CB3A20F2EEA36BA98D3DA3F5
          2DA736D2AC82369EF25B4A2B15A13C0FB6F9B0C1D8DE04E33C99222883F8BA78
          9ED7FF008288ED6D3E5D2E8747967E24650BBA90E215623013DF7FE73EB7D7FF
          00E728FF0021FCBBEA25CFE61596A1326CB0E951CFA8733E0B25B47247F49603
          DF37193B574D0E7307DDBFDCF99E8BFE075DBDABA31D34A23BE6443EC9112FB1
          E23AFF00FCE7C7E5C590913CBBE53D7B5E993ECBDCFD5EC606F93F39DFEF8F30
          727B43847D3127ECFD6F5DA2FF0080BF6964A39F363C63CB8A67E5511FEC9E25
          AFFF00CE7DF9FEF39AF96BC99A1E871B1F85EF64B8D42555ED4656B65AFB94A7
          B660E4F68729FA6207BF7FD4F5BA2FF80AF67E3DF519F264FEA88C07FBF3F6FC
          5E25AFFF00CE55FE7CF9879A4DE7DB8D2E0624AC1A5416F65C6BD8490C6B2FDE
          E7303276B6AA7FC75EED9EBF45FF00037EC1D2EE34C247BE6653FB24787EC78A
          EB5E69F3379924F5BCC5E63D535F9ABCBD5D46F26BA6AF8D667639833CB3C9F5
          489F79B7ACD2767697482B0628631FD1888FDC024590731D8ABB15762AEC55F5
          5FE42FFCE2DF9B3F35EF2CF5BD7EDEE3CB3E40465926D566431DC5FA03BC7628
          E370DD3D52380EDC88E39B6ECFECA9EA4894B6877F7FBBF5BE6FED9FFC11749D
          890961C2465D4F2111BC607BF211FEE7EA3E4377EC4F977CBBA2794F44D3BCBB
          E5DD3A1D2745D2611058584028A8A37249352CCC492CC492C49249273B4C78E3
          8E22311403F2D6BB5D9F5D9E59F3C8CF24CD927AFECE800D80D86C9D64DC4762
          AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC5
          5D8ABB15762AEC55FFD2FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55D8AB19F38793FCBBE7CF2EEA3E56F34E9D1EA9A36A91F0B8B77D99586EB2
          46C374743BAB0DC1CAB3618668184C582EC3B2FB5351D99A88EA74D2319C4EC7
          EF047507A8EAFC5AFCFDFF009C7FF307E49EB8A4B4BAC793354908D07CC7C29F
          150B1B6B90BB24AA07C9C7C4BFB4ABC47687674F492EF89E47F41F37EB1F62BD
          B6D3FB4583A433C07AE1FEFA3DF13F389D8F42788E87AE6AFE5AD5F4FD7B41D4
          26D2B58D2A65B8D3F50B76E324722F420F707A107623635073031E496390944D
          10F5FACD1E1D661961CD11384C5107911F8F9730FD3DF247E60FE5DFFCE5EF93
          0FE5DFE64C1068BF98F628D2E9D736C046F23A2D4DD69ECFCB7A0FDEC249A8DC
          6C2A9D560D462ED3C7E1E5DA63F163F487E79ED7EC4ED1F60F5BF9ED0133D2CB
          6903B800FF00064AFF00613EFDB9FD5E1DF3DFFCE3C7E69F923CDD3F9517CA9A
          9F9959B949A46A9A3D9CD750DE5BF2A0957D2572847ED2B6EA7DA84E8751D9B9
          F164E0E127B88176FAFF00637B73D95DA3A31A9F1A18BA4A33908984BBB722FC
          88D8FBEC092F977FE711BF3E3CC3E9C87C9C342B6969FE93ABDD416DC7FD6843
          BCC3FE45E5B8FB1F533FE1AF79FC175FAEFF00827760E96C78FE211D21194BFD
          9508FF00B26729FF0038A5E58F2ED4FE667E7F793FCAF2C5BCBA758CAB797069
          D5556696D9EBF28DBE5991FC91087F7B9A31F76FFA9D41FF00824EAB57FF0019
          FD9B9F283FC521C31FF62263FD9045C7A4FF00CE11F938037FE62F357E685DC4
          2B3DBDAC735B42CC3F6528963B1FF8CC7FD6C221D9D8B9994FF1F0FBDAA5A9F6
          E35FF462C3A589E449123EF3BE4FF703DC895FF9C94FC8FF002882BF975FF38E
          7A599D00FABEADAD3C0D3A11DEA62BA90FD130AE1FE53D363FEEB08F79FC1FBD
          ACFB03DB9AEFF1EED49D758E3BE13F6C23FEC0A47AE7FCE70FE72EA2860D160D
          07CA96E8385BFD46C8CD22281402B7724C869EC807B643276F6A25F4D47DC3F5
          B99A3FF810763623798E4CA7AF14A87FB0113FEC8BC53CC1F9F3F9CBE67F506B
          1F993AEBC528A4B6D6B74D65030F0686D7D2423E6B98193B435193EA99F9D7DC
          F5BA2F633B1B475E16971D8EA63C67E73E23F6BCAAE2E6E2EE692E6EE792EAE2
          63CA5B8998BBB1F1666249CC4249365E931E38E3888C4000741B051C593B1576
          2AEC5572AB3B2A22977721511454927600018A9200B2CFF45FCA6FCCFF0031F0
          6D13F2F7CC3A944F42B73169D73E8D1BA13294082B4EE73221A3CD3FA6123F02
          E9357ED2F65E93FBED4E289EE338DFCAEFEC7ACE8BFF003881F9F9AC7077F27C
          5A341200567D46FED22A57C634964947D299990EC6D54BF86BDE43CCEAFF00E0
          A1D81A7D867333DD18C8FDA408FDAF59D1BFE700FF00306E7836BDE73D034956
          DD96CD6E6F5D47B878EDD6BF26FA732E1ECF653F5480F99FD4F35ABFF8357674
          3FB9C1927FD6E180FB0CFEE7ACE8BFF3EFEF274054F987F30358D569F6869F6B
          6F615FF91A6EE99990F67718FAA64FB801FADE6757FF0006CD64BFB8D36387F5
          A529FDDE1BE84F24FF00CE30FE4AF916482EF4EF2741AB6A7050A6A9ACBB5FC9
          C874611CB5851876291839B1C1D95A7C3B88D9EF3BFEC788ED7FF82176DF6903
          1C99CC207F861E81F31EA23DF22F7D000000140360066C5E29BC55D8ABB15762
          AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC5
          5D8ABB15762AFF00FFD3FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55D8ABB1563FE69F2B683E74D0752F2CF99B4D8B55D175588C5796728D88EA
          ACAC2855948055810548A8DF2BCB8A3962613160B9BD9DDA3A8ECFD44751A791
          86481B047E3707910762362FC56FCFFF00C80D7BF2535EE4BEAEABE4AD56561E
          5EF3095DC1DDBEAD73C4516651F20E0725FDA55E1FB47B3A5A4977C4F23FA0F9
          BF59FB13EDB69FDA2D3F486780F5C3FDF47BE27E713B1E84F06D3F50BED26FAC
          F54D2EF26D3F51D3E64B8B1BEB7731CB14B190C8E8EA41041150466BE3231208
          3443D9E7C18F3E3963C91128C851077041E6087EAFFE40FF00CE4A5B7E70E872
          7E5B79CB599FCB1F98D716925BE9DE63B231C06FE8BF0CD6E4828972BF69A3E3
          C5A95514AA2F5DD9FDA63551F0A678675CC75F779BF367B6BEC0CBB0338D7E96
          032E944813095CB83FA32EA719E42576391E923E2AFF009C88F297E737903CC3
          2699E7EF376B9E6BF2FEA2F27F87BCC1757B7135ADDC2284AFA6F232C5228239
          C67A751C968C747DA587518675924640F23668FE3B9F59F61BB4FB17B534E326
          8B0E3C59635C701188944F7D800CA27A4BE746C3E69CD63DFBB15762AEC55D8A
          BB15762ACA749F22F9DB5FE0742F276B9AD090563361A7DCDCF21D6A3D28DAB9
          6C34F927F4C49F702EBB53DB1A1D2FF7D9F1C3FAD38C7EF21E9FA4FF00CE317E
          7CEB5C4DA7E5B6A5006DEB7EF6F614EBD45DCB11EDFE7519950ECAD54F940FC6
          87DEF3DA9FF82176069FEAD540FF00578A7FEE049F727FCE39FF00CE2A59796B
          4FD6AE3F38FC89A4EADAECB731B68CD713A5FC31DBF0A346D002620DCF7A9E55
          AF6A6FBEECDEC818C139E009E9D5F1FF006EFF00E0913D664C71ECAD44E18C03
          C540C0995EC78BEAAAE9B7C6DF6A68DE56F2C7971047E5EF2E697A0C614288F4
          EB386D5788D80A448BB0CDE431421F4C40F70A7C9B57DA3AAD59BCF96790FF00
          4A465F7929F658E13B15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB1
          5762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157FF
          D4FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AC7F
          CD3E56D07CE9A0EA5E59F3369B16ABA2EAB118AF2CE51B11D5595850AB2900AB
          020A9151BE57971472C4C262C1737B3BB4751D9FA88EA34F230C903608FC6E0F
          220EC46C5F8ADF9FFF00901AF7E4A6BDC97D5D57C95AACAC3CBDE612BB83BB7D
          5AE788A2CCA3E41C0E4BFB4ABC3F68F674B492EF89E47F41F37EB3F627DB6D3F
          B45A7E90CF01EB87FBE8F7C4FCE2763D09F3F4334B6F2C53C12BC13C0EB24334
          6C55D1D4D55958508208A82335C0D3DBCA2240C642C1E61FA59F92BF9F9E55FC
          EBF2EFFCA97FCF78AD6EEFEFA25B6D17CC176422DFC80158C3C869E95DAD7F77
          202399DBEDECFD3E87B421AB8781A8E6791EFF00F8F7DFF7F807B5BEC5EAFD9D
          D47F2B7631223137280DF8075A1FC588FF00144FD3FD5FA7CFDF9A5FF388DF99
          BE4DF34BE9FE4FD0EFFCF1E5ABE2D268DABDA46AF2220EB15DAAD046EB5A72A0
          57EABBD5575FABEC7CD8A75006513C8FEB7B7F677FE09DD99DA1A5E3D5648E0C
          B1DA5191D8F9C3BC1EEE71E47A120348FF009C3AFCFDD528D3794EDF4689BA4B
          7FA8DA2F720D52196571D3BAE421D8BAA97F0D7BC86ED4FF00C14FB030F2CC66
          7FA3097DE4447DACAE3FF9C36D674D20F9CFF36BC8BE55414322BDFB49220AD0
          F25992D96A28DD1BB75F0BBF91651FAF2423F1FEC75B2FF82A61CDFE29A2D465
          FF003687FB1333DDD3AA313F20BFE71CF4301BCD1FF3933A7EA74A734D0E085E
          9F66A03452DED773D69F46C725FC9FA487D79C1F77E0B51F6D3DA3D4FF008BF6
          54A3FF000C247DE31A2E3D33FE7057CBE097F30F9B7CEEC9B9429731722036C3
          8DB5877A0EBE1BD2B8443B361D652F9FEA0D4751EDDEAB962C183E313FEFB2FE
          3E08F8FF0038BFE70EFCBC40F2F7E445FEAED137C2FAB4714E8DBF5ADDDE5D92
          29FCCB921ADD043E9C44FBFF00692D32F65BDB2D5FF7FDA3185FF30907FD8421
          F614545FF39A9E59D068BE48FC83D07CBDE97F733A4F0C54D97FDD76D6515285
          7B3F61D308EDC843FBBC407E3C835CBFE04DAAD57F8E768E4C97CC513F6CA72F
          B922D4FF00E73D3F366EB92E9BE5FF002CE9719FB2E6DEEA79475FDA6B909D29
          FB1D7EEC84FDA0CE79088F9FEB7334FF00F019EC987F799734CFBE311F646FED
          79E6A7FF003985F9FF00A8F211F9CA2D2E26EB15969D62BD2876792191C74ECD
          98D3ED9D54BF8ABDC03BCD3FFC0BBD9FC3CF0199FE94E7F70901F63CF753FCF7
          FCE7D5C32DEFE67F99023821E3B7D426B546041041581A304107A5331A5DA1A8
          9739CBE6EF34FEC6F62E0FA3498BE3012FF740BD0FF297FE72AFF333F2CEF3D2
          D43519FCEFE5B9E5325EE8BABDC3C92A9620B35B5D3F392263E07926E4F1AEF9
          93A3ED6CDA73B9E28F71FD05D1FB4DFF00037ECCED885C223065036940003DD2
          80A121F297F4AB67EAA7E557E787E5F7E6FE9E2E3CADAB04D56140FA8F96AF38
          C57F6FE24C7521D47F3C6597DC1DB3ADD26BF16A45C0EFDDD5F9BFDA4F643B43
          B07270EA61E827D338EF097C7A1FE8CA8FC377AF6663CC3B15762AEC55D8ABB1
          5762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762
          AEC55D8ABB15762AEC55D8ABFFD5FBF98ABB15762AEC55D8ABB15762AEC55D8A
          BB15762AEC55D8ABB15762AEC5525F31797744F36689A8F977CC5A743AB68BAB
          4260BFB09C555D4EE0822855948055810548041046432638E4898C8582E5E875
          D9F439E39F048C3240D823A7ECE841D88D8ECFC4FF00F9C86FC88D53F253CD22
          280CBA879335B6793CB3ACB8AB00285EDAE08000963AF5E8EB4614F895786ED2
          ECF96927DF13C8FE83E6FD6DEC3FB658BDA2D2D9A8E787D71FBA51FE8CBFD89D
          8F427CF80904106846E08CD73DBBF4A3FE71B3FE72BA3D4A0B7FCB4FCDBD5244
          92E516C7CBDE74795E176575F4D60BBB8465747FE49C106BF6981F88F4FD99DA
          FC43C2CC7C81FD67F4BE05EDF7FC0D8E191ED0ECC80A1EA9E2A07CF8A113608F
          E763AAEE15B3C8BFE7283F247CFDF9777D2EBF6DE60D77CE1F9777AC0477F7F7
          735DCDA7BB90A20BB2CC471268124A50FD93F15396176AE872E03C409940F79B
          AF7BD47FC0F3DAEECFED6C630CB163C3AA8F48C4444FFA50F3FE747A731B72F1
          9E695F55762AEC55D8ABB15762AEC55D8ABB1547699AA6A5A2DFDAEABA3DFDC6
          97A9D8B896CF50B491A19A271FB48E84303F2386133037134434EA34F8B518CE
          3CB1138485104583EF05FA1FF931FF0039C33C1F55F2FF00E71406E21DA38BCE
          F6517EF14763796B1AFC5FEBC42BFE41DCE749A1EDD23D39BFD37EB1FA9F0DF6
          AFFE041195E7ECA347FD4A476FF326797BA5B7F48727E8EE8BADE8FE63D32D35
          9D0354B5D6749BE4E769A8D9CAB34322F43C5D091B1D88EC7639D2C3246638A2
          6C17C1F57A3CDA4CB2C59A06138F38C8511F029A64DC7762AEC55D8ABB15762A
          EC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55
          D8ABB15762AEC55FFFD6FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55D8ABB15762AEC55D8ABCEBF35BF2EB4AFCD4F226BBE4DD55114DFC25F4AB
          D6153697D1826DEE17BFC2DF6A9D54B2F7CC6D5E9A3A8C4607AF2F23D1DEFB37
          DBB97B175F8F578FF84FA87F3A07EA8FC472EE347A3F0D2EBF2ABF332D2E6E2D
          65FCBFF31996DA578A429A5DDBAF24254F16588822A36233833A4CC0D704BE45
          FB071FB49D99922243538A88BFAE3D7E2A1FF2ACBF323FF2DF7997FEE1379FF5
          4B07E5737F325F22CFFD10766FFCA4E2FF009590FD6FBEBFE71CBF34FCFD6F63
          17E53FE71F907CC5AB794F534361A6798350D2AEE65B78A5053EAB7DEA4479C0
          6B4573F63A37C1BA743D9BABCA07839E12313B5907E47CBEEF772F16F6EFD9CE
          CF9CCF697656A7143347D528472447111BF1E3A3B4FA903EAE63D5F5724FF9C8
          7FF9C4DD73C8BA9B7987F2DB4ABEF317933507F8B4BB647BABCD3656207A6CAA
          19E48989F81E848FB2FD99B0FB4BB22584F16204C4F4E647EC7A6F61BFE09783
          B4B1781AF9C71E78FF0011A8C320EFEE8CBBE3D79C7A81E60FF9565F991FF96F
          BCCBFF00709BCFFAA59AAFCAE6FE64BE45F43FF441D9BFF2938BFE5643F5BBFE
          5597E647FE5BEF32FF00DC26F3FEA963F95CDFCC97C8AFFA20ECDFF949C5FF00
          2B21FADDFF002ACBF323FF002DF7997FEE1379FF0054B1FCAE6FE64BE457FD10
          766FFCA4E2FF009590FD6EFF009565F991FF0096FBCCBFF709BCFF00AA58FE57
          37F325F22BFE883B37FE52717FCAC87EB77FCAB2FCC8FF00CB7DE65FFB84DE7F
          D52C7F2B9BF992F915FF00441D9BFF002938BFE5643F5BBFE5597E647FE5BEF3
          2FFDC26F3FEA963F95CDFCC97C8AFF00A20ECDFF00949C5FF2B21FADDFF2ACBF
          323FF2DF7997FEE1379FF54B1FCAE6FE64BE457FD10766FF00CA4E2FF9590FD6
          EFF9565F991FF96FBCCBFF00709BCFFAA58FE5737F325F22BFE883B37FE52717
          FCAC87EB77FCAB2FCC8FFCB7DE65FF00B84DE7FD52C7F2B9BF992F915FF441D9
          BFF2938BFE5643F5BBFE5597E647FE5BEF32FF00DC26F3FEA963F95CDFCC97C8
          AFFA20ECDFF949C5FF002B21FADEA3F963AB7FCE437E51EA9FA43C9FE56F33C1
          6B3387D4B42B8D26F65B0BBA6DFBE83D302B4140EA55C0E8C332B4B3D569A570
          8CBDD468BCEFB43A6F677B771706AB361247D331920271FEACAFEC3713D43F54
          BF283F3A5BF322DA3B2D7BC95AF7913CD31C75B9D3B52B0BA8ED262A2ACF6D74
          F12A11DF8BF16F00C072CEB747AEF1C54A2632F306BE05F9C7DA8F64C76448CF
          0E7C79F093B18CE2643CA50049F88B8FBB93DD333DE39D8ABB15762AEC55D8AB
          B15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157
          62AEC55D8ABFFFD7FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55
          26F31EBB65E57F2F6BDE66D484ADA779774EBAD4F5058543CA60B489A6902292
          A0B71434048DF219720C70323C8027E4E5E83473D6EA31E9F1D716494602F95C
          8888BF2B2F937FE87A7F257FE597CCBFF4810FFD94E69FF97B4FFD2F97ED7D2B
          FE4CEF6DF7E2FF004C7FE25DFF0043D3F92BFF002CBE65FF00A4087FECA71FE5
          ED3FF4BE5FB57FE4CEF6DF7E2FF4C7FE255ADBFE7387F262EAE20B68AD7CC9EA
          5CC8B147CAC61039390A2BFE93E2708EDED3935EAF97ED6393FE041DB5089913
          8A80BFA8FF00C4BE9FF3979B34BF23795F5AF376B4B3BE95A0DB9BABE5B64124
          A50103E0566504EFE2336B9F3470C0CE5C83E79D95D9B97B4B558F4B86B8F21A
          17B0BF3E6F96BFE87A7F257FE597CCBFF4810FFD94E6A7F97B4FFD2F97ED7D17
          FE4CEF6DF7E2FF004C7FE25DFF0043D3F92BFF002CBE65FF00A4087FECA71FE5
          ED3FF4BE5FB57FE4CEF6DF7E2FF4C7FE2533D17FE734FF0027F5ED6749D0AC6D
          BCC22F75ABD82C2CCCB650AA096E64589391170481C9854D3270EDCD3CE42238
          AC9AE5FB5C7D5FFC09BB634B8679A67170C22646A46EA22CD7A7C9F5B9200249
          A01B927370F993E6EF3CFF00CE58FE4AF916E25B19BCC52799B5280913D8797E
          217BC08342A672F1DBD6B5047AB51DC0CD66A3B5F4F84D5F11F2DFF67DAF7DD8
          FF00F034EDBED28898C43140F2390F07FB1A33F8F0D773C1AF7FE7E09E5B8E46
          1A77E5BEA577100783DCDFC36EC4F6AAA45301F7E6BE5ED143A40FCDECB0FF00
          C04B5247EF355007CA065F798A5B07FCFC26C98B7D67F2A6789401C0C5AD2C84
          9FDA041B24A53B78FB6447B463AE3FB7F63913FF008084C7D3AC07DF8EBFDF97
          A17973FE73BBF2A3549920D7F47D73CB05C8ADDBC31DE5BA8AFED181CCBF7447
          323176FE097D40C7EDFC7C9D1EBFFE037DAD8471619E3CBE56632FF64387FD93
          EB3F2979DBCA5E7BD31758F27F982CBCC3A71215E7B394398D8EE1254D9E36FF
          0025C03ED9B8C39F1E61C502087CD3B4FB2357D9997C2D5629639774873F3079
          48798243CD7F363FE720FC87F935A8693A679BA1D565B9D6ADDEEACCE9F6F1CC
          A1237E07917963A1AE62EB3B471694813BDFB9DFFB35EC46BFDA0C73C9A53002
          0403C448DC8BDA817937FD0F4FE4AFFCB2F997FE9021FF00B29CC3FE5ED3FF00
          4BE5FB5E97FE4CEF6DF7E2FF004C7FE25DFF0043D3F92BFF002CBE65FF00A408
          7FECA71FE5ED3FF4BE5FB57FE4CEF6DF7E2FF4C7FE25EC1F955F9FFF00971F9C
          53EA163E52BFB98B55D36313DCE8FA8C3F57B83096E3EAC6033ABA82403C5895
          A8E4054573749DA387544881DC742F2FED27B15DA5D8118CF5310612342513C5
          1BEE3B020F758DF7AE459C7E60F9EB44FCB5F286AFE76F3125CBE8DA2FD5FEB8
          B671ACB31FACDC476C9C519901F8E55AEFD32FD4EA238319C92E43F5D3A7EC4E
          C7CFDAFAC86930571CEEB88D0F4C4C8D9A3D227A3E67FF00A1E9FC95FF00965F
          32FF00D2043FF6539ABFE5ED3FF4BE5FB5F40FF933BDB7DF8BFD31FF008977FD
          0F4FE4AFFCB2F997FE9021FF00B29C7F97B4FF00D2F97ED5FF00933BDB7DF8BF
          D31FF897A379A3FE7267F2E7CA3E4FF24F9DF5583586D1BCFB1CD2E86B05AC6F
          385838F2F590CCA17ED8A509CCACBDA98B1638E43752E5B3A2ECEFF81FF696BB
          59A8D1E338FC4D390277235BDD709E1DF977079CFF00D0F4FE4AFF00CB2F997F
          E9021FFB29CC5FE5ED3FF4BE5FB5DEFF00C99DEDBEFC5FE98FFC4BBFE87A7F25
          7FE597CCBFF4810FFD94E3FCBDA7FE97CBF6AFFC99DEDBEFC5FE98FF00C4BBFE
          87A7F257FE597CCBFF004810FF00D94E3FCBDA7FE97CBF6AFF00C99DEDBEFC5F
          E98FFC4AA45FF39CDF927248A8D0F98E1563432BD844557DCF1B863F70C23B7B
          4DFD2F97ED44BFE03DDB6058388FF9E7FE25EABE4BFF009C90FC98F3EDCC161A
          279DAD60D52E28B1697A9AC9613339A0089F58544918D7A2331CCBC1DA7A7CC6
          A32DFB8EDF7BCDF6B7B05DB5D99133CDA79180FE2854C7BCF09240F3900F72CC
          F78F63FE6BF3269DE4EF2D6B9E6AD59666D33CBF6535FDFADBA8794C50A976E0
          A4A82683615195E6CA3140CCF202DCDECDD064D7EA71E9B1571E49088BD859DB
          77CA9FF43D3F92BFF2CBE65FFA4087FECA7351FCBDA7FE97CBF6BE91FF002677
          B6FBF17FA63FF12EFF00A1E9FC95FF00965F32FF00D2043FF6538FF2F69FFA5F
          2FDABFF2677B6FBF17FA63FF0012DAFF00CE747E4A1600DB799141342C6C21A0
          F734B9270FF2F69FFA5F2FDAA7FE03DDB7DF8BFD31FF00897D4DE51F36F97FCF
          5E5ED37CD3E57D45354D13568CC9677680A9F858ABA3AB00CAC8C0AB29150466
          D70E6866809C0D82F9CF69F666A3B37513D36A23C1920771F6820F5046E08649
          96B80EC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0FB
          F98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC5503A9E9B61ACE9BA868
          FAA5AA5EE99AADB4B67A8D949BA4D04E8639636A7665620E4671120627705BB4
          FA8C9A7CB1CB8CF0CE044A24731289B07E05F9AFFF003971FF0038FBF963F97B
          E42D3FCE3E48D124F2F6A235982C6F2DA3B99E7B79E2B88A5624A5C492706531
          8A702052B50762398ED8ECEC387109E3146EBF16FBE7FC0CBDB7ED4ED5D7CB4B
          ACC83247C33204C62240C48EB102C1BDEEFA517E73E736FBB3F563FE719FFE71
          C3F29B5CFCAFF2779E7CCBE5CFF10799357F5EF1EEAE6E6E5628BD2BA9238912
          08A548C8558C54B2924D7B6D9D6F65F66609E18E4946E47DFDEFCDDFF040F6F3
          B5B4DDA99F47A7CBE1E28546808D9B8824991065D4F2236F9BEE0D7742D27CCD
          A46A1A0EBD631EA5A3EA9118350B096BC258CEE54F120F6EC737B931C7244C64
          2C17C8747ACCDA3CD1CD86463381B04742FCC1FF009CC0FC86FCB8FCB1F2EF96
          BCCFE46D2A6D0A7D4B556D3EFF004F17335C5BBAB4324C2402E1E4756063A515
          B8D0F4CE57B67B3F0E9E119E31566BF16FD0DFF02EF6CFB4BB6753974FAC98C8
          230E207844643711AF48008DFA8BF37C0B9CFBED2FD88FC87FF9C69FCA3B3F23
          FE5CF9DEF7CBADAD79AF50D2B4DD7CEAD77737148AE6E628AED4470248B08113
          300A4A13B6E73B3ECFECBC031C321172201BDFDFEE7E5AF6CBDBFED7C9AED569
          2197830C673C7C318C778C4986F220CBD439EF5BBE77FF009CC4FF009C82D635
          0F30EA5F94DE52D424D3F40D1BF71E6DBCB7728F7D74CA0BDB165DFD28ABC597
          F69F90350A2BADEDAED194A670C0D01CFCCF77B9EE7FE059EC461C5A78769EA6
          225927BE3079423D25FD697307A46AB725F00A23C8E91C68D24923058E351566
          63B0000EA4E73CFB59200B3C9FA9BF945FF3843E51B6D0AC356FCD7FAD6B3E60
          BE8D27B8F2EDBDC3DB5A59861510BC9015964900D9C870A0ECB5A723D668FB0B
          188839B727A740FCE7ED3FFC177573CF2C5D9B50C7134264094A5FD20257111E
          E0413D4D721D6755FF009C33FC81D42D5EDED3CAD79A14CEA42DF58EA97AF2A9
          3D081772DC4751EE8732E7D89A590A1123DC4FE9B79AD37FC15BDA0C53E29668
          E41DD2842BFD8081FB5F99FF009FBF919ABFE48799EDF4F96E8EADE5BD6D249B
          CB7AD94E0D22C6544B0CCA361247C8569B10430A54A8E5FB43412D24EB9C4F22
          FD01EC57B6387DA3D29981C19614271E757CA43FA32A35D4104799E79E41FCC1
          F35FE59F98AD3CCFE51D524D3B50B660278ABCA0B986BF141711F4746F03B8EA
          A430046369F533C131381A3F8E6EF3B6BB0F49DB1A6969F5501289E5DF13FCE8
          9E847EC362C3F63F4CF2FF00E527FCE507923CA7E7BF3379522D58CF68D12C4F
          717104D653249C6E6DC496D2C4C42CA8684FDA1434DF3B58E3C1DA18E39251BF
          9EDDE367E57D46BBB5FD8CD766D1E9F31854AF94489823D32A9090DE27E076E8
          FC9CFCFEF23E8DF96FF9BBE71F26F97FD51A36932DA3E9E93317744BBB382EB8
          16352DC0CC5413B9037CE43B470470679423C857DA017E95F62BB63376BF6460
          D5E7AF1262575B02633942EBCF86DE67AB687AB684F631EAD6325936A7636DA9
          E9E5C7C335A5DA09219636150CAC0D36E84153B82331678E50AB1562FE05E834
          DACC5A91238A425C32313E5289A20F9FE8A2362133F25F9C75DF20F99F47F377
          96EECD9EAFA2CE26B77DCA3A91C648A45047249149561DC1C9E0CD2C33138F30
          E3F6B765E0ED4D2CF4BA88DC2628F97711DC41DC1EF7EDF7937CD1E43FF9C8EF
          CAF4B9BBD3E2D4F44D6912DFCCBE5AB8725ADAEE07495A090A156F8245574614
          A8E2DB74CEEB065C5AEC364583CC79BF2276AF676BFD92ED4E18C8C7242CC263
          F8A3204710BB1B824486F46C3E04FF009CC1FC8BFCBEFCADD3FCA3AF79134D9B
          441ACDDDC59EA3A61B89AE616E11AC89221B8791D4F50472A1DA80537E7BB674
          18B4E232C62ACF2FED7DABFE05DED8F68F6D64CD8759313E0889465422773441
          E1001F95FBD03FF3879F923E42FCD56F39EADE7AD3E6D661F2F3D941A7E94B71
          2DBC25AE04CCF248D03A48C47A6A147203AD435761D8BA1C5A8E23905D56CDBF
          F052F6BB5FD89E062D1C840E4122654247D3C340710207337B5F2AA7E8EEBFF9
          27F95BE67F2E685E52D73CA16D7BE5EF2CA3C7A069E25B88BEAAAE00611C914A
          920AD057E2CE9726870E48084A3623CB9ECF83E8BDAEED5D1EA726AB0E731CB9
          7799A89E2AE560823EC7E357FCE41F92743FCBAFCE0F39F93FCB514B0687A54B
          68FA7DBCD234AD1ADDD9417463E6C4B305694805893402A49DF38AED1C11C1A8
          9423C857DA017EABF623B5F3F6B763E0D56A08392625640ABE19CA17436DC46C
          D6D7C98E7E547942C7CFDF98BE52F26EA5733D9D8F986FD6D6E6EADB8FAA8A55
          8D539865AEDDC655A4C233658C0F225CFF00693B527D97D9D9B558C094B1C6C0
          3C8FBE9FA39FF4207F96FF00F5397997EFB3FF00B27CE97FD0F61FE74BECFD4F
          83FF00C9EAED2FF50C5FECFF00E29E63F9ADFF0038370F96FCA9AA7993C81E67
          BED66F344B792F2EB41D4A288C9710C4A5E4F4258427C6AA090850F2E8083D71
          757D83E1C0CB1C8923A17A1F66FF00E0C0757AB860D6E28C23322227126A24EC
          3884AF6BE66F6E74FCEFCE71F727E8F7FCE1CFFCE42EB575AC597E5179CEFDF5
          3B5BB8A4FF0006EAD72E5E7864850B9B277624B4651498EA6AA470150542F4BD
          8BDA323218666FB8FE8FD4F83FFC14FD87C10C32ED4D24444823C4881B104D71
          81D25647177FD5CC127E8F6B1A469BE60D2B50D1359B34D434AD5607B5D42C65
          AF09619071746A106841CE9A7013898C8582F83E9755974B9639B148C6702082
          3A11C8BF337FE72EBF29BF237F2C3CABA4C9E56D09F43F3B6B97C3F47DADB5ED
          CCB1B5AC42B712CB15C492A8415555E3C4966EE03672DDB1A3D369E03805489E
          F3CBAF37E80FF818FB4BDBBDB3AB98D4E4F134F8E3B931883C47E900C4477E64
          DDEC3CC3E4BFCA8FC9DF36FE70EA3AE69FE568A3E5A0E9B2EA1777131E319902
          9FABDB06E81E771C56A6800663B29CD46934593544887417FA87C5F4CF697DA9
          D276063C73D493FBC9888039D7F14BDD01B9F80EAF2FB8B79ED2E27B5BA85EDE
          E6DA468AE2DE452AF1C884AB2B29DC104508398841068BD142719C44A26C1160
          8E4417DA3FF3871F9E1FE04F347FCABEF315E7A7E53F385C28D3E795A8963A9B
          5111AA76093D023783706D872CDE762EBFC19F8723E997D87F6BE4FF00F054F6
          43F94F4BF9EC11BCD846E0739E3E67E30FA879710E74FD77CEC5F985D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157FFFD1FBF98ABB15762A
          EC55D8ABB15762AEC55D8ABB15762AEC55D8ABE34FF9CE9FFC92B6BFF812D87F
          C99B9CD276F7F8BFF9C3F4BEABFF0001DFF8DB3FF0A97DF17E3E671AFD46F65F
          2D7E6F7E77797743D3F45F2BF9AF5DD3F41B0464D3ACED52B0A2B3B3B043E99E
          ACC4F5CCDC5ACD4C2223091003CAEBFD98EC3D5E7965D461C72C92FA89E676AD
          F7EE4F3FE57C7FCE467FD4EFE65FF9167FEA9659FCA1ABFE749C3FF41BECE7FC
          A3E2F9FED617E77FCC7FCD3F39E9F6961E7CF30EADABE9D6B71F58B383505E28
          B3F065E4BF02EFC588CA33EA73E51590923CDDB764760F65767E494F458A1091
          144C79D5DF7F7BCCB315E81FD027E4CFFE49FF00CA8FFC03B42FFBA7C19E87A2
          FF0017C7FD58FDC1F89BDABFF8D8D67FC3F2FF00BB93F07FCE575797DE6FF35D
          F6A15FAFDE6B17D3DF72353EB4970ED254F7F889CE0339272489E767EF7ECAEC
          AC70C5A3C3087D31C7103DC222BEC643F94104573F9B5F95D6D7118960B8F376
          8914D1374647BF84303F3072DD18BCF8C1FE70FBDC1F6A2661D91AB944D11832
          91FE924FE8273D11F891D8ABE16FF9CFAB7B56FCAEF295DBF1FAEC3E698A2B72
          69CBD296CAEDA5A77A728D2B4DBA57B6683DA103C189EBC5FA0BEC5FF0169CC7
          6AE688FA4E124FBC4E15F797E4D6722FD2CFD6BFF9C08B8BB97F2A7CCD04BC9A
          D2DBCD338B4635A02F6768D2283E03634F7F7CEBFD9F27C097F5BF407E67FF00
          8344203B5B111F51C22FFD3CE8FE3B9F13FF00CE5EFF00EB447E617FDBA7FEE9
          1659A3ED9FF1B9FC3EE0FAD7FC0BFF00E71DD37FC94FFA6B37D9DACFE45DAFE7
          2FFCE32FE573E9B1C5079E3CBBE58B29FCB57AD45F581814C9652B1FD8969F09
          3F65E86A016AEEE7A01AAD1E3AFA84457EA7CA74BED8CBD9FF0069F56321274F
          933484C776E6A63CE3D7BE3639D57CA7BCB3BAD3EEEEAC2FADA4B3BEB199EDEF
          2D265292452C4C51D1D4D0865604107A1CE4A5131347987E91C596196027020C
          6401047220EE08F22F73FF009C7AFCECD43F25FCE91EA12196EBCA7ACF0B6F35
          6949B96881F82E2253B7A909248F11C97BD467F676B8E9725FF09E63F4FC1E3B
          DB8F64B1FB43A230143342CE3979F589FE8CBAF71A3D1F60FF00CE76EA9A7EB7
          F979F95FAC6937916A1A5EA9A8CD75A7DF42DCA396196D43A3A9F020D7373DBF
          313C50903609FD0F977FC06F4F934DDA3ABC5962633844020F3044A8853FF9F7
          CFFC71FF0033FF00E6334AFF00937738FB3BF4CFDE3F4A7FE0DDFDF693FAB3FB
          E2FD15CE91F0B7E227FCE5EFFEB447E617FDBA7FEE91659C2F6CFF008DCFE1F7
          07EBAFF817FF00CE3BA6FF00929FF4D66C6FFE71B7FF0027A7E597FDB653FE20
          F957667F8CC3DEEC3DBDFF008C2D5FFC2CFDE1FBBF9DFBF1AB4CA18156019585
          194EE083D8E2A0D3F9BFD4A3861D46FE1B7004115C4A9000790E0AE42D09AD76
          CF3390A269FBCF048CB1C4CB9902FE4CD7F292E2EAD7F353F2D67B12E2ED3CD1
          A47A012A5989BC8871A0DCF2AD08EFD32FD19233C2BF9C3EF751ED34213ECAD5
          09FD3E0E4BFF00487EE7EFC6B7AD699E5CD1F54D7F59BB4B1D2746B596F351BB
          7FB31C30A9776A0DCEC360373D067A16498844CA5B00FC57A3D265D5E6861C51
          E29CC88C47793B07E0BFE727E676A7F9B9E7ED67CE17FCE1B599BEADA169CCD5
          16961113E8C43B5772CF4EAECC73CFF5BAA3A9CA667E1E41FB3BD95F67B17617
          67C34B0DC8DE72FE74CFD47F40FE880FB03FE71FBFE7223F233F267C8169A04B
          6DAF5CF98F517FAEF9A75282C61292DCB0A2C71B35C2B18E25A2AD40A9E4D41C
          8E6E7B3BB4B4DA5C5C3BF11DCEDFB5F2EF6DBD86EDDF683B40E60718C511C38E
          264768F79F4D7148EE7E037A7CD7FF003913E6CFCB1F3EF9DDBCE7F97116A564
          FAEA193CD1A7DFDB240BF5C5A0FAC43C25901F557ED8DBE21CB7E669ACED2CD8
          7364E3C57BF3BEFEF7BEF617B33B53B3343F94D7984BC3FEECC4997A3F9A6C0F
          A7F87C8D6DC3BF02048208342370466BDED5FB41FF0038A1F9DEBF9A9E4A5D0F
          5CBB0FE77F27C51DBEA9CDBE3BDB4FB305E0AEE49A7093AFC6391A73519DB764
          6BBF318F865F5479F98EFF00D7FB5F943FE095EC8FF22EB7C6C23FC1F31263DD
          0973943F4C7FA3B7F097D5B9B77CD9D8ABB15762AEC55D8ABB15762AEC55D8AB
          B15762AEC55D8ABFFFD2FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55A660A0B310AAA2ACC76000EE71502DF087FCE7079CBCA779F95D63E5CB2F
          3269B7BAF49E60B59BF445B5CC735C2C70C37024778E3662814B0156A6E699A0
          EDDCF0384444813636F9BECBFF00021ECAD5E3ED49679E29C71F8521C44111B2
          634013CF9747E50E722FD26FDA9FF9C4EF38F956F3F253C8BA241E61D38EB5A6
          C5756D7DA39B9885D4527D727601A12DCC72560C36DC1CEDFB23340E9E11B162
          F6EBCCBF26FF00C12BB2B578FB6F5198E29787231225C27848E18FF1556C763E
          6FA7EE2E20B4825B9BA9E3B6B6814BCF712B044451B9666620003C4E6D490059
          7CEE1094E42310493C80DC97E77FFCE7679CFCA7ABF93FC9FA0691E63D3B55D6
          22D6CDECF6165731DC4914096D22739046CDC0169169CA95DE95A1CE73B7F3C2
          58E311204DDFD8FB9FFC073B275783599F3E5C52840E3E10640C413C40D0BE7C
          8DD72EBCDF98F9CB3F41BF75BF21BCFDE4BD5FF2A7F2D2C2C3CD1A5CBA8D8797
          74AD32F74C3750ADCC7756D6D1DBBC4D096E60F38C81B6FD4677BD9FA8C72C10
          0242C440E7D6A9F8EBDB3EC5D6E0ED6D5CE7866232CB92625C2784C65232078A
          AB9117DCFCD8FF009CB5FC9ED57F2FBF31756F34DAD9BC9E4FF3BDE4BA8586A1
          1A9F4A0BDB86696E6D243FB2DCF93A0D8143F0FD96A731DB1A2961CA6607A646
          FE3D43EF9FF033F6A7176AF67434D297EFF044448EA611DA331DE2A84BBA5CF9
          8BF2DE9F7F77A5DFD8EA761335B5F69D7115D595C2FDA8E58583A30F70C01CD5
          46462411CC3E899F0C336396398B8C810477822887ED2FE567FCE567E56F9F34
          1B39B5EF3269DE49F33450A8D6349D5E74B3844C07C6F6F71332C6E8C6A5472E
          43B8CEDF49DAF873447148465D41DBE45F93FDA3FF0081B76AF666790C38A59F
          113E9940191AE82518FA811D76AEE2F4BBCFCF1FC9AB1B696EA6FCD4F2A3C50A
          F275B7D5ED2E2423FC98A191DD8FB0539952D7E9C0BF123F30F3F8BD8FEDAC92
          111A3CD67BF1CA23E72000F897E5CFFCE54FFCE40D87E71EB3A568BE555957C9
          9E586964B5BC9D0C725FDD4A02B4FE9B7C488AA38A06A36EC580A80BCA76B768
          8D548461F4C7ED2FD13FF038F6272760619E5D4D78F96AC0362111FC37C89277
          911B6C00E567CB1A6699A8EB5A8D9693A4D94DA8EA7A8CC96F63636E85E59657
          3455551B924E6A61033200164BE8DA8D463D3E3965CB211844592760007EE37E
          4AF93B46FC8BFCAFF2FF0095BCC5AD69DA6EAF2ACBA8EBD3DC5CC50A3DE4F469
          4233B28658942C7C8750B5EF9DE6870C74984424403CCFBDF903DACED4CDED27
          6A65D4E0C72940546004493C0395D0D8C8DCABCE9F947FF3937E64D13CDBF9E5
          E7DD77CBBA845AAE9173359416DA8C0C1E295AD2C2DADA531B8D997D4898061B
          11B8D8E723DA996393533944D8DBEC003F49FF00C0FB419F43D85A6C39E26130
          24483CC714E52163A1A90B1CC722FD4EFF009C73F3DF93753FCA0FCB9D36D3CC
          FA63EA7A7E9169A75EE96D7512DD45730AFA4D1B4258382594F1A8F88508D8E7
          59D9BA8C72C100242C002AF77E73F6EFB1B5B87B63559258A7C129CA425C2784
          C4EF62555C8EFDC762F9C3FE7337FE71FF00EBD0DD7E70793ECFFD32D907F8E7
          4C857FBD89000B7E807ED201497C568FB7162759DB7D9D7FBE80DFF8BF5FEB7B
          BFF814FB6DE1C8765EAA5E93FDD48F43FEA67C8F3879FA7A8AF9919CBBF41B34
          BCF3EF98351F22E93F97D7F71F5AD0B40D4A5D4B44E75325B1B842B344A6BFDD
          B37C60766E47F6B2E96A252C4319E40D87538BB174F8B5F3D740564C90119774
          B84FA49FE90E57D45773F417FE7DF3FF001C7FCCFF00F98CD2BFE4DDCE747ECE
          FD33F78FD2F88FFC1BBFBED27F567F7C5FA03A96B7A2E8CB1B6AFABD9694B286
          3135E5C470060BF688F5196B4AEF9D0CB2463F5101F13D3E9336A2FC284A75FC
          D04FDCFC44FF009CA3D7347F31FE7BF9F757D0753B7D634A9E4D3E2B7D46D245
          96191ADF4EB5825E0EB50C1648D96A0D36CE17B572467A99CA26C6DF707EBBFF
          0081D68F3693B074D8B340C2604C989144716494858E96082C5BF2375FD1FCAD
          F9B7E43F30EBF7ABA6E8DA4EA693EA17CEACCB14611816210331DCF619568324
          71E784A46802EC7DB0D166D6F646A30608F14E70A036DCD8EFD9FAEFFF00434F
          F903FF00971ECFFE91AF7FEC9F3B1FE56D2FF3C7DBFA9F987FE4DCFB41FF0028
          B2FF004D0FF8A797FE6B7FCE647E58691E53D62DFC83AEC9E67F36DEDAC96FA4
          7D5ADAE2182D65954AADC4B34F1C4088EBC82A549200F86BC862EAFB6B0C6046
          33C523CB9EDE6F45ECDFFC0AFB533EAE12D6E318B0C4832B3126407F0811279F
          2B3400DF7E4FC82CE35FA81F5C7FCE247E5C26B5E7DD3BF30FCCB736FA37937C
          9339B98B51BF912DE2BAD4A35AC1044F2328262244AE4578D141FB63371D8FA6
          E3CA324B68C7BFA9FD9CDF32FF00826F6F1D3E825A1D3833CF9C570C41918E33
          F548817F57D23BEC91F4BD67FE733FF3EF4ED7A0B2FCAFF246B76FAA694C52F7
          CDFAAD84CB3432BAB560B359232558211EA494277E02B5561997DB7DA026062C
          66C73247DCF33FF028F62F269A52ED1D663309FD38E321440FE29D1DC5FD31F2
          E23D41788FFCE33FE507E5F7E68EA1E6397F30BCD90E8963A4C50C7A76911DF4
          167797334C4932AFAC1AB1C6A841A0EAC3A537C1ECBD162D4197892A03A5D17A
          FF00F8207B51DA1D8D8F10D0E13394C93291899422074F4FF1127AF41F2F707F
          D08B7E4AFF00CB57997FE93E1FFB26CDEFF20E9FFA5F3FD8F907FC9E2EDBEEC5
          FE94FF00C525BA87FCE17FFCE3EE92233AAEBFACE9826A884DDEAD6B0F3A75E3
          EA402B4F6C8CBB134B1E648F88FD4E460FF82BFB439EFC3C78E55DD8E47EE93F
          2FBF303CB761E50F3A798FCB5A56B76DE64D3748BC786C35BB491658AE212032
          3734254B05601A86818119CAEA310C5925106C03CDFA1FB135F935FA2C5A8C98
          CE39CE3663204189EBB1DEBBAFA523FF002C3F30F59FCADF3B689E73D11D9A5D
          36502FACB9714BBB47204F6EFD451D7A120F16A30DD464B4BA9969F209C7A7DA
          3B9A7DA1EC3C3DB5A1C9A4CDCA4363FCD90FA643DC7E62C722FDD1F25FE67F91
          3F3034DD3750F2C799F4FD41B5281265D316E62FAE44594B18E6B7E5EA23AD0D
          411DBC33BDC1AAC5980309037F3F93F1DF6B7B3DAFECBC9286A314A3C26B8A8F
          01F312AA20F42CFB321D2BB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABFFFD3FBF98ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC558D79CFCB
          DFE2EF27F9AFCA7F5CFD1FFE27D1AFB49FAFFA7EAFA1F5DB7783D5F4F9273E1C
          EBC790AF4A8CAB3E3F171CA175C408F98761D93AEFC86B30EA7878BC2C919D5D
          5F0484AAE8D5D55D1AEE7E7EFF00D13D3FF32F7FDC83FEF659CEFF00A1CFF6CF
          F63FB5F6CFF93E1FF405FF004B7FEADBBFE89E9FF997BFEE41FF007B2C7FD0E7
          FB67FB1FDABFF27C3FE80BFE96FF00D5B44D97FCFBF3EA7796977FF2B6FD4FAA
          CD1CDE9FE81A72E0C1A95FD22695A618FB3B46FC4FF63FB5AF2FFC1B7C484A3F
          92AB047F7BDFFF0024DF73FE64F937FE5617917CCDE4AFD25FA23FC4766D69FA
          4BD1FAC7A3C981E5E9738F974E9C866FF5583C6C5285D587C7BB03B57F92B5F8
          B57C3C7E1CAF86F86FE346BE45F07FFD13D3FF0032F7FDC83FEF659CFF00FA1C
          FF006CFF0063FB5F65FF0093E1FF00405FF4B7FEADBBFE89E9FF00997BFEE41F
          F7B2C7FD0E7FB67FB1FDABFF0027C3FE80BFE96FFD5B4F3CB3FF00381BFE1CF3
          2797BCC3FF002B57EB9FA0B52B4D47EA7FA0FD3F57EAB324BE9F3FD20DC7971A
          56869E072CC5ECFF0004C4BC4E441E5DDF1713B43FE0CDF9BD365C1F93E1F121
          28DF8B75C408BAF0C5D5F7BEF5D7741D17CCFA4DEE85E61D2EDB59D23504F4EF
          34EBB8C4913AF51556E841DC11B83B8DF3A0C98E3922632160BE2FA3D6E7D1E5
          8E6C13309C4D820D11F8EA3AF22F86BCF7FF003817E51D567B8BEF20F9A2EBCA
          AD2559746BE8FEBF680D7ECC72F349917FD6321CD0EA3D9FC72378E5C3E4771F
          AFEF7D83B1BFE0CFACC1110D6E18E5AFE289E097C451893EEE0782DFFF00CE07
          7E6FDBCB4B2D6FCAFA8C0D5E320BABA89C500FB4AF6B415276A31CD7CBD9FCE3
          9189F89FD4F6987FE0CBD8F31EBC79A27FAB13F74FF40408FF009C16FCEA240F
          ADF96857B9BE9FFEC9B23FC81A8FE8FCFF006377FC9E2EC4FE6E5FF4A3FE299E
          7977FE7DFF00E699A68CF9B3CFDA569D6E37963D2609EF5DBD834E2D40AF8D0F
          CB3231FB3B33F5CC0F76FF00A9D2EBBFE0D9A5883F96D34E47FA6443FDCF1FDE
          FB5FF2A3FE71EBF2D7F27FFD2BCB7A5C97DAFBA18E6F33EA6CB3DE956FB4B190
          A89129AD088D56A3ED16CDE693B3B0E9B788B3DE79BE4BED27B71DA7DBDE9D44
          C471F4C70DA1EF3B9323FD626BA5309FF9C81FF9C69FF95EBAC797F56FF1AFF8
          5BF4159CB69F57FD1BF5EF57D493D4E5CBEB56FC69D294394768F65FE6E40F17
          0D0EEBFD21DBFB13EDFF00FA1AC3971781E2F89212BE3E0AA15FCC95BE7EFF00
          A27A7FE65EFF00B907FDECB35DFE873FDB3FD8FED7B6FF0093E1FF00405FF4B7
          FEADA79E59FF009C0DFF000E7993CBDE61FF0095ABF5CFD05A95A6A3F53FD07E
          9FABF559925F4F9FE906E3CB8D2B434F039662F67F82625E27220F2EEF8B89DA
          1FF066FCDE9B2E0FC9F0F890946FC5BAE2045D7862EAFBDFA112C51CF1C90CD1
          ACD0CCA52589C065656142AC0EC411D4674645BE1F19189041A21F9FBE6CFF00
          9C05D0757F306A7A9F96BCFF002795F47BE99A6B5D064D2C5E8B6E7BB46930BC
          82A809F8415A81B127AE73B9BD9E8CA64C67C20F4ABFD21F6DECDFF834EA3069
          E18F51A6196711467C7C1C5E663C12DFBF7DCF40C77FE89E9FF997BFEE41FF00
          7B2CABFD0E7FB67FB1FDAE77FC9F0FFA02FF00A5BFF56DF4EFFCE3E7E417FCA8
          8B3F345A7F8B3FC55FE249AD66F53EA1F51F47EACB2AD29F58B8E5CBD4F6A533
          6BD9DD9FF93121C5C575D2BF497CF7DB7F6D7FD12CF0CBC1F0BC2121F571DF15
          7F463555E6967FCE41FF00CE38FF00CAF7BCF2BDDFF8CBFC2BFE1B86EA1F4FF4
          77D7BD6FACB44D5AFD66DF8F1F4FDEB5C8768F667E70C4F170D5F4BFD21C8F62
          3DBCFF004350CD1F03C5F14C4FD7C15C37FD195DDF93E75FFA27A7FE65EFFB90
          7FDECB35BFE873FDB3FD8FED7BAFF93E1FF405FF004B7FEADBBFE89E9FF997BF
          EE41FF007B2C7FD0E7FB67FB1FDABFF27C3FE80BFE96FF00D5B77FD13D3FF32F
          7FDC83FEF658FF00A1CFF6CFF63FB57FE4F87FD017FD2DFF00AB6EFF00A27A7F
          E65EFF00B907FDECB1FF00439FED9FEC7F6AFF00C9F0FF00A02FFA5BFF0056DE
          93E4CFF9C14FCB3D0AE61BCF356B5AA79D2584822C5B8D859B906BF1C709794F
          C84C0788399583B030C0DCC997D83F1F1741DABFF063ED3D4C4C34D8E1801EBF
          5CFE04D47FD833AFCF0FF9C63D2FF36F4DF2268FA2EBF6FF0097FA579123BF86
          C74EB5D2D6E6164BDFAB7C288B716C23E1F57AF7E5CBB77BF5FD951D48846278
          046FA77D798EE74FEC87FC10B2F6165D465CD8CEA279CC49267C26E1C5CC98CE
          EF8BCAA9F3E7FD13D3FF0032F7FDC83FEF659AEFF439FED9FEC7F6BDBFFC9F0F
          FA02FF00A5BFF56DDFF44F4FFCCBDFF720FF00BD963FE873FDB3FD8FED5FF93E
          1FF405FF004B7FEADBF49F3A77C0DF317FCE41FF00CE38FF00CAF7BCF2BDDFF8
          CBFC2BFE1B86EA1F4FF477D7BD6FACB44D5AFD66DF8F1F4FDEB5CD5768F667E7
          0C4F170D5F4BFD21F42F623DBCFF004350CD1F03C5F14C4FD7C15C37FD195DDF
          93E75FFA27A7FE65EFFB907FDECB35BFE873FDB3FD8FED7BAFF93E1FF405FF00
          4B7FEADBBFE89E9FF997BFEE41FF007B2C7FD0E7FB67FB1FDABFF27C3FE80BFE
          96FF00D5B7A0FE55FF00CE177FCAB3F3FF0096FCF3FF002B27F4DFF87E6966FD
          17FA1BEADEB7A90C90D3D5FAF4BC69EA57EC1E9993A4EC4F032C7271DD74AFDA
          E93DA3FF0082C7F2C767E5D1FE5783C40071789C55444B97871BE5DE1F7366F9
          F1E762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157FFFD4FBF98ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762A
          EC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B15762AEC55D8ABB15762AEC55FFD9}
        Stretch = True
      end
      object QRShape38: TQRShape
        Left = 636
        Top = 653
        Width = 2
        Height = 226
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          597.958333333333000000
          1682.750000000000000000
          1727.729166666670000000
          5.291666666666670000)
        Pen.Mode = pmBlack
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 536
        Top = 894
        Width = 161
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1418.166666666670000000
          2365.375000000000000000
          425.979166666667000000)
        Pen.Mode = pmBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel110: TQRLabel
        Left = 551
        Top = 901
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1457.854166666667000000
          2383.895833333333000000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ASSINATURA DO CLIENTE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 433
        Top = 118
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          312.208333333333400000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 474
        Top = 243
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          642.937500000000000000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 474
        Top = 262
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          693.208333333333400000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 474
        Top = 281
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          743.479166666666800000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 15
        Top = 367
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          971.020833333333400000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '01'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 15
        Top = 402
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1063.625000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '03'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 15
        Top = 438
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1158.875000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '05'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 15
        Top = 385
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1018.645833333333000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '02'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel20: TQRLabel
        Left = 15
        Top = 420
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1111.250000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel122: TQRLabel
        Left = 15
        Top = 456
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1206.500000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '06'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel123: TQRLabel
        Left = 15
        Top = 474
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1254.125000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '07'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel124: TQRLabel
        Left = 15
        Top = 492
        Width = 13
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          1301.750000000000000000
          34.395833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '08'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel132: TQRLabel
        Left = 50
        Top = 367
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          971.020833333333400000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM01'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel133: TQRLabel
        Left = 50
        Top = 385
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1018.645833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM02'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel134: TQRLabel
        Left = 50
        Top = 403
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1066.270833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM03'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel135: TQRLabel
        Left = 50
        Top = 421
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1113.895833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel136: TQRLabel
        Left = 50
        Top = 439
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1161.520833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM05'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel137: TQRLabel
        Left = 50
        Top = 457
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1209.145833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM06'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel138: TQRLabel
        Left = 50
        Top = 475
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1256.770833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM07'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel139: TQRLabel
        Left = 50
        Top = 493
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          132.291666666666700000
          1304.395833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM08'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel140: TQRLabel
        Left = 11
        Top = 634
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          29.104166666666670000
          1677.458333333333000000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estado do Ve'#237'culo'
        Color = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel147: TQRLabel
        Left = 88
        Top = 366
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          968.375000000000000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM01'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel148: TQRLabel
        Left = 88
        Top = 385
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1018.645833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM02'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel149: TQRLabel
        Left = 88
        Top = 403
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1066.270833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM03'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel150: TQRLabel
        Left = 88
        Top = 421
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1113.895833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM04'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel151: TQRLabel
        Left = 88
        Top = 439
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1161.520833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM05'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel152: TQRLabel
        Left = 88
        Top = 457
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1209.145833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM06'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel153: TQRLabel
        Left = 88
        Top = 475
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1256.770833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM07'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel154: TQRLabel
        Left = 88
        Top = 493
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          1304.395833333333000000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TM08'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel155: TQRLabel
        Left = 256
        Top = 511
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          1352.020833333333000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Defeitos'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel162: TQRLabel
        Left = 550
        Top = 559
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1455.208333333333000000
          1479.020833333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ01'
        Color = clWhite
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
      object QRLabel163: TQRLabel
        Left = 550
        Top = 577
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1455.208333333333000000
          1526.645833333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ02'
        Color = clWhite
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
      object QRLabel164: TQRLabel
        Left = 550
        Top = 596
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1455.208333333333000000
          1576.916666666667000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ03'
        Color = clWhite
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
      object QRLabel165: TQRLabel
        Left = 550
        Top = 616
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1455.208333333333000000
          1629.833333333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ04'
        Color = clWhite
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
      object QRLabel166: TQRLabel
        Left = 640
        Top = 559
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1693.333333333333000000
          1479.020833333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ05'
        Color = clWhite
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
      object QRLabel167: TQRLabel
        Left = 640
        Top = 577
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1693.333333333333000000
          1526.645833333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ06'
        Color = clWhite
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
      object QRLabel168: TQRLabel
        Left = 640
        Top = 596
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1693.333333333333000000
          1576.916666666667000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ07'
        Color = clWhite
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
      object QRLabel169: TQRLabel
        Left = 640
        Top = 616
        Width = 31
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1693.333333333333000000
          1629.833333333333000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'REQ08'
        Color = clWhite
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
      object QRLabel113: TQRLabel
        Left = 345
        Top = 677
        Width = 52
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          912.812500000000000000
          1791.229166666667000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel113'
        Color = clWhite
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
      object QRDBRichText1: TQRDBRichText
        Left = 12
        Top = 650
        Width = 321
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          140.229166666667000000
          31.750000000000000000
          1719.791666666670000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'ESTADO_VEIC'
        DataSet = DtmPedVenda.cdsPedVenda
      end
      object QRLabel71: TQRLabel
        Left = 641
        Top = 655
        Width = 74
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1695.979166666670000000
          1733.020833333330000000
          195.791666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel72: TQRLabel
        Left = 641
        Top = 673
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1695.979166666670000000
          1780.645833333330000000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel73: TQRLabel
        Left = 643
        Top = 691
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          1828.270833333330000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel74: TQRLabel
        Left = 643
        Top = 708
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          1873.250000000000000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel75: TQRLabel
        Left = 643
        Top = 725
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          1918.229166666670000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel76: TQRLabel
        Left = 643
        Top = 742
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          1963.208333333330000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel170: TQRLabel
        Left = 643
        Top = 759
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2008.187500000000000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel171: TQRLabel
        Left = 643
        Top = 775
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2050.520833333330000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel172: TQRLabel
        Left = 643
        Top = 791
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2092.854166666670000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel173: TQRLabel
        Left = 643
        Top = 807
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2135.187500000000000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel174: TQRLabel
        Left = 643
        Top = 824
        Width = 73
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          1701.270833333330000000
          2180.166666666670000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clWhite
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
      object QRLabel175: TQRLabel
        Left = 643
        Top = 841
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2225.145833333330000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel176: TQRLabel
        Left = 643
        Top = 861
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1701.270833333330000000
          2278.062500000000000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0,00'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 544
        Top = 143
        Width = 171
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1439.333333333330000000
          378.354166666667000000
          452.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'OBS_CXL_OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 497
        Top = 168
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1314.979166666667000000
          444.500000000000000000
          97.895833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel102: TQRLabel
        Left = 145
        Top = 864
        Width = 119
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          383.645833333333400000
          2286.000000000000000000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ASSINATURA DO CLIENTE'
        Color = clWhite
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
      object QRLabel2: TQRLabel
        Left = 9
        Top = 3
        Width = 266
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          23.812500000000000000
          7.937500000000000000
          703.791666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#195'O '#201' DOCUMENTO FISCAL'
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
      object QRLabel21: TQRLabel
        Left = 317
        Top = 5
        Width = 396
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          838.729166666666800000
          13.229166666666670000
          1047.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#195'O '#201' V'#193'LIDO COMO GARANTIA DE MERCADORIA'
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
      object QRLabel25: TQRLabel
        Left = 8
        Top = 927
        Width = 271
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          2452.687500000000000000
          717.020833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #201' vedada a autentica'#231#227'o deste documento'
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
      object QRShape67: TQRShape
        Left = 8
        Top = 946
        Width = 710
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666700000
          21.166666666666700000
          2502.958333333330000000
          1878.541666666670000000)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel177: TQRLabel
        Left = 216
        Top = 195
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          515.937500000000000000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ORDEM SERV.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRDBRichText2: TQRDBRichText
        Left = 11
        Top = 527
        Width = 533
        Height = 106
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          280.458333333333000000
          29.104166666666700000
          1394.354166666670000000
          1410.229166666670000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        DataField = 'DEFEITO'
        DataSet = DtmPedVenda.cdsPedVenda
      end
      object QRLabel125: TQRLabel
        Left = 16
        Top = 324
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          857.250000000000000000
          89.958333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EMAIL:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel126: TQRLabel
        Left = 88
        Top = 324
        Width = 96
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333400000
          857.250000000000000000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'teste@teste.com.br'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape50: TQRShape
        Left = 470
        Top = 299
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          791.104166666666800000
          42.333333333333330000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel128: TQRLabel
        Left = 489
        Top = 302
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          799.041666666666800000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'EXPRESSO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel129: TQRLabel
        Left = 474
        Top = 300
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          793.750000000000000000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrNome_emp: TQRLabel
        Left = 17
        Top = 83
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          219.604166666666700000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOME_EMP'
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 10
      end
      object QrEndereco_emp: TQRLabel
        Left = 17
        Top = 103
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          272.520833333333400000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENDERECO_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrCep_emp: TQRLabel
        Left = 47
        Top = 123
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          124.354166666666700000
          325.437500000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CEP_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrCidade_emp: TQRLabel
        Left = 106
        Top = 123
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          280.458333333333300000
          325.437500000000000000
          359.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CIDADE_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrTELEFONE_EMP: TQRLabel
        Left = 43
        Top = 147
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          113.770833333333300000
          388.937500000000000000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TELEFONE_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrCGC_EMP: TQRLabel
        Left = 78
        Top = 171
        Width = 135
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          206.375000000000000000
          452.437500000000000000
          357.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'CGC_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrIE_EMP: TQRLabel
        Left = 295
        Top = 171
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          780.520833333333200000
          452.437500000000000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'IE_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrEMAIL_EMP: TQRLabel
        Left = 63
        Top = 196
        Width = 150
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          166.687500000000000000
          518.583333333333300000
          396.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'EMAIL_EMP'
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
      object QrN_OS: TQRLabel
        Left = 295
        Top = 195
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          780.520833333333200000
          515.937500000000000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'N_OS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QrFILIAL: TQRLabel
        Left = 497
        Top = 40
        Width = 216
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          1314.979166666667000000
          105.833333333333300000
          571.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FILIAL'
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
      object QRLabel50: TQRLabel
        Left = 474
        Top = 321
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          849.312500000000000000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRShape51: TQRShape
        Left = 470
        Top = 320
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1243.541666666667000000
          846.666666666666800000
          42.333333333333330000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel127: TQRLabel
        Left = 489
        Top = 323
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          854.604166666666800000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RETORNO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel130: TQRLabel
        Left = 474
        Top = 320
        Width = 7
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          846.666666666666600000
          18.520833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'x'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRBarcode1: TQRBarcode
        Left = 281
        Top = 28
        Width = 103
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          743.479166666666800000
          74.083333333333340000
          272.520833333333400000)
        Picture.Data = {
          07544269746D6170A2480000424DA24800000000000036000000280000006700
          00002D00000001002000000000006C4800000000000000000000000000000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF000000
          0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
          FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
          0000FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
          FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
          FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
          FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
          0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
          000000000000FFFFFF0000000000}
        BarCode = '123456'
        Modul = 1
        Ratio = 2.000000000000000000
        TextShow = tsBarCode
        AutoWidth = True
        About = 
          'BarCode VCL Component, Copyright(C) Han-soft Software.(http://ww' +
          'w.han-soft.com)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Alignment = taLeftJustify
        Color = clWhite
        UseDockManager = False
      end
      object QRLabel131: TQRLabel
        Left = 107
        Top = 991
        Width = 141
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          283.104166666666700000
          2622.020833333333000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NOME_EMP'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
      object QRLabel141: TQRLabel
        Left = 266
        Top = 991
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          703.791666666666800000
          2622.020833333333000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel141'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        FontSize = 8
      end
    end
    object QRLabel77: TQRLabel
      Left = 386
      Top = 676
      Width = 73
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1021.291666666667000000
        1788.583333333333000000
        193.145833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'COMBUST'#205'VEL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel78: TQRLabel
      Left = 435
      Top = 696
      Width = 14
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        1150.937500000000000000
        1841.500000000000000000
        37.041666666666670000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '4/4'
      Color = clWhite
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
    object QRLabel79: TQRLabel
      Left = 435
      Top = 712
      Width = 14
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        1150.937500000000000000
        1883.833333333333000000
        37.041666666666670000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '1/2'
      Color = clWhite
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
    object QRLabel80: TQRLabel
      Left = 432
      Top = 728
      Width = 23
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333340000
        1143.000000000000000000
        1926.166666666667000000
        60.854166666666680000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'RES.'
      Color = clWhite
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
    object QRLabel82: TQRLabel
      Left = 475
      Top = 693
      Width = 71
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1256.770833333333000000
        1833.562500000000000000
        187.854166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'M.O. - REVIS'#195'O'
      Color = clWhite
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
    object QRLabel83: TQRLabel
      Left = 474
      Top = 711
      Width = 79
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1254.125000000000000000
        1881.187500000000000000
        209.020833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'M.O. - MEC'#194'NICA'
      Color = clSilver
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
    object QRLabel84: TQRLabel
      Left = 474
      Top = 729
      Width = 86
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1254.125000000000000000
        1928.812500000000000000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SERV. TERCEIROS'
      Color = clWhite
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
    object QRLabel85: TQRLabel
      Left = 474
      Top = 746
      Width = 44
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1254.125000000000000000
        1973.791666666667000000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'LAVAGEM'
      Color = clSilver
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
    object QRLabel86: TQRLabel
      Left = 474
      Top = 763
      Width = 86
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1254.125000000000000000
        2018.770833333333000000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SERVI'#199'OS GERAIS'
      Color = clWhite
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
    object QRLabel87: TQRLabel
      Left = 474
      Top = 781
      Width = 74
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        1254.125000000000000000
        2066.395833333333000000
        195.791666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'SUB-TOTAL M.O.'
      Color = clSilver
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
    object QRLabel95: TQRLabel
      Left = 66
      Top = 745
      Width = 378
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        174.625000000000000000
        1971.145833333334000000
        1000.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'UTILIZAR ESTE CAMPO EM CASO DE SERVI'#199'O REEMBOLSADO PELA HONDA'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel96: TQRLabel
      Left = 52
      Top = 768
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        2032.000000000000000000
        87.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NOME:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel97: TQRLabel
      Left = 52
      Top = 785
      Width = 58
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        2076.979166666667000000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ENDERE'#199'O:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel98: TQRLabel
      Left = 52
      Top = 802
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        2121.958333333333000000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'CIDADE'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel99: TQRLabel
      Left = 52
      Top = 821
      Width = 31
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        2172.229166666667000000
        82.020833333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FONE:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel100: TQRLabel
      Left = 60
      Top = 846
      Width = 399
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        158.750000000000000000
        2238.375000000000000000
        1055.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'ESTOU CIENTE DAS CONDI'#199#213'ES APRESENTADAS NESTA O.S E QUE MINHA MO' +
        'TOCICLETA FOI DEIXADA'
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
    object QRLabel103: TQRLabel
      Left = 308
      Top = 800
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        814.916666666666800000
        2116.666666666667000000
        121.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ESTADO:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel104: TQRLabel
      Left = 220
      Top = 823
      Width = 25
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        582.083333333333400000
        2177.520833333333000000
        66.145833333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'FAX:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
    object QRLabel1: TQRLabel
      Left = 55
      Top = 859
      Width = 402
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        145.520833333333300000
        2272.770833333333000000
        1063.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 
        'NA CONCESSION'#193'RIA CONFORME DESCRITO E QUE PODER'#193' SER ESTRAPOLADO' +
        ' O PRAZO DE (30) DIAS'
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
    object QRLabel101: TQRLabel
      Left = 114
      Top = 872
      Width = 255
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        301.625000000000000000
        2307.166666666667000000
        674.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'PARA REALIZA'#199#195'O DOS SERVI'#199'OS E ENTREGA DA MOTOCICLETA.'
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
    object QrFAX: TQRLabel
      Left = 287
      Top = 186
      Width = 78
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        759.354166666666800000
        492.125000000000000000
        206.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'TELEFONE_EMP'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      ExportAs = exptText
      FontSize = 8
    end
  end
end
