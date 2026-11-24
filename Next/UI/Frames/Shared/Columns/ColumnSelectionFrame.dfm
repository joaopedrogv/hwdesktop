object frmColumnSelectionFrame: TfrmColumnSelectionFrame
  Left = 0
  Top = 0
  Width = 588
  Height = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object pnLista: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 352
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    Caption = ''
    TabOrder = 0
    object clbColunas: TCheckListBox
      Left = 6
      Top = 6
      Width = 576
      Height = 340
      Align = alClient
      IntegralHeight = False
      PopupMenu = pmLista
      TabOrder = 0
    end
  end
  object pmLista: TPopupMenu
    Left = 16
    Top = 96
    object miSelecionarTodos: TMenuItem
      Caption = 'Selecionar todos'
      OnClick = miSelecionarTodosClick
    end
    object miRemoverSelecao: TMenuItem
      Caption = 'Remover a sele'#231#227'o de todos'
      OnClick = miRemoverSelecaoClick
    end
    object miInverterSelecao: TMenuItem
      Caption = 'Inverter sele'#231#227'o'
      OnClick = miInverterSelecaoClick
    end
  end
end
