object frmDefinirPISCOFINSCP: TfrmDefinirPISCOFINSCP
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmDefinirPISCOFINSCP'
  ClientHeight = 58
  ClientWidth = 579
  Color = clBtnFace
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
    Width = 579
    Height = 58
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 2
      Top = 2
      Width = 575
      Height = 17
      Align = alTop
      AutoSize = False
      Caption = 'Status de Processamento'
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
      Width = 575
      Height = 20
      Align = alClient
      Caption = 'Status de processamento'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 187
      ExplicitHeight = 18
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 39
      Width = 575
      Height = 17
      Align = alBottom
      TabOrder = 0
    end
  end
end
