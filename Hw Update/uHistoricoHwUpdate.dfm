object frmHistoricoHwUpdate: TfrmHistoricoHwUpdate
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Hist'#243'rico HwUpdate'
  ClientHeight = 513
  ClientWidth = 777
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 31
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'Hist'#243'rico HwUpdate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 37
    Width = 777
    Height = 116
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 1
    object Label1: TLabel
      Left = 391
      Top = 37
      Width = 21
      Height = 13
      Caption = '[SH]'
    end
    object Label2: TLabel
      Left = 454
      Top = 37
      Width = 18
      Height = 13
      Caption = '[IP]'
    end
    object Label3: TLabel
      Left = 551
      Top = 37
      Width = 21
      Height = 13
      Caption = '[PC]'
    end
    object Label4: TLabel
      Left = 647
      Top = 37
      Width = 68
      Height = 13
      Caption = '[MT] - M'#233'todo'
    end
    object Label5: TLabel
      Left = 6
      Top = 37
      Width = 33
      Height = 13
      Caption = 'Vers'#227'o'
    end
    object Panel3: TPanel
      Left = 6
      Top = 6
      Width = 761
      Height = 25
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 127
      Top = 37
      Width = 258
      Height = 40
      Caption = 'Tipos'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Erros'
        'Processados')
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 391
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 2
      Text = 'X2345678'
    end
    object Edit2: TEdit
      Left = 454
      Top = 56
      Width = 91
      Height = 21
      TabOrder = 3
      Text = '192.168.254.254'
    end
    object Edit3: TEdit
      Left = 551
      Top = 56
      Width = 90
      Height = 21
      TabOrder = 4
      Text = 'FINANCEIRO'
    end
    object Edit4: TEdit
      Left = 647
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'Edit1'
    end
    object ComboBox1: TComboBox
      Left = 6
      Top = 56
      Width = 83
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
    end
    object BitBtn1: TBitBtn
      Left = 91
      Top = 43
      Width = 30
      Height = 34
      TabOrder = 7
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
        B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
        DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
        4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
        E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
        7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
        6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
        4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
    end
    object CheckBox1: TCheckBox
      Left = 416
      Top = 37
      Width = 35
      Height = 17
      Hint = 'Diferente'
      Caption = '!='
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object CheckBox2: TCheckBox
      Left = 478
      Top = 37
      Width = 35
      Height = 17
      Hint = 'Diferente'
      Caption = '!='
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object CheckBox3: TCheckBox
      Left = 578
      Top = 37
      Width = 35
      Height = 17
      Hint = 'Diferente'
      Caption = '!='
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object CheckBox4: TCheckBox
      Left = 721
      Top = 37
      Width = 35
      Height = 17
      Hint = 'Diferente'
      Caption = '!='
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object BitBtn3: TBitBtn
      Left = 6
      Top = 81
      Width = 761
      Height = 25
      Align = alBottom
      Caption = 'Filtrar'
      TabOrder = 12
      OnClick = BitBtn3Click
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 159
    Width = 777
    Height = 354
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 2
    object ListBox1: TListBox
      Left = 6
      Top = 6
      Width = 761
      Height = 313
      Align = alClient
      ItemHeight = 13
      ScrollWidth = 10
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 6
      Top = 319
      Width = 761
      Height = 25
      Align = alBottom
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
