inherited frmEventoDFe211130ItemFrame: TfrmEventoDFe211130ItemFrame
  Width = 600
  Height = 380
  inherited pnCampos: TPanel
    Height = 216
    object lblNItem: TLabel
      Left = 16
      Top = 12
      Width = 32
      Height = 16
      Caption = 'nItem'
    end
    object lblVIbs: TLabel
      Left = 120
      Top = 12
      Width = 55
      Height = 16
      Caption = 'Valor IBS'
    end
    object lblVCbs: TLabel
      Left = 256
      Top = 12
      Width = 59
      Height = 16
      Caption = 'Valor CBS'
    end
    object lblQImobilizado: TLabel
      Left = 16
      Top = 68
      Width = 132
      Height = 16
      Caption = 'Quantidade imobilizada'
    end
    object lblUImobilizado: TLabel
      Left = 160
      Top = 68
      Width = 50
      Height = 16
      Caption = 'Unidade'
    end
    object edNItem: TEditHw
      Left = 16
      Top = 30
      Width = 80
      Height = 24
      MaxLength = 3
      TabOrder = 0
      Formato = fInteger
      FormatSize = '0'
    end
    object edVIbs: TEditHw
      Left = 120
      Top = 30
      Width = 120
      Height = 24
      TabOrder = 1
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edVCbs: TEditHw
      Left = 256
      Top = 30
      Width = 120
      Height = 24
      TabOrder = 2
      Formato = fNumber
      FormatSize = '0.2'
    end
    object edQImobilizado: TEditHw
      Left = 16
      Top = 86
      Width = 120
      Height = 24
      TabOrder = 3
      Formato = fNumber
      FormatSize = '0.4'
    end
    object edUImobilizado: TEdit
      Left = 160
      Top = 86
      Width = 80
      Height = 24
      MaxLength = 6
      TabOrder = 4
    end
  end
end
