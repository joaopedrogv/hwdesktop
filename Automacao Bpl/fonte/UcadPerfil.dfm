inherited frmCadPerfil: TfrmCadPerfil
  Caption = 'Perfil'
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
              ActivePage = TabSheet4
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 145
                    Caption = 'Dados Perfil'
                    ExplicitHeight = 145
                    object Label6: TLabel
                      Left = 40
                      Top = 42
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 27
                      Top = 67
                      Width = 46
                      Height = 13
                      Caption = 'Descri'#231#227'o'
                      FocusControl = DBEdit2
                    end
                    object DBEdit1: TDBEdit
                      Left = 79
                      Top = 37
                      Width = 66
                      Height = 21
                      DataField = 'CAMPO_PERFIL'
                      DataSource = DtmCadBasicos.dsPerfil
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 79
                      Top = 64
                      Width = 385
                      Height = 21
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsPerfil
                      TabOrder = 1
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'TabSheet4'
                ImageIndex = 1
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
                  DataSet = DtmCadBasicos.cdsPerfil
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
                  ReportTitle = 'Rela'#231#227'o de Perfis'
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
                    Height = 82
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
                      216.958333333333400000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 128
                      Top = 56
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        338.666666666666700000
                        148.166666666666700000
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
                    object QRLabel2: TQRLabel
                      Left = 272
                      Top = 56
                      Width = 63
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        719.666666666666800000
                        148.166666666666700000
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
                    object QRPLabel1: TQRPLabel
                      Left = 248
                      Top = 8
                      Width = 162
                      Height = 23
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        60.854166666666680000
                        656.166666666666800000
                        21.166666666666670000
                        428.625000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Rela'#231#227'o de Perfis'
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
                      Degree = 0
                      FixBottomPosition = False
                      StretchHeightWithBand = False
                      FontSize = 14
                    end
                    object QRPLabel2: TQRPLabel
                      Left = 0
                      Top = 34
                      Width = 64
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        89.958333333333340000
                        169.333333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Data/hora:'
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
                    object QRPLabel3: TQRPLabel
                      Left = 608
                      Top = 34
                      Width = 47
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1608.666666666667000000
                        89.958333333333340000
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
                      Degree = 0
                      FixBottomPosition = False
                      StretchHeightWithBand = False
                      FontSize = 10
                    end
                    object QRHRule1: TQRHRule
                      Left = 0
                      Top = 48
                      Width = 717
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        127.000000000000000000
                        1897.062500000000000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRHRule2: TQRHRule
                      Left = 0
                      Top = 72
                      Width = 717
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        26.458333333333330000
                        0.000000000000000000
                        190.500000000000000000
                        1897.062500000000000000)
                      VertAdjust = 0
                      Pen.Width = 2
                    end
                    object QRSysData1: TQRSysData
                      Left = 70
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
                        185.208333333333300000
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
                    object QRSysData2: TQRSysData
                      Left = 661
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
                        1748.895833333334000000
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
                  end
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 120
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
                      Left = 128
                      Top = 5
                      Width = 101
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        338.666666666666700000
                        13.229166666666670000
                        267.229166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsPerfil
                      DataField = 'CAMPO_PERFIL'
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 10
                    end
                    object QRDBText2: TQRDBText
                      Left = 272
                      Top = 4
                      Width = 77
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        719.666666666666800000
                        10.583333333333330000
                        203.729166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = DtmCadBasicos.cdsPerfil
                      DataField = 'DESCRICAO'
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
                Hint = 'Salvar Registro - [BAS319]'
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
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS315]'
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
              DataSource = DtmCadBasicos.dsPerfil
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS316]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS317]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BAS322]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS319]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS321]'
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
end
