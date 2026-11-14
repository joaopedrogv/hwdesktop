inherited frmGruposFiscais: TfrmGruposFiscais
  PixelsPerInch = 96
  TextHeight = 16
  object pcAbas: TPageControl
    Left = 0
    Top = 0
    Width = 760
    Height = 440
    ActivePage = tsConsulta
    Align = alNone
    TabOrder = 2
    Visible = False
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      TabVisible = False
      object sbCadastro: TScrollBox
        Left = 0
        Top = 0
        Width = 752
        Height = 358
        Align = alClient
        AutoScroll = True
        TabOrder = 0
        inline fraCadastro: TfrmGrupoFiscalCadastroFrame
          Left = 0
          Top = 0
          Width = 752
          Height = 350
          Align = alTop
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 736
          ExplicitHeight = 350
        end
      end
      object pnAcoesCadastro: TPanel
        Left = 0
        Top = 358
        Width = 752
        Height = 44
        Align = alBottom
        BevelOuter = bvNone
        Caption = ''
        TabOrder = 1
        object btnSalvar: TButton
          Left = 516
          Top = 6
          Width = 110
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          Enabled = False
          TabOrder = 0
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 634
          Top = 6
          Width = 110
          Height = 32
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
  end
  inherited pnFiltros: TPanel
    Height = 104
    object btnEnviarLixeira: TButton
      Left = 466
      Top = 16
      Width = 150
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Enviar para a lixeira'
      TabOrder = 2
      OnClick = btnEnviarLixeiraClick
    end
    object pnComandosConsulta: TPanel
      Left = 0
      Top = 68
      Width = 760
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      Caption = ''
      TabOrder = 3
      object btnNovo: TButton
        Left = 16
        Top = 2
        Width = 100
        Height = 32
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
    end
  end
end
