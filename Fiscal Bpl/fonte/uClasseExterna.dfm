object frmSegundoPlano: TfrmSegundoPlano
  Left = 229
  Top = 127
  AlphaBlend = True
  AlphaBlendValue = 1
  Caption = 'Impressao de Cupom Fiscal'
  ClientHeight = 153
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 120
    Top = 48
    Width = 241
    Height = 41
    Caption = 'Imprimir Cupom Fiscal'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 464
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 96
    object VerificarSolicitaes1: TMenuItem
      Caption = 'Verificar Solicita'#231#245'es'
      OnClick = VerificarSolicitaes1Click
    end
    object AbrirSistemaFiscal1: TMenuItem
      Caption = 'Abrir Sistema Fiscal'
      OnClick = AbrirSistemaFiscal1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ResetaremcasodeErro1: TMenuItem
      Caption = 'Sair do Fiscal em segundo plano'
      OnClick = ResetaremcasodeErro1Click
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 440
    Top = 64
  end
end
