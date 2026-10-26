inherited frmReciboSimples: TfrmReciboSimples
  Left = 265
  Top = 35
  Caption = 'Emiss'#227'o de Recibo Simples'
  ClientHeight = 480
  Position = poMainFormCenter
  Scaled = False
  ExplicitWidth = 792
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 432
    Align = alTop
    Caption = 'Recibo simples'
    TabOrder = 0
    object Shape1: TShape
      Left = 17
      Top = 18
      Width = 744
      Height = 393
    end
    object Shape3: TShape
      Left = 29
      Top = 121
      Width = 713
      Height = 1
      Pen.Style = psDot
    end
    object Label9: TLabel
      Left = 85
      Top = 167
      Width = 63
      Height = 13
      Caption = 'a import'#226'ncia'
    end
    object Label10: TLabel
      Left = 308
      Top = 169
      Width = 3
      Height = 13
      Color = clBtnHighlight
      ParentColor = False
    end
    object Label11: TLabel
      Left = 85
      Top = 191
      Width = 59
      Height = 13
      Caption = 'Referente a:'
    end
    object Label12: TLabel
      Left = 85
      Top = 311
      Width = 54
      Height = 13
      Caption = 'Local/Data'
    end
    object Label8: TLabel
      Left = 85
      Top = 139
      Width = 75
      Height = 13
      Caption = 'Recebemos de '
    end
    object Label14: TLabel
      Left = 103
      Top = 357
      Width = 55
      Height = 13
      Caption = 'Benefici'#225'rio'
    end
    object Label6: TLabel
      Left = 629
      Top = 48
      Width = 80
      Height = 29
      Caption = 'Recibo'
      Color = clCream
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 29
      Top = 41
      Width = 500
      Height = 17
      DataField = 'NOME_CLIENTE'
      DataSource = dtmRecibo.dsClRec
    end
    object DBText2: TDBText
      Left = 29
      Top = 58
      Width = 500
      Height = 17
      DataField = 'CPFCGC'
      DataSource = dtmRecibo.dsClRec
    end
    object DBText3: TDBText
      Left = 29
      Top = 75
      Width = 500
      Height = 17
      DataField = 'ENDERECO'
      DataSource = dtmRecibo.dsClRec
    end
    object DBText4: TDBText
      Left = 29
      Top = 92
      Width = 500
      Height = 17
      DataField = 'CEPCIDADEUF'
      DataSource = dtmRecibo.dsClRec
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 239
      Top = 354
      Width = 380
      Height = 21
      KeyField = 'COD_CLIENTE'
      ListField = 'NOME_CLIENTE'
      ListSource = dtmRecibo.dsClRec
      TabOrder = 9
    end
    object Edit2: TEdit
      Left = 164
      Top = 136
      Width = 61
      Height = 21
      TabOrder = 0
      OnExit = Edit2Exit
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 231
      Top = 136
      Width = 250
      Height = 21
      TabOrder = 1
    end
    object Edit5: TEdit
      Left = 85
      Top = 210
      Width = 532
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object Edit6: TEdit
      Left = 85
      Top = 237
      Width = 532
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object Edit7: TEdit
      Left = 85
      Top = 264
      Width = 534
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object Edit8: TEdit
      Left = 85
      Top = 291
      Width = 532
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object Edit9: TEdit
      Left = 85
      Top = 327
      Width = 532
      Height = 21
      TabOrder = 7
      OnEnter = Edit9Enter
    end
    object Edit10: TEdit
      Left = 167
      Top = 354
      Width = 66
      Height = 21
      TabOrder = 8
      OnExit = Edit10Exit
      OnKeyDown = Edit10KeyDown
    end
    object EditMoeda1: TEditMoeda
      Left = 164
      Top = 166
      Width = 125
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      FormatReal = fNumber
      FormatSize = '10.2'
      OnExit = EditMoeda1Exit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 432
    Width = 784
    Height = 48
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn4: TBitBtn
      Left = 312
      Top = 13
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 2
      Visible = False
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
    object BitBtn5: TBitBtn
      Left = 393
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Cancela'
      TabOrder = 3
      Visible = False
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
    object BitBtn6: TBitBtn
      Left = 604
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 4
      OnClick = BitBtn6Click
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
    object BitBtn7: TBitBtn
      Left = 282
      Top = 14
      Width = 105
      Height = 25
      Caption = '&Imprimir Recibo'
      TabOrder = 0
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 393
      Top = 14
      Width = 105
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = BitBtn8Click
    end
    object CheckBox1: TCheckBox
      Left = 17
      Top = 16
      Width = 97
      Height = 17
      Caption = 'F2 - Duas Vias'
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 308
    Top = 248
    Width = 768
    Height = 461
    Caption = 'Panel1'
    TabOrder = 2
    Visible = False
    object QuickRep1: TQuickRep
      Left = 63
      Top = -85
      Width = 794
      Height = 1123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      DataSet = dtmRecibo.qrClRec
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
      ReportTitle = 'Outros Recibos'
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsMaximized
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stQRP
      object TitleBand1: TQRBand
        Left = 38
        Top = 38
        Width = 718
        Height = 467
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
          1235.604166666667000000
          1899.708333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
        object QRShape2: TQRShape
          Left = 2
          Top = 91
          Width = 710
          Height = 350
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            926.041666666666800000
            5.291666666666667000
            240.770833333333300000
            1878.541666666667000000)
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRHRule1: TQRHRule
          Left = 18
          Top = 191
          Width = 694
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            26.458333333333330000
            47.625000000000000000
            505.354166666666700000
            1836.208333333333000000)
          VertAdjust = 0
          Pen.Style = psDot
        end
        object QRPLabel3: TQRPLabel
          Left = 28
          Top = 207
          Width = 106
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            547.687500000000000000
            280.458333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Recebi(emos) de, '
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel5: TQRPLabel
          Left = 28
          Top = 238
          Width = 103
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            629.708333333333200000
            272.520833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'A import'#226'ncia de:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel6: TQRPLabel
          Left = 28
          Top = 277
          Width = 73
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            732.895833333333200000
            193.145833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Referente a:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel7: TQRPLabel
          Left = 28
          Top = 355
          Width = 365
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            74.083333333333320000
            939.270833333333200000
            965.729166666666800000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
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
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel8: TQRPLabel
          Left = 518
          Top = 422
          Width = 54
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1370.541666666667000000
            1116.541666666667000000
            142.875000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Assinatura'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 8
        end
        object QRHRule2: TQRHRule
          Left = 404
          Top = 415
          Width = 296
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            26.458333333333330000
            1068.916666666667000000
            1098.020833333333000000
            783.166666666666800000)
          VertAdjust = 0
        end
        object QRLabel2: TQRLabel
          Left = 137
          Top = 240
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            362.479166666666700000
            635.000000000000000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel2'
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
        object QRLabel3: TQRLabel
          Left = 206
          Top = 380
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            545.041666666666700000
            1005.416666666667000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel3'
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
          Left = 131
          Top = 209
          Width = 52
          Height = 21
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            55.562500000000000000
            346.604166666666700000
            552.979166666666700000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel5'
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
        object QRLabel6: TQRLabel
          Left = 105
          Top = 277
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            277.812500000000000000
            732.895833333333200000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel6'
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
        object QRLabel7: TQRLabel
          Left = 105
          Top = 297
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            785.812500000000000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel7'
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
        object QRLabel8: TQRLabel
          Left = 105
          Top = 317
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            838.729166666666800000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel8'
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
        object QRLabel9: TQRLabel
          Left = 105
          Top = 335
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            886.354166666666800000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel9'
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
        object QRPShape1: TQRPShape
          Left = 562
          Top = 120
          Width = 125
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            171.979166666666700000
            1486.958333333333000000
            317.500000000000000000
            330.729166666666700000)
          Shape = qrpsRectangle
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRLabel10: TQRLabel
          Left = 587
          Top = 141
          Width = 75
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666680000
            1553.104166666667000000
            373.062500000000000000
            198.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'RECIBO'
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
        object qrlCliente1: TQRLabel
          Left = 28
          Top = 105
          Width = 70
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333340000
            277.812500000000000000
            185.208333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel11'
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
        object qrlCPF1: TQRLabel
          Left = 28
          Top = 128
          Width = 70
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333340000
            338.666666666666700000
            185.208333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel11'
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
        object qrlEndereco1: TQRLabel
          Left = 27
          Top = 151
          Width = 70
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            71.437500000000000000
            399.520833333333400000
            185.208333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel11'
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
        object qrlcidade1: TQRLabel
          Left = 27
          Top = 174
          Width = 68
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            71.437500000000000000
            460.375000000000000000
            179.916666666666700000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrlcidade1'
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
      object SummaryBand1: TQRBand
        Left = 38
        Top = 505
        Width = 718
        Height = 448
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
          1185.333333333333000000
          1899.708333333333000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbSummary
        object QRShape1: TQRShape
          Left = 2
          Top = 91
          Width = 710
          Height = 350
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            926.041666666666800000
            5.291666666666667000
            240.770833333333300000
            1878.541666666667000000)
          Shape = qrsRectangle
          VertAdjust = 0
        end
        object QRHRule3: TQRHRule
          Left = 18
          Top = 191
          Width = 694
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            26.458333333333330000
            47.625000000000000000
            505.354166666666700000
            1836.208333333333000000)
          VertAdjust = 0
          Pen.Style = psDot
        end
        object QRPLabel1: TQRPLabel
          Left = 28
          Top = 207
          Width = 106
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            547.687500000000000000
            280.458333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Recebi(emos) de, '
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel2: TQRPLabel
          Left = 28
          Top = 238
          Width = 103
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            629.708333333333200000
            272.520833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'A import'#226'ncia de:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel4: TQRPLabel
          Left = 28
          Top = 277
          Width = 73
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            732.895833333333200000
            193.145833333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Referente a:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel9: TQRPLabel
          Left = 28
          Top = 355
          Width = 365
          Height = 19
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            50.270833333333330000
            74.083333333333320000
            939.270833333333200000
            965.729166666666800000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
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
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 10
        end
        object QRPLabel10: TQRPLabel
          Left = 518
          Top = 422
          Width = 54
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            1370.541666666667000000
            1116.541666666667000000
            142.875000000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'Assinatura'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
          Transparent = False
          WordWrap = True
          ExportAs = exptText
          Degree = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
          FontSize = 8
        end
        object QRHRule4: TQRHRule
          Left = 404
          Top = 415
          Width = 296
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            26.458333333333330000
            1068.916666666667000000
            1098.020833333333000000
            783.166666666666800000)
          VertAdjust = 0
        end
        object qrlCPF2: TQRLabel
          Left = 28
          Top = 128
          Width = 69
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            338.666666666666700000
            182.562500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'CNPJ/CPF:'
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
        object QRLabel13: TQRLabel
          Left = 134
          Top = 241
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            354.541666666666700000
            637.645833333333200000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel2'
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
        object QRLabel14: TQRLabel
          Left = 206
          Top = 380
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            545.041666666666700000
            1005.416666666667000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel3'
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
        object qrlCidade2: TQRLabel
          Left = 28
          Top = 168
          Width = 63
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            444.500000000000000000
            166.687500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel4'
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
          Left = 135
          Top = 209
          Width = 52
          Height = 21
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            55.562500000000000000
            357.187500000000000000
            552.979166666666700000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel5'
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
        object QRLabel17: TQRLabel
          Left = 105
          Top = 277
          Width = 52
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            277.812500000000000000
            732.895833333333200000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel6'
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
        object QRLabel18: TQRLabel
          Left = 105
          Top = 297
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            785.812500000000000000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel7'
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
        object QRLabel19: TQRLabel
          Left = 105
          Top = 317
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            838.729166666666800000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel8'
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
        object QRLabel20: TQRLabel
          Left = 105
          Top = 335
          Width = 52
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            39.687500000000000000
            277.812500000000000000
            886.354166666666800000
            137.583333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel9'
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
        object QRPShape2: TQRPShape
          Left = 562
          Top = 120
          Width = 125
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            171.979166666666700000
            1486.958333333333000000
            317.500000000000000000
            330.729166666666700000)
          Shape = qrpsRectangle
          VertAdjust = 0
          FixBottomPosition = False
          StretchHeightWithBand = False
        end
        object QRLabel21: TQRLabel
          Left = 587
          Top = 141
          Width = 75
          Height = 23
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            60.854166666666680000
            1553.104166666667000000
            373.062500000000000000
            198.437500000000000000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'RECIBO'
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
        object qrlEndereco2: TQRLabel
          Left = 28
          Top = 148
          Width = 70
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            391.583333333333300000
            185.208333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'QRLabel11'
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
        object qrlCliente2: TQRLabel
          Left = 28
          Top = 105
          Width = 70
          Height = 17
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            44.979166666666670000
            74.083333333333320000
            277.812500000000000000
            185.208333333333300000)
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = True
          AutoStretch = False
          Caption = 'qrCLiente2'
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
        object QRShape3: TQRShape
          Left = 6
          Top = 56
          Width = 737
          Height = 424
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Size.Values = (
            1121.833333333333000000
            15.875000000000000000
            148.166666666666700000
            1949.979166666667000000)
          Pen.Style = psClear
          Shape = qrsRectangle
          VertAdjust = 0
        end
      end
    end
  end
end
