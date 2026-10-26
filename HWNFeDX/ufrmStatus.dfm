object frmStatus: TfrmStatus
  Left = 231
  Top = 166
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Mensagem de Comunica'#231#227'o com WebService...'
  ClientHeight = 45
  ClientWidth = 571
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 45
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 2
      Top = 2
      Width = 567
      Height = 17
      Align = alTop
      AutoSize = False
      Caption = 'Status do Sistema de NF-e'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      ExplicitWidth = 477
    end
    object lblStatus: TLabel
      Left = 2
      Top = 19
      Width = 4
      Height = 18
      Align = alClient
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
  end
end
