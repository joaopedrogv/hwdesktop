object FrmArqFrente: TFrmArqFrente
  Left = 113
  Top = 114
  Caption = 'Importa'#231#227'o e Exporta'#231#227'o de Arquivos para o Fiscal'
  ClientHeight = 279
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 680
    Height = 278
    Align = alTop
    Caption = 'Arquivos'
    TabOrder = 0
    ExplicitTop = 47
    object PageControl1: TPageControl
      Left = 2
      Top = 15
      Width = 676
      Height = 261
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 0
      object TabSheet1: TTabSheet
        Caption = 'Importar'
        OnShow = TabSheet1Show
        object SpeedButton1: TSpeedButton
          Left = 455
          Top = 35
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF078DBE
            078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078DBE078D
            BE078DBEFF00FFFF00FF078DBE25A1D172C7E785D7FA66CDF965CDF965CDF965
            CDF965CDF865CDF965CDF866CEF939ADD8078DBEFF00FFFF00FF078DBE4CBCE7
            39A8D1A0E2FB6FD4FA6FD4F96ED4FA6FD4F96FD4FA6FD4FA6FD4FA6ED4F93EB1
            D984D7EB078DBEFF00FF078DBE72D6FA078DBEAEEAFC79DCFB79DCFB79DCFB79
            DCFB79DCFB7ADCFB79DCFA79DCFA44B5D9AEF1F9078DBEFF00FF078DBE79DDFB
            1899C79ADFF392E7FB84E4FB83E4FC83E4FC84E4FC83E4FC83E4FB84E5FC48B9
            DAB3F4F9078DBEFF00FF078DBE82E3FC43B7DC65C3E0ACF0FD8DEBFC8DEBFC8D
            EBFD8DEBFD8DEBFC8DEBFD0C85184CBBDAB6F7F96DCAE0078DBE078DBE8AEAFC
            77DCF3229CC6FDFFFFC8F7FEC9F7FEC9F7FEC9F7FEC8F7FE0C85183CBC5D0C85
            18DEF9FBD6F6F9078DBE078DBE93F0FE93F0FD1697C5078DBE078DBE078DBE07
            8DBE078DBE0C851852D97F62ED9741C4650C8518078DBE078DBE078DBE9BF5FE
            9AF6FE9AF6FE9BF5FD9BF6FE9AF6FE9BF5FE0C851846CE6C59E48858E18861EB
            9440C1650C8518FF00FF078DBEFEFEFEA0FBFFA0FBFEA0FBFEA1FAFEA1FBFE0C
            85180C85180C85180C851856E18447CD6E0C85180C85180C8518FF00FF078DBE
            FEFEFEA5FEFFA5FEFFA5FEFF078CB643B7DC43B7DC43B7DC0C85184EDD7936BA
            540C8518FF00FFFF00FFFF00FFFF00FF078DBE078DBE078DBE078DBEFF00FFFF
            00FFFF00FFFF00FF0C851840D0650C8518FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85182AB7432DBA490C85
            18FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0C851821B5380C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C85180C8518FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0C85180C85180C
            85180C8518FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = SpeedButton1Click
        end
        object Label1: TLabel
          Left = 11
          Top = 16
          Width = 143
          Height = 13
          Caption = 'Endere'#231'o do arquivo de texto'
        end
        object Gauge1: TGauge
          Left = 10
          Top = 168
          Width = 646
          Height = 33
          Progress = 0
          Visible = False
        end
        object Label5: TLabel
          Left = 11
          Top = 149
          Width = 71
          Height = 13
          Caption = 'Aguardando...'
          Visible = False
        end
        object Label6: TLabel
          Left = 256
          Top = 149
          Width = 123
          Height = 13
          Caption = 'Total de 475599 registros'
          Visible = False
        end
        object Label7: TLabel
          Left = 558
          Top = 149
          Width = 54
          Height = 13
          Caption = 'Registro n'#186
          Visible = False
        end
        object Label8: TLabel
          Left = 11
          Top = 130
          Width = 40
          Height = 13
          Caption = 'Terminal'
        end
        object Edit1: TEdit
          Left = 11
          Top = 35
          Width = 438
          Height = 21
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 574
          Top = 32
          Width = 82
          Height = 25
          Caption = 'Processar >>'
          TabOrder = 1
          OnClick = BitBtn1Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Exportar'
        ImageIndex = 1
        OnShow = TabSheet2Show
        object SpeedButton2: TSpeedButton
          Left = 335
          Top = 167
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF7F2B287F2B28A18283A18283A18283A1
            8283A18283A18283A182837A1C1C7F2B28FF00FFFF00FFFF00FFFF00FF7F2B28
            CA4D4DB64545DDD4D5791617791617DCE0E0D7DADECED5D7BDBABD76100F9A2D
            2D7F2B28FF00FFFF00FFFF00FF7F2B28C24A4BB14444E2D9D9791617791617D9
            D8DAD9DEE1D3D9DCC1BDC1761111982D2D7F2B28FF00FFFF00FFFF00FF7F2B28
            C24A4AB04242E6DCDC791617791617D5D3D5D8DEE1D7DDE0C6C2C5700F0F962C
            2C7F2B28FF00FFFF00FFFF00FF7F2B28C24A4AB04141EADEDEE7DDDDDDD4D5D7
            D3D5D5D7D9D7D8DACAC2C57E17179E31317F2B28FF00FFFF00FFFF00FF7F2B28
            BF4748B84545BA4C4CBD5757BB5756B64E4EB44949BD5251BB4B4CB54242BF4A
            4A7F2B28FF00FFFF00FFFF00FF7F2B28A33B39B1605DC68684CB918FCC9190CC
            908FCB8988C98988CB9391CC9696BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
            BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B
            4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
            BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
            4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FF7F2B28
            BD4B4CF7F7F7BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFF7F7F7BD4B
            4C7F2B28FF00FFFF00FFFF00FF7F2B28BD4B4CF7F7F7F7F7F7F7F7F7F7F7F7F7
            F7F7F7F7F7F7F7F7F7F7F7F7F7F7BD4B4C7F2B28FF00FFFF00FFFF00FFFF00FF
            7F2B28F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F77F2B
            28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = SpeedButton2Click
        end
        object Gauge2: TGauge
          Left = 3
          Top = 213
          Width = 662
          Height = 17
          Progress = 0
        end
        object Label2: TLabel
          Left = 373
          Top = 175
          Width = 17
          Height = 13
          Caption = 'De:'
        end
        object Label3: TLabel
          Left = 473
          Top = 175
          Width = 21
          Height = 13
          Caption = 'At'#233':'
        end
        object Label4: TLabel
          Left = 3
          Top = 194
          Width = 71
          Height = 13
          Caption = 'Aguardando...'
        end
        object GroupBox3: TGroupBox
          Left = 3
          Top = 3
          Width = 662
          Height = 158
          Caption = 'Tabelas do Sistema Fiscal'
          Enabled = False
          TabOrder = 0
          object aliq: TCheckBox
            Left = 24
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Aliq'
            Enabled = False
            TabOrder = 0
          end
          object Barra: TCheckBox
            Left = 24
            Top = 39
            Width = 97
            Height = 17
            Caption = 'Barra'
            TabOrder = 1
          end
          object CadFP: TCheckBox
            Left = 24
            Top = 62
            Width = 97
            Height = 17
            Caption = 'CadFP'
            Enabled = False
            TabOrder = 2
          end
          object Cliente: TCheckBox
            Left = 24
            Top = 85
            Width = 97
            Height = 17
            Caption = 'Cliente'
            TabOrder = 3
          end
          object ConfImp: TCheckBox
            Left = 24
            Top = 108
            Width = 97
            Height = 17
            Caption = 'ConfImp'
            Enabled = False
            TabOrder = 4
          end
          object ConsPw: TCheckBox
            Left = 24
            Top = 131
            Width = 97
            Height = 17
            Caption = 'ConsPw'
            Enabled = False
            TabOrder = 5
          end
          object Cupom: TCheckBox
            Left = 152
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Cupom'
            Checked = True
            State = cbChecked
            TabOrder = 6
          end
          object Cupom2: TCheckBox
            Left = 152
            Top = 39
            Width = 97
            Height = 17
            Caption = 'Cupom2'
            Checked = True
            State = cbChecked
            TabOrder = 7
          end
          object CupomInt: TCheckBox
            Left = 152
            Top = 62
            Width = 97
            Height = 17
            Caption = 'CupomInt'
            Enabled = False
            TabOrder = 8
          end
          object Cupom2Int: TCheckBox
            Left = 152
            Top = 85
            Width = 97
            Height = 17
            Caption = 'Cupom2Int'
            Enabled = False
            TabOrder = 9
          end
          object DA: TCheckBox
            Left = 152
            Top = 108
            Width = 97
            Height = 17
            Caption = 'DA'
            Enabled = False
            TabOrder = 10
          end
          object Empresa: TCheckBox
            Left = 152
            Top = 131
            Width = 97
            Height = 17
            Caption = 'Empresa'
            TabOrder = 11
          end
          object FinCupom: TCheckBox
            Left = 280
            Top = 16
            Width = 97
            Height = 17
            Caption = 'FinCupom'
            Checked = True
            State = cbChecked
            TabOrder = 12
          end
          object FormPag: TCheckBox
            Left = 280
            Top = 39
            Width = 97
            Height = 17
            Caption = 'FormPag'
            TabOrder = 13
          end
          object ForPgto: TCheckBox
            Left = 280
            Top = 62
            Width = 97
            Height = 17
            Caption = 'ForPgto'
            Enabled = False
            TabOrder = 14
          end
          object Funcion: TCheckBox
            Left = 280
            Top = 85
            Width = 97
            Height = 17
            Caption = 'Funcion'
            TabOrder = 15
          end
          object Itbx: TCheckBox
            Left = 280
            Top = 108
            Width = 97
            Height = 17
            Caption = 'Itbx'
            Enabled = False
            TabOrder = 16
          end
          object PendPreV: TCheckBox
            Left = 280
            Top = 131
            Width = 97
            Height = 17
            Caption = 'PendPreV'
            Enabled = False
            TabOrder = 17
          end
          object PrestTemp: TCheckBox
            Left = 413
            Top = 16
            Width = 97
            Height = 17
            Caption = 'PrestTemp'
            Enabled = False
            TabOrder = 18
          end
          object Processos: TCheckBox
            Left = 413
            Top = 39
            Width = 97
            Height = 17
            Caption = 'Processos'
            Enabled = False
            TabOrder = 19
          end
          object Produto: TCheckBox
            Left = 413
            Top = 62
            Width = 97
            Height = 17
            Caption = 'Produto'
            TabOrder = 20
          end
          object ResumoD: TCheckBox
            Left = 413
            Top = 85
            Width = 97
            Height = 17
            Caption = 'ResumoD'
            Checked = True
            State = cbChecked
            TabOrder = 21
          end
          object SangSup: TCheckBox
            Left = 413
            Top = 108
            Width = 97
            Height = 17
            Caption = 'SangSup'
            Checked = True
            State = cbChecked
            TabOrder = 22
          end
          object Tecl: TCheckBox
            Left = 536
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Tecl'
            Enabled = False
            TabOrder = 23
          end
          object TempOp: TCheckBox
            Left = 536
            Top = 39
            Width = 97
            Height = 17
            Caption = 'TempOp'
            Enabled = False
            TabOrder = 24
          end
          object Terminais: TCheckBox
            Left = 536
            Top = 62
            Width = 97
            Height = 17
            Caption = 'Terminais'
            Enabled = False
            TabOrder = 25
          end
          object TipFinal: TCheckBox
            Left = 536
            Top = 85
            Width = 97
            Height = 17
            Caption = 'TipFinal'
            Checked = True
            State = cbChecked
            TabOrder = 26
          end
          object Tip75: TCheckBox
            Left = 536
            Top = 108
            Width = 97
            Height = 17
            Caption = 'Tip75'
            Enabled = False
            TabOrder = 27
          end
          object TransTEF: TCheckBox
            Left = 536
            Top = 131
            Width = 97
            Height = 17
            Caption = 'Mapa ResumoD'
            Enabled = False
            TabOrder = 28
          end
          object Servicos: TCheckBox
            Left = 413
            Top = 131
            Width = 97
            Height = 17
            Caption = 'Servicos'
            TabOrder = 29
          end
        end
        object BitBtn2: TBitBtn
          Left = 590
          Top = 167
          Width = 75
          Height = 25
          Caption = 'Exportar'
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object Edit2: TEdit
          Left = 3
          Top = 167
          Width = 326
          Height = 21
          TabOrder = 2
        end
        object MaskEdit1: TMaskEdit
          Left = 396
          Top = 167
          Width = 70
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
        end
        object MaskEdit2: TMaskEdit
          Left = 500
          Top = 167
          Width = 68
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 4
          Text = '  /  /    '
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo de Texto (*.txt)|*.txt'
    Left = 622
    Top = 206
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivo de texto (*.txt)|*.txt'
    Left = 622
    Top = 318
  end
end
