object DBGridProdutosGrupoFiscalVincularFrame: TDBGridProdutosGrupoFiscalVincularFrame
  Left = 0
  Top = 0
  Width = 800
  Height = 170
  TabOrder = 0
  TabStop = True
  inline gridProdutos: TDBGridFrame
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 794
    Height = 164
    Align = alClient
    TabOrder = 0
    TabStop = True
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 794
    ExplicitHeight = 164
    inherited DBGrid: TDBGrid
      Width = 794
      Height = 136
    end
    inherited pnBtns: TPanel
      Width = 794
      ExplicitWidth = 794
    end
  end
end
