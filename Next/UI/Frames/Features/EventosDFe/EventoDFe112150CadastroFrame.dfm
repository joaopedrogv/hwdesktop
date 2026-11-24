inherited frmEventoDFe112150CadastroFrame: TfrmEventoDFe112150CadastroFrame
  inherited pnCampos: TPanel
    Height = 236
    object lblChaveDocumento: TLabel
      Left = 16
      Top = 12
      Width = 89
      Height = 16
      Caption = 'Chave da NF-e'
    end
    object lblDataPrevisao: TLabel
      Left = 16
      Top = 60
      Width = 176
      Height = 16
      Caption = 'Data de previs'#227'o de entrega'
    end
    object edChaveDocumento: TEdit
      Left = 16
      Top = 30
      Width = 600
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 44
      TabOrder = 0
    end
    object edDataPrevisaoEntrega: TMaskEdit
      Left = 16
      Top = 78
      Width = 100
      Height = 24
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
end
