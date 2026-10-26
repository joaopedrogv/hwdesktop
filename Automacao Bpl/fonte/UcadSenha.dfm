inherited frmCadSenha: TfrmCadSenha
  Caption = 'Senhas'
  Scaled = False
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    BevelOuter = bvNone
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 545
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 545
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 545
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            ExplicitWidth = 787
            ExplicitHeight = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ExplicitWidth = 787
              ExplicitHeight = 466
              inherited TabSheet3: TTabSheet
                Caption = '&Dados Usu'#225'rio'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 435
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  ExplicitWidth = 779
                  ExplicitHeight = 435
                  inherited GroupBox1: TGroupBox
                    Width = 758
                    Height = 432
                    Caption = 'Dados Usu'#225'rio'
                    OnEnter = GroupBox1Enter
                    ExplicitWidth = 758
                    ExplicitHeight = 432
                    object Label6: TLabel
                      Left = 90
                      Top = 62
                      Width = 36
                      Height = 13
                      Caption = 'Usu'#225'rio'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 26
                      Top = 37
                      Width = 100
                      Height = 13
                      Caption = 'Nome do Funcion'#225'rio'
                    end
                    object Label8: TLabel
                      Left = 96
                      Top = 89
                      Width = 30
                      Height = 13
                      Caption = 'Senha'
                    end
                    object Label9: TLabel
                      Left = 233
                      Top = 89
                      Width = 89
                      Height = 13
                      Caption = 'Confirmar a Senha'
                    end
                    object Label10: TLabel
                      Left = 57
                      Top = 116
                      Width = 69
                      Height = 13
                      Caption = 'Departamento'
                    end
                    object Label12: TLabel
                      Left = 61
                      Top = 145
                      Width = 65
                      Height = 13
                      Caption = 'Est. Negativo'
                    end
                    object Label13: TLabel
                      Left = 250
                      Top = 147
                      Width = 51
                      Height = 13
                      Caption = 'Modo Imp.'
                    end
                    object Label14: TLabel
                      Left = 231
                      Top = 172
                      Width = 70
                      Height = 13
                      Caption = 'Alt. Cabe'#231'alho'
                    end
                    object Label15: TLabel
                      Left = 52
                      Top = 170
                      Width = 74
                      Height = 13
                      Caption = 'Alt. Impressora'
                    end
                    object Label11: TLabel
                      Left = 455
                      Top = 62
                      Width = 162
                      Height = 13
                      Caption = 'Usu'#225'rio padr'#227'o da empresa: '
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 47
                      Top = 382
                      Width = 79
                      Height = 13
                      Caption = 'Mens. Consorcio'
                    end
                    object Label17: TLabel
                      Left = 305
                      Top = 116
                      Width = 70
                      Height = 13
                      Caption = 'Liberar Acesso'
                    end
                    object Label18: TLabel
                      Left = 19
                      Top = 356
                      Width = 107
                      Height = 13
                      Caption = 'Perfil Hor'#225'rio Trabalho'
                    end
                    object DBEdit1: TDBEdit
                      Left = 132
                      Top = 59
                      Width = 317
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'USUARIO'
                      DataSource = DtmCadBasicos.dsSenha
                      TabOrder = 1
                      OnExit = DBEdit1Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 132
                      Top = 32
                      Width = 317
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = DtmCadBasicos.dsSenha
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmCadBasicos.dsColaborador
                      TabOrder = 0
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 132
                      Top = 113
                      Width = 154
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DEPART'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      TabOrder = 4
                      OnKeyPress = DBComboBox1KeyPress
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 132
                      Top = 140
                      Width = 84
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ESTOQ_NEG'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 6
                      OnKeyPress = DBComboBox2KeyPress
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 307
                      Top = 169
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ALT_CAB'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 9
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 132
                      Top = 167
                      Width = 84
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ALT_IMP'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 8
                      OnKeyPress = DBComboBox4KeyPress
                    end
                    object DBRadioGroup1: TDBRadioGroup
                      Left = 132
                      Top = 194
                      Width = 476
                      Height = 151
                      Caption = 'Niveis de Usu'#225'rios'
                      Columns = 2
                      DataField = 'NIVEL_US'
                      DataSource = DtmCadBasicos.dsSenha
                      Items.Strings = (
                        'N'#237'vel 1  - Usu'#225'rios Comuns'
                        'N'#237'vel 2  - Usu'#225'rios Avan'#231'ados'
                        'N'#237'vel 3  - Usu'#225'rios Super-Avan'#231'ados'
                        'N'#237'vel 4  - Usu'#225'rios Gerenciais'
                        'N'#237'vel 5  - Usu'#225'rio Mestre'
                        'N'#237'vel 6  - Usu'#225'rio Personalizado'
                        'N'#237'vel 7  - Usu'#225'rio Personalizado'
                        'N'#237'vel 8  - Usu'#225'rio Personalizado'
                        'N'#237'vel 9  - Usu'#225'rio Personalizado'
                        'N'#237'vel 10 - Usu'#225'rio Diretoria')
                      ParentBackground = True
                      TabOrder = 10
                      Values.Strings = (
                        '1'
                        '2'
                        '3'
                        '4'
                        '5'
                        '6'
                        '7'
                        '8'
                        '9'
                        '10')
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 307
                      Top = 142
                      Width = 145
                      Height = 21
                      DataField = 'IMP_US'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'Epson'
                        'Grafico'
                        'HP'
                        'Personalizado'
                        'Rima')
                      TabOrder = 7
                      OnKeyPress = DBComboBox5KeyPress
                    end
                    object Edit1: TEdit
                      Left = 132
                      Top = 86
                      Width = 95
                      Height = 21
                      CharCase = ecUpperCase
                      MaxLength = 6
                      PasswordChar = '*'
                      TabOrder = 2
                    end
                    object Edit2: TEdit
                      Left = 328
                      Top = 86
                      Width = 121
                      Height = 21
                      CharCase = ecUpperCase
                      MaxLength = 6
                      PasswordChar = '*'
                      TabOrder = 3
                    end
                    object BitBtn9: TBitBtn
                      Left = 458
                      Top = 142
                      Width = 150
                      Height = 46
                      Caption = 'Aplicativos'
                      TabOrder = 11
                      OnClick = BitBtn9Click
                      Glyph.Data = {
                        8A050000424D8A050000000000004A0300002800000018000000180000000100
                        08000000000040020000120B0000120B0000C5000000C500000000000000FFFF
                        FF00FF00FF00FFFEFF00FFFCFC008C381600874F3500FFFAF700BB530B00B65C
                        2200FFFCFA00CB5C0700C75B0A00C5692700995F3500D9782800DD6C0A005A35
                        1300F3A96600FFEFE000FFF4EA00E98728005A36130069421D00FBAF6600684D
                        3300684E3400684F3600684F3700FFCC9800FECC9900FECF9F00FED0A100FFD1
                        A400FED1A300FED1A400FED4A900FED5AC00FFD8B000FFD9B200FFDAB400FFDA
                        B500FEDAB500FFDDBA00FFDEBC00FFDEBD00FFE0C100FFE3C700FFE7CF00FEE7
                        D000FFE9D300FFEBD700D0C1B200FFF2E500FFF3E700D0C6BC00FFF4E900FFFB
                        F700D5812700623F1A0062401B0062401C0062411C00684F350068503700FECB
                        9600846A4E007D654A00FECC9700FECC9800FECE9900FECE9A00FECE9C00FECF
                        9C00FECF9D00FED09D00FFD09F00FECF9E00FED09E00FED09F00FED0A000FED1
                        A100FED3A300FFD3A500FED3A400FED3A500FED4A500FFD4A700FED3A600FED4
                        A700FED5A900FED5AA00FFD7AC00FED7AB00FFD8AD00FED7AC00FED7AD00FED8
                        AD00FFD8AF00FED8AF00FED9B000FED9B200FEDAB200FEDCB600FFDDB800FEDC
                        B700FEDDB800FEDDBA00FEDEBB00FEDEBC00FFE0BF00FEE0BF00FFE1C100FFE1
                        C200FFE2C200FFE2C400FFE3C500FEE2C400FFE3C600FEE3C500FEE3C600FFE5
                        C900FEE5C900FFE6CB00FEE5CA00FEE6CB00FEE6CC00FFE7CE00FEE7CE00FFEA
                        D300D0BFAC00FFEAD400FFEBD500FEEAD500FFEDD900FEEDDA00FFEEDC00FFEF
                        DE00FEF0E100FFF3E600FEF2E500FFF7EE0081634100FED7AA00FAD7AC00FEDC
                        B500FEDDB700FEE0BC00FEE0BD00FEE1BF00FEE1C000FAE0C000FFE9CF00FEE9
                        D000FEE9D100FEEAD300FEEBD500FFEDD800FFEEDA00FEEDD900FFF2E200FFF8
                        F000F8DDBA00FAE1C100FAE6CC00FEEEDA00CFC6BA00D0C9C000FFFBF600F0D0
                        A300F0D0A400F0D1A400F0D1A500F0D3A900F0D4AA00998C7A00FEF6EB00D0CB
                        C400FFFAF300EEE9E200E3AF5D00FAEAD10065646200FFFEFC00645D41009F9E
                        9A00919190007F8C7900004B00005E817A0081FFFE00D0D7D700E7EBEB0095E9
                        FF0000BDFF00E7EAEB003553C700020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020205050505050505050505
                        050505050505050505050505050505388CA3ACA901019072946A292625595450
                        4A471D41410505B0343C171743B301762E2C69275E5B58224F491E444105058D
                        1AB80101BB43017A73952B67645F2455204B4745410505A111BFC3010117A97E
                        3A3A3A3A3A3A3A3A3A3A3A46450505B211BFBFC00117AA307A74966C6765605A
                        55224E481E0505A83F42BFBF8E3BA2327F2F726F6B91645C2421514D47050539
                        373F111119828783317B7870939266638F58544C4A05050A07B5AEAB0101979D
                        9B807C736E6C6765615A56511F050504A73EB6B6BA0101A5849A7E2F71946B29
                        645D5723500505B71CBDC2C2C1BA01898685987D77966D6965625B5852050503
                        16C2BCBCC2B6AB8A3A3A3A3A3A3A3A3A3A3A3A245305050116BEBCBCC2B6AD35
                        139E9C997E2F712D682863255705050140B901C2AF3DA436A0899F83987C7796
                        6C6965605B050501B14016161BA68D148B8A8833818079756F2B2A645C0505B4
                        B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B40505080B0B0B0B0B0B0B0B
                        0B0B0B0B0B18151018150EC4080505090D0D0D0D0D0D0D0D0D0D0D0D0D120F0C
                        180F06C409050205050505050505050505050505050505050505050505020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202}
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 132
                      Top = 379
                      Width = 84
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'EXIBIR_MENSAGEM_CONSORCIO'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 13
                      OnKeyPress = DBComboBox4KeyPress
                    end
                    object DBComboBox7: TDBComboBox
                      Left = 383
                      Top = 113
                      Width = 69
                      Height = 21
                      DataField = 'LIBERAR_ACESSO'
                      DataSource = DtmCadBasicos.dsSenha
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 5
                      OnKeyPress = DBComboBox5KeyPress
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 132
                      Top = 352
                      Width = 317
                      Height = 21
                      DataField = 'COD_PERFIL_HORAS_TRAB'
                      DataSource = DtmCadBasicos.dsSenha
                      KeyField = 'CODIGO'
                      ListField = 'DESCRICAO'
                      ListSource = DtmCadBasicos.dsPerfilHorasTrabalhoCons
                      TabOrder = 12
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
                object QuickRep1: TQuickRep
                  Left = 1
                  Top = -24
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  DataSet = DtmCadBasicos.cdsSenha
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
                  ReportTitle = 'Rela'#231#227'o de Usu'#225'rios do Sistema'
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
                    Height = 80
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
                      211.666666666666700000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 192
                      Top = 8
                      Width = 299
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        508.000000000000000000
                        21.166666666666670000
                        791.104166666666800000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Rela'#231#227'o de Usu'#225'rios do Sistema'
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
                      Top = 45
                      Width = 716
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        119.062500000000000000
                        1894.416666666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 72
                      Width = 716
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        190.500000000000000000
                        1894.416666666667000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRLabel2: TQRLabel
                      Left = 8
                      Top = 32
                      Width = 65
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        21.166666666666670000
                        84.666666666666680000
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
                    object QRMBLabel1: TQRMBLabel
                      Left = 595
                      Top = 32
                      Width = 47
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1574.270833333333000000
                        84.666666666666680000
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
                      FontSize = 10
                    end
                    object QRSysData1: TQRSysData
                      Left = 648
                      Top = 32
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1714.500000000000000000
                        84.666666666666680000
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
                      Left = 79
                      Top = 32
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        209.020833333333300000
                        84.666666666666680000
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
                    object QRLabel3: TQRLabel
                      Left = 64
                      Top = 58
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        169.333333333333300000
                        153.458333333333300000
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
                    object QRLabel4: TQRLabel
                      Left = 145
                      Top = 58
                      Width = 49
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        383.645833333333400000
                        153.458333333333300000
                        129.645833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Usu'#225'rio'
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
                      Left = 256
                      Top = 58
                      Width = 33
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        677.333333333333400000
                        153.458333333333300000
                        87.312500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'N'#237'vel'
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
                      Left = 320
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
                        846.666666666666600000
                        153.458333333333300000
                        89.958333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Dpto.'
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
                      Left = 409
                      Top = 58
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1082.145833333333000000
                        153.458333333333300000
                        179.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Modo Imp.'
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
                    object QRLabel8: TQRLabel
                      Left = 512
                      Top = 58
                      Width = 90
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1354.666666666667000000
                        153.458333333333300000
                        238.125000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Data Cadastro'
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
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 118
                    Width = 718
                    Height = 23
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
                      60.854166666666680000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = 64
                      Top = 1
                      Width = 52
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        169.333333333333300000
                        2.645833333333333000
                        137.583333333333300000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'CODIGO'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 145
                      Top = 1
                      Width = 59
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        383.645833333333400000
                        2.645833333333333000
                        156.104166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'USUARIO'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText3: TQRDBText
                      Left = 245
                      Top = 1
                      Width = 63
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        648.229166666666800000
                        2.645833333333333000
                        166.687500000000000000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'NIVEL_US'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText4: TQRDBText
                      Left = 320
                      Top = 1
                      Width = 53
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        846.666666666666600000
                        2.645833333333333000
                        140.229166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'DEPART'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText5: TQRDBText
                      Left = 421
                      Top = 1
                      Width = 49
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1113.895833333333000000
                        2.645833333333333000
                        129.645833333333300000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'IMP_US'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText6: TQRDBText
                      Left = 512
                      Top = 1
                      Width = 85
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1354.666666666667000000
                        2.645833333333333000
                        224.895833333333300000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsSenha
                      DataField = 'DATA_CAD_S'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                end
              end
              object tsSistemas: TTabSheet
                Caption = 'Sistemas'
                ImageIndex = 2
                object GroupBox4: TGroupBox
                  Left = 3
                  Top = 4
                  Width = 775
                  Height = 431
                  Caption = 'Cadastro de Sistemas para Usu'#225'rios'
                  TabOrder = 0
                  object DBGrid2: TDBGrid
                    Left = 92
                    Top = 23
                    Width = 591
                    Height = 130
                    DataSource = DtmCadBasicos.dsErp
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = DBGrid2DblClick
                    OnKeyDown = DBGrid2KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COD_APLICATIVO'
                        Width = 42
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_APLICATIVO'
                        Width = 506
                        Visible = True
                      end>
                  end
                  object DBGrid3: TDBGrid
                    Left = 92
                    Top = 213
                    Width = 591
                    Height = 130
                    DataSource = DtmCadBasicos.dsSenhas_erp
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = DBGrid3DblClick
                    OnKeyDown = DBGrid3KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'Aplicativo'
                        Width = 542
                        Visible = True
                      end>
                  end
                  object BitBtn7: TBitBtn
                    Left = 305
                    Top = 170
                    Width = 164
                    Height = 25
                    Hint = 'Incluir Aplicativo'
                    Caption = 'Incluir'
                    Default = True
                    TabOrder = 2
                    OnClick = BitBtn7Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000010000B5847300AD73
                      8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                      D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                      FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                      1111111111111111111111111101020202020202020202020211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      13131313131313130211111112121210101010101010101002111111120D120C
                      0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                      120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                      0808080806000211111111111212120707070707050011111111}
                  end
                  object BitBtn8: TBitBtn
                    Left = 305
                    Top = 360
                    Width = 164
                    Height = 25
                    Hint = 'Excluir Aplicativo'
                    Cancel = True
                    Caption = 'Excluir'
                    TabOrder = 3
                    OnClick = BitBtn8Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000220B0000220B000000010000000100000031DE000031
                      E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                      0404040404040404000004000004040404040404040404000004040000000404
                      0404040404040000040404000000000404040404040000040404040402000000
                      0404040400000404040404040404000000040000000404040404040404040400
                      0101010004040404040404040404040401010204040404040404040404040400
                      0201020304040404040404040404030201040403030404040404040404050203
                      0404040405030404040404040303050404040404040303040404040303030404
                      0404040404040403040403030304040404040404040404040404030304040404
                      0404040404040404040404040404040404040404040404040404}
                  end
                  object BitBtn10: TBitBtn
                    Left = 597
                    Top = 395
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 4
                    OnClick = BitBtn10Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                      0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                      0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                      1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                      3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                      5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                      2828281F05002828282828282828282828282817050713282828282828282828
                      2828282817060715282828282828282828282828281507062328280004040404
                      040404232828000701282802090807070707061B28282706062328040B090711
                      2727272828282800071328060D070A07232828282828281C070128070E13020B
                      082028282828281C0701280F101D28020D0818282828280107132816191E2828
                      140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                      282827140808041B282828282828282828282828282828282828282828282828
                      2828282828282828282828282828282828282828282828282828}
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              ExplicitTop = 466
              ExplicitWidth = 787
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 765
            end
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
              Hint = 'Clique para pesquisar - [CFG022]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CFG023]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 441
            ExplicitWidth = 787
            ExplicitHeight = 441
            inherited Splitter1: TSplitter
              Height = 380
              ExplicitTop = 57
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'USUARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SENHA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_US'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NIVEL_US'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTOQ_NEG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTRA_SENHA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DEPART'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMAGENS_US'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMP_US'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_CAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALT_IMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_CAD_S'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOD_S'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CFG026]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CFG027]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [CFG028]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CFG030]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Importar usu'#225'rio de outra empresa - [CFG045]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8F6FAF3EBF7ECDDF2E4CCEE
                  DCBBEAD2A7E0CFB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F1EBD7F8F0E5F3EAD9EFE2C9ECDCBCE9D5AEE4CD9CDFC388DDBF80DDC07FDBBD
                  7ADBBB76DBB975DBBA76DCBA73CBB284F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFE4D6B1DBCB9ADAC897DAC591DEC892DFC991E0C991E2CC95
                  E4CF98E6D19CE8D5A0EAD8A4EDDCA9EFE1AEF3E8B2DCD1AFFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8D5F1EBD7F5F0DEF7F5E3FBF9E8FF
                  FFEDFFFFECFAF9E1FAF7DBF8F5D7F8F5D2F7F3CDF7F1C7F7F0C3F9F2C2DACFA9
                  D9BA7FD8C6A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EBD7F1EBD7F6F0
                  E8EFE4D7E7D7C5DEC8B2E2C4A6FBF0D4F7F3D6F7F1D2F7F1CDF6F1C9F5EFC5F5
                  EEC0F8F1C2D9CCA5D3B16CD2BF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FED1A4FFD2A4A25D3B9E5B369F5D389A5835C27C4CFFEECDF8F9DFF7F7D8F7F7
                  D4F6F6D0F6F6CCF6F5C8F8F5C5DBD2ADF1ECBCDED5BBF8F0E6F4F2F2FFFFFFFF
                  FFFFFFFFFFFFFFFFFED1A4FED1A4A25D3B9C5F3FA56846AA6D49F4B57BF9D0A9
                  F4C7A0F4C49BF4C096F4BD92F4B98EF3B68AF6B489DAAF8DF1EFC0D5C59BDAB6
                  68D4C9B8FFFFFFFFFFFFFFFFFFFFFFFFF3BF99F7BF8CA25D3BA25D3B9C5F3FA2
                  5D3BFFC386F4BF93F0B283F1B384F0B384F0B384F0B284F0B384F3B484D9AF8B
                  F1F0C1D7C9A1E7CE8CD8CFC0FFFFFFFFFFFFFFFFFFFFFFFFF0BB93F5B381A25D
                  3BB26B44A25D3BA6613EFFB275F2B788EDAA77EDAB78EDAB78EDAB77EDAB78EE
                  AC7BF1AE7CD8AD88F0E5B8DCCDA9FAF6C2DBD5C8FFFFFFFFFFFFFFFFFFFFFFFF
                  ECB286F5AA79A25D3B9C4E2DA3512DAA552FA25D3BEFAB7BE7A068E8A06AE8A0
                  69E8A06AEAA46FECA974F1AE7CD7A782EDAF85DAB795F8F5BFDAD4C7FFFFFFFF
                  FFFFFFFFFFFFFFFFE9AC7CF39059A25D3BB75D37AA5837AB5A3AA25D3BEDA371
                  E4975CE5975DE5995EE79D63E9A26DECAA76F1B07ED8A984EAAD7ED9B894F9F9
                  C3DAD5C8FFFFFFFFFFFFFFFFFFFFFFFFE5A06BEC8A52F28650F88D54DE7E4FF0
                  8955F98D56EC9C66E28E4EE49152E7975BE99E64ECA670F0AD7AF5B685DBAC88
                  E8A878D9AF8AF8D09FDBCEC2FFFFFFFFFFFFFFFFFFFFFFFFF4D7C2F4D5BDE0A8
                  7AE1A67ADB9F73C9946ECB956ECF976FD69E76D5A27AD8A47CDCAA84DFB18FE3
                  BA99E9C2A3C49D7EEBAA79D7A883F5B282DACABEFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFE49C62F88953A25D3BB6542DA0492BA25D3BFD864BE7A16FDF92
                  57DF9157DE9359DE965EDE9A67E6A574F3B381D7A783F2AF7ADAC9BDFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8B4BEB8C55ED8D58F4945CEB8F59F8965D
                  F4925BE99A60E28E4EE59254E8995DEBA068EFAA74F1B07EF6B98AD8AA86F1AA
                  75DAC9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9DDF9EADEE6AA77E9
                  9E71D6966EBB8566C08A69C88F6DDFA27AD7A57ED9A47CDBA981DDAE8ADFB493
                  E2BA9BCB9B76F3AD77DAC9BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE09152FA6C30A25D3BA25D3BB34A23A25D3BFE7D43E59D64E49051E4
                  9154E69659E89B61EBA36CF0AD7AF2B17EDACABDFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDF8441E9A776E8A673EDA873EEA872EAA570E9A3
                  72E39358E49458E79A60E99F67ECA772EFAE7CF2B585F7B888D7C5B8FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFF9FFFFF6FCFF
                  F5F7F9F5F6F6F4F5F5F2F2F2EFEEEDEEEBE8EFEAE7EFEBE7EFEBE8EEEAE7EDE6
                  E0F0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Visualizar Exce'#231#245'es de Processos - [CFG052]'
                Glyph.Data = {
                  F2040000424DF204000000000000B20200002800000018000000180000000100
                  08000000000040020000120B0000120B00009F0000009F00000000000000FFFF
                  FF00FF00FF00D3FFFF00CCFEFF00C6FBFF00C9FBFF00C6FAFF00BFF8FF009EF0
                  FF00A5F3FF00AFF2FE00B5F3FE00C0F6FF0055E1FF0068E6FF0070E7FF0082EA
                  FF0087EAFF008EE9FB0091EBFE00A0EEFF00A5F0FE00B7F0FB00BBF3FF00BCF4
                  FF00BDF4FF00BFF4FF0022D3FF0032D7FF0036D7FF0043DDFF0045D7FC004BDE
                  FF0057E0FF005BDEFF0065E0FF0066E0FF0067E2FF006EE3FF006FE2FF0075E5
                  FF007AE6FE007DE5FF0082E7FF0083E6FF0086E7FF008CE9FF0092EAFF0093EB
                  FF0095EAFF009CEBFF00A3EEFF00A4EDFF00AAEFFF00ABEFFF00B1F0FF00BAF2
                  FF00BBF2FF0009CBFF0011C9FE0012CEFF0012C9FE0013CFFF0014CBFF0016CB
                  FF0016CAFE0017CAFE0019CCFF001ACFFF001BCEFF001CCCFE001FCBFB0020CE
                  FE0021D1FF0022CEFE0026CFFE0028CFFE0027CAF7002AD0FE002DD0FE002FD1
                  FE0033D3FE0035D4FF0038D4FE003AD4FE003AD3FB003FD5FE0040D5FE0043D7
                  FE0045D8FE0049D8FF004BD9FF004DDAFF0050DAFE0052DAFF0054D9FC0058DC
                  FF0058DDFF0057D8FA005DDDFF005EDEFF0069E0FF006CE1FF0066D3F0006DD9
                  F7006CD7F40073E2FF0076E3FF0078E3FF007FE5FF007DDDF80084E2FB008BE7
                  FF00A0E2F300ACEAFA00B6F0FF0009C5FF0009C5FE000AC5FF000AC7FF0009AD
                  E2000BC5FE000CC6FF000DC7FF000DC6FE000FAFE20011ABDE0016A3D1001AAB
                  DA001EA4D00027B5E00035A9CF0070C0DA0072C1DA007BC7DE008CD3E9008FD5
                  EA001A8FBB0023A1CC00269AC5002896BF0055ADCC0069BAD5002A93BB000E73
                  A0001079A7000F729E00025F8F000464920004639100056A9A00056999000567
                  9600056695000565930006689700066796000667950002029B9B9B0202020202
                  0202020202020202020202020202029B0B36169B020202020202020202020202
                  0202020202029E9B013231139B02020202020202020202020202020202029370
                  9B016E116A9B020202020202020202020202020202029C902A9B016710849B02
                  020202020202020202020202020202948D269B01236092020202020202020202
                  02020202020202029C8C0E9B01218A0202020202020202020202020202020202
                  02968B1F9B01839D02029A02020202020202020202020202020295821D9B0181
                  9A9A409A02020202020202020202020202020296801C9B014441403D9A9A9A9A
                  9A9A9C020202020202020202997F3F9B017B777675787C3C4246489A02020202
                  020202020298793B9B7A7D3E4347494C4F511E569A020202020202020202977E
                  454A4B4D50525457595B5E22639A020202020202020202964E5355585A5C5F62
                  64242729689C02020202020202020296205D5F616525676B6D126F14149C0202
                  02020202020202960F66286C2B2D71300A019B0C0C9C02020202020202029169
                  2C2E2F3233343708019B9B04049C020202020202020296091535373874390601
                  9B029B05059C02020202020202029C8E01183A3A3A07019B02029B19199C0202
                  02020202020202958F013A390D879B9B9B9B9B19199C02020202020202020202
                  9A85011B1A88897273190317179C02020202020202020202029C860117171717
                  171717179C020202020202020202020202029C9C9C9C9C9C9C9C9C9C02020202
                  02020202020202020202020202020202020202020202}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Consultas OLAP'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C00600003A0B00003A0B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFB89F8E4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C
                  4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C4E2E
                  1C4E2E1C4E2E1CFF00FFFF00FFB89F8EEFE9E3A48B7AA48B7AA48B7AA48B7AA4
                  8B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7AA48B7A
                  A48B7AA48B7AA48B7AA48B7A4E2E1CFF00FFFF00FFB89F8EF2EBE7EFE9E3EEE5
                  E0EBE2DCE9DED8E7DCD5E5D9D1E3D5CEE1D3CADECFC6DCCBC2DAC9BFD8C5BAD5
                  C1B6D3BFB2D0BBAFD0BAADD0BAADD0BAADA48B7A4E2E1CFF00FFFF00FFB89F8E
                  F4EFEBBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF59
                  0FBF590FBF590FBF590FBF590FBF590FBF590FBF590FD0BAADA48B7A4E2E1CFF
                  00FFFF00FFB89F8EF6F2EFBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFC
                  FEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7A4E2E1C4E2E1C4E2E1C4E2E1C4E2E
                  1C4E2E1C4E2E1CFF00FFFF00FFB89F8EF8F6F3BF590FFEFEFCFEFEFCFEFEFCBF
                  590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7AFFFFFF7990FF
                  566FFFE3E7FFFFFFFF4E2E1C4E2E1CFF00FFFF00FFB89F8EFCFBFABF590FFEFE
                  FCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA4
                  8B7AD0D9FF3147FF001CF68492FFF7F8FF4E2E1C4E2E1CFF00FFFF00FFB89F8E
                  FEFEFCBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF59
                  0FBF590FBF590FA48B7A7087FF001CF6001CF6001CF6DCDEFF4E2E1C4E2E1CFF
                  00FFFF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFC
                  FEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7A001CF6001CF6CBD5FF001CF65577
                  FF4E2E1C4E2E1CFF00FFFF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF
                  590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7AE0E5FF5577FF
                  FFFFFFDCDEFF001CF68492FF4E2E1CFF00FFFF00FFB89F8EFFFFFFBF590FFEFE
                  FCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA4
                  8B7AA48B7AA48B7AA48B7AA48B7A8492FF001CF64E2E1CFF00FFFF00FFB89F8E
                  FFFFFFBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF59
                  0FBF590FBF590FBF590FBF590FBF590FBF590FBF590FE0D0C78492FF001CF6FF
                  00FFFF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFC
                  FEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FE2D4
                  CBA48B7A8492FF001CF6FF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF
                  590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7A4E2E1C4E2E1C
                  4E2E1C4E2E1C4E2E1C4E2E1C4E2E1C8492FFFF00FFB89F8EFFFFFFBF590FFEFE
                  FCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA4
                  8B7AFFFFFF7990FF566FFFE3E7FFFFFFFF4E2E1C4E2E1CFF00FFFF00FFB89F8E
                  FFFFFFBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF59
                  0FBF590FBF590FA48B7AD0D9FF3147FF001CF68492FFF7F8FF4E2E1C4E2E1CFF
                  00FFFF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFC
                  FEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7A7087FF001CF6001CF6001CF6DCDE
                  FF4E2E1C4E2E1CFF00FFFF00FFB89F8EFFFFFFBF590FFEFEFCFEFEFCFEFEFCBF
                  590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA48B7A001CF6001CF6
                  CBD5FF001CF65577FF4E2E1C4E2E1CFF00FFFF00FFB89F8EFFFFFFBF590FFEFE
                  FCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCBF590FFEFEFCFEFEFCFEFEFCA4
                  8B7AE0E5FF5577FFFFFFFFDCDEFF001CF68492FF4E2E1CFF00FFFF00FFB89F8E
                  FFFFFFBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF590FBF59
                  0FBF590FBF590FA48B7AA48B7AA48B7AA48B7AA48B7A8492FF001CF64E2E1CFF
                  00FFFF00FFB89F8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFCFCFBFAFAF7F6F7F3F2F4F0
                  EE8492FF001CF6FF00FFFF00FFB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB8
                  9F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8EB89F8E
                  B89F8EB89F8EB89F8EB89F8E8492FF001CF6FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8492FF}
                ParentFont = False
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Abrir Perfil Hor'#225'rio de Trabalho - [BAS532]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000B0000000B00000000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D56C72613F4732454C3B5A5D54B4B5
                  B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE787E6F48582DA2C864C8EE91
                  B6D787BDDF8C6E7F564E5148EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8084776A853EBB
                  E776D2F89BBDDF8C95B06FD2F89CCBF097A1BE78474B42FCFCFCFFFFFFC0C0C0
                  989798989898989898989798999999999999999999999999999999ADACADDEDD
                  DE42512BC1F36F697C4DD2F89CD2F89CD2F89CD2F89C8AA367AFCF827E92609A
                  9C987171717574759F9E9F9F9E9FA3A2A3A5A5A6A5A5A6A5A5A6A5A5A6A5A5A6
                  A5A5A6B5B4B5797E7290B651C9F682D2F89CD2F89CC6E993B9DB8AD2F89CD2F8
                  9CD2F89CCDF29844483E464646EFEDEFB5B4B8767580BEBDC0F8F7F9A09FA086
                  8585DCDBDDF8F7F9F8F7F9F3F2F44E5540AFDE62A1C36ED2F89CCEF3992C3815
                  31420FA5C37AD2F89CB9DB8AB5D687424839474647EFEDEF3130435A5ABE3939
                  46E4E3E44C4C45A9A6916E6E6CF8F7F9F8F7F9F3F2F44E5640ABD85F97B667D2
                  F89CCAEE961F270E364A0D708453D2F89CB3D385AECD81434939474647EFEDEF
                  3837463C3C6F3F3F4AEAE9EB33332F6362587C7B7AF8F7F9F8F7F9F5F4F69197
                  86B0DF62CAF782D2F89C596942819960ADCC80697C4ED0F59AD2F89CCFF49A43
                  473C474647EFEDEFE1DFE1C0BEC0EAE9EBF8F7F9DDDCDEC8C8C9F5F4F6F8F7F9
                  F8F7F9F7F7F8F0EEF0809D51C2F371728754C5E892D2F89CD2F89CD2F89C8FA9
                  6AB4D485869C6590918D474647EFEDEF5E5E6B2D2D40686872F2F1F34645433F
                  3E3AA3A3A2CCCBCD3D3D393D3D39D2D0D2727768749242B5DD74D2F89CBFE28E
                  9CB974D2F89CC6EA93A6C47B40443BF9F9F9474647EFEDEF3332477171EE3B3B
                  49DEDDDF616058D6D3B96968669E9D9EA29F8C969483A9A9AAEFEEEF676D5D50
                  6330ADD56EC6E991AFCE82C7EB947C915F41453BE8E8E8FFFFFF474647EFEDEF
                  78778332314082828BF6F5F75A5A57444340B7B5B6D9D8DA4948454B4A48E0DF
                  E1F7F6F8F3F1F4BDBCBC565E493F4730414836494D43989896C4C3C5FFFFFFFF
                  FFFF474647EFEDEFCCCBCCA09FA0D5D4D6F8F7F9BFBEBFA7A7A8E8E7E9F3F2F4
                  AEADAFB1B0B2F5F4F6E6E5E6A6A6A7C2C0C3F3F2F4CCCACDA2A0A2D5D4D5F6F5
                  F64F4F50F9F9F9FFFFFF474647EFEDEF3333444B4B9F3B3B47E6E6E742413B8D
                  8B7A737371A9A9AA6B695D626156B5B4B66867659592803D3C38EFEEF043423F
                  A4A18D4B4A47F8F7F94F4F50F9F9F9FFFFFF474647EFEDEF34334444448F3B3B
                  47E7E7E83D3C377F7D6E747472A9A9AA615F545A584FB6B5B769686687857539
                  3834EFEEF042413E94917F4C4B48F8F7F94F4F50F9F9F9FFFFFF474647EFEDEF
                  CECCCEA09FA0D7D6D8F8F7F9C1C0C1A8A8A9E9E8EAF3F2F4B0AFB1B2B1B3F5F4
                  F6E6E6E7A7A7A8C4C4C5F8F7F9D3D2D4A5A5A6DAD9DBF8F7F94F4F50F9F9F9FF
                  FFFF2726267F7E7C7F7E7CCECCC9A7A7A6848483848483848483848483848483
                  8484838484838484838484838484838484838484838484838484838484838484
                  832A2A2AF9F9F9FFFFFF353329B0A97AB0A97AE0D89FCBC7AFB4B19BB4B19BB4
                  B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19BB4B19B
                  B4B19BB4B19BB4B19B3A3934F9F9F9FFFFFF454437F0E7A6F0E7A6EAE3A5504F
                  4869675DF3EFD255544C605F55F6F2D45B5A51595850F5F1D364625953524BF2
                  EED16C6A5F4F4D47EEEACDF6F2D4F6F2D4484742FDFDFDFFFFFF7B7B7369654C
                  908B647975546B6A66454442838171605F5D4F4F4C8583735554525B5A578482
                  724B4A47666563807E6F44434071706E7A786994917F6E6C60787875FFFFFFFF
                  FFFFFFFFFFCDCDCDAAAAAA9090906B6B6B474647989898605F604F4F4F9A9A9A
                  5554555A5A5A9999994C4B4C6665669494944545457170718D8D8DAAAAAACBCB
                  CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA595959737373FDFDFD60
                  5F606B6B6BFFFFFF666666636363FEFEFE6E6E6E5E5E5EFCFCFC777777575757
                  F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'Atualizar informa'#231#245'es da senha'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton12Click
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Top = 6
                Hint = 'Ver registros da lixeira - [CFG029]'
                OnClick = SpeedButton25Click
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 380
              ExplicitHeight = 380
              inherited ScrollBox2: TScrollBox
                Height = 363
                ExplicitHeight = 363
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
        end
        object tsMultiEmpresa: TTabSheet
          Caption = 'tsMultiEmpresa'
          ImageIndex = 3
          object pnMultiEmpresa: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 514
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox5: TGroupBox
              Left = 6
              Top = 6
              Width = 775
              Height = 105
              Align = alTop
              Caption = 'Empresa'
              TabOrder = 0
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 771
                Height = 88
                Align = alClient
                DataSource = DtmCadBasicos.dsEmpSenha
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_EMPRESA'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO_EMP'
                    Width = 434
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CGC_EMP'
                    Width = 203
                    Visible = True
                  end>
              end
            end
            object GroupBox6: TGroupBox
              Left = 6
              Top = 111
              Width = 775
              Height = 356
              Align = alClient
              Caption = 'Usu'#225'rios'
              TabOrder = 1
              object DBGrid5: TDBGrid
                Left = 2
                Top = 15
                Width = 771
                Height = 339
                Align = alClient
                DataSource = DtmCadBasicos.dsSenha
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'USUARIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_US'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL_US'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTOQ_NEG'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEPART'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IMP_US'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALT_CAB'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ALT_IMP'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EMP_PADRAO'
                    Width = 64
                    Visible = True
                  end>
              end
            end
            object Panel4: TPanel
              Left = 6
              Top = 467
              Width = 775
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn11: TBitBtn
                Left = 309
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Selecionar'
                TabOrder = 0
                OnClick = BitBtn11Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
              object BitBtn12: TBitBtn
                Left = 390
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn12Click
                Glyph.Data = {
                  E6010000424DE60100000000000036000000280000000C0000000C0000000100
                  180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                  9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                  ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
                  A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
                  0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                  B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
                  01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                  0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
                  ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
                  39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
                  4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
                  DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
                  A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
                  5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF7D7DE9A4A4EDFFFFFF}
              end
            end
          end
        end
        object tsConsultasOLAP: TTabSheet
          Caption = 'tsConsultasOLAP'
          ImageIndex = 4
          object pnConsultasOLAP: TPanel
            Left = 40
            Top = 16
            Width = 713
            Height = 458
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 360
              Top = 6
              Height = 405
              ExplicitLeft = 352
              ExplicitTop = 176
              ExplicitHeight = 100
            end
            object Panel5: TPanel
              Left = 6
              Top = 6
              Width = 354
              Height = 405
              Align = alLeft
              BevelOuter = bvNone
              Padding.Right = 3
              Padding.Bottom = 6
              TabOrder = 0
              object tvDB: TTreeView
                Left = 0
                Top = 41
                Width = 351
                Height = 358
                Align = alClient
                Indent = 19
                TabOrder = 0
                OnDblClick = tvDBDblClick
              end
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 351
                Height = 41
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                Caption = 'Duplo clique para adicionar consulta ao usu'#225'rio'
                TabOrder = 1
              end
            end
            object Panel6: TPanel
              Left = 363
              Top = 6
              Width = 344
              Height = 405
              Align = alClient
              BevelOuter = bvNone
              Padding.Left = 3
              Padding.Bottom = 6
              TabOrder = 1
              object tvUS: TTreeView
                Left = 3
                Top = 41
                Width = 341
                Height = 358
                Align = alClient
                Indent = 19
                TabOrder = 0
                OnDblClick = tvUSDblClick
              end
              object Panel9: TPanel
                Left = 3
                Top = 0
                Width = 341
                Height = 41
                Align = alTop
                BevelKind = bkTile
                BevelOuter = bvNone
                Caption = 'Duplo clique '#225'ra remover consulta do usu'#225'rio'
                TabOrder = 1
              end
            end
            object Panel7: TPanel
              Left = 6
              Top = 411
              Width = 701
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn13: TBitBtn
                Left = 608
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Voltar'
                ModalResult = 2
                TabOrder = 0
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
                  0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
                  0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
                  1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
                  3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
                  5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
                  2828281F05002828282828282828282828282817050713282828282828282828
                  2828282817060715282828282828282828282828281507062328280004040404
                  040404232828000701282802090807070707061B28282706062328040B090711
                  2727272828282800071328060D070A07232828282828281C070128070E13020B
                  082028282828281C0701280F101D28020D0818282828280107132816191E2828
                  140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
                  282827140808041B282828282828282828282828282828282828282828282828
                  2828282828282828282828282828282828282828282828282828}
              end
            end
          end
        end
        object tsExcecoesProcessos: TTabSheet
          Caption = 'tsExcecoesProcessos'
          ImageIndex = 5
          object Panel10: TPanel
            Left = 0
            Top = 477
            Width = 787
            Height = 37
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object BitBtn120: TBitBtn
              Left = 146
              Top = 4
              Width = 120
              Height = 25
              Hint = 'Excel'
              Caption = 'Excel'
              TabOrder = 1
              OnClick = BitBtn120Click
              Glyph.Data = {
                8E020000424D8E020000000000008E0100002800000010000000100000000100
                08000000000000010000120B0000120B0000560000005600000000000000FFFF
                FF00FF00FF00B8838400AA7F7A00AD827B00B1857C00B6897E00BA8D8000BF91
                8300CA978400C4968500FFFCFB00C99B8700CD9E8A00CA8A6A00D1A38B00DDAC
                9100D9AA8F00D6A78D00F7F0EC00D0987700DBA68500DFAF9200FDF7F200FBF1
                E800FEF7F100FAF1E800FDF7F100FFFDFB00F8E8D600F9ECDE00FBF1E600EBB8
                7A00F5DFC500F8E8D500F7E8D600FAEDDE00F9EDDF00FBF2E700F3AE5200E9B6
                7600F4DBBB00F7DFBF00F4DCBC00F5E0C400F5E0C500F7E5CE00F6E4CD00FAEE
                DF00F3D6AB00F4DAB300F2D7B200FDEDD500EADDCA00FDF0DD00FBF3E700FDF8
                F000FCEBCE00FEF2DE00C7BFB000FFF7E800FEFDFB00FFFCF200FFFFFC00FFFF
                FD00008400000385030004860400178F17001C911C00309B30003AA03A0061B3
                610065B5650069B7690068B668007ABF7A007BBF7B0084C4840091CA9100C4E3
                C400CAE5CA00F2F9F200FBFDFB00FAFAFE000202020202424242424242424242
                424204030303034201010101010101010142053A2B3332420101010101010101
                01420635222A344201504247544F424C0142073B2F2E2C420101514446424F01
                0142083D1E302D420101014B424554010142093F2624304201014D424A444853
                01420B401B1F23420149424E0152434801420D01181931420101010101010101
                01420E010C1A2742010101010101010101421001011D1C424242424242424242
                4242130101011D1C202537363C030202020212010101013E3938030303030202
                020211010101010141140329280F020202021701010101010155032115020202
                02021616161616161616030A020202020202}
            end
            object BitBtn109: TBitBtn
              Left = 517
              Top = 4
              Width = 120
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar (Esc)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BitBtn109Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object BitBtn14: TBitBtn
              Left = 393
              Top = 4
              Width = 120
              Height = 25
              Hint = 'Atualizar'
              Caption = 'Atualizar (F5) '
              TabOrder = 3
              OnClick = BitBtn14Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B0000000100000001000000840000088C
                0800108C080018941000219410001894180029941800219C2100299C210029A5
                2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
                5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
                6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
                73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
                7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
                840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
                9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
                A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
                B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
                DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
                F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
                1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
                0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
                0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
                2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
                5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
                00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
                5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
                575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
            end
            object BitBtn15: TBitBtn
              Left = 270
              Top = 4
              Width = 120
              Height = 25
              Hint = 'Relat'#243'rio - [CFG053]'
              Caption = 'Relat'#243'rio'
              TabOrder = 2
              OnClick = BitBtn15Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B00000001000000010000181818002118
                21001821210031313100393939004242420052525200636363006B6B6B007373
                7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
                9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
                A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
                BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
                C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
                DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
                F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
                103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
                2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
                22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
                2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
                343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
                24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
                261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
                261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
            end
          end
          object GroupBox7: TGroupBox
            Left = 0
            Top = 0
            Width = 787
            Height = 477
            Align = alClient
            Caption = 'Exce'#231#245'es de Processos por usu'#225'rio'
            TabOrder = 0
            object DBGrid6: TDBGrid
              Left = 2
              Top = 15
              Width = 783
              Height = 460
              Align = alClient
              DataSource = DtmCadBasicos.dsExecoesProc
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnTitleClick = DBGrid6TitleClick
            end
          end
        end
        object tsAlterDadosProc: TTabSheet
          Caption = 'tsAlterDadosProc'
          ImageIndex = 7
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 787
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosProc: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosProcClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 787
            Height = 83
            Align = alTop
            Caption = 'Senha'
            TabOrder = 1
            Visible = False
            object DBText57: TDBText
              Left = 152
              Top = 14
              Width = 75
              Height = 17
              DataField = 'CODIGO'
              DataSource = DtmCadBasicos.dsSenha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText58: TDBText
              Left = 152
              Top = 33
              Width = 620
              Height = 17
              DataField = 'NOME_US'
              DataSource = DtmCadBasicos.dsSenha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label450: TLabel
              Left = 102
              Top = 14
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
            object DBText59: TDBText
              Left = 152
              Top = 52
              Width = 620
              Height = 17
              DataField = 'NIVEL_US'
              DataSource = DtmCadBasicos.dsSenha
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label453: TLabel
              Left = 70
              Top = 52
              Width = 76
              Height = 13
              Alignment = taRightJustify
              BiDiMode = bdLeftToRight
              Caption = 'N'#237'vel Usu'#225'rio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label19: TLabel
              Left = 65
              Top = 33
              Width = 81
              Height = 13
              Alignment = taRightJustify
              BiDiMode = bdLeftToRight
              Caption = 'Nome Usu'#225'rio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 193
            Width = 787
            Height = 321
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object pnCenterAlterDadosProd: TPanel
              Left = 0
              Top = 0
              Width = 783
              Height = 54
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarSenha: TSpeedButton
                Left = 62
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [CFG026]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarSenhaClick
              end
              object SpeedButtonAlterarSenha2: TSpeedButton
                Left = 5
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [CFG056]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarSenha2Click
              end
              object btExcluirRegistro: TSpeedButton
                Left = 121
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Apagar Registro - [CFG027]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
                  FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 441
                Top = 18
                Width = 310
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ckPermOpcaoMarcadasClick
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 6
          object pnAlteracaoEmLote: TPanel
            Left = 16
            Top = 9
            Width = 713
            Height = 319
            TabOrder = 0
            object GroupBoxAlteracaoEmLote: TGroupBox
              Left = 1
              Top = 1
              Width = 711
              Height = 272
              Align = alClient
              Caption = 'Altera'#231#227'o em lote de senhas'
              TabOrder = 0
              object pnDepartamento: TPanel
                Left = 2
                Top = 15
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 0
                object lbDepartamento: TLabel
                  Left = 100
                  Top = 7
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Departamento:'
                end
                object ckDepartamento: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDepartamentoClick
                end
                object cbDepartamento: TComboBox
                  Left = 175
                  Top = 4
                  Width = 468
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                end
              end
              object pnLiberarAcesso: TPanel
                Left = 2
                Top = 46
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 1
                object lbLiberarAcesso: TLabel
                  Left = 99
                  Top = 7
                  Width = 74
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Liberar Acesso:'
                end
                object ckLiberarAcesso: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckLiberarAcessoClick
                end
                object cbLiberarAcesso: TComboBox
                  Left = 175
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'Sim'
                    'N'#227'o')
                end
              end
              object pnEstoqueNegativo: TPanel
                Left = 2
                Top = 77
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 2
                object lbEstoqueNegativo: TLabel
                  Left = 84
                  Top = 7
                  Width = 89
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Estoque Negativo:'
                end
                object ckEstoqueNegativo: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckEstoqueNegativoClick
                end
                object cbEstoqueNegativo: TComboBox
                  Left = 175
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'Sim'
                    'N'#227'o')
                end
              end
              object pnAlterarImpressora: TPanel
                Left = 2
                Top = 139
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 4
                object lbAlterarImpressora: TLabel
                  Left = 79
                  Top = 7
                  Width = 94
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Alterar Impressora:'
                end
                object cbAlterarImpressora: TComboBox
                  Left = 176
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'Sim'
                    'N'#227'o')
                end
                object ckAlterarImpressora: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckAlterarImpressoraClick
                end
              end
              object pnAlterarCabecalho: TPanel
                Left = 2
                Top = 170
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 5
                object lbAlterarCabecalho: TLabel
                  Left = 83
                  Top = 6
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Alterar Cabe'#231'alho:'
                end
                object ckAlterarCabecalho: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckAlterarCabecalhoClick
                end
                object cbAlterarCabecalho: TComboBox
                  Left = 175
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'Sim'
                    'N'#227'o')
                end
              end
              object pnNivelSenha: TPanel
                Left = 2
                Top = 201
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 6
                object lbNivelSenha: TLabel
                  Left = 92
                  Top = 6
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N'#237'vel do Usu'#225'rio:'
                end
                object cbNivelSenha: TComboBox
                  Left = 175
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                end
                object ckNivelSenha: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNivelSenhaClick
                end
              end
              object pnModoImpressao: TPanel
                Left = 2
                Top = 108
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 3
                object lbModoImpressao: TLabel
                  Left = 90
                  Top = 7
                  Width = 83
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Modo Impress'#227'o:'
                end
                object ckModoImpressao: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckModoImpressaoClick
                end
                object cbModoImpressao: TComboBox
                  Left = 175
                  Top = 4
                  Width = 144
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'Epson'
                    'Grafico'
                    'HP'
                    'Personalizado'
                    'Rima')
                end
              end
              object Panel21: TPanel
                Left = 2
                Top = 232
                Width = 707
                Height = 34
                Align = alTop
                TabOrder = 7
                object pnPerfilHorarioTrabalho: TPanel
                  Left = 1
                  Top = 1
                  Width = 705
                  Height = 31
                  Align = alTop
                  TabOrder = 0
                  object lbPerfilHorarioTrabalho: TLabel
                    Left = 62
                    Top = 6
                    Width = 111
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Perfil Hor'#225'rio Trabalho:'
                  end
                  object ckPerfilHorarioTrabalho: TCheckBox
                    Left = 22
                    Top = 6
                    Width = 30
                    Height = 17
                    TabOrder = 0
                    OnClick = ckPerfilHorarioTrabalhoClick
                  end
                  object DBLPerfilHorarioTrabalho: TDBLookupComboBox
                    Left = 174
                    Top = 2
                    Width = 468
                    Height = 21
                    KeyField = 'CODIGO'
                    ListField = 'DESCRICAO'
                    ListSource = DtmCadBasicos.dsPerfilHorasTrabalhoCons
                    TabOrder = 1
                  end
                end
              end
            end
            object Panel11: TPanel
              Left = 1
              Top = 273
              Width = 711
              Height = 45
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOKAlteracaoEmLote: TBitBtn
                Left = 280
                Top = 6
                Width = 75
                Height = 25
                Hint = 'OK - [CLI263]'
                Caption = 'OK'
                TabOrder = 0
                OnClick = btnOKAlteracaoEmLoteClick
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
              object btnCancelarAlteracaoEmLote: TBitBtn
                Left = 361
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancela'
                TabOrder = 1
                OnClick = btnCancelarAlteracaoEmLoteClick
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
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 545
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 545
      inherited bMarketingHW: TBitBtn
        Top = 523
        ExplicitTop = 523
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    Top = 535
    ExplicitTop = 535
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 708
    Top = 65
    object MarcarTodasSenhasClick: TMenuItem
      Caption = 'Marcar Todas Senhas'
      OnClick = MarcarTodasSenhasClickClick
    end
    object DesmarcarTodasSenhasClick: TMenuItem
      Caption = 'Desmarcar Todas Senhas'
      OnClick = DesmarcarTodasSenhasClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 670
    Top = 67
  end
  inherited Timer1: TTimer
    Left = 734
    Top = 67
  end
end
