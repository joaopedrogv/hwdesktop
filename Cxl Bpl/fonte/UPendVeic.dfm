inherited FrmPendCcia: TFrmPendCcia
  Caption = 'Pend'#234'ncias Veiculos...'
  ExplicitWidth = 792
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 784
    Height = 423
    Align = alClient
    DataSource = DtmBalcao.DtPendOS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 784
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 9
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Confirma'
    end
    object SpeedButton2: TSpeedButton
      Left = 80
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Soma'
    end
    object SpeedButton3: TSpeedButton
      Left = 149
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Detalhes Rec'
    end
    object SpeedButton4: TSpeedButton
      Left = 219
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Pesquisa'
    end
    object SpeedButton5: TSpeedButton
      Left = 289
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Atualiza'
    end
    object SpeedButton6: TSpeedButton
      Left = 359
      Top = 6
      Width = 64
      Height = 27
      Caption = 'Cancelar'
    end
    object SpeedButton7: TSpeedButton
      Left = 430
      Top = 5
      Width = 64
      Height = 27
      Caption = 'Env. Frente'
    end
    object SpeedButton8: TSpeedButton
      Left = 500
      Top = 6
      Width = 64
      Height = 27
      Caption = 'Sair'
    end
  end
end
