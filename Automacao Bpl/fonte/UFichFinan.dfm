inherited FrmFichaFin: TFrmFichaFin
  Left = 246
  Top = 91
  AutoSize = True
  Caption = 'Ficha Financeira'
  ClientHeight = 483
  Position = poMainFormCenter
  ExplicitLeft = 246
  ExplicitTop = 91
  ExplicitWidth = 792
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 784
    Height = 120
    Align = alTop
    Caption = 'Cr'#233'ditos'
    TabOrder = 0
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 780
      Height = 103
      Align = alClient
      DataSource = DtmClientes.dsPesquisa
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 120
    Width = 784
    Height = 38
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 391
      Top = 6
      Width = 115
      Height = 13
      Caption = 'Total em Aberto: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 613
      Top = 6
      Width = 87
      Height = 13
      Caption = 'Total Pago: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 511
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 704
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 158
    Width = 784
    Height = 120
    Align = alTop
    Caption = 'Cheques'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 780
      Height = 103
      Align = alClient
      DataSource = DtmClientes.dsPesquisa1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 278
    Width = 784
    Height = 38
    Align = alTop
    TabOrder = 3
    object Label5: TLabel
      Left = 391
      Top = 6
      Width = 115
      Height = 13
      Caption = 'Total em Aberto: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 613
      Top = 6
      Width = 87
      Height = 13
      Caption = 'Total Pago: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 511
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 704
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Label8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 0
    Top = 316
    Width = 784
    Height = 120
    Align = alTop
    Caption = 'Vale compra/Recibos'
    TabOrder = 4
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 780
      Height = 103
      Align = alClient
      DataSource = DtmClientes.dsPesquisa2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 436
    Width = 784
    Height = 47
    Align = alTop
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 354
      Top = 11
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
  end
end
