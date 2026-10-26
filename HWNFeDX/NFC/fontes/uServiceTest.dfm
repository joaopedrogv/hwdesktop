object frmNFCTest: TfrmNFCTest
  Left = 0
  Top = 0
  Caption = 'NFC - Configurador - Testes'
  ClientHeight = 669
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 161
    Top = 0
    Width = 922
    Height = 669
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 669
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 6
      Top = 6
      Width = 149
      Height = 295
      Align = alClient
      Caption = 'Client / StantAlone'
      TabOrder = 0
      object BitBtn5: TBitBtn
        Left = 8
        Top = 64
        Width = 129
        Height = 25
        Caption = 'Enviar NFCe'
        TabOrder = 0
        OnClick = BitBtn5Click
      end
      object BitBtn6: TBitBtn
        Left = 8
        Top = 95
        Width = 129
        Height = 25
        Caption = 'Imprimir NFC-e'
        TabOrder = 1
        OnClick = BitBtn6Click
      end
      object BitBtn7: TBitBtn
        Left = 8
        Top = 126
        Width = 129
        Height = 25
        Caption = 'Cancelar NFC-e'
        TabOrder = 2
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 8
        Top = 157
        Width = 129
        Height = 25
        Caption = 'Gerar Contingencia'
        TabOrder = 3
        OnClick = BitBtn8Click
      end
      object BitBtn9: TBitBtn
        Left = 8
        Top = 188
        Width = 129
        Height = 25
        Caption = 'Inutilizar NFC-e'
        TabOrder = 4
        OnClick = BitBtn9Click
      end
      object BitBtn10: TBitBtn
        Left = 8
        Top = 219
        Width = 129
        Height = 25
        Caption = 'Email NFC-e'
        TabOrder = 5
        OnClick = BitBtn10Click
      end
      object BitBtn11: TBitBtn
        Left = 8
        Top = 250
        Width = 129
        Height = 25
        Caption = 'Clear DLL'
        TabOrder = 6
        OnClick = BitBtn11Click
      end
      object Edit1: TEdit
        Left = 10
        Top = 24
        Width = 127
        Height = 21
        MaxLength = 16
        TabOrder = 7
        Text = '02659A1800061895'
        OnExit = Edit1Exit
      end
    end
    object Panel2: TPanel
      Left = 6
      Top = 301
      Width = 149
      Height = 288
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 149
        Height = 288
        Align = alClient
        Caption = 'Server / Servico'
        TabOrder = 0
        object BitBtn1: TBitBtn
          Left = 8
          Top = 24
          Width = 129
          Height = 25
          Caption = 'Configurar'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 10
          Top = 179
          Width = 129
          Height = 25
          Caption = 'NFCe Count Thread'
          TabOrder = 5
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 10
          Top = 117
          Width = 129
          Height = 25
          Caption = 'Verficar Central Acoes'
          TabOrder = 3
          OnClick = BitBtn3Click
        end
        object BitBtn12: TBitBtn
          Left = 10
          Top = 148
          Width = 129
          Height = 25
          Caption = 'Loop Central Acoes = off'
          TabOrder = 4
          OnClick = BitBtn12Click
        end
        object BitBtn13: TBitBtn
          Left = 10
          Top = 55
          Width = 129
          Height = 25
          Caption = 'Config PosPrinter'
          TabOrder = 1
          OnClick = BitBtn13Click
        end
        object BitBtn14: TBitBtn
          Left = 10
          Top = 210
          Width = 129
          Height = 25
          Caption = 'IMP Count Thread'
          TabOrder = 6
          OnClick = BitBtn14Click
        end
        object BitBtn16: TBitBtn
          Left = 10
          Top = 86
          Width = 129
          Height = 25
          Caption = 'Clear DLL'
          TabOrder = 2
          OnClick = BitBtn16Click
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 589
      Width = 149
      Height = 74
      Align = alBottom
      TabOrder = 2
      object BitBtn4: TBitBtn
        Left = 8
        Top = 11
        Width = 129
        Height = 25
        Caption = 'Limpar Log'
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object BitBtn17: TBitBtn
        Left = 8
        Top = 42
        Width = 129
        Height = 25
        Caption = 'Sair'
        TabOrder = 1
        OnClick = BitBtn17Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 528
    Top = 272
  end
end
