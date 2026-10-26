inherited frmControleFaturamento: TfrmControleFaturamento
  Caption = 'Controle Faturamento'
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
                Caption = 'Cadastro Controle Faturamento'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 129
                    Caption = 'Dados Faturamento'
                    ExplicitHeight = 129
                    object Label6: TLabel
                      Left = 33
                      Top = 35
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 24
                      Top = 62
                      Width = 46
                      Height = 13
                      Caption = 'Desci'#231#227'o:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 35
                      Top = 89
                      Width = 35
                      Height = 13
                      Caption = 'Status:'
                    end
                    object DBEdit1: TDBEdit
                      Left = 76
                      Top = 32
                      Width = 134
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CODIGO_FATURAMENTO'
                      DataSource = DtmCadBasicos.dsContFatura
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 76
                      Top = 59
                      Width = 413
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESC_FAT'
                      DataSource = DtmCadBasicos.dsContFatura
                      TabOrder = 1
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 76
                      Top = 86
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'STATUS_F'
                      DataSource = DtmCadBasicos.dsContFatura
                      ItemHeight = 0
                      Items.Strings = (
                        'ATIVO'
                        'BARRADO')
                      TabOrder = 2
                      OnKeyPress = DBComboBox1KeyPress
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
                  DataSet = DtmCadBasicos.cdsContFatura
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Arial'
                  Font.Style = []
                  Functions.Strings = (
                    'PAGENUMBER'
                    'COLUMNNUMBER'
                    'REPORTTITLE'
                    'QRSTRINGSBAND1')
                  Functions.DATA = (
                    '0'
                    '0'
                    #39#39
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
                    Top = 115
                    Width = 718
                    Height = 24
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
                      63.500000000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 9
                      Top = 3
                      Width = 156
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        23.812500000000000000
                        7.937500000000000000
                        412.750000000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContFatura
                      DataField = 'CODIGO_FATURAMENTO'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 199
                      Top = 3
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        526.520833333333400000
                        7.937500000000000000
                        179.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContFatura
                      DataField = 'DESC_FAT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText3: TQRDBText
                      Left = 517
                      Top = 3
                      Width = 66
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1367.895833333333000000
                        7.937500000000000000
                        174.625000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContFatura
                      DataField = 'STATUS_F'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                  object PageHeaderBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 77
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
                      203.729166666666700000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRSysData1: TQRSysData
                      Left = 4
                      Top = 20
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        10.583333333333330000
                        52.916666666666670000
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
                    object QRLabel1: TQRLabel
                      Left = 4
                      Top = 2
                      Width = 230
                      Height = 18
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        47.625000000000000000
                        10.583333333333330000
                        5.291666666666667000
                        608.541666666666800000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Relat'#243'rio Cadastro de Faturamento'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -15
                      Font.Name = 'Arial'
                      Font.Style = [fsItalic]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 11
                    end
                    object QRLabel2: TQRLabel
                      Left = 617
                      Top = 20
                      Width = 45
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1632.479166666667000000
                        52.916666666666670000
                        119.062500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'P'#225'gina:'
                      Color = clWhite
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRLabel4: TQRLabel
                      Left = 119
                      Top = 49
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        314.854166666666700000
                        129.645833333333300000
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
                    object QRLabel5: TQRLabel
                      Left = 199
                      Top = 49
                      Width = 63
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        526.520833333333400000
                        129.645833333333300000
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
                    object QRLabel6: TQRLabel
                      Left = 517
                      Top = 49
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1367.895833333333000000
                        129.645833333333300000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Status'
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
                    object QRSysData2: TQRSysData
                      Left = 668
                      Top = 20
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1767.416666666667000000
                        52.916666666666670000
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
                    object QRHRule1: TQRHRule
                      Left = 0
                      Top = 33
                      Width = 721
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        87.312500000000000000
                        1907.645833333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 66
                      Width = 721
                      Height = 16
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        42.333333333333330000
                        0.000000000000000000
                        174.625000000000000000
                        1907.645833333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro'
              end
              inherited BitBtn5: TBitBtn
                Top = 14
                Hint = 'Cancelar Registro'
                ExplicitTop = 14
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
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Top = 6
                OnClick = SpeedButton5Click
                ExplicitTop = 6
              end
              inherited SpeedButton25: TSpeedButton
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
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 572
    Top = 73
  end
  inherited PopupMenu2: TPopupMenu
    Left = 606
    Top = 75
  end
  inherited Timer1: TTimer
    Left = 638
    Top = 75
  end
end
