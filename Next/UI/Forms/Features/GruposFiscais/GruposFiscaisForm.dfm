inherited frmGruposFiscais: TfrmGruposFiscais
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnFiltros: TPanel
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
  end
end
