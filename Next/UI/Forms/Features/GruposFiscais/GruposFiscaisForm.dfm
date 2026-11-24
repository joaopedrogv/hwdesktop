inherited frmGruposFiscais: TfrmGruposFiscais
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcAbas: TPageControl
    inherited tsConsulta: TTabSheet
      inherited pnFiltros: TPanel
        inherited pnBotoes: TPanel
          inherited btnNovoAcoes: TButton
            OnClick = btnNovoAcoesClick
          end
        end
      end
      inherited pnAcoesConsulta: TPanel
        inherited btnAlterar: TSpeedButton
          OnClick = btnAlterarClick
        end
        inherited btnExcluir: TSpeedButton
          OnClick = btnExcluirClick
        end
      end
    end
  end
end
