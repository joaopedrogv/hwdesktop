object frmGrupoFiscalCadastroFrame: TfrmGrupoFiscalCadastroFrame
  Left = 0
  Top = 0
  Width = 736
  Height = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object lblDescricao: TLabel
    Left = 16
    Top = 12
    Width = 56
    Height = 16
    Caption = 'Descri'#231#227'o'
  end
  object edDescricao: TEdit
    Left = 16
    Top = 30
    Width = 600
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    MaxLength = 128
    TabOrder = 0
  end
  object lblErroDescricao: TLabel
    Left = 16
    Top = 57
    Width = 600
    Height = 32
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object lblTipoTributo: TLabel
    Left = 16
    Top = 90
    Width = 89
    Height = 16
    Caption = 'Tipo de tributo'
  end
  object cbTipoTributo: TComboBox
    Left = 16
    Top = 108
    Width = 260
    Height = 24
    Style = csDropDownList
    TabOrder = 1
  end
  object lblErroTipoTributo: TLabel
    Left = 16
    Top = 135
    Width = 600
    Height = 32
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object lblEmpresas: TLabel
    Left = 16
    Top = 168
    Width = 54
    Height = 16
    Caption = 'Empresas'
  end
  object clbEmpresas: TCheckListBox
    Left = 16
    Top = 186
    Width = 600
    Height = 120
    Anchors = [akLeft, akTop, akRight]
    IntegralHeight = False
    TabOrder = 2
  end
  object lblErroGeral: TLabel
    Left = 16
    Top = 312
    Width = 600
    Height = 32
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
    WordWrap = True
  end
end
