object FrmEnvAssoHonda: TFrmEnvAssoHonda
  Left = 32
  Top = 83
  Caption = 'Controle de Envio de Estoque/Vendas Assohonda'
  ClientHeight = 429
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Data inicial:'
    end
    object Label2: TLabel
      Left = 163
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Data Final:'
    end
    object MaskEdit1: TMaskEdit
      Left = 76
      Top = 16
      Width = 69
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 223
      Top = 16
      Width = 69
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object BitBtn1: TBitBtn
      Left = 301
      Top = 12
      Width = 75
      Height = 25
      Hint = 'Buscar - [FAB009]'
      Caption = 'Buscar >>'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 984
    Height = 345
    Align = alTop
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TP_INCLUSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ARQUIVO'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_COR'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MODELO'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_COR'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUEFISICO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSITO'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANCELAMENTO'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDASDIA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDASACUMULADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDOFATURAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDIDOFIRME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONFIRMADOHONDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PEDIDOADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_STATUS_RET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_RETORNO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_STATUS_RETV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_RETORNOV'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 394
    Width = 984
    Height = 35
    Align = alTop
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Data para Enviar:'
    end
    object BitBtn2: TBitBtn
      Left = 173
      Top = 6
      Width = 129
      Height = 25
      Hint = 'Enviar p/ AssoHonda - [FAB012]'
      Caption = 'Enviar p/ AssoHonda >>'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object MaskEdit3: TMaskEdit
      Left = 98
      Top = 8
      Width = 69
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object BitBtn3: TBitBtn
      Left = 829
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 384
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Incluir - [FAB010]'
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888800000000000888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
        F0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
        F0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F08888880FFFFFF00
        888888800000000888888888888888888888}
    end
    object BitBtn5: TBitBtn
      Left = 465
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Excluir - [FAB011]'
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777777777777777770000000777777777777770F700000007777
        0F777777777770000000777000F7777770F770000000777000F777770F777000
        00007777000F77700F777000000077777000F700F7777000000077777700000F
        7777700000007777777000F777777000000077777700000F7777700000007777
        7000F70F7777700000007770000F77700F7770000000770000F7777700F77000
        00007700F7777777700F70000000777777777777777770000000777777777777
        777770000000}
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 488
    Top = 216
    object EnviarparaExcel1: TMenuItem
      Caption = 'Enviar Dados para Excel'
      OnClick = EnviarparaExcel1Click
    end
  end
end
