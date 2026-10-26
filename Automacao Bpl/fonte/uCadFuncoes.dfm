inherited frmCadFuncoes: TfrmCadFuncoes
  Left = 259
  Top = 50
  Caption = 'Cadastro de Fun'#231#244'es'
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
                    Height = 353
                    Caption = ''
                    ExplicitHeight = 353
                    object Label6: TLabel
                      Left = 17
                      Top = 29
                      Width = 101
                      Height = 13
                      Caption = 'C'#243'digo da Fun'#231#227'o:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 32
                      Top = 77
                      Width = 86
                      Height = 13
                      Caption = 'Departamento:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 42
                      Top = 53
                      Width = 76
                      Height = 13
                      Caption = 'Desc. Fun'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 65
                      Top = 101
                      Width = 53
                      Height = 13
                      Caption = 'Tipo DOC:'
                      FocusControl = DBMemo1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 122
                      Top = 26
                      Width = 69
                      Height = 21
                      Hint = 'C'#243'digo da fun'#231#227'o'
                      DataField = 'COD_FUNCAO'
                      DataSource = dtmColaborador.dsFuncao
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 122
                      Top = 50
                      Width = 279
                      Height = 21
                      Hint = 'Descri'#231#227'o da fun'#231#227'o.'
                      CharCase = ecUpperCase
                      DataField = 'DESC_FUNCAO'
                      DataSource = dtmColaborador.dsFuncao
                      TabOrder = 1
                    end
                    object DBMemo1: TDBMemo
                      Left = 122
                      Top = 98
                      Width = 279
                      Height = 122
                      Hint = 
                        'Tipo de requisi'#231#227'o que a fun'#231#227'o est'#225' autorizado a realizar (Ex.:' +
                        'REQV,REQA)'
                      DataField = 'TPDOCS_VND'
                      DataSource = dtmColaborador.dsFuncao
                      TabOrder = 3
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 122
                      Top = 74
                      Width = 279
                      Height = 21
                      Hint = 'C'#243'digo do departamente que a fun'#231#227'o est'#225' vinculada'
                      DataField = 'COD_DEPTO'
                      DataSource = dtmColaborador.dsFuncao
                      KeyField = 'COD_DEPTO'
                      ListField = 'NOME_DEPTO;COD_DEPTO'
                      ListSource = dtmColaborador.dsDepto
                      TabOrder = 2
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
                object qrpFuncoes: TQuickRep
                  Left = 0
                  Top = 3
                  Width = 816
                  Height = 1056
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = dtmColaborador.cdsFuncao
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
                  OnPreview = qrpFuncoesPreview
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
                      66.145833333333340000
                      1957.916666666667000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText2: TQRDBText
                      Left = 29
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
                        76.729166666666680000
                        0.000000000000000000
                        145.520833333333300000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsFuncao
                      DataField = 'COD_FUNCAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 12
                    end
                    object QRDBText3: TQRDBText
                      Left = 283
                      Top = 0
                      Width = 126
                      Height = 19
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        50.270833333333330000
                        748.770833333333400000
                        0.000000000000000000
                        333.375000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsFuncao
                      DataField = 'DESC_FUNCAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 12
                    end
                    object QRDBText4: TQRDBText
                      Left = 136
                      Top = 0
                      Width = 102
                      Height = 19
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        50.270833333333330000
                        359.833333333333400000
                        0.000000000000000000
                        269.875000000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsFuncao
                      DataField = 'COD_DEPTO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 12
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
                      84.666666666666680000
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
                    object QRDBText13: TQRDBText
                      Left = 344
                      Top = 11
                      Width = 56
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        910.166666666666600000
                        29.104166666666670000
                        148.166666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataField = 'RODAPE'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel7: TQRLabel
                      Left = 5
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
                        13.229166666666670000
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
                      328.083333333333400000
                      1957.916666666667000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbTitle
                    object QRLabel1: TQRLabel
                      Left = 2
                      Top = 36
                      Width = 335
                      Height = 24
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        63.500000000000000000
                        5.291666666666670000
                        95.250000000000000000
                        886.354166666667000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = False
                      AutoStretch = False
                      Caption = 'Cadastro de Func'#245'es'
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
                      Left = 16
                      Top = 88
                      Width = 68
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        42.333333333333340000
                        232.833333333333400000
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
                      Left = 283
                      Top = 88
                      Width = 95
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        748.770833333333400000
                        232.833333333333400000
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
                      Left = 95
                      Top = 88
                      Width = 180
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        251.354166666666700000
                        232.833333333333400000
                        476.250000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'd. Departamento'
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
                      Left = 2
                      Top = 10
                      Width = 103
                      Height = 24
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        63.500000000000000000
                        5.291666666666667000
                        26.458333333333330000
                        272.520833333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'lbEmpresa'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 14
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [COL025]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [COL026]'
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
            object btUnSelectAll: TSpeedButton [6]
              Left = 631
              Top = 46
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
            object btSelectAll: TSpeedButton [7]
              Left = 604
              Top = 46
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [COL027]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [COL019]'
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
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_FUNCAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_DEPTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_FUNCAO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TPDOCS_VND'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DPTO'
                  Width = 64
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [COL020]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [COL021]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [COL022]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [COL024]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [COL023]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
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
end
