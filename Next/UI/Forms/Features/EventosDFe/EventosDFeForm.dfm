inherited frmEventosDFe: TfrmEventosDFe
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcAbas: TPageControl
    inherited tsConsulta: TTabSheet
      ExplicitWidth = 752
      ExplicitHeight = 412
      inherited pnFiltros: TPanel
        ExplicitWidth = 752
        inherited fraFiltros: TfrmFilterFrame
          inherited pnValores: TPanel
            inherited pnBotoes: TPanel
              inherited lblContador: TLabel
                Height = 21
              end
            end
          end
        end
      end
      inherited pnAcoesConsulta: TPanel
        object ckLixeira: TCheckBox
          Left = 660
          Top = 14
          Width = 80
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Lixeira'
          TabOrder = 0
          OnClick = ckLixeiraClick
        end
        object btnRestaurar: TButton
          Left = 548
          Top = 6
          Width = 100
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Restaurar'
          TabOrder = 1
          OnClick = btnRestaurarClick
        end
        object btnTransmitir: TButton
          Left = 440
          Top = 6
          Width = 100
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Transmitir'
          TabOrder = 2
          OnClick = btnTransmitirClick
        end
        object btnConsultarSituacao: TButton
          Left = 332
          Top = 6
          Width = 100
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Consultar situa'#231#227'o'
          TabOrder = 3
          OnClick = btnConsultarSituacaoClick
        end
      end
      inherited fraGrid: TfrmDataGridFrame
        inherited pnComandos: TPanel
          ExplicitWidth = 740
          inherited pnCriterios: TPanel
            Width = 653
          end
        end
      end
    end
  end
end
