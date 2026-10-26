inherited FrmDetalheRec: TFrmDetalheRec
  Left = 257
  Top = 175
  AutoSize = True
  Caption = 'Detalhamento do recebimento de presta'#231#227'o...'
  ClientHeight = 352
  Position = poMainFormCenter
  ExplicitLeft = 257
  ExplicitTop = 175
  ExplicitWidth = 800
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 84
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 9
      Width = 67
      Height = 20
      Caption = 'Cliente: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 37
      Width = 108
      Height = 16
      Caption = 'N'#186' Documento: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 17
      Top = 60
      Width = 201
      Height = 16
      Caption = 'Valor Original do Cr'#233'dito: RS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 84
    Width = 784
    Height = 217
    Align = alTop
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 780
      Height = 200
      Align = alClient
      DataSource = DtmClientes.dsBaixaCredito
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 301
    Width = 784
    Height = 51
    Align = alTop
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 232
      Top = 14
      Width = 101
      Height = 25
      Caption = '&Imprimir Recibo'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 341
      Top = 13
      Width = 159
      Height = 26
      Caption = '&Detalhes Rec. Por  Modalidade'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object BitBtn2: TBitBtn
      Left = 688
      Top = 12
      Width = 75
      Height = 27
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 2
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
