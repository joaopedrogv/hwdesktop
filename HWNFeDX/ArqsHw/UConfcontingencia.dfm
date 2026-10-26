object FrmConfContingencia: TFrmConfContingencia
  Left = 233
  Top = 94
  Caption = 'Configura'#231#245'es de Conting'#234'ncia da NF-e'
  ClientHeight = 120
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitTop = 5
    object Label1: TLabel
      Left = 1
      Top = 16
      Width = 102
      Height = 13
      Caption = 'Tipo de Emiss'#227'o NFe:'
    end
    object ComboBox1: TComboBox
      Left = 111
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = ComboBox1Exit
      OnKeyDown = ComboBox1KeyDown
      Items.Strings = (
        'NORMAL'
        'SVC'
        'DPEC'
        'CONTINGENCIA')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 525
    Height = 40
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 23
      Top = 11
      Width = 141
      Height = 13
      Caption = 'Justificativa de Conting'#234'ncia:'
    end
    object Edit1: TEdit
      Left = 167
      Top = 3
      Width = 346
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyDown = ComboBox1KeyDown
    end
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 87
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Cancela'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 416
    Top = 87
    Width = 101
    Height = 25
    Caption = 'Verificar SVC >>'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
end
