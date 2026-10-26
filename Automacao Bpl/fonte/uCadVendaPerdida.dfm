inherited frmCadVendaPerdida: TfrmCadVendaPerdida
  Left = 353
  Top = 119
  Caption = 'Vendas Perdidas'
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
                    Height = 289
                    Caption = 'Cadastro da Venda Perdida'
                    ExplicitHeight = 289
                    object Label6: TLabel
                      Left = 23
                      Top = 64
                      Width = 96
                      Height = 13
                      Caption = 'Tipo Venda Perdida:'
                    end
                    object Label7: TLabel
                      Left = 491
                      Top = 135
                      Width = 27
                      Height = 13
                      Caption = 'Data:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 270
                      Top = 159
                      Width = 33
                      Height = 13
                      Caption = 'Grupo:'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 351
                      Top = 159
                      Width = 64
                      Height = 13
                      Caption = 'C'#243'd Produto:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 69
                      Top = 135
                      Width = 50
                      Height = 13
                      Caption = 'Vendedor:'
                    end
                    object Label11: TLabel
                      Left = 59
                      Top = 208
                      Width = 60
                      Height = 13
                      Caption = 'Quantidade:'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 82
                      Top = 112
                      Width = 37
                      Height = 13
                      Caption = 'Cliente:'
                    end
                    object Label13: TLabel
                      Left = 276
                      Top = 36
                      Width = 27
                      Height = 13
                      Caption = 'Data:'
                      FocusControl = DBEdit3
                    end
                    object Label14: TLabel
                      Left = 20
                      Top = 39
                      Width = 99
                      Height = 13
                      Caption = 'Cod. Venda Perdida:'
                      FocusControl = DBEdit3
                    end
                    object Label15: TLabel
                      Left = 57
                      Top = 184
                      Width = 65
                      Height = 13
                      Caption = 'Cod. Servi'#231'o:'
                      FocusControl = DBEdit8
                    end
                    object Label16: TLabel
                      Left = 38
                      Top = 87
                      Width = 81
                      Height = 13
                      Caption = 'Produto/Servi'#231'o:'
                    end
                    object Label17: TLabel
                      Left = 35
                      Top = 159
                      Width = 84
                      Height = 13
                      Caption = 'Num. Fabrica'#231#227'o:'
                      FocusControl = Edit3
                    end
                    object DBEdit2: TDBEdit
                      Left = 309
                      Top = 33
                      Width = 70
                      Height = 21
                      DataField = 'DATA_VNP'
                      DataSource = dtmVendaPerdida.dsVendaP
                      Enabled = False
                      TabOrder = 14
                    end
                    object DBEdit3: TDBEdit
                      Left = 309
                      Top = 156
                      Width = 36
                      Height = 21
                      Hint = '[F3: Pesquisar] Grupo do produto'
                      DataField = 'GRUPO_PROD'
                      DataSource = dtmVendaPerdida.dsVendaP
                      Enabled = False
                      TabOrder = 8
                    end
                    object DBEdit4: TDBEdit
                      Left = 417
                      Top = 156
                      Width = 60
                      Height = 21
                      Hint = '[F3: Pesquisar] C'#243'digo do produto'
                      DataField = 'COD_PROD'
                      DataSource = dtmVendaPerdida.dsVendaP
                      Enabled = False
                      TabOrder = 9
                    end
                    object DBEdit6: TDBEdit
                      Left = 125
                      Top = 205
                      Width = 70
                      Height = 21
                      Hint = 'Quantidade do item produto/servi'#231'o'
                      DataField = 'QUANT_PROD_VP'
                      DataSource = dtmVendaPerdida.dsVendaP
                      TabOrder = 13
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 197
                      Top = 132
                      Width = 545
                      Height = 21
                      DataField = 'COD_VENDEDOR'
                      DataSource = dtmVendaPerdida.dsVendaP
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmVendaPerdida.dsColaborador
                      TabOrder = 6
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 125
                      Top = 60
                      Width = 617
                      Height = 21
                      Hint = 'Tipo/Motivo de venda perdida'
                      DataField = 'CODIGO_VP'
                      DataSource = dtmVendaPerdida.dsVendaP
                      KeyField = 'CODIGO_VP'
                      ListField = 'DESCRICAO_VP'
                      ListSource = dtmVendaPerdida.dsLocTpVp
                      TabOrder = 1
                      OnExit = DBLookupComboBox2Exit
                      OnKeyDown = DBLookupComboBox2KeyDown
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 198
                      Top = 108
                      Width = 544
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmVendaPerdida.dsVendaP
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmVendaPerdida.dsCliVP
                      TabOrder = 4
                    end
                    object DBEdit1: TDBEdit
                      Left = 125
                      Top = 108
                      Width = 70
                      Height = 21
                      Hint = '[F3: Pesquisar]   [F4: Novo]  - C'#243'digo do cliente'
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmVendaPerdida.dsVendaP
                      TabOrder = 3
                      OnExit = DBEdit1Exit
                      OnKeyDown = DBEdit1KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 125
                      Top = 132
                      Width = 70
                      Height = 21
                      Hint = '[F3: Pesquisar]   [F4: Novo]  -  C'#243'digo do vendedor'
                      DataField = 'COD_VENDEDOR'
                      DataSource = dtmVendaPerdida.dsVendaP
                      TabOrder = 5
                      OnExit = DBEdit5Exit
                      OnKeyDown = DBEdit5KeyDown
                    end
                    object DBEdit7: TDBEdit
                      Left = 125
                      Top = 36
                      Width = 70
                      Height = 21
                      DataField = 'SEQVP'
                      DataSource = dtmVendaPerdida.dsVendaP
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 125
                      Top = 84
                      Width = 145
                      Height = 21
                      Hint = 'Informe se a venda perdida '
                      CharCase = ecUpperCase
                      DataField = 'TIPOVP'
                      DataSource = dtmVendaPerdida.dsVendaP
                      ItemHeight = 13
                      Items.Strings = (
                        'PRODUTO'
                        'SERVI'#199'O')
                      TabOrder = 2
                      OnExit = DBComboBox1Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 125
                      Top = 181
                      Width = 70
                      Height = 21
                      Hint = '[F3: Pesquisar] C'#243'digo do servi'#231'o'
                      DataField = 'COD_SERVICO'
                      DataSource = dtmVendaPerdida.dsVendaP
                      TabOrder = 11
                      OnExit = DBEdit8Exit
                      OnKeyDown = DBEdit8KeyDown
                    end
                    object Edit1: TEdit
                      Left = 480
                      Top = 157
                      Width = 262
                      Height = 21
                      CharCase = ecUpperCase
                      Enabled = False
                      TabOrder = 10
                      Text = 'EDIT1'
                    end
                    object Edit2: TEdit
                      Left = 199
                      Top = 181
                      Width = 543
                      Height = 21
                      Enabled = False
                      TabOrder = 12
                      Text = 'Edit2'
                    end
                    object Edit3: TEdit
                      Left = 125
                      Top = 157
                      Width = 139
                      Height = 21
                      CharCase = ecUpperCase
                      TabOrder = 7
                      Text = 'EDIT3'
                      OnExit = Edit3Exit
                      OnKeyDown = Edit3KeyDown
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [VND084]'
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
              Hint = 'Clique para pesquisar - [VND077]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VND076]'
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
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [VND078]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VND080]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [VND081]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton4Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [VND083]'
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
                Left = 179
                Top = 5
                Hint = 'Ver registros da lixeira - [VND082]'
                Visible = False
                OnClick = SpeedButton25Click
                ExplicitLeft = 179
                ExplicitTop = 5
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
        object tsRelVP: TTabSheet
          Caption = 'Relatorios de Vendas Perdidas'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpVP: TQuickRep
            Left = -2
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            BeforePrint = qrpVPBeforePrint
            DataSet = dtmVendaPerdida.cdsVendaP
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
            OnPreview = qrpVPPreview
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
            ReportTitle = 'Relat'#243'rio de Vendas Perdidas'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object ColumnHeaderBand1: TQRBand
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
              BandType = rbColumnHeader
              object QRShape2: TQRShape
                Left = 0
                Top = 23
                Width = 735
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  0.000000000000000000
                  60.854166666666680000
                  1944.687500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape1: TQRShape
                Left = 0
                Top = 1
                Width = 735
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  0.000000000000000000
                  2.645833333333333000
                  1944.687500000000000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 7
                Top = 4
                Width = 72
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  18.520833333333330000
                  10.583333333333330000
                  190.500000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Prod./Serv.'
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
                Left = 512
                Top = 4
                Width = 68
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  1354.666666666667000000
                  10.583333333333330000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'd Perda'
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
                Left = 193
                Top = 4
                Width = 63
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  510.645833333333300000
                  10.583333333333330000
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
              object QRLabel8: TQRLabel
                Left = 108
                Top = 4
                Width = 43
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  285.750000000000000000
                  10.583333333333330000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#186' Fab'
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
              object QRLabel9: TQRLabel
                Left = 673
                Top = 4
                Width = 56
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  1780.645833333333000000
                  10.583333333333330000
                  148.166666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Dt Perda'
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
                Left = 427
                Top = 4
                Width = 75
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  1129.770833333333000000
                  10.583333333333330000
                  198.437500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Quantidade'
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
            object detalhes: TQRBand
              Left = 38
              Top = 140
              Width = 718
              Height = 16
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
                42.333333333333340000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = 18
                Top = 0
                Width = 32
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  47.625000000000000000
                  0.000000000000000000
                  84.666666666666680000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'GRUPO_PROD'
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
              object QRDBText2: TQRDBText
                Left = 53
                Top = 0
                Width = 43
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  140.229166666666700000
                  0.000000000000000000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'COD_PROD'
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
              object QRDBText7: TQRDBText
                Left = 513
                Top = 0
                Width = 26
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1357.312500000000000000
                  0.000000000000000000
                  68.791666666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'CODIGO_VP'
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
              object QRDBText8: TQRDBText
                Left = 672
                Top = 0
                Width = 57
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1778.000000000000000000
                  0.000000000000000000
                  150.812500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'DATA_VNP'
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
              object lbTipoVP: TQRLabel
                Left = 542
                Top = 0
                Width = 128
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  1434.041666666667000000
                  0.000000000000000000
                  338.666666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'lbTipoVP'
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
              object lbNumFab: TQRLabel
                Left = 108
                Top = 1
                Width = 80
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  285.750000000000000000
                  2.645833333333333000
                  211.666666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QRLabel10'
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
              object lbDescricao: TQRLabel
                Left = 193
                Top = 0
                Width = 54
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  510.645833333333300000
                  0.000000000000000000
                  142.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel10'
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
              object QRDBText3: TQRDBText
                Left = 428
                Top = 1
                Width = 73
                Height = 16
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  42.333333333333330000
                  1132.416666666667000000
                  2.645833333333333000
                  193.145833333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'QUANT_PROD_VP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                Mask = '0.0'
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText5: TQRDBText
                Left = 46
                Top = 0
                Width = 50
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  121.708333333333300000
                  0.000000000000000000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'COD_SERVICO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = True
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText4: TQRDBText
                Left = 3
                Top = 0
                Width = 18
                Height = 15
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  39.687500000000000000
                  7.937500000000000000
                  0.000000000000000000
                  47.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmVendaPerdida.cdsVendaP
                DataField = 'TIPOVP'
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
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 156
              Width = 718
              Height = 55
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
                145.520833333333300000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 8
                Top = 10
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  21.166666666666670000
                  26.458333333333330000
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
              object QRLabel11: TQRLabel
                Left = 607
                Top = 13
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1606.020833333333000000
                  34.395833333333340000
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
              object QRSysData4: TQRSysData
                Left = 658
                Top = 13
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1740.958333333333000000
                  34.395833333333340000
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
            object TitleBand1: TQRBand
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
              BandType = rbTitle
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
              object QRSysData3: TQRSysData
                Left = 2
                Top = 38
                Width = 94
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  5.291666666666667000
                  100.541666666666700000
                  248.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsReportTitle
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 12
              end
            end
          end
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 596
    Top = 65529
  end
  inherited PopupMenu2: TPopupMenu
    Left = 566
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 534
    Top = 65531
  end
end
