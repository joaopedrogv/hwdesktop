object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 161
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edBanco: TEdit
    Left = 8
    Top = 8
    Width = 393
    Height = 21
    TabOrder = 0
    Text = 'joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb'
  end
  object edEmpresa: TEdit
    Left = 8
    Top = 35
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object edUsuario: TEdit
    Left = 71
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'HW'
  end
  object edNivel: TEdit
    Left = 198
    Top = 35
    Width = 51
    Height = 21
    TabOrder = 3
    Text = '100'
  end
  object edCNPJ: TEdit
    Left = 255
    Top = 35
    Width = 146
    Height = 21
    TabOrder = 4
    Text = '03530705000109'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 62
    Width = 393
    Height = 25
    Caption = 'EFD ICMS IPI'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 124
    Width = 393
    Height = 25
    Caption = 'EFD Contribui'#231#245'es'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 8
    Top = 93
    Width = 393
    Height = 25
    Caption = 'EFD ICMS IPI PAF ECF'
    TabOrder = 7
    OnClick = BitBtn3Click
  end
end
