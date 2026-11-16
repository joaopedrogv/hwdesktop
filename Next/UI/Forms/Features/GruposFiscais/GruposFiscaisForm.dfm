inherited frmGruposFiscais: TfrmGruposFiscais
  PixelsPerInch = 96
  TextHeight = 16
  inherited pcAbas: TPageControl
    inherited tsConsulta: TTabSheet
      inherited pnAcoesConsulta: TPanel
        object btnNovo: TButton
          Left = 16
          Top = 6
          Width = 100
          Height = 32
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnAlterar: TButton
          Left = 124
          Top = 6
          Width = 100
          Height = 32
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnEnviarLixeira: TButton
          Left = 232
          Top = 6
          Width = 150
          Height = 32
          Caption = 'Enviar para a lixeira'
          TabOrder = 2
          OnClick = btnEnviarLixeiraClick
        end
      end
    end
  end
end
