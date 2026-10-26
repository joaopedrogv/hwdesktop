inherited frmDetalhamento: TfrmDetalhamento
  Left = 252
  Top = 146
  BorderIcons = [biSystemMenu]
  Caption = 'Detalhamento de Venda'
  ClientHeight = 358
  ClientWidth = 891
  KeyPreview = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 899
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 311
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 233
      Width = 887
      Height = 74
      Align = alClient
      DataSource = dtmFP.dsDestalhes
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'FORMADEPAGAMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_MOV'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORDOC'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENC'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TPDOCS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NREQUISICAO'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_REC_DEP'
          Title.Caption = 'N Venda'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDOC'
          Title.Caption = 'N'#176' Documento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_REC_PARC'
          Title.Caption = 'N Documento'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CONTROLE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HISTORICO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERCEIROS'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPDOC'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CTRL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOSSO_NUMERO_BANCO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_PROCESSAMENTO'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_DOCNSU_ADM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_AUT_CART'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_TERMINAL_ADM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_TERMINAL_ADM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_ADM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_ADM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_BANDEIRA_ADM'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_BANDEIRA'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NPARCELA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE_PARC'
          Width = 64
          Visible = True
        end>
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 887
      Height = 233
      Align = alTop
      TabOrder = 1
      Visible = False
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 883
        Height = 229
        ActivePage = tsboletas
        Align = alClient
        TabOrder = 0
        object tsboletas: TTabSheet
          Caption = 'tsboletas'
          object ScrollBox2: TScrollBox
            Left = 0
            Top = 0
            Width = 875
            Height = 201
            Align = alClient
            TabOrder = 0
            object QuickRep1: TQuickRep
              Left = 5
              Top = 0
              Width = 794
              Height = 1123
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              DataSet = dtmFP.cdsFormPag2
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
                0.000000000000000000
                2970.000000000000000000
                100.000000000000000000
                2100.000000000000000000
                0.000000000000000000
                0.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = Auto
              PrinterSettings.Duplex = False
              PrinterSettings.FirstPage = 1
              PrinterSettings.LastPage = 1
              PrinterSettings.UseStandardprinter = False
              PrinterSettings.UseCustomBinCode = True
              PrinterSettings.CustomBinCode = 15
              PrinterSettings.ExtendedDuplex = 1
              PrinterSettings.UseCustomPaperCode = False
              PrinterSettings.CustomPaperCode = 9
              PrinterSettings.PrintMetaFile = False
              PrinterSettings.PrintQuality = 0
              PrinterSettings.Collate = 0
              PrinterSettings.ColorOption = 2
              PrintIfEmpty = True
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PreviewWidth = 1000
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object TitleBand1: TQRBand
                Left = 0
                Top = 38
                Width = 794
                Height = 266
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
                  703.791666666666700000
                  2100.791666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRShape1: TQRShape
                  Left = 23
                  Top = 1
                  Width = 747
                  Height = 264
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    698.500000000000000000
                    60.854166666666680000
                    2.645833333333333000
                    1976.437500000000000000)
                  Brush.Color = clMenu
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape2: TQRShape
                  Left = 26
                  Top = 5
                  Width = 159
                  Height = 257
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    679.979166666666800000
                    68.791666666666680000
                    13.229166666666670000
                    420.687500000000000000)
                  Brush.Color = clBtnHighlight
                  Shape = qrsRectangle
                  VertAdjust = 1
                end
                object QRShape3: TQRShape
                  Left = 188
                  Top = 5
                  Width = 577
                  Height = 257
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    679.979166666666800000
                    497.416666666666700000
                    13.229166666666670000
                    1526.645833333333000000)
                  Brush.Color = clBtnHighlight
                  Shape = qrsRectangle
                  VertAdjust = 1
                end
                object QRLabel1: TQRLabel
                  Left = 195
                  Top = 26
                  Width = 26
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666680000
                    515.937500000000000000
                    68.791666666666670000
                    68.791666666666670000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N.'#186
                  Color = clBtnHighlight
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
                object QRShape4: TQRShape
                  Left = 227
                  Top = 26
                  Width = 122
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    600.604166666666800000
                    68.791666666666680000
                    322.791666666666700000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel2: TQRLabel
                  Left = 347
                  Top = 8
                  Width = 66
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    918.104166666666700000
                    21.166666666666670000
                    174.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Vencimento'
                  Color = clBtnHighlight
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
                object QRLabel8: TQRLabel
                  Left = 589
                  Top = 26
                  Width = 25
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666680000
                    1558.395833333333000000
                    68.791666666666670000
                    66.145833333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'R$'
                  Color = clBtnHighlight
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
                object QRShape5: TQRShape
                  Left = 621
                  Top = 26
                  Width = 141
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1643.062500000000000000
                    68.791666666666680000
                    373.062500000000000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel9: TQRLabel
                  Left = 195
                  Top = 52
                  Width = 34
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    137.583333333333300000
                    89.958333333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Ao (s)'
                  Color = clBtnHighlight
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
                object QRLabel10: TQRLabel
                  Left = 235
                  Top = 52
                  Width = 475
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    621.770833333333400000
                    137.583333333333300000
                    1256.770833333333000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '................................................................' +
                    '..............................'
                  Color = clBtnHighlight
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
                object QRLabel11: TQRLabel
                  Left = 195
                  Top = 70
                  Width = 166
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    185.208333333333300000
                    439.208333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.......................................................'
                  Color = clBtnHighlight
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
                object QRLabel12: TQRLabel
                  Left = 366
                  Top = 70
                  Width = 34
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    968.375000000000000000
                    185.208333333333300000
                    89.958333333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'pagar'
                  Color = clBtnHighlight
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
                object QRLabel13: TQRLabel
                  Left = 410
                  Top = 71
                  Width = 97
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1084.791666666667000000
                    187.854166666666700000
                    256.645833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  BiDiMode = bdRightToLeft
                  ParentBiDiMode = False
                  Caption = '................................'
                  Color = clBtnHighlight
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
                object QRLabel14: TQRLabel
                  Left = 512
                  Top = 70
                  Width = 118
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1354.666666666667000000
                    185.208333333333300000
                    312.208333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'por esta '#250'nica via de'
                  Color = clBtnHighlight
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
                object QRLabel15: TQRLabel
                  Left = 639
                  Top = 70
                  Width = 118
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1690.687500000000000000
                    185.208333333333300000
                    312.208333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'NOTA PROMISS'#211'RIA'
                  Color = clBtnHighlight
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
                object QRLabel16: TQRLabel
                  Left = 194
                  Top = 93
                  Width = 8
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    513.291666666666700000
                    246.062500000000000000
                    21.166666666666670000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'a'
                  Color = clBtnHighlight
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
                object QRLabel18: TQRLabel
                  Left = 542
                  Top = 93
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1434.041666666667000000
                    246.062500000000000000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                  Left = 206
                  Top = 95
                  Width = 301
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    545.041666666666700000
                    251.354166666666700000
                    796.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '....................................'
                  Color = clBtnHighlight
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
                object QRLabel19: TQRLabel
                  Left = 602
                  Top = 95
                  Width = 145
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1592.791666666667000000
                    251.354166666666700000
                    383.645833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '................................................'
                  Color = clBtnHighlight
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
                object QRLabel20: TQRLabel
                  Left = 195
                  Top = 112
                  Width = 164
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    296.333333333333400000
                    433.916666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ou '#224' sua ordem, a quantia de'
                  Color = clBtnHighlight
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
                object QRShape6: TQRShape
                  Left = 365
                  Top = 110
                  Width = 398
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    965.729166666666800000
                    291.041666666666700000
                    1053.041666666667000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape7: TQRShape
                  Left = 195
                  Top = 131
                  Width = 568
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    515.937500000000000000
                    346.604166666666700000
                    1502.833333333333000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel21: TQRLabel
                  Left = 195
                  Top = 153
                  Width = 246
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    404.812500000000000000
                    650.875000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'em moeda corrente neste pa'#237's, pag'#225'vel em'
                  Color = clBtnHighlight
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
                object QRLabel22: TQRLabel
                  Left = 447
                  Top = 154
                  Width = 317
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1182.687500000000000000
                    407.458333333333400000
                    838.729166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '...............'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel23: TQRLabel
                  Left = 195
                  Top = 176
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    465.666666666666700000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'EMITENTE'
                  Color = clBtnHighlight
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
                object QRLabel24: TQRLabel
                  Left = 256
                  Top = 181
                  Width = 283
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    677.333333333333400000
                    478.895833333333400000
                    748.770833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '..............................'
                  Color = clBtnHighlight
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
                object QRLabel25: TQRLabel
                  Left = 550
                  Top = 176
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1455.208333333333000000
                    465.666666666666700000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel26: TQRLabel
                  Left = 606
                  Top = 181
                  Width = 139
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1603.375000000000000000
                    478.895833333333400000
                    367.770833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..............................................'
                  Color = clBtnHighlight
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
                  Left = 195
                  Top = 201
                  Width = 56
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    515.937500000000000000
                    531.812500000000000000
                    148.166666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel32: TQRLabel
                  Left = 256
                  Top = 202
                  Width = 507
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    677.333333333333200000
                    534.458333333333300000
                    1341.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '................................................................' +
                    '........................'
                  Color = clBtnHighlight
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
                object QRLabel33: TQRLabel
                  Left = 69
                  Top = 16
                  Width = 80
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    182.562500000000000000
                    42.333333333333340000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'AVALISTAS'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 11
                end
                object QRLabel34: TQRLabel
                  Left = 29
                  Top = 50
                  Width = 149
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666670000
                    132.291666666666700000
                    394.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.....................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel35: TQRLabel
                  Left = 29
                  Top = 100
                  Width = 149
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666670000
                    264.583333333333400000
                    394.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.....................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel36: TQRLabel
                  Left = 29
                  Top = 156
                  Width = 149
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666670000
                    412.750000000000000000
                    394.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.....................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel37: TQRLabel
                  Left = 29
                  Top = 212
                  Width = 149
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    560.916666666666700000
                    394.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.....................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel38: TQRLabel
                  Left = 29
                  Top = 68
                  Width = 65
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666670000
                    179.916666666666700000
                    171.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel39: TQRLabel
                  Left = 29
                  Top = 121
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666670000
                    320.145833333333400000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel40: TQRLabel
                  Left = 29
                  Top = 177
                  Width = 65
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    468.312500000000000000
                    171.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel41: TQRLabel
                  Left = 29
                  Top = 231
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    611.187500000000000000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel42: TQRLabel
                  Left = 368
                  Top = 112
                  Width = 393
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    973.666666666666900000
                    296.333333333333400000
                    1039.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '********************************************************'
                  Color = clScrollBar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel43: TQRLabel
                  Left = 199
                  Top = 133
                  Width = 561
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    526.520833333333400000
                    351.895833333333400000
                    1484.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '****************'
                  Color = clScrollBar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel44: TQRLabel
                  Left = 234
                  Top = 28
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    619.125000000000000000
                    74.083333333333340000
                    280.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '***************'
                  Color = clMenu
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel45: TQRLabel
                  Left = 642
                  Top = 28
                  Width = 113
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1698.625000000000000000
                    74.083333333333340000
                    298.979166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '****************'
                  Color = clMenu
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel46: TQRLabel
                  Left = 210
                  Top = 87
                  Width = 309
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    555.625000000000000000
                    230.187500000000000000
                    817.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '********************************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel47: TQRLabel
                  Left = 609
                  Top = 87
                  Width = 113
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1611.312500000000000000
                    230.187500000000000000
                    298.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '****************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel51: TQRLabel
                  Left = 261
                  Top = 172
                  Width = 267
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    690.562500000000000000
                    455.083333333333300000
                    706.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '**************************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel52: TQRLabel
                  Left = 611
                  Top = 172
                  Width = 141
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1616.604166666667000000
                    455.083333333333300000
                    373.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '********************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel53: TQRLabel
                  Left = 261
                  Top = 194
                  Width = 498
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    690.562500000000000000
                    513.291666666666700000
                    1317.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '*******'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel3: TQRLabel
                  Left = 433
                  Top = 8
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1145.645833333333000000
                    21.166666666666670000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Vencimento'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel27: TQRLabel
                  Left = 256
                  Top = 244
                  Width = 202
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    677.333333333333400000
                    645.583333333333400000
                    534.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '...'
                  Color = clBtnHighlight
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
                object QRLabel29: TQRLabel
                  Left = 534
                  Top = 244
                  Width = 202
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1412.875000000000000000
                    645.583333333333400000
                    534.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '...'
                  Color = clBtnHighlight
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
                object QRLabel28: TQRLabel
                  Left = 256
                  Top = 226
                  Width = 508
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    677.333333333333200000
                    597.958333333333200000
                    1344.083333333333000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '................................................................' +
                    '........................'
                  Color = clBtnHighlight
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
                object QRLabel31: TQRLabel
                  Left = 261
                  Top = 218
                  Width = 498
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    690.562500000000000000
                    576.791666666666800000
                    1317.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '*******'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
              end
            end
          end
        end
        object tsCarne: TTabSheet
          Caption = 'tsCarne'
          ImageIndex = 1
          object ScrollBox3: TScrollBox
            Left = 0
            Top = 0
            Width = 875
            Height = 201
            Align = alClient
            TabOrder = 0
            object QuickRep2: TQuickRep
              Left = 0
              Top = 0
              Width = 960
              Height = 1344
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              DataSet = dtmFP.cdsFormPag2
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
              OnPreview = QuickRep2Preview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = qr10X14
              Page.Values = (
                100.000000000000000000
                3556.000000000000000000
                50.000000000000000000
                2540.000000000000000000
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
                Top = 19
                Width = 884
                Height = 266
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
                  703.791666666666700000
                  2338.916666666667000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRShape8: TQRShape
                  Left = 8
                  Top = 8
                  Width = 153
                  Height = 253
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    669.395833333333000000
                    21.166666666666700000
                    21.166666666666700000
                    404.812500000000000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape9: TQRShape
                  Left = 16
                  Top = 16
                  Width = 137
                  Height = 21
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    55.562500000000000000
                    42.333333333333300000
                    42.333333333333300000
                    362.479166666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape10: TQRShape
                  Left = 16
                  Top = 37
                  Width = 137
                  Height = 28
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    74.083333333333300000
                    42.333333333333300000
                    97.895833333333300000
                    362.479166666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel4: TQRLabel
                  Left = 48
                  Top = 18
                  Width = 72
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    127.000000000000000000
                    47.625000000000000000
                    190.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'C'#243'd. Cliente'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel5: TQRLabel
                  Left = 36
                  Top = 120
                  Width = 101
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    95.250000000000000000
                    317.500000000000000000
                    267.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Vencimento'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel6: TQRLabel
                  Left = 36
                  Top = 164
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    95.250000000000000000
                    433.916666666666700000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Pagamento'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel7: TQRLabel
                  Left = 48
                  Top = 183
                  Width = 72
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    127.000000000000000000
                    484.187500000000000000
                    190.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '___/___/___'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape11: TQRShape
                  Left = 12
                  Top = 205
                  Width = 73
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666660000
                    31.750000000000000000
                    542.395833333333400000
                    193.145833333333300000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel49: TQRLabel
                  Left = 19
                  Top = 207
                  Width = 58
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    50.270833333333330000
                    547.687500000000000000
                    153.458333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N.'#186' Prest.'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape13: TQRShape
                  Left = 12
                  Top = 225
                  Width = 73
                  Height = 29
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    76.729166666666680000
                    31.750000000000000000
                    595.312500000000000000
                    193.145833333333300000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape14: TQRShape
                  Left = 84
                  Top = 225
                  Width = 73
                  Height = 29
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    76.729166666666680000
                    222.250000000000000000
                    595.312500000000000000
                    193.145833333333300000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape15: TQRShape
                  Left = 16
                  Top = 68
                  Width = 137
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666700000
                    42.333333333333300000
                    179.916666666667000000
                    362.479166666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel50: TQRLabel
                  Left = 54
                  Top = 70
                  Width = 51
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    142.875000000000000000
                    185.208333333333300000
                    134.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Valor R$'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape16: TQRShape
                  Left = 16
                  Top = 91
                  Width = 137
                  Height = 27
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    71.437500000000000000
                    42.333333333333300000
                    240.770833333333000000
                    362.479166666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape17: TQRShape
                  Left = 168
                  Top = 8
                  Width = 9
                  Height = 254
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    672.041666666667000000
                    444.500000000000000000
                    21.166666666666700000
                    23.812500000000000000)
                  Pen.Style = psDashDotDot
                  Shape = qrsVertLine
                  VertAdjust = 0
                end
                object QRShape18: TQRShape
                  Left = 184
                  Top = 8
                  Width = 369
                  Height = 254
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    672.041666666667000000
                    486.833333333333000000
                    21.166666666666700000
                    976.312500000000000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel54: TQRLabel
                  Left = 199
                  Top = 36
                  Width = 76
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    526.520833333333400000
                    95.250000000000000000
                    201.083333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'C'#243'd. Cliente:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel55: TQRLabel
                  Left = 199
                  Top = 65
                  Width = 75
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    526.520833333333400000
                    171.979166666666700000
                    198.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome.........:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel56: TQRLabel
                  Left = 199
                  Top = 94
                  Width = 75
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    526.520833333333400000
                    248.708333333333300000
                    198.437500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Valor R$.....:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel57: TQRLabel
                  Left = 268
                  Top = 155
                  Width = 101
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    709.083333333333400000
                    410.104166666666700000
                    267.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Vencimento'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel58: TQRLabel
                  Left = 442
                  Top = 154
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1169.458333333333000000
                    407.458333333333400000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data Pagamento'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel59: TQRLabel
                  Left = 445
                  Top = 172
                  Width = 93
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1177.395833333333000000
                    455.083333333333300000
                    246.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '____/____/____'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel60: TQRLabel
                  Left = 101
                  Top = 232
                  Width = 35
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    267.229166666666700000
                    613.833333333333400000
                    92.604166666666680000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '0'
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
                object QRLabel61: TQRLabel
                  Left = 29
                  Top = 232
                  Width = 35
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    613.833333333333400000
                    92.604166666666680000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '0'
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
                object QRLabel62: TQRLabel
                  Left = 19
                  Top = 44
                  Width = 129
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    50.270833333333330000
                    116.416666666666700000
                    341.312500000000000000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel62'
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
                object QRLabel63: TQRLabel
                  Left = 19
                  Top = 96
                  Width = 129
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    50.270833333333330000
                    254.000000000000000000
                    341.312500000000000000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel63'
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
                object QRLabel64: TQRLabel
                  Left = 19
                  Top = 142
                  Width = 134
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    50.270833333333330000
                    375.708333333333300000
                    354.541666666666700000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel64'
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
                object QRLabel65: TQRLabel
                  Left = 281
                  Top = 36
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    743.479166666666800000
                    95.250000000000000000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel65'
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
                object QRLabel66: TQRLabel
                  Left = 280
                  Top = 65
                  Width = 260
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    740.833333333333200000
                    171.979166666666700000
                    687.916666666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel66'
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
                object QRLabel67: TQRLabel
                  Left = 280
                  Top = 94
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    740.833333333333400000
                    248.708333333333300000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel67'
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
                object QRLabel68: TQRLabel
                  Left = 268
                  Top = 174
                  Width = 101
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    709.083333333333200000
                    460.375000000000000000
                    267.229166666666700000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel68'
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
                object QRLabel69: TQRLabel
                  Left = 215
                  Top = 222
                  Width = 325
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    568.854166666666700000
                    587.375000000000000000
                    859.895833333333200000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel69_MENSAGEM_EMP'
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
                object QRShape12: TQRShape
                  Left = 84
                  Top = 205
                  Width = 73
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666660000
                    222.250000000000000000
                    542.395833333333400000
                    193.145833333333300000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel48: TQRLabel
                  Left = 87
                  Top = 207
                  Width = 68
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    230.187500000000000000
                    547.687500000000000000
                    179.916666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Qtde Prest.'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
            end
          end
        end
        object tsRecibo1: TTabSheet
          Caption = 'tsRecibo1'
          ImageIndex = 2
          object QuickRep3: TQuickRep
            Left = 0
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmFP.cdsFormPag2
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
            ReportTitle = 'Recibo'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object TitleBand3: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 519
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
                1373.187500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRShape19: TQRShape
                Left = 3
                Top = 160
                Width = 710
                Height = 350
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  926.041666666666800000
                  7.937500000000000000
                  423.333333333333300000
                  1878.541666666667000000)
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRPShape1: TQRPShape
                Left = 546
                Top = 172
                Width = 154
                Height = 76
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  201.083333333333300000
                  1444.625000000000000000
                  455.083333333333300000
                  407.458333333333300000)
                Shape = qrpsRectangle
                VertAdjust = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
              end
              object QRHRule1: TQRHRule
                Left = 12
                Top = 248
                Width = 694
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  31.750000000000000000
                  656.166666666666800000
                  1836.208333333333000000)
                VertAdjust = 0
                Pen.Style = psDot
              end
              object qrlRecibo: TQRPLabel
                Left = 569
                Top = 193
                Width = 87
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1505.479166666667000000
                  510.645833333333300000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recibo N'#186
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrlRecebi: TQRPLabel
                Left = 12
                Top = 263
                Width = 121
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  695.854166666666800000
                  320.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recebi(emos) de, '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrImportancia: TQRPLabel
                Left = 12
                Top = 286
                Width = 118
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  756.708333333333400000
                  312.208333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'A import'#226'ncia de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlReferente: TQRPLabel
                Left = 12
                Top = 338
                Width = 84
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  894.291666666666800000
                  222.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Referente a:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlParaClareza: TQRPLabel
                Left = 12
                Top = 427
                Width = 374
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  31.750000000000000000
                  1129.770833333333000000
                  989.541666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 11
              end
              object QRPLabel8: TQRPLabel
                Left = 513
                Top = 488
                Width = 61
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1357.312500000000000000
                  1291.166666666667000000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Assinatura'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
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
                Left = 399
                Top = 481
                Width = 296
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  1055.687500000000000000
                  1272.645833333333000000
                  783.166666666666800000)
                VertAdjust = 0
              end
              object qrl_valor: TQRLabel
                Left = 41
                Top = 309
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  817.562500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'VALOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cidade_datarec: TQRLabel
                Left = 41
                Top = 447
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1182.687500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CIDADE_DATA_REC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_nome_cliente: TQRLabel
                Left = 12
                Top = 170
                Width = 517
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  449.791666666666700000
                  1367.895833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cpfcgc: TQRLabel
                Left = 12
                Top = 190
                Width = 517
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  502.708333333333400000
                  1367.895833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CPFCGC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_endereco: TQRLabel
                Left = 12
                Top = 209
                Width = 517
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  552.979166666666800000
                  1367.895833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ENDERECO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cep_cidade_uf: TQRLabel
                Left = 12
                Top = 228
                Width = 517
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  603.250000000000000000
                  1367.895833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CEPCIDADEUF'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_nome_dev: TQRLabel
                Left = 134
                Top = 263
                Width = 571
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  354.541666666666700000
                  695.854166666666800000
                  1510.770833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_DEV'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia1: TQRLabel
                Left = 41
                Top = 354
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  936.625000000000100000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia2: TQRLabel
                Left = 41
                Top = 372
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  984.249999999999900000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia3: TQRLabel
                Left = 41
                Top = 391
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1034.520833333333000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia4: TQRLabel
                Left = 41
                Top = 410
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1084.791666666667000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_nrecibo: TQRPLabel
                Left = 562
                Top = 219
                Width = 84
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  579.437500000000000000
                  222.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NRECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrl_tiporec: TQRLabel
                Left = 392
                Top = 193
                Width = 145
                Height = 41
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  108.479166666666700000
                  1037.166666666667000000
                  510.645833333333300000
                  383.645833333333400000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'TIPO RECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object SummaryBand1: TQRBand
              Left = 38
              Top = 557
              Width = 718
              Height = 428
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
                1132.416666666667000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape20: TQRShape
                Left = 3
                Top = 64
                Width = 710
                Height = 350
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  926.041666666666800000
                  7.937500000000000000
                  169.333333333333300000
                  1878.541666666667000000)
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRPShape2: TQRPShape
                Left = 546
                Top = 76
                Width = 154
                Height = 76
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  201.083333333333300000
                  1444.625000000000000000
                  201.083333333333300000
                  407.458333333333300000)
                Shape = qrpsRectangle
                VertAdjust = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
              end
              object QRHRule3: TQRHRule
                Left = 12
                Top = 152
                Width = 694
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  31.750000000000000000
                  402.166666666666700000
                  1836.208333333333000000)
                VertAdjust = 0
                Pen.Style = psDot
              end
              object qrlRecebi2: TQRPLabel
                Left = 12
                Top = 167
                Width = 121
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  441.854166666666700000
                  320.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recebi(emos) de, '
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrImportancia2: TQRPLabel
                Left = 12
                Top = 190
                Width = 118
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  502.708333333333400000
                  312.208333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'A import'#226'ncia de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlReferente2: TQRPLabel
                Left = 12
                Top = 242
                Width = 84
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  640.291666666666800000
                  222.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Referente a:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlParaClareza2: TQRPLabel
                Left = 12
                Top = 331
                Width = 374
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  31.750000000000000000
                  875.770833333333400000
                  989.541666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 11
              end
              object QRHRule4: TQRHRule
                Left = 402
                Top = 383
                Width = 296
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  1063.625000000000000000
                  1013.354166666667000000
                  783.166666666666800000)
                VertAdjust = 0
              end
              object qrl_cidade_datarec2: TQRLabel
                Left = 41
                Top = 351
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  928.687500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CIDADE_DATA_REC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_valor2: TQRLabel
                Left = 41
                Top = 214
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  566.208333333333400000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'VALOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_nome_cliente2: TQRLabel
                Left = 12
                Top = 76
                Width = 528
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  201.083333333333300000
                  1397.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_nome_dev2: TQRLabel
                Left = 134
                Top = 167
                Width = 571
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  354.541666666666700000
                  441.854166666666700000
                  1510.770833333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_DEV'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia1_2: TQRLabel
                Left = 41
                Top = 261
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  690.562500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia2_2: TQRLabel
                Left = 41
                Top = 279
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  738.187500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia3_2: TQRLabel
                Left = 41
                Top = 297
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  785.812500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia4_2: TQRLabel
                Left = 41
                Top = 315
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  833.437500000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrlRecibo2: TQRPLabel
                Left = 569
                Top = 96
                Width = 87
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1505.479166666667000000
                  254.000000000000000000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recibo N'#186
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrl_nrecibo2: TQRPLabel
                Left = 562
                Top = 124
                Width = 84
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  328.083333333333400000
                  222.250000000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NRECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrl_cpfcgc2: TQRLabel
                Left = 12
                Top = 94
                Width = 528
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  248.708333333333300000
                  1397.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CPFCGC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_endereco2: TQRLabel
                Left = 12
                Top = 112
                Width = 528
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  296.333333333333400000
                  1397.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ENDERECO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cep_cidade_uf2: TQRLabel
                Left = 12
                Top = 132
                Width = 528
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  349.250000000000000000
                  1397.000000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CEPCIDADEUF'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_tiporec2: TQRLabel
                Left = 392
                Top = 98
                Width = 145
                Height = 41
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  108.479166666666700000
                  1037.166666666667000000
                  259.291666666666700000
                  383.645833333333400000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'TIPO RECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRShape21: TQRShape
                Left = 3
                Top = 55
                Width = 721
                Height = 409
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  1082.145833333333000000
                  7.937500000000000000
                  145.520833333333300000
                  1907.645833333333000000)
                Pen.Style = psClear
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
        object tsRecibo2: TTabSheet
          Caption = 'tsRecibo2'
          ImageIndex = 3
          object QuickRep4: TQuickRep
            Left = 0
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmFP.cdsFormPag2
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
            OnPreview = QuickRep2Preview
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
            ReportTitle = 'Recibo'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object TitleBand4: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 519
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
                1373.187500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRSchape3: TQRShape
                Left = 3
                Top = 115
                Width = 710
                Height = 398
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  1053.041666666667000000
                  7.937500000000000000
                  304.270833333333400000
                  1878.541666666667000000)
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRPShape3: TQRPShape
                Left = 551
                Top = 123
                Width = 154
                Height = 71
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  187.854166666666700000
                  1457.854166666667000000
                  325.437500000000000000
                  407.458333333333400000)
                Shape = qrpsRectangle
                VertAdjust = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
              end
              object QRHRule5: TQRHRule
                Left = 12
                Top = 195
                Width = 694
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  31.750000000000000000
                  515.937500000000000000
                  1836.208333333333000000)
                VertAdjust = 0
                Pen.Style = psDot
              end
              object qrlRecibo3: TQRPLabel
                Left = 562
                Top = 137
                Width = 87
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  362.479166666666700000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recibo N'#186
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrlRecebemos3: TQRPLabel
                Left = 12
                Top = 225
                Width = 102
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  595.312500000000000000
                  269.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recebemos de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlQuantia3: TQRPLabel
                Left = 12
                Top = 245
                Width = 112
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  648.229166666666800000
                  296.333333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'A quantia de: R$'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlReferente3: TQRPLabel
                Left = 12
                Top = 318
                Width = 84
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  841.375000000000000000
                  222.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Referente a:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlParaServVerdade3: TQRPLabel
                Left = 12
                Top = 442
                Width = 265
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  31.750000000000000000
                  1169.458333333333000000
                  701.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Por ser verdade, afirmo o presente Recibo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 11
              end
              object QRPLabel18: TQRPLabel
                Left = 336
                Top = 498
                Width = 61
                Height = 14
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  37.041666666666670000
                  889.000000000000000000
                  1317.625000000000000000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Assinatura'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
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
              object QRHRule6: TQRHRule
                Left = 222
                Top = 491
                Width = 296
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  587.375000000000000000
                  1299.104166666667000000
                  783.166666666666800000)
                VertAdjust = 0
              end
              object qrl_valor3: TQRLabel
                Left = 131
                Top = 245
                Width = 574
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  346.604166666666700000
                  648.229166666666800000
                  1518.708333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'VALOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cidade_datarec3: TQRLabel
                Left = 41
                Top = 461
                Width = 127
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1219.729166666667000000
                  336.020833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'CIDADE_DATA_REC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrlResponsavel3: TQRPLabel
                Left = 12
                Top = 204
                Width = 88
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  539.750000000000000000
                  232.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Respons'#225'vel:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlAtraves3: TQRPLabel
                Left = 12
                Top = 266
                Width = 79
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  703.791666666666800000
                  209.020833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Atrav'#233's de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlObservacao3: TQRPLabel
                Left = 12
                Top = 391
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  1034.520833333333000000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Observa'#231#227'o:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nome_cliente3: TQRPLabel
                Left = 12
                Top = 124
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  328.083333333333400000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 10
              end
              object qrl_cpfcgc3: TQRPLabel
                Left = 12
                Top = 142
                Width = 218
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  375.708333333333400000
                  576.791666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CPFCGC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_fone_cliente3: TQRPLabel
                Left = 236
                Top = 142
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  624.416666666666800000
                  375.708333333333400000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'FONE_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_endereco3: TQRPLabel
                Left = 12
                Top = 161
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  425.979166666666700000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ENDERECO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_cep_cidade_uf3: TQRPLabel
                Left = 12
                Top = 180
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  476.250000000000000000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CEPCIDADEUF'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nrecibo3: TQRPLabel
                Left = 562
                Top = 163
                Width = 136
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  431.270833333333400000
                  359.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NUM_REC_DEP'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrl_nome_vendedor3: TQRPLabel
                Left = 105
                Top = 204
                Width = 600
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  277.812500000000000000
                  539.750000000000000000
                  1587.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_VENDEDOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nome_dev3: TQRPLabel
                Left = 118
                Top = 225
                Width = 587
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  312.208333333333400000
                  595.312500000000000000
                  1553.104166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_DEV'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_tiporec3: TQRLabel
                Left = 400
                Top = 150
                Width = 145
                Height = 41
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  108.479166666666700000
                  1058.333333333333000000
                  396.875000000000000000
                  383.645833333333400000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'TIPO RECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object qrl_atraves1_3: TQRLabel
                Left = 99
                Top = 266
                Width = 608
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  261.937500000000000000
                  703.791666666666800000
                  1608.666666666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_atraves2_3: TQRLabel
                Left = 41
                Top = 284
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  751.416666666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_atraves3_3: TQRLabel
                Left = 41
                Top = 302
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  799.041666666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao1_3: TQRDBText
                Left = 103
                Top = 391
                Width = 602
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  272.520833333333400000
                  1034.520833333333000000
                  1592.791666666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmRecibo.cdsRecibo
                DataField = 'OBSERVACAO1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao2_3: TQRDBText
                Left = 41
                Top = 409
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1082.145833333333000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmRecibo.cdsRecibo
                DataField = 'OBSERVACAO2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao3_3: TQRDBText
                Left = 41
                Top = 427
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1129.770833333333000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmRecibo.cdsRecibo
                DataField = 'OBSERVACAO3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia1_3: TQRLabel
                Left = 101
                Top = 318
                Width = 604
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  841.375000000000000000
                  1598.083333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia2_3: TQRLabel
                Left = 41
                Top = 336
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  889.000000000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia3_3: TQRLabel
                Left = 41
                Top = 355
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  939.270833333333400000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia4_3: TQRLabel
                Left = 41
                Top = 374
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  989.541666666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object SummaryBand2: TQRBand
              Left = 38
              Top = 557
              Width = 718
              Height = 518
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
                1370.541666666667000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbSummary
              object QRShape22: TQRShape
                Left = 643
                Top = 33
                Width = 721
                Height = 409
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  1082.145833333333000000
                  1701.270833333333000000
                  87.312500000000000000
                  1907.645833333333000000)
                Pen.Style = psClear
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape23: TQRShape
                Left = 3
                Top = 61
                Width = 710
                Height = 398
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  1053.041666666667000000
                  7.937500000000000000
                  161.395833333333300000
                  1878.541666666667000000)
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRPShape4: TQRPShape
                Left = 551
                Top = 67
                Width = 154
                Height = 71
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  187.854166666666700000
                  1457.854166666667000000
                  177.270833333333300000
                  407.458333333333400000)
                Shape = qrpsRectangle
                VertAdjust = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
              end
              object QRHRule7: TQRHRule
                Left = 12
                Top = 139
                Width = 694
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  31.750000000000000000
                  367.770833333333400000
                  1836.208333333333000000)
                VertAdjust = 0
                Pen.Style = psDot
              end
              object qrlRecibo4: TQRPLabel
                Left = 562
                Top = 81
                Width = 87
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  214.312500000000000000
                  230.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recibo N'#186
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrlRecebemos: TQRPLabel
                Left = 12
                Top = 169
                Width = 102
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  447.145833333333400000
                  269.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Recebemos de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlQuantia4: TQRPLabel
                Left = 12
                Top = 189
                Width = 112
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  500.062500000000100000
                  296.333333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'A quantia de: R$'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlReferente4: TQRPLabel
                Left = 12
                Top = 262
                Width = 84
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  693.208333333333400000
                  222.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Referente a:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlParaServVerdade4: TQRPLabel
                Left = 12
                Top = 386
                Width = 265
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  31.750000000000000000
                  1021.291666666667000000
                  701.145833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Por ser verdade, afirmo o presente Recibo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 11
              end
              object QRPLabel24: TQRPLabel
                Left = 336
                Top = 443
                Width = 61
                Height = 14
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  37.041666666666670000
                  889.000000000000000000
                  1172.104166666667000000
                  161.395833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Assinatura'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Verdana'
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
              object QRHRule8: TQRHRule
                Left = 222
                Top = 436
                Width = 296
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  587.375000000000000000
                  1153.583333333333000000
                  783.166666666666800000)
                VertAdjust = 0
              end
              object qrl_valor4: TQRLabel
                Left = 131
                Top = 189
                Width = 574
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  346.604166666666700000
                  500.062500000000100000
                  1518.708333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'VALOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_cidade_datarec4: TQRLabel
                Left = 41
                Top = 405
                Width = 127
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  1071.562500000000000000
                  336.020833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'CIDADE_DATA_REC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrlResponsavel4: TQRPLabel
                Left = 12
                Top = 148
                Width = 88
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  391.583333333333400000
                  232.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Respons'#225'vel:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlAtraves4: TQRPLabel
                Left = 12
                Top = 210
                Width = 79
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  555.625000000000000000
                  209.020833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Atrav'#233's de:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrlObservacao4: TQRPLabel
                Left = 12
                Top = 335
                Width = 85
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  886.354166666666900000
                  224.895833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Observa'#231#227'o:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nome_cliente4: TQRPLabel
                Left = 12
                Top = 68
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  179.916666666666700000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 10
              end
              object qrl_cpfcgc4: TQRPLabel
                Left = 12
                Top = 86
                Width = 218
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  227.541666666666700000
                  576.791666666666800000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CPFCGC'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_fone_cliente4: TQRPLabel
                Left = 236
                Top = 86
                Width = 99
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  624.416666666666800000
                  227.541666666666700000
                  261.937500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'FONE_CLIENTE'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nrecibo4: TQRPLabel
                Left = 562
                Top = 107
                Width = 136
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1486.958333333333000000
                  283.104166666666700000
                  359.833333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'NUM_REC_DEP'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                Degree = 0
                FixBottomPosition = False
                StretchHeightWithBand = False
                FontSize = 12
              end
              object qrl_nome_vendedor4: TQRPLabel
                Left = 105
                Top = 148
                Width = 600
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  277.812500000000000000
                  391.583333333333400000
                  1587.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_VENDEDOR'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_nome_dev4: TQRPLabel
                Left = 118
                Top = 169
                Width = 587
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  312.208333333333400000
                  447.145833333333400000
                  1553.104166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'NOME_DEV'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_atraves1_4: TQRLabel
                Left = 99
                Top = 210
                Width = 606
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  261.937500000000000000
                  555.625000000000000000
                  1603.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_atraves2_4: TQRLabel
                Left = 41
                Top = 227
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  600.604166666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_atraves3_4: TQRLabel
                Left = 41
                Top = 245
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  648.229166666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ATRAVES3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia1_4: TQRLabel
                Left = 101
                Top = 262
                Width = 604
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  267.229166666666700000
                  693.208333333333400000
                  1598.083333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia2_4: TQRLabel
                Left = 41
                Top = 280
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  740.833333333333400000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia3_4: TQRLabel
                Left = 41
                Top = 299
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  791.104166666666800000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_referencia4_4: TQRLabel
                Left = 41
                Top = 318
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  841.375000000000000000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'REFERENCIA4'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao1_4: TQRLabel
                Left = 103
                Top = 335
                Width = 604
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  272.520833333333400000
                  886.354166666666900000
                  1598.083333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'OBSERVACAO1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao2_4: TQRLabel
                Left = 41
                Top = 352
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  931.333333333333500000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'OBSERVACAO2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_observacao3_4: TQRLabel
                Left = 41
                Top = 372
                Width = 664
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  108.479166666666700000
                  984.249999999999900000
                  1756.833333333333000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'OBSERVACAO3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object qrl_endereco4: TQRPLabel
                Left = 12
                Top = 105
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  277.812500000000000000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'ENDERECO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_cep_cidade_uf4: TQRPLabel
                Left = 12
                Top = 124
                Width = 533
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  31.750000000000000000
                  328.083333333333400000
                  1410.229166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'CEPCIDADEUF'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
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
              object qrl_tiporec4: TQRLabel
                Left = 400
                Top = 94
                Width = 145
                Height = 41
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  108.479166666666700000
                  1058.333333333333000000
                  248.708333333333300000
                  383.645833333333400000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'TIPO RECIBO'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRShape24: TQRShape
                Left = 3
                Top = 61
                Width = 721
                Height = 473
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  1251.479166666667000000
                  7.937500000000000000
                  161.395833333333300000
                  1907.645833333333000000)
                Pen.Style = psClear
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 311
    Width = 891
    Height = 47
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object imgInformation: TImage
      Left = 863
      Top = 0
      Width = 24
      Height = 43
      Cursor = crHelp
      Align = alRight
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
      ExplicitLeft = 760
      ExplicitTop = 15
      ExplicitHeight = 168
    end
    object BitBtn1: TBitBtn
      Left = 466
      Top = 9
      Width = 90
      Height = 25
      Hint = 'OK'
      Caption = 'OK'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 1
      Top = 9
      Width = 90
      Height = 25
      Hint = 'Promiss'#243'rias - [FPG006]'
      Caption = 'Promiss'#243'rias'
      TabOrder = 1
      Glyph.Data = {
        CA020000424DCA02000000000000CA0100002800000010000000100000000100
        08000000000000010000120B0000120B00006500000065000000FF00FF008E5D
        590091605A00905F5A0090605B0082524C009C685F0096645C009F675A00A773
        6400A06D6000AF796700BB775D00B67F6900C4896E00BC846C00CE927200D196
        7400C98F7000CF8E6800F2A14100F4B66900F6D8B200DDCBB400FFFCF800FEF2
        E100FEF4E600FFFAF300FFC46500F6CB8400F6CC8800F6CC8900F7CF9000F7D1
        9300F8D9A600F8DAA900EFD3A700FADEB200FAE0B500FAE1B800FAE3BD00FCEA
        CE00FBEACF00FEF6E900F6CE8B00F6D08F00F7D39500F7D39700F7D49900F7D5
        9900F8D79C00F7D79E00F8D79F00F8D8A000F8D8A100F8D9A400F8D9A500F8DA
        A700F8DCAB00F8DCAC00F8DDAC00F8DDAD00FADEAF00F8DEB000F8E0B400FAE1
        B700FBE3BB00FAE3BA00FAE3BB00FBE5C000FAE5BF00FBE6C100FBE6C200FBE7
        C400FBE9C900FBEBD000FCEDD300FCF0DA00FCF0DC00FEF8ED00FEF8EE00FFFB
        F400FFFCF700F8E1B500FBE9C600FBE9C700FBEDD100B4AA9700FBEED400FBEE
        D500FCF3E200FEF6E700FFFEFC00FCF2DD00FCF4E300FEFCF600FFFEFB00FEFE
        FB00FEFFFE00FFFFFF0000000000000000000000000000000000000000000000
        0103030303030303030303050000000002403C2235312E202C1E1D0500000000
        0728413E2336040404041F0500000000064A4743403B383430212D0500000000
        0A5604490426042304322F0500000000095D592A554527253A37330500000000
        0B1A040404040442533D3905000000000D502B5A4E58295446413F0500000000
        0F5F04040404044B4A484405000000000E5C181B4F5B194D4C16240500000000
        126304040404045E5D17570500000000106304636152044F0808080800000000
        1163040404040451081C140C00000000116363636363626008150C0000000000
        1113131313131313080C00000000}
    end
    object BitBtn3: TBitBtn
      Left = 751
      Top = 9
      Width = 110
      Height = 25
      Hint = 'Nova Forma de Pagamento -  [FPG018]'
      Caption = 'Nova Forma'
      TabOrder = 5
      Visible = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        8E010000424D8E010000000000008E0000002800000010000000100000000100
        08000000000000010000120B0000120B0000160000001600000000000000FFFF
        FF00FF00FF00A67A7500F1E1D600ECD6C500EEDBCD00E7CCB500EAD1BD00E3C3
        A500E5C8AD00E0BF9D00FCF7F200FAF1E700F9ECDC00F3D8B400F4DDBE00F5E2
        C800F7E7D200F1D4A9000335FB000330E2000202020202020202020202020202
        0202030303030303030303030200000000020304060508070A090B0302000214
        0002030C0D0E1211100F13030200141400020303030303030303030302000000
        1502020202020202020202020202020202140303030303030303030302000000
        00020304060508070A090B03020002140002030C0D0E1211100F130302001414
        0002030303030303030303030200000015020202020202020202020202020202
        0214030303030303030303030200000000020304060508070A090B0302000214
        0002030C0D0E1211100F13030200141400020303030303030303030302000000
        150202020202020202020202020202020214}
    end
    object BitBtn4: TBitBtn
      Left = 95
      Top = 9
      Width = 90
      Height = 25
      Hint = 'Carn'#234' - [FPG006]'
      Caption = 'Carn'#234
      TabOrder = 2
      Glyph.Data = {
        CA020000424DCA02000000000000CA0100002800000010000000100000000100
        08000000000000010000120B0000120B00006500000065000000FF00FF008E5D
        590091605A00905F5A0090605B0082524C009C685F0096645C009F675A00A773
        6400A06D6000AF796700BB775D00B67F6900C4896E00BC846C00CE927200D196
        7400C98F7000CF8E6800F2A14100F4B66900F6D8B200DDCBB400FFFCF800FEF2
        E100FEF4E600FFFAF300FFC46500F6CB8400F6CC8800F6CC8900F7CF9000F7D1
        9300F8D9A600F8DAA900EFD3A700FADEB200FAE0B500FAE1B800FAE3BD00FCEA
        CE00FBEACF00FEF6E900F6CE8B00F6D08F00F7D39500F7D39700F7D49900F7D5
        9900F8D79C00F7D79E00F8D79F00F8D8A000F8D8A100F8D9A400F8D9A500F8DA
        A700F8DCAB00F8DCAC00F8DDAC00F8DDAD00FADEAF00F8DEB000F8E0B400FAE1
        B700FBE3BB00FAE3BA00FAE3BB00FBE5C000FAE5BF00FBE6C100FBE6C200FBE7
        C400FBE9C900FBEBD000FCEDD300FCF0DA00FCF0DC00FEF8ED00FEF8EE00FFFB
        F400FFFCF700F8E1B500FBE9C600FBE9C700FBEDD100B4AA9700FBEED400FBEE
        D500FCF3E200FEF6E700FFFEFC00FCF2DD00FCF4E300FEFCF600FFFEFB00FEFE
        FB00FEFFFE00FFFFFF0000000000000000000000000000000000000000000000
        0103030303030303030303050000000002403C2235312E202C1E1D0500000000
        0728413E2336040404041F0500000000064A4743403B383430212D0500000000
        0A5604490426042304322F0500000000095D592A554527253A37330500000000
        0B1A040404040442533D3905000000000D502B5A4E58295446413F0500000000
        0F5F04040404044B4A484405000000000E5C181B4F5B194D4C16240500000000
        126304040404045E5D17570500000000106304636152044F0808080800000000
        1163040404040451081C140C00000000116363636363626008150C0000000000
        1113131313131313080C00000000}
    end
    object BitBtn5: TBitBtn
      Left = 637
      Top = 9
      Width = 110
      Height = 25
      Hint = 'Cancelar Forma de Pagamento -  [FPG023]'
      Caption = 'Cancelar Forma'
      TabOrder = 6
      OnClick = BitBtn5Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        10000300000000020000120B0000120B00000000000000000000007C0000E003
        00001F000000D472C260C260C260C25CA25CA25CA25CA258A358835883588358
        83588354B56EC160C164C268C268C264C264A264A260A260A260A35C835C8358
        835883588354E164C16C8354285D4A61E758A260A264A260A25CE7584A61285D
        835483588354E164E16CA260CE65FF7F5A77C558A264A260A5585A77FF7FCE65
        835883588358E164E16CE16C835CD672FF7F736E835C8358736EFF7FD6728358
        A35C835C8358E164E170E16CC16CA5587B7BFF7F8C618C61FF7F7B7BA558A260
        A25C835C8358E164E170E170E16CC268285DFF7FBD7BBD7BFF7F285DA260A260
        A260A35C8358E164E170E170E170E16CA260316AFF7FFF7F316A835CA264A260
        A260A260A3580169E174E170E170E270A360316AFF7FFF7F316AA35CA264A264
        A260A260A25800698775A975EA75686D285DFF7FBD7BBD7BFF7F285D05650569
        E464C360A25C00690C7A0B7ACA75C5587B7BFF7F8C618C61FF7F7B7BC5580569
        0465E464A25C00690C7A0B7AE560D672FF7F736EE560E560736EFF7FD672A45C
        0469E464A25C00690C7A4869CE65FF7F5A77C65C88716771C55C5A77FF7FCE65
        C460E464A25C00692C7A84580F66316A285D676D88758771466D285D316A0F66
        8354E368C25C006D86718771466D466D666D867166716571456D2469E464E464
        E364E364C25CF376006D0069006900690069E168E164E164E164E164E164C160
        C160C260D472}
    end
    object BitBtn6: TBitBtn
      Left = 312
      Top = 9
      Width = 140
      Height = 25
      Hint = 'Visualizar Comprovante - [POSV007]'
      Caption = 'Visualizar Comprovante'
      TabOrder = 4
      Visible = False
      OnClick = BitBtn6Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B00000001000000010000181818003939
        390042393900424242004A4A4A00524A4A00EFA54A00525252005A5A5A00AD6B
        5A006B6B6B00C6846B00B58473009C8C7300CE947300EFB57300FFC67300BD84
        7B00A5947B00C6947B0084848400B5848400B58C8400CE9C8400AD9C8C00C6B5
        9400EFCE940094949C009C9C9C00A5A59C00C6A59C00E7C69C00EFCE9C00A5A5
        A500C6ADA500C6BDA500D6BDA500EFD6A500F7D6A500ADADAD00CEB5AD00D6B5
        AD00EFC6AD00F7D6AD00FFD6AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCE
        B500F7D6B500FFD6B500F7DEB500BDBDBD00EFCEBD00F7DEBD00C6C6C600F7DE
        C600F7E7C600E7CECE00F7E7CE00DEDED600FFDED600F7E7D600FFE7D600FFEF
        D600FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00F7FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00474715151515
        1515151515151515210347471E413A37342B26201A1A1A27083847471E413C39
        37322620201A350A3814474722420909091C1C1C1C090A000A05474722433F3C
        350405040721010A354747472846091B0209090909020A3D1547474729491D02
        0C090909090C0238154747472D1D0A19402A2B2B1F3C0D02154747472D1D0A24
        0909090909091802154747472E1D0A230C0C090909091202154747472F491D0A
        2C4048463E330221154747473049491D0A2B0909250235161547474730490909
        1D0A0A0A0A1D0F060B47474736494949491D1D1D1D13100E4747474730454444
        444444443B1317474747474730313131313030312D1147474747}
    end
    object BitBtn7: TBitBtn
      Left = 189
      Top = 9
      Width = 119
      Height = 25
      Hint = 'Visualizar Recibo - [REC006]'
      Caption = 'Visualizar Recibo'
      TabOrder = 3
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B00000001000000010000181818003939
        390042393900424242004A4A4A00524A4A00EFA54A00525252005A5A5A00AD6B
        5A006B6B6B00C6846B00B58473009C8C7300CE947300EFB57300FFC67300BD84
        7B00A5947B00C6947B0084848400B5848400B58C8400CE9C8400AD9C8C00C6B5
        9400EFCE940094949C009C9C9C00A5A59C00C6A59C00E7C69C00EFCE9C00A5A5
        A500C6ADA500C6BDA500D6BDA500EFD6A500F7D6A500ADADAD00CEB5AD00D6B5
        AD00EFC6AD00F7D6AD00FFD6AD00D6BDB500DEBDB500DEC6B500E7C6B500EFCE
        B500F7D6B500FFD6B500F7DEB500BDBDBD00EFCEBD00F7DEBD00C6C6C600F7DE
        C600F7E7C600E7CECE00F7E7CE00DEDED600FFDED600F7E7D600FFE7D600FFEF
        D600FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00F7FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00474715151515
        1515151515151515210347471E413A37342B26201A1A1A27083847471E413C39
        37322620201A350A3814474722420909091C1C1C1C090A000A05474722433F3C
        350405040721010A354747472846091B0209090909020A3D1547474729491D02
        0C090909090C0238154747472D1D0A19402A2B2B1F3C0D02154747472D1D0A24
        0909090909091802154747472E1D0A230C0C090909091202154747472F491D0A
        2C4048463E330221154747473049491D0A2B0909250235161547474730490909
        1D0A0A0A0A1D0F060B47474736494949491D1D1D1D13100E4747474730454444
        444444443B1317474747474730313131313030312D1147474747}
    end
  end
end
