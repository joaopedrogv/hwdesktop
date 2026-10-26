inherited frmRelLivroRegistroEntrada: TfrmRelLivroRegistroEntrada
  Left = 424
  Top = 387
  Caption = 'Livro de Registro de Entrada'
  ClientHeight = 208
  ClientWidth = 497
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 505
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 497
    Height = 208
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpLeft
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 469
        Height = 153
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
        object Label1: TLabel
          Left = 82
          Top = 42
          Width = 57
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label2: TLabel
          Left = 225
          Top = 42
          Width = 52
          Height = 13
          Caption = 'Data Final:'
        end
        object Label3: TLabel
          Left = 104
          Top = 69
          Width = 35
          Height = 13
          Caption = 'Status:'
        end
        object Label4: TLabel
          Left = 73
          Top = 96
          Width = 66
          Height = 13
          Caption = 'P'#225'gina Inicial:'
        end
        object MaskEdit1: TMaskEdit
          Left = 145
          Top = 34
          Width = 66
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object MaskEdit2: TMaskEdit
          Left = 283
          Top = 34
          Width = 68
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
        object ComboBox1: TComboBox
          Left = 145
          Top = 61
          Width = 206
          Height = 21
          ItemHeight = 13
          TabOrder = 2
          Text = 'Ambos'
          Items.Strings = (
            'Abertas'
            'Fechadas'
            'Ambos')
        end
        object Edit1: TEdit
          Left = 145
          Top = 88
          Width = 75
          Height = 21
          TabOrder = 3
          Text = '01'
        end
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 129
          Width = 461
          Height = 16
          Align = alBottom
          TabOrder = 4
          Visible = False
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 156
        Width = 469
        Height = 44
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 106
          Top = 8
          Width = 75
          Height = 25
          Caption = '&OK'
          TabOrder = 0
          OnClick = BitBtn1Click
          Glyph.Data = {
            92010000424D9201000000000000920000002800000010000000100000000100
            08000000000000010000120B0000120B0000170000001700000000000000FFFF
            FF00FF00FF00004B0000098611000C9C19000A8615000C9518000D931A000F9E
            1C000F991C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1
            340024BC430029B548002EC6520035CA5E0039D4650002020202020202020202
            0202020202020202020202020202020202020202020202020202020303020202
            0202020202020202020203090C03020202020202020202020203100D050E0302
            02020202020202020314120F03080B030202020202020203151611030203060A
            0302020202020202031303020202020307030202020202020203020202020202
            0304030202020202020202020202020202020303020202020202020202020202
            0202020303020202020202020202020202020202020202020202020202020202
            0202020202020202020202020202020202020202020202020202020202020202
            02020202020202020202020202020202020202020202}
        end
        object BitBtn2: TBitBtn
          Left = 187
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancela'
          TabOrder = 1
          OnClick = BitBtn2Click
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
        object BitBtn3: TBitBtn
          Left = 268
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Parar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = BitBtn3Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 1092
      ExplicitHeight = 306
      object QuickRep1: TQuickRep
        Left = 0
        Top = 0
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        AfterPreview = QuickRep1AfterPreview
        BeforePrint = QuickRep1BeforePrint
        DataSet = DtmPedVenda.qrBuscas
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
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100.000000000000000000
          2100.000000000000000000
          100.000000000000000000
          2970.000000000000000000
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
        ReportTitle = 'Registro de Entradas de Servi'#231'os'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        PrevFormStyle = fsNormal
        PreviewInitialState = wsNormal
        PrevInitialZoom = qrZoomToFit
        PreviewDefaultSaveType = stQRP
        object QRBand2: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 65
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = QRBand2BeforePrint
          Color = clWhite
          TransparentBand = False
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            171.979166666666700000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbPageHeader
          object QRLabel2: TQRLabel
            Left = 41
            Top = 46
            Width = 59
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              108.479166666666700000
              121.708333333333300000
              156.104166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data Entrada'
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
          object QRLabel1: TQRLabel
            Left = 2
            Top = 46
            Width = 35
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              5.291666666666667000
              121.708333333333300000
              92.604166666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'N'#186' Reg.'
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
          object QRLabel3: TQRLabel
            Left = 106
            Top = 46
            Width = 32
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              280.458333333333300000
              121.708333333333300000
              84.666666666666680000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'N'#186'Doc.'
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
          object QRLabel4: TQRLabel
            Left = 195
            Top = 46
            Width = 27
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              515.937500000000000000
              121.708333333333300000
              71.437500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Nome'
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
          object QRLabel5: TQRLabel
            Left = 306
            Top = 46
            Width = 98
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              809.625000000000000000
              121.708333333333300000
              259.291666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Endere'#231'o e Telefones'
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
            Left = 431
            Top = 46
            Width = 72
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1140.354166666667000000
              121.708333333333300000
              190.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Desc. dos Bens'
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
            Left = 524
            Top = 46
            Width = 25
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1386.416666666667000000
              121.708333333333300000
              66.145833333333320000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Valor'
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
            Left = 602
            Top = 46
            Width = 101
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1592.791666666667000000
              121.708333333333300000
              267.229166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Finalidade da Entrada'
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
            Left = 744
            Top = 45
            Width = 49
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1968.500000000000000000
              119.062500000000000000
              129.645833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data Sa'#237'da'
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
            Left = 799
            Top = 46
            Width = 50
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2114.020833333333000000
              121.708333333333300000
              132.291666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'N'#186' do Doc.'
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
            Left = 919
            Top = 46
            Width = 58
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2431.520833333333000000
              121.708333333333300000
              153.458333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Observa'#231#245'es'
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
            Left = 434
            Top = 1
            Width = 255
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1148.291666666667000000
              2.645833333333333000
              674.687500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'REGISTRO DE ENTRADAS DE SERVI'#199'OS'
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
            Left = 388
            Top = 16
            Width = 337
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666700000
              1026.583333333330000000
              42.333333333333300000
              891.645833333333000000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Outros Dados'
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
          object QRLabel17: TQRLabel
            Left = 883
            Top = 1
            Width = 37
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2336.270833333333000000
              2.645833333333333000
              97.895833333333320000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Folha:'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel18: TQRLabel
            Left = 834
            Top = 24
            Width = 87
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2206.625000000000000000
              63.500000000000000000
              230.187500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Data Emiss'#227'o:'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRSysData1: TQRSysData
            Left = 932
            Top = 24
            Width = 68
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2465.916666666667000000
              63.500000000000000000
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
          object QRLabel19: TQRLabel
            Left = 932
            Top = 2
            Width = 36
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              2465.916666666667000000
              5.291666666666667000
              95.250000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '00001'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 10
          end
          object QRLabel21: TQRLabel
            Left = 40
            Top = 3
            Width = 70
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              105.833333333333300000
              7.937500000000000000
              185.208333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'QRLabel21'
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
        object QRBand1: TQRBand
          Left = 38
          Top = 103
          Width = 1047
          Height = 31
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          BeforePrint = QRBand1BeforePrint
          Color = clWhite
          TransparentBand = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            82.020833333333340000
            2770.187500000000000000)
          PreCaluculateBandHeight = False
          KeepOnOnePage = False
          BandType = rbDetail
          object QRShape10: TQRShape
            Left = 879
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333320000
              2325.687500000000000000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape9: TQRShape
            Left = 796
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333320000
              2106.083333333333000000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape8: TQRShape
            Left = 740
            Top = 0
            Width = 1
            Height = 30
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              79.375000000000000000
              1957.916666666667000000
              0.000000000000000000
              2.645833333333333000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape7: TQRShape
            Left = 559
            Top = 0
            Width = 1
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              84.666666666666700000
              1479.020833333330000000
              0.000000000000000000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape6: TQRShape
            Left = 513
            Top = 0
            Width = 1
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              84.666666666666700000
              1357.312500000000000000
              0.000000000000000000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape5: TQRShape
            Left = 422
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333300000
              1116.541666666670000000
              0.000000000000000000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape4: TQRShape
            Left = 287
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333300000
              759.354166666667000000
              0.000000000000000000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape3: TQRShape
            Left = 138
            Top = -1
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333300000
              365.125000000000000000
              -2.645833333333330000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape2: TQRShape
            Left = 101
            Top = -1
            Width = 1
            Height = 32
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              84.666666666666700000
              267.229166666667000000
              -2.645833333333330000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape1: TQRShape
            Left = 40
            Top = 0
            Width = 1
            Height = 31
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              82.020833333333300000
              105.833333333333000000
              0.000000000000000000
              2.645833333333330000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRDBText2: TQRDBText
            Left = 43
            Top = 2
            Width = 57
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              113.770833333333000000
              5.291666666666670000
              150.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'DATA_PED'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText3: TQRDBText
            Left = 103
            Top = 2
            Width = 34
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              272.520833333333000000
              5.291666666666670000
              89.958333333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'NPED'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText4: TQRDBText
            Left = 140
            Top = 2
            Width = 146
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              370.416666666667000000
              5.291666666666670000
              386.291666666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'NOME_CLIENTE'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText5: TQRDBText
            Left = 289
            Top = 2
            Width = 132
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              764.645833333333000000
              5.291666666666670000
              349.250000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'ENDERECO'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText6: TQRDBText
            Left = 424
            Top = 2
            Width = 88
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              1121.833333333330000000
              5.291666666666670000
              232.833333333333000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'DESCMODELO'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText8: TQRDBText
            Left = 561
            Top = 2
            Width = 176
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333330000
              1484.312500000000000000
              5.291666666666667000
              465.666666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'DESC_SERV_PED'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText11: TQRDBText
            Left = 884
            Top = 4
            Width = 159
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333330000
              2338.916666666667000000
              10.583333333333330000
              420.687500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'OBS_RED_OS'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText12: TQRDBText
            Left = 289
            Top = 14
            Width = 72
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              764.645833333333000000
              37.041666666666700000
              190.500000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'BAIRRO'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRDBText13: TQRDBText
            Left = 367
            Top = 16
            Width = 50
            Height = 9
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              23.812500000000000000
              971.020833333333000000
              42.333333333333300000
              132.291666666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'FONE_CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 5
          end
          object QRDBText14: TQRDBText
            Left = 424
            Top = 15
            Width = 57
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              1121.833333333330000000
              39.687500000000000000
              150.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DtmPedVenda.qrBuscas
            DataField = 'PLACA'
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRLabel13: TQRLabel
            Left = 4
            Top = 3
            Width = 32
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333300000
              10.583333333333300000
              7.937500000000000000
              84.666666666666700000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '0'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRLabel14: TQRLabel
            Left = 744
            Top = 3
            Width = 47
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333330000
              1968.500000000000000000
              7.937500000000000000
              124.354166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabel14'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRLabel15: TQRLabel
            Left = 799
            Top = 4
            Width = 77
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333330000
              2114.020833333333000000
              10.583333333333330000
              203.729166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabel15'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
          object QRLabel20: TQRLabel
            Left = 515
            Top = 3
            Width = 43
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.395833333333330000
              1362.604166666667000000
              7.937500000000000000
              113.770833333333300000)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = '0,00'
            Color = clWhite
            Transparent = False
            WordWrap = True
            ExportAs = exptText
            FontSize = 7
          end
        end
      end
    end
  end
end
