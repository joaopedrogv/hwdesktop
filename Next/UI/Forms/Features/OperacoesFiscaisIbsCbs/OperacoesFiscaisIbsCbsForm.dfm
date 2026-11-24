inherited frmOperacoesFiscaisIbsCbs: TfrmOperacoesFiscaisIbsCbs
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcAbas: TPageControl
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 754
    ExplicitHeight = 434
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 746
      ExplicitHeight = 399
      inherited pnFiltros: TPanel
        Height = 96
        ExplicitWidth = 740
        ExplicitHeight = 96
        inherited splFiltros: TSplitter
          Height = 96
        end
        inherited fraFiltros: TfrmFilterFrame
          Height = 90
          ExplicitHeight = 90
          inherited pnFilterBottom: TPanel
            inherited pnBotoes: TPanel
              inherited lblContador: TLabel
                Height = 21
              end
            end
          end
        end
        inherited pnBotoes: TPanel
          Height = 96
          ExplicitWidth = 311
          ExplicitHeight = 96
        end
        object chkLixeira: TCheckBox
          Left = 8
          Top = 64
          Width = 260
          Height = 21
          Caption = 'Pesquisar na lixeira'
          TabOrder = 2
        end
      end
      inherited pnAcoesConsulta: TPanel
        Top = 105
        ExplicitTop = 105
        ExplicitWidth = 734
        inherited btnExcluir: TSpeedButton
          OnClick = btnExcluirClick
        end
      end
      inherited fraGrid: TfrmDataGridFrame
        Top = 158
        Height = 235
        ExplicitTop = 158
        ExplicitHeight = 235
        inherited pnComandos: TPanel
          ExplicitWidth = 734
          inherited pnCriterios: TPanel
            Width = 647
            ExplicitWidth = 647
          end
        end
        inherited dbgDados: TDBGrid
          Height = 199
        end
        inherited pmCelula: TPopupMenu
          Images = imgListConsulta
        end
      end
    end
  end
end
