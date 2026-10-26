object frmManutencaoArqAuxCript: TfrmManutencaoArqAuxCript
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o de dados criptografados gravados em arquivo auxiliar'
  ClientHeight = 464
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 393
    Height = 81
    Caption = 'Gravar ECF Autorizado'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Numero Caixa'
    end
    object Label2: TLabel
      Left = 111
      Top = 24
      Width = 116
      Height = 13
      Caption = 'N'#250'mero de S'#233'rie do ECF'
    end
    object Edit1: TEdit
      Left = 16
      Top = 43
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 111
      Top = 43
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 295
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 95
    Width = 393
    Height = 81
    Caption = 'Gravar Grande Total Acumulado'
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Numero Caixa'
    end
    object Label4: TLabel
      Left = 111
      Top = 24
      Width = 155
      Height = 13
      Caption = 'Valor do grande total acumulado'
    end
    object Edit3: TEdit
      Left = 16
      Top = 43
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 295
      Top = 39
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object EditHw1: TEditHw
      Left = 111
      Top = 43
      Width = 178
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Text = '                                   0'
      Formato = fFixed
      FormatSize = '0.2'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 182
    Width = 393
    Height = 227
    Caption = 'Gravar Empresa Desenvolvedora'
    TabOrder = 2
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object Label7: TLabel
      Left = 111
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Insc Estadual'
    end
    object Label8: TLabel
      Left = 207
      Top = 24
      Width = 66
      Height = 13
      Caption = 'Insc Municipal'
    end
    object Label9: TLabel
      Left = 16
      Top = 70
      Width = 64
      Height = 13
      Caption = 'Denomina'#231#227'o'
    end
    object Label10: TLabel
      Left = 16
      Top = 116
      Width = 87
      Height = 13
      Caption = 'Nome do PAF-ECF'
    end
    object Label6: TLabel
      Left = 207
      Top = 116
      Width = 78
      Height = 13
      Caption = 'Vers'#227'o PAF-ECF'
    end
    object Label11: TLabel
      Left = 16
      Top = 162
      Width = 121
      Height = 13
      Caption = 'C'#243'digo MD-5 do PAF-ECF'
    end
    object Edit4: TEdit
      Left = 16
      Top = 43
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 14
      TabOrder = 0
      Text = '03530705000109'
    end
    object BitBtn3: TBitBtn
      Left = 295
      Top = 177
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object Edit5: TEdit
      Left = 111
      Top = 43
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 14
      TabOrder = 2
      Text = '2773057110004'
    end
    object Edit6: TEdit
      Left = 207
      Top = 43
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 14
      TabOrder = 3
      Text = '0406231'
    end
    object Edit7: TEdit
      Left = 16
      Top = 89
      Width = 273
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 4
      Text = 'HW SISTEMAS E COMPUTADORES LTDA'
    end
    object Edit8: TEdit
      Left = 16
      Top = 135
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 5
      Text = 'FISCAL 4.1'
    end
    object Edit9: TEdit
      Left = 207
      Top = 135
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 6
      Text = '4.1'
    end
    object Edit10: TEdit
      Left = 16
      Top = 181
      Width = 273
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 32
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 415
    Width = 394
    Height = 41
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 158
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Raiz Aplica'#231#227'o'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 282
      Top = 8
      Width = 88
      Height = 17
      Caption = 'System32'
      TabOrder = 2
    end
  end
end
