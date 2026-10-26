inherited frmCadRegrasTravReqOS: TfrmCadRegrasTravReqOS
  Caption = 
    'Regras para Travar REQ/OS/EST FECH pendentes (fechamento/recebim' +
    'ento)'
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
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alClient
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 78
                      Top = 23
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo:'
                    end
                    object Label7: TLabel
                      Left = 29
                      Top = 55
                      Width = 73
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Sigla / Tipo OS:'
                    end
                    object Label8: TLabel
                      Left = 51
                      Top = 87
                      Width = 51
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Qtde Dias:'
                    end
                    object Label9: TLabel
                      Left = 8
                      Top = 119
                      Width = 94
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Qtde Dias Reserva:'
                    end
                    object Label10: TLabel
                      Left = 36
                      Top = 150
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#237'vel Usu'#225'rio:'
                    end
                    object Label11: TLabel
                      Left = 235
                      Top = 87
                      Width = 222
                      Height = 13
                      Caption = 'Pedidos pendentes (fechamento/recebimento)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 235
                      Top = 118
                      Width = 196
                      Height = 13
                      Caption = 'Mercadorias pendentes estoque fechado'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 108
                      Top = 20
                      Width = 121
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPO'
                      DataSource = DtmCadBasicos.dsRegrasTravOsReq
                      ItemHeight = 0
                      Items.Strings = (
                        'REQ - Requisi'#231#227'o'
                        'OS - Ordem de Servi'#231'o'
                        'ESF - Estoque Fechado')
                      TabOrder = 0
                      OnExit = DBComboBox1Exit
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 108
                      Top = 52
                      Width = 121
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPV'
                      DataSource = DtmCadBasicos.dsRegrasTravOsReq
                      ItemHeight = 0
                      Items.Strings = (
                        'REQ - Requisi'#231#227'o'
                        'OS - Ordem de Servi'#231'o'
                        'ESF - Estoque Fechado')
                      TabOrder = 1
                    end
                    object DBEdit1: TDBEdit
                      Left = 108
                      Top = 84
                      Width = 121
                      Height = 21
                      DataField = 'QTDE_DIAS'
                      DataSource = DtmCadBasicos.dsRegrasTravOsReq
                      TabOrder = 2
                    end
                    object DBEdit2: TDBEdit
                      Left = 108
                      Top = 115
                      Width = 121
                      Height = 21
                      DataField = 'QTDE_DIAS_RES'
                      DataSource = DtmCadBasicos.dsRegrasTravOsReq
                      TabOrder = 3
                    end
                    object DBEdit3: TDBEdit
                      Left = 108
                      Top = 146
                      Width = 121
                      Height = 21
                      DataField = 'NIVEL_US'
                      DataSource = DtmCadBasicos.dsRegrasTravOsReq
                      TabOrder = 4
                    end
                    object ComboBox4: TComboBox
                      Left = 235
                      Top = 20
                      Width = 145
                      Height = 21
                      ItemHeight = 0
                      TabOrder = 5
                      Text = 'ComboBox4'
                      Visible = False
                      Items.Strings = (
                        'REQ'
                        'OS'
                        'ESF')
                    end
                    object ComboBox5: TComboBox
                      Left = 235
                      Top = 54
                      Width = 145
                      Height = 21
                      ItemHeight = 0
                      TabOrder = 6
                      Text = 'ComboBox5'
                      Visible = False
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS483]'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
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
              Hint = 'Clique para pesquisar - [BAS477]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS478]'
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
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS479]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS480]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS485]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS482]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Flat = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Flat = False
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
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpRegrasTravOsReq: TQuickRep
            Left = 3
            Top = 3
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = DtmCadBasicos.cdsRegrasTravOsReq
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
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
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
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 2
                Top = 36
                Width = 461
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  95.250000000000000000
                  1219.729166666667000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cadastro de Regras para Travar REQ/OS/EST FECH'
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
                Left = 607
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
                  1606.020833333333000000
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
                Left = 658
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
                  1740.958333333333000000
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
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
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
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 3
                Top = 1
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
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = 3
                Top = 27
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
                  71.437500000000000000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 70
                Top = 6
                Width = 35
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  185.208333333333300000
                  15.875000000000000000
                  92.604166666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Tipo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 136
                Top = 6
                Width = 104
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  359.833333333333400000
                  15.875000000000000000
                  275.166666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Sigla/Tipo OS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel6: TQRLabel
                Left = 256
                Top = 6
                Width = 75
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  677.333333333333400000
                  15.875000000000000000
                  198.437500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Qtde Dias'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel7: TQRLabel
                Left = 352
                Top = 6
                Width = 142
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  931.333333333333500000
                  15.875000000000000000
                  375.708333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Qtde Dias Reserva'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel8: TQRLabel
                Left = 516
                Top = 6
                Width = 103
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1365.250000000000000000
                  15.875000000000000000
                  272.520833333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nivel Usu'#225'rio'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 19
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
                50.270833333333330000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 70
                Top = 0
                Width = 28
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  185.208333333333300000
                  0.000000000000000000
                  74.083333333333340000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsRegrasTravOsReq
                DataField = 'TIPO'
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
              object QRDBText3: TQRDBText
                Left = 136
                Top = 0
                Width = 26
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  359.833333333333400000
                  0.000000000000000000
                  68.791666666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsRegrasTravOsReq
                DataField = 'TIPV'
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
              object QRDBText1: TQRDBText
                Left = 256
                Top = 0
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  677.333333333333400000
                  0.000000000000000000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsRegrasTravOsReq
                DataField = 'QTDE_DIAS'
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
              object QRDBText4: TQRDBText
                Left = 352
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
                  931.333333333333500000
                  0.000000000000000000
                  264.583333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsRegrasTravOsReq
                DataField = 'QTDE_DIAS_RES'
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
              object QRDBText5: TQRDBText
                Left = 516
                Top = 0
                Width = 59
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1365.250000000000000000
                  0.000000000000000000
                  156.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = DtmCadBasicos.cdsRegrasTravOsReq
                DataField = 'NIVEL_US'
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
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 173
              Width = 718
              Height = 36
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
                95.250000000000000000
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
              object QRShape3: TQRShape
                Left = 3
                Top = 4
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
                  10.583333333333330000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
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
end
