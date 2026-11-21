object frmEventoDFe211130ItensFrame: TfrmEventoDFe211130ItensFrame
  Left = 0
  Top = 0
  Width = 600
  Height = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object pnComandos1: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 44
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object btnIncluir: TButton
      Left = 6
      Top = 6
      Width = 90
      Height = 32
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 102
      Top = 6
      Width = 90
      Height = 32
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnRemover: TButton
      Left = 198
      Top = 6
      Width = 90
      Height = 32
      Caption = 'Remover'
      TabOrder = 2
      OnClick = btnRemoverClick
    end
  end
  inline fraGrid: TfrmDataGridFrame
    AlignWithMargins = True
    Left = 6
    Top = 50
    Width = 588
    Height = 244
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    TabOrder = 1
    TabStop = True
    ExplicitLeft = 6
    ExplicitTop = 50
    ExplicitWidth = 588
    ExplicitHeight = 244
    inherited pnComandos: TPanel
      Width = 588
    end
    inherited dbgDados: TDBGrid
      Width = 588
      Height = 208
    end
  end
  object dsItens: TDataSource
    Left = 6
    Top = 250
  end
end
