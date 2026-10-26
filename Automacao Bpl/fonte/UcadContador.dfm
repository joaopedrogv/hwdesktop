inherited frmCadContador: TfrmCadContador
  Caption = 'Contadores'
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitTop = 27
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = TabSheet4
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de Contadores'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 353
                    Caption = 'Dados do Contador'
                    ExplicitHeight = 353
                    object Label6: TLabel
                      Left = 49
                      Top = 37
                      Width = 40
                      Height = 13
                      Caption = 'C'#243'digo :'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 55
                      Top = 63
                      Width = 34
                      Height = 13
                      Caption = 'Nome :'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 37
                      Top = 90
                      Width = 52
                      Height = 13
                      Caption = 'Endere'#231'o :'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 54
                      Top = 165
                      Width = 35
                      Height = 13
                      Caption = 'Bairro :'
                    end
                    object Label12: TLabel
                      Left = 49
                      Top = 194
                      Width = 40
                      Height = 13
                      Caption = 'Cidade :'
                    end
                    object Label13: TLabel
                      Left = 62
                      Top = 219
                      Width = 26
                      Height = 13
                      Caption = 'CEP :'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 240
                      Top = 219
                      Width = 20
                      Height = 13
                      Caption = 'UF :'
                    end
                    object Label15: TLabel
                      Left = 49
                      Top = 245
                      Width = 40
                      Height = 13
                      Caption = 'Fone 1 :'
                      FocusControl = DBEdit10
                    end
                    object Label16: TLabel
                      Left = 224
                      Top = 245
                      Width = 36
                      Height = 13
                      Caption = 'Ramal :'
                      FocusControl = DBEdit11
                    end
                    object Label17: TLabel
                      Left = 351
                      Top = 245
                      Width = 46
                      Height = 13
                      Caption = 'Contato :'
                      FocusControl = DBEdit12
                    end
                    object Label18: TLabel
                      Left = 49
                      Top = 272
                      Width = 40
                      Height = 13
                      Caption = 'Fone 2 :'
                      FocusControl = DBEdit13
                    end
                    object Label19: TLabel
                      Left = 235
                      Top = 272
                      Width = 25
                      Height = 13
                      Caption = 'Fax :'
                      FocusControl = DBEdit14
                    end
                    object Label20: TLabel
                      Left = 54
                      Top = 300
                      Width = 35
                      Height = 13
                      Caption = 'E-mail :'
                      FocusControl = DBEdit15
                    end
                    object Label21: TLabel
                      Left = 23
                      Top = 325
                      Width = 65
                      Height = 13
                      Caption = 'Observa'#231#227'o :'
                      FocusControl = DBEdit16
                    end
                    object Label22: TLabel
                      Left = 18
                      Top = 114
                      Width = 71
                      Height = 13
                      Caption = 'CPF Contador:'
                      FocusControl = DBEdit4
                    end
                    object Label23: TLabel
                      Left = 339
                      Top = 90
                      Width = 81
                      Height = 13
                      Caption = 'N'#186'/Complemento'
                      FocusControl = DBEdit7
                    end
                    object Label10: TLabel
                      Left = 211
                      Top = 114
                      Width = 76
                      Height = 13
                      Caption = 'CNPJ Escrit'#243'rio:'
                      FocusControl = DBEdit7
                    end
                    object Label11: TLabel
                      Left = 493
                      Top = 120
                      Width = 25
                      Height = 13
                      Caption = 'CRC:'
                      FocusControl = DBEdit17
                    end
                    object Label24: TLabel
                      Left = 41
                      Top = 143
                      Width = 48
                      Height = 13
                      Caption = 'Escrit'#243'rio:'
                      FocusControl = DBEdit18
                    end
                    object DBEdit1: TDBEdit
                      Left = 95
                      Top = 33
                      Width = 126
                      Height = 21
                      DataField = 'COD_CONTADOR'
                      DataSource = DtmCadBasicos.dsContador
                      Enabled = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 95
                      Top = 60
                      Width = 545
                      Height = 21
                      DataField = 'NOME_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 95
                      Top = 87
                      Width = 238
                      Height = 21
                      DataField = 'ENDERECO_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 2
                    end
                    object DBEdit6: TDBEdit
                      Left = 95
                      Top = 189
                      Width = 110
                      Height = 21
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 11
                      OnEnter = DBEdit6Enter
                      OnExit = DBEdit6Exit
                      OnKeyDown = DBEdit6KeyDown
                    end
                    object DBEdit8: TDBEdit
                      Left = 95
                      Top = 216
                      Width = 110
                      Height = 21
                      DataField = 'CEP_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 13
                    end
                    object DBEdit10: TDBEdit
                      Left = 95
                      Top = 242
                      Width = 110
                      Height = 21
                      DataField = 'FONE_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 15
                    end
                    object DBEdit11: TDBEdit
                      Left = 267
                      Top = 242
                      Width = 66
                      Height = 21
                      DataField = 'RAMAL_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 16
                    end
                    object DBEdit12: TDBEdit
                      Left = 403
                      Top = 243
                      Width = 237
                      Height = 21
                      DataField = 'CONTATO_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 17
                    end
                    object DBEdit13: TDBEdit
                      Left = 95
                      Top = 269
                      Width = 110
                      Height = 21
                      DataField = 'OUTROTEL_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 18
                    end
                    object DBEdit14: TDBEdit
                      Left = 267
                      Top = 270
                      Width = 110
                      Height = 21
                      DataField = 'FAX_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 19
                    end
                    object DBEdit15: TDBEdit
                      Left = 95
                      Top = 295
                      Width = 393
                      Height = 21
                      DataField = 'EMAIL_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 20
                    end
                    object DBEdit16: TDBEdit
                      Left = 95
                      Top = 322
                      Width = 545
                      Height = 21
                      DataField = 'OBS_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 21
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 211
                      Top = 189
                      Width = 276
                      Height = 21
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsContador
                      KeyField = 'COD_CIDADE'
                      ListField = 'NOME_CIDADE'
                      ListSource = DtmCadBasicos.dsCidade
                      TabOrder = 12
                      OnExit = DBLookupComboBox2Exit
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 267
                      Top = 216
                      Width = 66
                      Height = 21
                      DataField = 'CODIGO_UF'
                      DataSource = DtmCadBasicos.dsContador
                      KeyField = 'CODIGO_UF'
                      ListField = 'SIGLA_UF'
                      ListSource = DtmCadBasicos.dsUF
                      TabOrder = 14
                    end
                    object DBEdit4: TDBEdit
                      Left = 95
                      Top = 111
                      Width = 110
                      Height = 21
                      DataField = 'CPFCNPJ_CONT'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 5
                      OnKeyPress = DBEdit4KeyPress
                    end
                    object DBEdit5: TDBEdit
                      Left = 95
                      Top = 162
                      Width = 110
                      Height = 21
                      DataField = 'COD_BAIRRO'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 9
                      OnEnter = DBEdit5Enter
                      OnExit = DBEdit5Exit
                      OnKeyDown = DBEdit5KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 211
                      Top = 162
                      Width = 276
                      Height = 21
                      DataField = 'COD_BAIRRO'
                      DataSource = DtmCadBasicos.dsContador
                      KeyField = 'COD_BAIRRO'
                      ListField = 'NOME_BAIRRO'
                      ListSource = DtmCadBasicos.dsBairro
                      TabOrder = 10
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBEdit7: TDBEdit
                      Left = 422
                      Top = 87
                      Width = 45
                      Height = 21
                      DataField = 'NUMERO'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 3
                    end
                    object DBEdit134: TDBEdit
                      Left = 473
                      Top = 87
                      Width = 167
                      Height = 21
                      DataField = 'COMPLEMENTO'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 4
                    end
                    object DBEdit9: TDBEdit
                      Left = 293
                      Top = 114
                      Width = 194
                      Height = 21
                      DataField = 'CNPJ_ESCRITORIO'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 6
                    end
                    object DBEdit17: TDBEdit
                      Left = 524
                      Top = 114
                      Width = 116
                      Height = 21
                      DataField = 'CRC'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 7
                    end
                    object DBEdit18: TDBEdit
                      Left = 95
                      Top = 137
                      Width = 545
                      Height = 21
                      DataField = 'NOME_ESCRITORIO'
                      DataSource = DtmCadBasicos.dsContador
                      TabOrder = 8
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
                  Left = -7
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicos.cdsContador
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
                  ReportTitle = 'Rela'#231#227'o de Contadores'
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
                    BandType = rbPageHeader
                    object QRHRule2: TQRHRule
                      Left = 1
                      Top = 56
                      Width = 717
                      Height = 35
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        92.604166666666680000
                        2.645833333333333000
                        148.166666666666700000
                        1897.062500000000000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRLabel1: TQRLabel
                      Left = 241
                      Top = 5
                      Width = 217
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        637.645833333333400000
                        13.229166666666670000
                        574.145833333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Rela'#231#227'o de Contadores'
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
                      Top = 30
                      Width = 718
                      Height = 37
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        97.895833333333340000
                        0.000000000000000000
                        79.375000000000000000
                        1899.708333333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRLabel2: TQRLabel
                      Left = 32
                      Top = 52
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        84.666666666666680000
                        137.583333333333300000
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
                    object QRLabel3: TQRLabel
                      Left = 128
                      Top = 52
                      Width = 38
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        338.666666666666700000
                        137.583333333333300000
                        100.541666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Nome'
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
                    object QRLabel4: TQRLabel
                      Left = 341
                      Top = 53
                      Width = 57
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        902.229166666666800000
                        140.229166666666700000
                        150.812500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Telefone'
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
                      Left = 428
                      Top = 52
                      Width = 42
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1132.416666666667000000
                        137.583333333333300000
                        111.125000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Ramal'
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
                      Left = 508
                      Top = 52
                      Width = 41
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1344.083333333333000000
                        137.583333333333300000
                        108.479166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'E-mail'
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
                    object QRLabel7: TQRLabel
                      Left = 1
                      Top = 27
                      Width = 65
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        2.645833333333333000
                        71.437500000000000000
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
                    object QRLabel8: TQRLabel
                      Left = 625
                      Top = 27
                      Width = 47
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1653.645833333333000000
                        71.437500000000000000
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
                    object QRSysData1: TQRSysData
                      Left = 675
                      Top = 27
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1785.937500000000000000
                        71.437500000000000000
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
                    object QRSysData2: TQRSysData
                      Left = 72
                      Top = 27
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        190.500000000000000000
                        71.437500000000000000
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
                  end
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 117
                    Width = 718
                    Height = 27
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
                      71.437500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 32
                      Top = 4
                      Width = 108
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        84.666666666666680000
                        10.583333333333330000
                        285.750000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContador
                      DataField = 'COD_CONTADOR'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 128
                      Top = 4
                      Width = 82
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        338.666666666666700000
                        10.583333333333330000
                        216.958333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContador
                      DataField = 'NOME_CONT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRMBDBText1: TQRMBDBText
                      Left = 341
                      Top = 4
                      Width = 79
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        902.229166666666800000
                        10.583333333333330000
                        209.020833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContador
                      DataField = 'FONE_CONT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText3: TQRDBText
                      Left = 428
                      Top = 4
                      Width = 88
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1132.416666666667000000
                        10.583333333333330000
                        232.833333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContador
                      DataField = 'RAMAL_CONT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRMBDBText2: TQRMBDBText
                      Left = 507
                      Top = 2
                      Width = 82
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1341.437500000000000000
                        5.291666666666667000
                        216.958333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsContador
                      DataField = 'EMAIL_CONT'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
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
              Hint = 'Clique para pesquisar - [BAS204]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS205]'
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
              DataSource = DtmCadBasicos.dsContador
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CONTADOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CPFCNPJ_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAIRRO_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIDADE_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEP_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAMAL_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTATO_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OUTROTEL_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FAX_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_CAD_CONT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS206]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS208]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS213]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS209]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS210]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
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
