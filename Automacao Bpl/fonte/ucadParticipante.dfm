inherited frmCadParticipante: TfrmCadParticipante
  Caption = 'Participantes'
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
                Caption = 'Dados Pessoais'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 401
                    Caption = 'Dados do participante'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ExplicitHeight = 401
                    object Label6: TLabel
                      Left = 90
                      Top = 26
                      Width = 41
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 246
                      Top = 26
                      Width = 35
                      Height = 13
                      Caption = 'Nome:'
                      FocusControl = DBEdit2
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 394
                      Top = 50
                      Width = 55
                      Height = 13
                      Caption = 'Endere'#231'o:'
                      FocusControl = DBEdit3
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 89
                      Top = 106
                      Width = 41
                      Height = 13
                      Caption = 'Cidade:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 610
                      Top = 104
                      Width = 41
                      Height = 13
                      Caption = 'Estado:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 261
                      Top = 155
                      Width = 94
                      Height = 13
                      Caption = 'Fone de contato:'
                      FocusControl = DBEdit7
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 108
                      Top = 159
                      Width = 23
                      Height = 13
                      Caption = 'CPF:'
                      FocusControl = DBEdit8
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 317
                      Top = 131
                      Width = 38
                      Height = 13
                      Caption = 'E-mail:'
                      FocusControl = DBEdit14
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 101
                      Top = 133
                      Width = 30
                      Height = 13
                      Caption = 'Fone:'
                      FocusControl = DBEdit15
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 61
                      Top = 216
                      Width = 70
                      Height = 13
                      Caption = 'Observa'#231#227'o:'
                      FocusControl = DBMemo1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 93
                      Top = 79
                      Width = 37
                      Height = 13
                      Caption = 'Bairro:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 108
                      Top = 52
                      Width = 23
                      Height = 13
                      Caption = 'CEP:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 69
                      Top = 184
                      Width = 62
                      Height = 13
                      Caption = 'Data Nasc.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 232
                      Top = 45
                      Width = 156
                      Height = 22
                      Caption = 'Consultar na &Internet'
                      Glyph.Data = {
                        1A030000424D1A030000000000001A0200002800000010000000100000000100
                        08000000000000010000120B0000120B0000790000007900000000000000FFFF
                        FF00FF00FF007A5A5A00F6F2F200F4F0F000FCFBFB00FBFAFA00B49796008E5D
                        59008C5C5800895A56008A5B5700A3807D00D3C5C4009F7A7600A07F7B00997D
                        7A008A676200A9786F008B645D0090696300A77F780097726C0087554A009765
                        5A008C675E0091675B00936B6000A5766800AF867900AC847800A9837500BF9F
                        93009F776700AB877900EBE1DC00AF8B7800A4592D00B0886F00A5877500EDE0
                        D800A0674200C59D8200C1997F00BA763F00D3AD8A00F7E0CB00FEF0E300FCD0
                        A400FBCFA400FFF2E500D5812700F3B67200EFBC8300FBD4AB00FED9B200F0BB
                        7B00EFC59200F0D1AB00D0B69600F3C07E00F7C58300EFC18700E9C49500FCD9
                        AB00E2C49900FFE7C400E7D8C200FAEEDD00F3D09600EACF9E00FFE5A500EEE2
                        C000FFF8E500FFEAAB00F7E6B200FFEDAB00FFFCF000FAF2C200FFF7C100FAF7
                        D500FEFBCB00FFFCCF00FFFED500FFFEE900FFFFC900FFFFCE00FFFFD100FFFF
                        D400FFFFD500FFFFDA00FFFFDC00FFFFDE00FCFCE000F4FBFB00DAF8FF00F0F8
                        FB00869AA500CCEBFE00D8EFFE004A93C700C0E0F70036A3FB0038A5FF003AA7
                        FF003F7FBB005EA7E9003996EF003A96ED003F93E50062686E000F6CD3001177
                        E3001174E1004883C5004B66870048638700445C7B005D677E00FEFEFE000202
                        020202020202020202020202766F020202020202020202020202027571650202
                        020202020202020202027472696D02020202020202020202027770686C020909
                        0909090A131E1F19036A6773020209413231271644545C49250D620B02020943
                        38371C245D565850481D28090202094A3A34205E57575A4C3E2E1A0C0202094E
                        3330235B5759533F3542120C020209013B342251524F46364B2B110902020901
                        0101103C4D393D5529140E09020209017878050F2C40472118262F0902020901
                        787878040817151B2A2D45090202090178787878787801666B6E600902020906
                        070707070707076164635F09020209090909090909090909090909090202}
                      OnClick = SpeedButton15Click
                    end
                    object Label15: TLabel
                      Left = 254
                      Top = 184
                      Width = 101
                      Height = 13
                      Caption = 'Porc. Venda Prod.:'
                      FocusControl = DBEdit10
                    end
                    object DBEdit1: TDBEdit
                      Left = 137
                      Top = 21
                      Width = 89
                      Height = 21
                      Hint = 'C'#243'digo do Participante'
                      DataField = 'COD_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 282
                      Top = 21
                      Width = 432
                      Height = 21
                      Hint = 'Nome do Participante'
                      CharCase = ecUpperCase
                      DataField = 'NOME_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 455
                      Top = 46
                      Width = 259
                      Height = 21
                      Hint = 'Endere'#231'o resid'#234'ncial'
                      CharCase = ecUpperCase
                      DataField = 'END_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit7: TDBEdit
                      Left = 361
                      Top = 154
                      Width = 110
                      Height = 21
                      Hint = 'Telefone de Contato'
                      DataField = 'FONE_CONTATO'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                    end
                    object DBEdit8: TDBEdit
                      Left = 137
                      Top = 154
                      Width = 110
                      Height = 21
                      Hint = 'CPF: numero do documento de Cadastro de Pessoa f'#237'sica'
                      DataField = 'CPF_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                      OnExit = DBEdit8Exit
                    end
                    object DBEdit14: TDBEdit
                      Left = 361
                      Top = 128
                      Width = 353
                      Height = 21
                      Hint = 'E-mail.'
                      DataField = 'EMAIL'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                    end
                    object DBEdit15: TDBEdit
                      Left = 137
                      Top = 128
                      Width = 110
                      Height = 21
                      Hint = 'Telefone '
                      DataField = 'FONE_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBMemo1: TDBMemo
                      Left = 137
                      Top = 209
                      Width = 577
                      Height = 119
                      Hint = 'Observa'#231#245'es do Colaborador'
                      DataField = 'OBS_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 657
                      Top = 101
                      Width = 55
                      Height = 21
                      Hint = 'Estado'
                      DataField = 'CODIGO_UF'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'CODIGO_UF'
                      ListField = 'SIGLA_UF'
                      ListSource = dtmColaborador.dsUF
                      ParentFont = False
                      TabOrder = 8
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 187
                      Top = 100
                      Width = 409
                      Height = 21
                      Hint = 'Cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_CIDADE'
                      ListField = 'NOME_CIDADE'
                      ListSource = dtmColaborador.dsCidades
                      ParentFont = False
                      TabOrder = 7
                      OnDropDown = DBLookupComboBox3DropDown
                      OnKeyDown = DBLookupComboBox3KeyDown
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 187
                      Top = 73
                      Width = 409
                      Height = 21
                      Hint = 'Bairro'
                      DataField = 'COD_BAIRRO'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_BAIRRO'
                      ListField = 'NOME_BAIRRO'
                      ListSource = dtmColaborador.dsBairro
                      ParentFont = False
                      TabOrder = 5
                      OnDropDown = DBLookupComboBox4DropDown
                      OnKeyDown = DBLookupComboBox4KeyDown
                    end
                    object DBEdit4: TDBEdit
                      Left = 137
                      Top = 47
                      Width = 89
                      Height = 21
                      Hint = 
                        '[F3: Consultar] [F4: Novo]  - CEP: C'#243'digo de endere'#231'amento Posta' +
                        'l'
                      DataField = 'CEP_PARTICIPANTE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 137
                      Top = 181
                      Width = 110
                      Height = 21
                      Hint = 'Data de dascimento'
                      DataField = 'DAT_NASC_PART'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                    end
                    object DBEdit34: TDBEdit
                      Left = 136
                      Top = 74
                      Width = 49
                      Height = 21
                      DataField = 'COD_BAIRRO'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnExit = DBEdit34Exit
                      OnKeyDown = DBEdit34KeyDown
                    end
                    object DBEdit38: TDBEdit
                      Left = 136
                      Top = 100
                      Width = 48
                      Height = 21
                      DataField = 'COD_CIDADE'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                      OnExit = DBEdit38Exit
                      OnKeyDown = DBEdit38KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 361
                      Top = 181
                      Width = 110
                      Height = 21
                      Hint = 'Porcentagem no valor de venda de Pe'#231'as'
                      DataField = 'PC_VEND_PROD'
                      DataSource = dtmColaborador.dsParticipante
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
                object QuickRep1: TQuickRep
                  Left = -12
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = dtmColaborador.cdsParticipante
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
                  ReportTitle = 'Relat'#243'rio de Participantes'
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoomToFit
                  PreviewDefaultSaveType = stQRP
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 113
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
                      Left = -24
                      Top = 0
                      Width = 94
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        -63.500000000000000000
                        0.000000000000000000
                        248.708333333333300000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'COD_PARTICIPANTE'
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
                    object QRDBText2: TQRDBText
                      Left = 69
                      Top = 0
                      Width = 100
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        182.562500000000000000
                        0.000000000000000000
                        264.583333333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'NOME_PARTICIPANTE'
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
                      Left = 178
                      Top = 1
                      Width = 93
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        470.958333333333400000
                        2.645833333333333000
                        246.062500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'END_PARTICIPANTE'
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
                      Left = 313
                      Top = 1
                      Width = 109
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        828.145833333333200000
                        2.645833333333333000
                        288.395833333333400000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'CIDADE_PARTICIPANTE'
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
                      Left = 436
                      Top = 0
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1153.583333333333000000
                        0.000000000000000000
                        121.708333333333300000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'SIGLA_UF'
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
                      Left = 488
                      Top = 0
                      Width = 92
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1291.166666666667000000
                        0.000000000000000000
                        243.416666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsParticipante
                      DataField = 'CPF_PARTICIPANTE'
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
                  object PageHeaderBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 75
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
                      198.437500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 168
                      Top = 6
                      Width = 341
                      Height = 28
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        74.083333333333340000
                        444.500000000000000000
                        15.875000000000000000
                        902.229166666666800000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'RELAT'#211'RIO DE PARTICIPANTES'
                      Color = clWhite
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'Arial Black'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 14
                    end
                    object QRLabel2: TQRLabel
                      Left = 0
                      Top = 59
                      Width = 40
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
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'digo'
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
                    object QRLabel3: TQRLabel
                      Left = 69
                      Top = 58
                      Width = 34
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        182.562500000000000000
                        153.458333333333300000
                        89.958333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Nome'
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
                    object QRLabel4: TQRLabel
                      Left = 178
                      Top = 59
                      Width = 55
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        470.958333333333400000
                        156.104166666666700000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Endere'#231'o'
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
                    object QRLabel5: TQRLabel
                      Left = 313
                      Top = 59
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        828.145833333333200000
                        156.104166666666700000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Cidade'
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
                    object QRLabel6: TQRLabel
                      Left = 442
                      Top = 58
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1169.458333333333000000
                        153.458333333333300000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Estado'
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
                    object QRLabel7: TQRLabel
                      Left = 489
                      Top = 58
                      Width = 23
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1293.812500000000000000
                        153.458333333333300000
                        60.854166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'CPF'
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
                    object QRSysData2: TQRSysData
                      Left = 0
                      Top = 40
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        105.833333333333300000
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
                    object QRLabel8: TQRLabel
                      Left = 593
                      Top = 52
                      Width = 28
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1568.979166666667000000
                        137.583333333333300000
                        74.083333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Fone'
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
                  end
                  object SummaryBand1: TQRBand
                    Left = 38
                    Top = 140
                    Width = 718
                    Height = 29
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
                      76.729166666666680000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageFooter
                    object QRSysData1: TQRSysData
                      Left = 625
                      Top = 6
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1653.645833333333000000
                        15.875000000000000000
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
                  end
                  object QRDBText7: TQRDBText
                    Left = 631
                    Top = 113
                    Width = 76
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1669.520833333333000000
                      298.979166666666700000
                      201.083333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmColaborador.cdsParticipante
                    DataField = 'FONE_CONTATO'
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
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [COL008]'
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
            object btSelectAll: TSpeedButton [6]
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS393]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro -  [BAS394]'
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
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS395]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS396]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS401]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton4Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS398]'
                OnClick = SpeedButton5Click
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
                Hint = 'Ver registros da lixeira - [BAS400]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
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
    Left = 728
    ExplicitLeft = 728
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    object MarcarTodosParticipantesClick: TMenuItem
      Caption = 'Marcar Todos Participantes'
      OnClick = MarcarTodosParticipantesClickClick
    end
    object DesmarcarTodosParticipantesClick: TMenuItem
      Caption = 'Desmarcar Todos Participantes'
      OnClick = DesmarcarTodosParticipantesClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 550
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 518
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 486
    Top = 11
  end
end
