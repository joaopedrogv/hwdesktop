inherited frmCondicaoPagamento: TfrmCondicaoPagamento
  Left = 245
  Top = 65
  Caption = 'Cadastro de Condi'#231#227'o de Pagamento'
  Position = poMainFormCenter
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
                Caption = 'Cadastro Condi'#231#227'o de Pagamento'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 427
                    Align = alClient
                    Caption = 'Dados Condi'#231#227'o de Pagamento'
                    ExplicitHeight = 427
                    object Label6: TLabel
                      Left = 181
                      Top = 35
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 168
                      Top = 62
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 162
                      Top = 91
                      Width = 56
                      Height = 13
                      Caption = 'Seq. Pre'#231'o:'
                    end
                    object Label9: TLabel
                      Left = 120
                      Top = 118
                      Width = 98
                      Height = 13
                      Caption = 'Max. Desconto (%):'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 127
                      Top = 292
                      Width = 91
                      Height = 13
                      Caption = 'Finalizador Cupom:'
                      FocusControl = DBEdit3
                      Visible = False
                    end
                    object Label11: TLabel
                      Left = 170
                      Top = 145
                      Width = 48
                      Height = 13
                      Caption = 'Natureza:'
                    end
                    object Label12: TLabel
                      Left = 137
                      Top = 230
                      Width = 81
                      Height = 13
                      Caption = 'Tabela de Pre'#231'o:'
                      FocusControl = DBEdit3
                    end
                    object Label13: TLabel
                      Left = 424
                      Top = 91
                      Width = 54
                      Height = 13
                      Caption = 'Modalidade'
                    end
                    object Label24: TLabel
                      Left = 392
                      Top = 118
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Considerar dia '#250'til'
                    end
                    object lbDiaFixo: TLabel
                      Left = 456
                      Top = 40
                      Width = 35
                      Height = 13
                      Cursor = crHandPoint
                      Caption = 'dia fixo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      OnClick = lbDiaFixoClick
                    end
                    object lbInformarDia: TLabel
                      Left = 515
                      Top = 40
                      Width = 57
                      Height = 13
                      Cursor = crHandPoint
                      Caption = 'informar dia'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      OnClick = lbDiaFixoClick
                    end
                    object Label27: TLabel
                      Left = 393
                      Top = 145
                      Width = 144
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'M'#225'ximo de Parcelas Adicionais'
                    end
                    object Label50: TLabel
                      Left = 23
                      Top = 173
                      Width = 195
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Condi'#231#227'o padr'#227'o para clientes (Vendas):'
                    end
                    object Label29: TLabel
                      Left = 5
                      Top = 202
                      Width = 213
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Condi'#231#227'o padr'#227'o para clientes (Presta'#231#245'es):'
                    end
                    object DBEdit1: TDBEdit
                      Left = 220
                      Top = 32
                      Width = 160
                      Height = 21
                      Hint = 'C'#243'digo da condi'#231#227'o de pagamento'
                      CharCase = ecUpperCase
                      DataField = 'COD_COND_PAG'
                      DataSource = DtmCadBasicos.dsCondPgto
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 220
                      Top = 59
                      Width = 434
                      Height = 21
                      Hint = 'Descri'#231#227'o da condi'#231#227'o de pagamento'
                      CharCase = ecUpperCase
                      DataField = 'DESC_COND_PAG'
                      DataSource = DtmCadBasicos.dsCondPgto
                      TabOrder = 1
                      OnChange = DBEdit2Change
                    end
                    object DBEdit4: TDBEdit
                      Left = 220
                      Top = 115
                      Width = 160
                      Height = 21
                      Hint = 
                        'M'#225'ximo de desconto por condi'#231'ao de pagamento. Este desconto '#233' da' +
                        'do em 2'#170' plano caso em produtos n'#227'o tenha nenhum limite.'
                      CharCase = ecUpperCase
                      DataField = 'MAX_DESC'
                      DataSource = DtmCadBasicos.dsCondPgto
                      TabOrder = 4
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 220
                      Top = 88
                      Width = 160
                      Height = 21
                      Hint = 
                        'Indica se para esta condi'#231#227'o ser'#225' extra'#237'do o pre'#231'o dos campos PR' +
                        'EC_TAB_PROD, PREC_30_PROD,PREC_60_PROD E PREC_90_PROD'
                      CharCase = ecUpperCase
                      DataField = 'SEQPRECO'
                      DataSource = DtmCadBasicos.dsCondPgto
                      DragMode = dmAutomatic
                      ItemHeight = 13
                      Items.Strings = (
                        '1 - A VISTA'
                        '2 - 30 DIAS'
                        '3 - 60 DIAS'
                        '4 - 90 DIAS ')
                      TabOrder = 2
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBEdit3: TDBEdit
                      Left = 220
                      Top = 289
                      Width = 134
                      Height = 21
                      Hint = 'Finalizador de Cupom'
                      CharCase = ecUpperCase
                      TabOrder = 12
                      Visible = False
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 220
                      Top = 142
                      Width = 160
                      Height = 21
                      Hint = 
                        'Natureza da condi'#231#227'o de Pagamento. V = Vendas, C = Compras e T =' +
                        ' Todas.'
                      CharCase = ecUpperCase
                      DataField = 'NATUREZA_CP'
                      DataSource = DtmCadBasicos.dsCondPgto
                      ItemHeight = 13
                      Items.Strings = (
                        'V - VENDA'
                        'C - COMPRA'
                        'T - TODAS')
                      TabOrder = 6
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBLookupComboBox22: TDBLookupComboBox
                      Left = 290
                      Top = 227
                      Width = 364
                      Height = 21
                      Hint = 'Tabela de Pre'#231'o da Cond. Pag'
                      KeyField = 'COD_PROMOCAO'
                      ListField = 'DESCR_PROMOCAO'
                      ListSource = DtmCadBasicos.dsCondPgtoTabPreco
                      TabOrder = 11
                      OnExit = DBLookupComboBox22Exit
                    end
                    object EditHw5: TEditHw
                      Left = 220
                      Top = 227
                      Width = 66
                      Height = 21
                      Hint = 'Tabela de Pre'#231'o da Cond. Pag'
                      TabOrder = 10
                      Text = '                 0'
                      OnExit = EditHw5Exit
                      OnKeyDown = EditHw5KeyDown
                      Formato = fInteger
                      FormatSize = '0.2'
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 484
                      Top = 86
                      Width = 170
                      Height = 21
                      DataField = 'MODALIDADE'
                      DataSource = DtmCadBasicos.dsCondPgto
                      TabOrder = 3
                    end
                    object BitBtn8: TBitBtn
                      Left = 665
                      Top = 55
                      Width = 75
                      Height = 25
                      Caption = 'Simular'
                      TabOrder = 13
                      OnClick = BitBtn8Click
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 484
                      Top = 113
                      Width = 170
                      Height = 21
                      DataField = 'CONSIDERAR_DIA_UTIL'
                      DataSource = DtmCadBasicos.dsCondPgto
                      DropDownWidth = 320
                      TabOrder = 5
                    end
                    object DBEdit5: TDBEdit
                      Left = 543
                      Top = 140
                      Width = 111
                      Height = 21
                      DataField = 'PARCELAS_ADICIONAIS'
                      DataSource = DtmCadBasicos.dsCondPgto
                      TabOrder = 7
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 220
                      Top = 170
                      Width = 160
                      Height = 21
                      DataField = 'COND_PADRAO_CL_VND'
                      DataSource = DtmCadBasicos.dsCondPgto
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM - NOVOS CLIENTES'
                        'TODOS - TODOS CLIENTE'
                        'N'#195'O - NENHUM CLIENTE')
                      TabOrder = 8
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 220
                      Top = 199
                      Width = 160
                      Height = 21
                      DataField = 'COND_PADRAO_CL_PREST'
                      DataSource = DtmCadBasicos.dsCondPgto
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM - NOVOS CLIENTES'
                        'TODOS - TODOS CLIENTE'
                        'N'#195'O - NENHUM CLIENTE')
                      TabOrder = 9
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Relat'#243'rio'
                ImageIndex = 1
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
                  DataSet = DtmCadBasicos.cdsCondPgto
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
                    Top = 148
                    Width = 718
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
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 102
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
                        269.875000000000000000
                        10.583333333333330000
                        285.750000000000000000)
                      Alignment = taRightJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsCondPgto
                      DataField = 'COD_COND_PAG'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 279
                      Top = 4
                      Width = 116
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        738.187500000000000000
                        10.583333333333330000
                        306.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsCondPgto
                      DataField = 'DESC_COND_PAG'
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
                    Height = 110
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    AlignToBottom = False
                    BeforePrint = PageHeaderBand1BeforePrint
                    Color = clWhite
                    TransparentBand = False
                    ForceNewColumn = False
                    ForceNewPage = False
                    Size.Values = (
                      291.041666666666700000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRPLabel1: TQRPLabel
                      Left = 4
                      Top = 31
                      Width = 223
                      Height = 18
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        47.625000000000000000
                        10.583333333333330000
                        82.020833333333320000
                        590.020833333333200000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Relat'#243'rio de Condi'#231#245'es de Pagamento'
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
                      Degree = 0
                      FixBottomPosition = False
                      StretchHeightWithBand = False
                      FontSize = 10
                    end
                    object QRSysData1: TQRSysData
                      Left = 78
                      Top = 50
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        206.375000000000000000
                        132.291666666666700000
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
                      Left = 627
                      Top = 52
                      Width = 49
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1658.937500000000000000
                        137.583333333333300000
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
                    object QRLabel4: TQRLabel
                      Left = 279
                      Top = 84
                      Width = 63
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        738.187500000000000000
                        222.250000000000000000
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
                      Left = 164
                      Top = 84
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        433.916666666666700000
                        222.250000000000000000
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
                    object QRSysData2: TQRSysData
                      Left = 682
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
                        1804.458333333333000000
                        137.583333333333300000
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
                    object QRLabel2: TQRLabel
                      Left = 4
                      Top = 52
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
                        137.583333333333300000
                        179.916666666666700000)
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
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRHRule1: TQRHRule
                      Left = 0
                      Top = 70
                      Width = 721
                      Height = 13
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        34.395833333333330000
                        0.000000000000000000
                        185.208333333333300000
                        1907.645833333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 101
                      Width = 721
                      Height = 13
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        34.395833333333330000
                        0.000000000000000000
                        267.229166666666700000
                        1907.645833333333000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object lbEmpresa: TQRLabel
                      Left = 4
                      Top = 1
                      Width = 67
                      Height = 32
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        84.666666666666680000
                        10.583333333333330000
                        2.645833333333333000
                        177.270833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Nome'
                      Color = clWhite
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 18
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS095]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS096]'
              end
              object btDefinirEmp: TBitBtn
                Left = 190
                Top = 13
                Width = 110
                Height = 25
                Hint = 'Definir Empresas'
                Caption = '&Definir Empresas'
                TabOrder = 4
                OnClick = btDefinirEmpClick
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
            object SpeedButton59: TSpeedButton [6]
              Left = 685
              Top = 13
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton59Click
            end
            object btUnSelectAll: TSpeedButton [7]
              Left = 631
              Top = 44
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
            object btSelectAll: TSpeedButton [8]
              Left = 604
              Top = 44
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
              Hint = 'Clique para pesquisar - [BAS097]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS088]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
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
                  FieldName = 'COD_COND_PAG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESC_COND_PAG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEQPRECO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MAX_DESC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATUREZA_CP'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS089]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS090]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS092]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS094]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 
                  'Adicionar/Remover controle para condi'#231#227'o de pagamento em todos c' +
                  'lientes - [BAS501]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000000000107B10001084
                  100021A52100298C2900299C290029AD2900398C3100319C310031AD31004284
                  390039943900399C390039B53900527342004A8C42004A9C42004AA5420042BD
                  420042CE420018734A00528C4A0052A54A004ABD4A00296B520052B5520052C6
                  5200736B5A005AC65A00428463006B84630063A5630063BD630063CE6300315A
                  6B0073B56B006BCE6B0073AD730073CE730094B57B0084BD7B008CBD7B007BCE
                  7B007BD67B00316B840084B58400085A8C0039738C009CB58C008CBD8C009CDE
                  8C0039739400106B9C00216B9C005A849C0063849C00216BA5002173A500B5E7
                  A500297BAD003984AD00428CAD004A8CAD00107BB500217BB500428CB5004A94
                  B500217BBD004294BD005294BD00529CBD006BA5BD00D6E7BD00187BC6002184
                  C6002984C600298CC600318CC600428CC6003994C6004294C6004A94C60063A5
                  C6006BA5C600BDC6C600298CCE00398CCE002994CE00E7DECE00D6E7CE006BAD
                  D6003194DE005AADDE00218CE700298CE7004A9CE70073BDE7008CBDE7009CCE
                  E700ADCEE7002994EF0042A5EF004AB5EF007BBDEF00F7FFEF002994F700319C
                  F700399CF70042A5F70063ADF70052B5F700FF00FF003194FF00399CFF0042A5
                  FF004AADFF004AB5FF0052B5FF004ABDFF006BBDFF006BC6FF008CF7FF009CF7
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E1D0D0707070707072D1B091A0A0A6E6E6E6E6E
                  6E6E6E6E240112021111111100621B1B1B1B1B0A6E6E6E6E6E6E6E6E03120811
                  1619310B281B1B1B1B1B1B1B0A6E6E6E6E6E6E6E0A050C161B311822471B1B1B
                  1B1B1B1B0A6E6E6E6E6E6E6E3004161B23391E676727391B1B1B1B096E6E6E6E
                  6E6E6E6E6E0616203915587A7A2C31251B1B096E6E6E6E6E6E6E6E6E6E6E0618
                  0F2F53535726292A18096E6E6E6E6E6E6E6E6E6E6E6E6E0E133B42423C1C1F0B
                  146E6E6E6E6E6E6E6E6E6E6E6E6E6E35485C5D5D5C3E176E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E4263686F6F6963346E6E6E6E6E6E6E6E6E6E6E6E6E6E6E3A63
                  7070707070705D336E6E6E6E6E6E6E6E6E6E6E6E6E6E49707171717171716A21
                  6E6E6E6E6E6E6E6E6E6E6E6E6E366A717272767672726B2B6E6E6E6E6E6E6E6E
                  6E6E6E6E6E526B7273767476747672326E6E6E6E6E6E6E6E6E6E6E6E6E446474
                  7777776D656D6D2E6E6E6E6E6E6E6E6E6E6E6E6E6E513F545A5A494B4C4A5633
                  6E6E6E6E6E6E6E6E6E6E6E6E6E36384D5059666C5E55376E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E384C5960605F5B4E336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E40
                  4F59616043336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E4641453D366E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Definir condi'#231#245'es de pagamento por empresa - [BAS514]'
                Glyph.Data = {
                  02060000424D0206000000000000C20300002800000018000000180000000100
                  08000000000040020000120B0000120B0000E3000000E300000000000000FFFF
                  FF00FF00FF00FFFEFF00A4676900A5686B00FFFEFE009365600093655E009263
                  5D009566600093655F00986963009E6E64008469640080676200A37266009D70
                  6500896A63009F6F6200A0706300A7756800986859009F6F6000AC796900A072
                  6400B17E6B00BB846E00B6816C00CB917300C58C7000C0896F00CF8E6800D498
                  7500CF967400FFFCFA00FFF8F300FFFBF800FFF4EB00FFFAF600FFEFE000FFF0
                  E200FFF0E300FFF2E600FFF4EA00FFF6EE00FFF8F200FECC9900FFCE9C00FECE
                  9D00FECF9F00FED1A300FFD5AA00FED4A900FED5AB00FED7AF00FFDAB500FEDA
                  B500FFDDBA00FFDEBC00FEDDBB00FFE3C700FFE5CB00FFE7CF00FEE6CE00FFEB
                  D800FFEEDE00FFF0E100FEEFE000FFF2E500FFF3E700FFF4E900FFF6ED00FFF7
                  EF00FFFBF700D5812700FECB9600FECC9700FECC9800FECE9900FECE9A00FECE
                  9C00FECF9D00FFD09F00FECF9E00FED09E00FED0A000FED3A300FFD4A500FED3
                  A400FED4A500FED4A600FED4A700FED5A700FED5A900FED5AA00FED7AB00FFD8
                  AD00FED7AD00FED8AD00FED8AF00FED8B000FFDAB200FED9B100FED9B200FEDA
                  B200FEDAB400FFDCB700FEDCB600FFDDB800FEDCB700FEDDB800FFDEBB00FEDD
                  BA00FFE0BD00FEDEBC00FEE0BF00FFE1C100FEE0C000FFE1C200FFE2C200FEE1
                  C100FFE3C500FEE2C400FFE3C600FEE3C500FEE3C600FEE3C700FFE5C900FFE5
                  CA00FEE5C900FFE6CB00FEE5CA00FFE6CC00FEE6CB00FEE6CC00FFE7CE00FFE9
                  D100FFEAD300FFEAD400FFEBD500FEEAD400FEEBD700FFEDD900FFEDDA00FFEE
                  DC00FFEFDD00FEEEDC00FFEFDE00FEEEDD00FFF0E000FEF0E100FFF3E600FEF2
                  E500FEF3E700FEF4E900FFF7EE00F8CE9C00FED9AF00FEE0BC00FEE0BD00FEE1
                  BF00FEE1C000FEE2C200FEE3C400FFE5C700FFE7CB00FEE6CA00FEE7CC00FEE9
                  CF00FEE9D000FEE9D100FEEAD300FEEBD400FEEBD500FFEDD700FFEDD800FEED
                  D900FFF0DE00FEEFDD00FFF2E200FFF3E500FFF4E700FEF3E600FFF6EB00FFF8
                  F000F6D3A700F8D9B100FEEAD100FFF2E100FEF2E300FFF6EA00FFF7ED00FFF8
                  EF00FEF7EE00FEF8F000FFFBF600EECE9E00F6E0C000F8E6CB00FEF6EB00FFFA
                  F300FEFAF400EED9B500FFFBF400FEFAF300FFFCF700FFFEFC00F7EEDA00EFE6
                  CF00FFFEFB00FFFEFA00FEFEFB00FFFFFE00AFB17400AFBA8400AFC49700648E
                  43005484370064934C0054893E0064995600548F470032772500327A2900327D
                  2E00008100000202020904040404040404040404040404040404040402020202
                  02086B386764605D5A57563231504E4C4C4C4C1702020202020B736F38686460
                  5F5B59565452514F4D4C4C1702020202020B75A0716C6965635F5C5933E25230
                  4F4E4D1702020202020B7A7972706E6A67613635E2E2E255522F4E1702020202
                  0207817E4B4B4B4B4B4B64E2DFD9E2DA5451501702020202020A883EA57B769F
                  3A6C66E2BA34D6E2E29D521702020202020C8AA98582A479A0706C6A676236C5
                  E2E2531702020202020D41ADAA40847E77743B6E396737603558331702020202
                  021093B08DAB88867C7BA2736DE2689E605E5B170202020202159695B18C893F
                  863DA479E2E2E26665635F1302020202021845B44B4B4B4B4B4B80E2E0DBE2DC
                  3967621402020202021A472B294491418BABA8E2C6A3D7E2E2BB671902020202
                  021CC02C46B444918F8CBC3FA73D78CBE2E26C1102020202021BC1C2C8469943
                  428F8EACA987A57D79A03C1202020202021FC92E9CBFB6B7BD9490AF8BE2A882
                  7C77A10F02020202021ECECA2E494847982AB293E2E2E288837F780E02020202
                  021D23254B4B4B4B4B4BBEE2E1DDE2DE3F83A516020202020222CFD22527CDB9
                  2D269AE2D094D8E2E2C7A60502020202022103CFD325C4C92EC1B847B5B428D1
                  E2E2AA0E020202020221010106D2234ACC2E49B89B98BE9692B1AE0E02020202
                  0221010101D5D2D425CC24C39C2CB69997B3900E020202020220202020202020
                  20202020202020202020200E0202020202020202020202020202020202020202
                  020202020202}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 
                  'Adicionar/Remover condi'#231#227'o de pagamento para presta'#231#245'es em todos' +
                  ' clientes - [BAS504]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000000000107B10001084
                  100021A52100298C2900299C290029AD2900398C3100319C310031AD31004284
                  390039943900399C390039B53900527342004A8C42004A9C42004AA5420042BD
                  420042CE420018734A00528C4A0052A54A004ABD4A00296B520052B5520052C6
                  5200736B5A005AC65A00428463006B84630063A5630063BD630063CE6300315A
                  6B0073B56B006BCE6B0073AD730073CE730094B57B0084BD7B008CBD7B007BCE
                  7B007BD67B00316B840084B58400085A8C0039738C009CB58C008CBD8C009CDE
                  8C0039739400106B9C00216B9C005A849C0063849C00216BA5002173A500B5E7
                  A500297BAD003984AD00428CAD004A8CAD00107BB500217BB500428CB5004A94
                  B500217BBD004294BD005294BD00529CBD006BA5BD00D6E7BD00187BC6002184
                  C6002984C600298CC600318CC600428CC6003994C6004294C6004A94C60063A5
                  C6006BA5C600BDC6C600298CCE00398CCE002994CE00E7DECE00D6E7CE006BAD
                  D6003194DE005AADDE00218CE700298CE7004A9CE70073BDE7008CBDE7009CCE
                  E700ADCEE7002994EF0042A5EF004AB5EF007BBDEF00F7FFEF002994F700319C
                  F700399CF70042A5F70063ADF70052B5F700FF00FF003194FF00399CFF0042A5
                  FF004AADFF004AB5FF0052B5FF004ABDFF006BBDFF006BC6FF008CF7FF009CF7
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E1D0D0707070707072D1B091A0A0A6E6E6E6E6E
                  6E6E6E6E2401484848484848484848484848480A6E6E6E6E6E6E6E6E03484848
                  4848480B281B4848484848480A6E6E6E6E6E6E6E0A4848484848482247484848
                  484848480A6E6E6E6E6E6E6E3048484848481E6767484848484848096E6E6E6E
                  6E6E6E6E6E0648484815587A7A4848484848096E6E6E6E6E6E6E6E6E6E6E0648
                  0F2F53535748484818096E6E6E6E6E6E6E6E6E6E6E6E6E0E133B42423C48480B
                  146E6E6E6E6E6E6E6E6E6E6E6E6E6E35485C5D5D5C3E176E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E4263686F6F6963346E6E6E6E6E6E6E6E6E6E6E6E6E6E6E3A63
                  7070707070705D336E6E6E6E6E6E6E6E6E6E6E6E6E6E49707171717171716A21
                  6E6E6E6E6E6E6E6E6E6E6E6E6E366A717272767672726B2B6E6E6E6E6E6E6E6E
                  6E6E6E6E6E526B7273767476747672326E6E6E6E6E6E6E6E6E6E6E6E6E446474
                  7777776D656D6D2E6E6E6E6E6E6E6E6E6E6E6E6E6E513F545A5A494B4C4A5633
                  6E6E6E6E6E6E6E6E6E6E6E6E6E36384D5059666C5E55376E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E384C5960605F5B4E336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E40
                  4F59616043336E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E4641453D366E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
                  6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E}
                OnClick = SpeedButton8Click
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
                Hint = 'Ver registros da lixeira - [BAS093]'
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
        object tsSimulacao: TTabSheet
          Caption = 'tsSimulacao'
          ImageIndex = 3
          object pnSimulador: TPanel
            Left = 3
            Top = 0
            Width = 665
            Height = 428
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 6
              Top = 6
              Width = 649
              Height = 412
              Align = alClient
              Caption = 'Simula'#231#227'o de parcelas'
              TabOrder = 0
              object Label14: TLabel
                Left = 16
                Top = 24
                Width = 44
                Height = 13
                Caption = 'Condi'#231#227'o'
              end
              object Label15: TLabel
                Left = 215
                Top = 24
                Width = 42
                Height = 13
                Caption = 'Num Doc'
              end
              object Label16: TLabel
                Left = 342
                Top = 24
                Width = 49
                Height = 13
                Caption = 'Valor total'
              end
              object Label17: TLabel
                Left = 16
                Top = 70
                Width = 155
                Height = 13
                Caption = 'Tipo de parcelamento (Controle)'
              end
              object Label18: TLabel
                Left = 215
                Top = 70
                Width = 93
                Height = 13
                Caption = 'Dia base (Controle)'
              end
              object Label19: TLabel
                Left = 469
                Top = 24
                Width = 115
                Height = 13
                Caption = 'Modalidade (Cond. Pag)'
              end
              object Label20: TLabel
                Left = 16
                Top = 116
                Width = 147
                Height = 13
                Caption = 'Codigo cliente(dia vencimento)'
              end
              object Label21: TLabel
                Left = 185
                Top = 116
                Width = 92
                Height = 13
                Caption = 'Data (padrao hoje)'
              end
              object Label22: TLabel
                Left = 16
                Top = 189
                Width = 40
                Height = 13
                Caption = 'Parcelas'
              end
              object Label23: TLabel
                Left = 288
                Top = 116
                Width = 147
                Height = 13
                Caption = 'Considerar dia util (Cond. Pag)'
              end
              object Label28: TLabel
                Left = 459
                Top = 116
                Width = 94
                Height = 13
                Caption = 'Max Parc Adicionais'
              end
              object MaskEdit4: TMaskEdit
                Left = 16
                Top = 43
                Width = 193
                Height = 21
                TabOrder = 0
                Text = 'MaskEdit4'
                OnExit = ComboBox5Exit
              end
              object MaskEdit5: TMaskEdit
                Left = 215
                Top = 43
                Width = 121
                Height = 21
                TabOrder = 1
                Text = 'MaskEdit5'
              end
              object EditHw1: TEditHw
                Left = 342
                Top = 43
                Width = 121
                Height = 21
                TabOrder = 2
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object ComboBox4: TComboBox
                Left = 16
                Top = 89
                Width = 193
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'ComboBox4'
                Items.Strings = (
                  'I1 - Parcelas iguais e diferen'#231'a na primeira'
                  'IN - Parcelas iguais e diferen'#231'a na '#250'ltima'
                  'T1 - Truncamento de parcelas e diferen'#231'a na primeira'
                  'TN - Truncamento de parcelas e diferen'#231'a na '#250'ltima')
              end
              object ComboBox6: TComboBox
                Left = 469
                Top = 43
                Width = 164
                Height = 21
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 3
                Text = 'D - Direta'
                OnExit = ComboBox6Exit
                Items.Strings = (
                  'D - Direta'
                  'S - Fora semana'
                  'Q - Fora quinzena'
                  'M - Fora mes')
              end
              object ComboBox5: TComboBox
                Left = 215
                Top = 89
                Width = 418
                Height = 21
                ItemHeight = 13
                TabOrder = 5
                Text = 'ComboBox5'
                OnExit = ComboBox5Exit
                Items.Strings = (
                  
                    'D1 - Dia de vencimento do cliente, se n'#227'o existir ser'#225' o dia atu' +
                    'al. Mesmo dia nas demais parcelas'
                  
                    'D2 - Dia de vencimento do cliente, se n'#227'o existir o usu'#225'rio deve' +
                    ' digitar. Mesmo dia nas demais parcelas'
                  
                    'D3 - Dia atual atribuido automaticamente. Mesmo dia nas demais p' +
                    'arcelas'
                  
                    'D4 - Dia digitado pelo usu'#225'rio no momento do parcelamento. Mesmo' +
                    ' dia nas demais parcelas'
                  
                    'D5 - 30 dias acrescidos em cada vencimento. Primeiro vencimento ' +
                    'dia D+0 (hoje). Provavelmente ter'#225' dias diferentes nas demais pa' +
                    'rcelas'
                  
                    'D6 - 30 dias acrescidos em cada vencimento. Primeiro vencimento ' +
                    'dia D+30. Provavelmente ter'#225' dias diferentes nas demais parcelas'
                  'N - N'#227'o usar para este controle. Usar do config')
              end
              object SpinEdit1: TSpinEdit
                Left = 16
                Top = 135
                Width = 163
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 6
                Value = 0
              end
              object MaskEdit6: TMaskEdit
                Left = 185
                Top = 135
                Width = 98
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 7
                Text = '  /  /    '
              end
              object BitBtn7: TBitBtn
                Left = 559
                Top = 135
                Width = 75
                Height = 25
                Caption = 'Simular'
                TabOrder = 10
                OnClick = BitBtn7Click
              end
              object Memo1: TMemo
                Left = 16
                Top = 208
                Width = 617
                Height = 189
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Lucida Console'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object ComboBox7: TComboBox
                Left = 289
                Top = 135
                Width = 164
                Height = 21
                ItemHeight = 13
                TabOrder = 8
                Text = 'ComboBox7'
                OnExit = ComboBox7Exit
                Items.Strings = (
                  'N - N'#227'o'
                  'S  - Sim'
                  'S1 - Sim, somente primeira parcela'
                  'SA - Sim, antecipar vencimento'
                  'SA1 - Sim, antecipar vencimento, somente primeira parcela')
              end
              object Panel4: TPanel
                Left = 248
                Top = 255
                Width = 321
                Height = 122
                BorderWidth = 6
                TabOrder = 12
                Visible = False
                object Label25: TLabel
                  Left = 16
                  Top = 16
                  Width = 93
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Data 1'#186' parcela'
                end
                object Label26: TLabel
                  Left = 16
                  Top = 43
                  Width = 93
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Data 2'#186' parcela'
                end
                object MaskEdit7: TMaskEdit
                  Left = 115
                  Top = 13
                  Width = 77
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 0
                  Text = '  /  /    '
                end
                object MaskEdit8: TMaskEdit
                  Left = 115
                  Top = 40
                  Width = 78
                  Height = 21
                  TabOrder = 1
                  Text = '99/99/9999'
                end
                object BitBtn9: TBitBtn
                  Left = 231
                  Top = 24
                  Width = 75
                  Height = 25
                  Caption = 'Confirmar'
                  TabOrder = 2
                end
                object Panel5: TPanel
                  Left = 7
                  Top = 74
                  Width = 307
                  Height = 41
                  Align = alBottom
                  BorderWidth = 7
                  Caption = 'Panel5'
                  TabOrder = 3
                  object BitBtn10: TBitBtn
                    Left = 224
                    Top = 8
                    Width = 75
                    Height = 25
                    Align = alRight
                    Caption = 'BitBtn10'
                    TabOrder = 0
                  end
                end
              end
              object SpinEdit2: TSpinEdit
                Left = 459
                Top = 135
                Width = 94
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 9
                Value = 0
              end
            end
          end
        end
        object tsCondPagClienteVendas: TTabSheet
          Caption = 'Condi'#231#227'o Pagamento Cliente (Vendas)'
          ImageIndex = 4
          object pnCondicaoPagClienteVendas: TPanel
            Left = 1
            Top = 3
            Width = 560
            Height = 195
            TabOrder = 0
            object pnTopAlterarVendCli: TPanel
              Left = 1
              Top = 156
              Width = 558
              Height = 38
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn47: TBitBtn
                Left = 185
                Top = 4
                Width = 90
                Height = 25
                Hint = 'OK - [BAS502/BAS503]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn47Click
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
              object BitBtn53: TBitBtn
                Left = 279
                Top = 4
                Width = 90
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancelar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn53Click
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
            end
            object RadioGroup1: TRadioGroup
              Left = 1
              Top = 73
              Width = 558
              Height = 83
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Incluir controle padr'#227'o'
                'Remover controle padr'#227'o')
              TabOrder = 1
            end
            object GroupBox15: TGroupBox
              Left = 1
              Top = 1
              Width = 558
              Height = 72
              Align = alTop
              TabOrder = 2
              object DBText4: TDBText
                Left = 13
                Top = 19
                Width = 524
                Height = 17
                DataField = 'DESC_COND_PAG'
                DataSource = DtmCadBasicos.dsCondPgto
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label71: TLabel
                Left = 13
                Top = 42
                Width = 44
                Height = 13
                Caption = 'Codigo: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText5: TDBText
                Left = 63
                Top = 42
                Width = 65
                Height = 17
                DataField = 'COD_COND_PAG'
                DataSource = DtmCadBasicos.dsCondPgto
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        object tsCondPagClientePrestacoes: TTabSheet
          Caption = 'Condi'#231#227'o Pagamento Cliente (Presta'#231#245'es)'
          ImageIndex = 5
          object pnCondicaoPagClientePrestacoes: TPanel
            Left = 1
            Top = 3
            Width = 560
            Height = 195
            TabOrder = 0
            object Panel7: TPanel
              Left = 1
              Top = 156
              Width = 558
              Height = 38
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn11: TBitBtn
                Left = 185
                Top = 4
                Width = 90
                Height = 25
                Hint = 'OK - [BAS505/BAS506]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn11Click
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
              object BitBtn12: TBitBtn
                Left = 279
                Top = 4
                Width = 90
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancelar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn12Click
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
            end
            object RadioGroup2: TRadioGroup
              Left = 1
              Top = 73
              Width = 558
              Height = 83
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Incluir controle padr'#227'o'
                'Remover controle padr'#227'o')
              TabOrder = 1
            end
            object GroupBox5: TGroupBox
              Left = 1
              Top = 1
              Width = 558
              Height = 72
              Align = alTop
              TabOrder = 2
              object DBText1: TDBText
                Left = 13
                Top = 19
                Width = 524
                Height = 17
                DataField = 'DESC_COND_PAG'
                DataSource = DtmCadBasicos.dsCondPgto
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label30: TLabel
                Left = 13
                Top = 42
                Width = 44
                Height = 13
                Caption = 'Codigo: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText2: TDBText
                Left = 63
                Top = 42
                Width = 65
                Height = 17
                DataField = 'COD_COND_PAG'
                DataSource = DtmCadBasicos.dsCondPgto
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
        object tsDefinirCondPagPorEmpresa: TTabSheet
          Caption = 'tsDefinirCondPagPorEmpresa'
          ImageIndex = 6
          object pnDefinirCondPagPorEmpresa: TPanel
            Left = 16
            Top = 32
            Width = 704
            Height = 286
            BevelOuter = bvSpace
            TabOrder = 0
            object Panel12: TPanel
              Left = 1
              Top = 1
              Width = 702
              Height = 41
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'DEFINIR CONDI'#199#213'ES DE PAGAMENTO POR EMPRESA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object pnDefinirControlePorEmpresaBottom: TPanel
              Left = 1
              Top = 253
              Width = 702
              Height = 32
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnMultiempresaOK: TBitBtn
                Left = 271
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK - [BAS515/BAS516]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnMultiempresaOKClick
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
              object btnMultiempresaCancelar: TBitBtn
                Left = 352
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnMultiempresaCancelarClick
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
            end
            object pnDefinirCondPagPorEmpresaTop: TPanel
              Left = 1
              Top = 42
              Width = 702
              Height = 31
              Align = alTop
              BevelOuter = bvNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object btSelectAllDefControleEmpresa: TSpeedButton
                Left = 643
                Top = 6
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
                OnClick = btSelectAllDefControleEmpresaClick
              end
              object btUnSelectAllDefControleEmpresa: TSpeedButton
                Left = 672
                Top = 6
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
                OnClick = btUnSelectAllDefControleEmpresaClick
              end
            end
            object DBGridDefinirControlePorEmpresa: TDBGrid
              Left = 1
              Top = 73
              Width = 702
              Height = 180
              Align = alClient
              DataSource = DtmCadBasicos.dsEmpresaDefCondPag
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridDefinirControlePorEmpresaCellClick
              OnDrawColumnCell = DBGridDefinirControlePorEmpresaDrawColumnCell
              OnKeyDown = DBGridDefinirControlePorEmpresaKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SEL'
                  Title.Caption = 'Sel'
                  Width = 18
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IDENTIFICACAO_EMP'
                  Width = 514
                  Visible = True
                end>
            end
          end
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
    Left = 590
    Top = 59
    object MarcarTodasCondPagClick: TMenuItem
      Caption = 'Marcar Todas Condi'#231#245'es de Pagamento'
      OnClick = MarcarTodasCondPagClickClick
    end
    object DesmarcarTodasCondPagClick: TMenuItem
      Caption = 'Desmarcar Todas Condi'#231'oes de Pagamento'
      OnClick = DesmarcarTodasCondPagClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 654
    Top = 59
  end
  inherited Timer1: TTimer
    Left = 622
    Top = 59
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 270
    Top = 11
  end
end
