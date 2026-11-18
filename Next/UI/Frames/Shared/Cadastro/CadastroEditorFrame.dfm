object frmCadastroEditor: TfrmCadastroEditor
  Left = 0
  Top = 0
  Width = 736
  Height = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  DesignSize = (
    736
    404)
  object sbCampos: TScrollBox
    Left = 0
    Top = 0
    Width = 736
    Height = 360
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object pnCampos: TPanel
      Left = 0
      Top = 0
      Width = 736
      Height = 240
      Align = alTop
      BevelOuter = bvNone
      Caption = ''
      TabOrder = 0
    end
    inline fraValidacao: TfrmValidationPanelFrame
      Left = 0
      Top = 240
      Width = 736
      Height = 120
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 240
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 360
    Width = 736
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    Caption = ''
    TabOrder = 1
    object btnSalvar: TButton
      Left = 492
      Top = 6
      Width = 110
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 610
      Top = 6
      Width = 110
      Height = 32
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
