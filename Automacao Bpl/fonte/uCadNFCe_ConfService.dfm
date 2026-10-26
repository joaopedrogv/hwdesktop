inherited frmCadNFCe_ConfService: TfrmCadNFCe_ConfService
  AutoSize = True
  Caption = 'Configura'#231#227'o do Servi'#231'o'
  ClientHeight = 297
  ClientWidth = 481
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 489
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 297
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 153
      Height = 25
      Caption = 'Instalar Servi'#231'o'
      Enabled = False
      TabOrder = 0
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 175
      Top = 16
      Width = 153
      Height = 25
      Caption = 'Desinstalar Servi'#231'o'
      Enabled = False
      TabOrder = 1
      Visible = False
      OnClick = BitBtn2Click
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 47
      Width = 433
      Height = 66
      Caption = 'Servi'#231'o de Autoriza'#231#227'o / Cancelamento / Inutiliza'#231#227'o'
      TabOrder = 2
      object bt_aut_start: TBitBtn
        Left = 179
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = bt_aut_startClick
      end
      object bt_aut_stop: TBitBtn
        Left = 260
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 1
        OnClick = bt_aut_stopClick
      end
      object bt_aut_inst: TBitBtn
        Left = 17
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Instalar'
        TabOrder = 2
        OnClick = bt_aut_instClick
      end
      object bt_aut_des: TBitBtn
        Left = 98
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Desinstalar'
        TabOrder = 3
        OnClick = bt_aut_desClick
      end
      object bt_aut_conf: TBitBtn
        Left = 341
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 4
        OnClick = bt_aut_confClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 119
      Width = 433
      Height = 66
      Caption = 'Servi'#231'o de Impress'#227'o e Envio de email'
      TabOrder = 3
      object bt_imp_start: TBitBtn
        Left = 179
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = bt_imp_startClick
      end
      object bt_imp_stop: TBitBtn
        Left = 260
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 1
        OnClick = bt_imp_stopClick
      end
      object bt_imp_des: TBitBtn
        Left = 98
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Desinstalar'
        TabOrder = 2
        OnClick = bt_imp_desClick
      end
      object bt_imp_inst: TBitBtn
        Left = 17
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Instalar'
        TabOrder = 3
        OnClick = bt_imp_instClick
      end
      object bt_imp_conf: TBitBtn
        Left = 341
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 4
        OnClick = bt_imp_confClick
      end
    end
    object BitBtn7: TBitBtn
      Left = 334
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Configurar Servi'#231'o'
      Enabled = False
      TabOrder = 4
      Visible = False
      OnClick = BitBtn7Click
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 199
      Width = 433
      Height = 66
      Caption = 'Servi'#231'o de sincriniza'#231#227'o com API para NFCe offline'
      TabOrder = 5
      object bt_off_start: TBitBtn
        Left = 179
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = bt_off_startClick
      end
      object bt_off_stop: TBitBtn
        Left = 260
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Parar'
        TabOrder = 1
        OnClick = bt_off_stopClick
      end
      object bt_off_des: TBitBtn
        Left = 98
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Desinstalar'
        TabOrder = 2
        OnClick = bt_off_desClick
      end
      object bt_off_inst: TBitBtn
        Left = 17
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Instalar'
        TabOrder = 3
        OnClick = bt_off_instClick
      end
      object bt_off_conf: TBitBtn
        Left = 341
        Top = 23
        Width = 75
        Height = 25
        Caption = 'Configurar'
        TabOrder = 4
        OnClick = bt_off_confClick
      end
    end
    object Panel2: TPanel
      Left = 438
      Top = 0
      Width = 457
      Height = 273
      Caption = 'Panel2'
      TabOrder = 6
      Visible = False
      object pnConf: TPanel
        Left = 17
        Top = 8
        Width = 432
        Height = 257
        BevelKind = bkTile
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Panel3: TPanel
          Left = 6
          Top = 206
          Width = 416
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn3: TBitBtn
            Left = 168
            Top = 6
            Width = 75
            Height = 25
            Caption = 'OK'
            ModalResult = 2
            TabOrder = 0
          end
        end
        object memoConf: TMemo
          Left = 6
          Top = 6
          Width = 416
          Height = 200
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Lines.Strings = (
            'memoConf')
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ExplicitLeft = 110
          ExplicitTop = 80
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
  end
end
