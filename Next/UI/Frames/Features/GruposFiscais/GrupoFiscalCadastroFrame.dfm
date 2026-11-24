inherited frmGrupoFiscalCadastroFrame: TfrmGrupoFiscalCadastroFrame
  inherited pnCampos: TPanel
    Height = 236
    object lblDescricao: TLabel
      Left = 16
      Top = 12
      Width = 55
      Height = 16
      Caption = 'Descri'#231#227'o'
    end
    object lblTipoTributo: TLabel
      Left = 16
      Top = 60
      Width = 84
      Height = 16
      Caption = 'Tipo de tributo'
    end
    object lblEmpresas: TLabel
      Left = 16
      Top = 108
      Width = 56
      Height = 16
      Caption = 'Empresas'
    end
    object edDescricao: TEdit
      Left = 16
      Top = 30
      Width = 600
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 128
      TabOrder = 0
    end
    object cbTipoTributo: TComboBox
      Left = 16
      Top = 78
      Width = 260
      Height = 24
      Style = csDropDownList
      TabOrder = 1
    end
    inline fraEmpresas: TfrmEmpresaChecklistFrame
      Left = 16
      Top = 126
      Width = 600
      Height = 110
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 16
      ExplicitTop = 126
    end
  end
end
