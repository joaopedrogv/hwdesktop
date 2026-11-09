object frmDataGridFrame: TfrmDataGridFrame
  Left = 0
  Top = 0
  Width = 760
  Height = 376
  TabOrder = 0
  TabStop = True
  object pnComandos: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object btnSelecionarTodos: TButton
      Left = 8
      Top = 4
      Width = 120
      Height = 24
      Caption = 'Selecionar todos'
      TabOrder = 0
      OnClick = btnSelecionarTodosClick
    end
    object btnDesmarcarTodos: TButton
      Left = 136
      Top = 4
      Width = 120
      Height = 24
      Caption = 'Desmarcar todos'
      TabOrder = 1
      OnClick = btnDesmarcarTodosClick
    end
    object btnInverterSelecao: TButton
      Left = 264
      Top = 4
      Width = 120
      Height = 24
      Caption = 'Inverter sele??o'
      TabOrder = 2
      OnClick = btnInverterSelecaoClick
    end
  end
  object dbgDados: TDBGrid
    Left = 0
    Top = 32
    Width = 760
    Height = 344
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgDadosCellClick
    OnDrawColumnCell = dbgDadosDrawColumnCell
    OnKeyDown = dbgDadosKeyDown
  end
end
