inherited frmTesteTeclas: TfrmTesteTeclas
  Left = 304
  Top = 176
  AutoSize = True
  Caption = 'Testando Teclas do Teclado PDV'
  ClientHeight = 250
  ClientWidth = 500
  Position = poMainFormCenter
  ExplicitLeft = 304
  ExplicitTop = 176
  ExplicitWidth = 508
  ExplicitHeight = 277
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 250
    TabOrder = 0
    object Label1: TLabel
      Left = 145
      Top = 56
      Width = 29
      Height = 13
      Caption = 'Tecla:'
    end
    object Label2: TLabel
      Left = 128
      Top = 83
      Width = 47
      Height = 13
      Caption = 'Processo:'
    end
    object Label3: TLabel
      Left = 124
      Top = 110
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 354
      Top = 17
      Width = 124
      Height = 13
      Caption = 'Tecla n'#227'o configurada'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object CheckBox1: TCheckBox
      Left = 22
      Top = 16
      Width = 145
      Height = 17
      Caption = 'Habilitar teste das teclas'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object Edit1: TEdit
      Left = 180
      Top = 48
      Width = 166
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 180
      Top = 75
      Width = 166
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 180
      Top = 102
      Width = 166
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 212
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = BitBtn1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 416
    Top = 32
  end
end
