object frmNews: TfrmNews
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Canal de Not'#237'cias Hw Sistemas'
  ClientHeight = 566
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 643
    Height = 525
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 808
    ExplicitHeight = 528
    ControlData = {
      4C00000075420000433600000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 525
    Width = 643
    Height = 41
    Align = alBottom
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 16
      Top = 16
      Width = 305
      Height = 17
      Caption = 'N'#227'o exibir esta tela novamente at'#233' surgir novas not'#237'cias'
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 552
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
