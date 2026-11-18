object frmOperacaoFiscalIbsCbsCadastroFrame: TfrmOperacaoFiscalIbsCbsCadastroFrame
  Left = 0
  Top = 0
  Width = 752
  Height = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object pcSecoes: TPageControl
    Left = 0
    Top = 0
    Width = 752
    Height = 420
    ActivePage = tsCadastro
    Align = alTop
    TabOrder = 0
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      object lblOperacaoInterna: TLabel
        Left = 26
        Top = 16
        Width = 86
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Opera'#231#227'o Interna'
      end
      inline fraOperacaoInterna: TfrmSeletorEntidadeFrame
        Left = 118
        Top = 13
        Width = 395
        Height = 21
        TabOrder = 0
        ExplicitLeft = 118
        ExplicitTop = 13
        ExplicitWidth = 395
        ExplicitHeight = 21
      end
      object lblGrupoFiscal: TLabel
        Left = 54
        Top = 43
        Width = 58
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Grupo Fiscal'
      end
      inline fraGrupoFiscal: TfrmSeletorEntidadeFrame
        Left = 118
        Top = 40
        Width = 395
        Height = 21
        TabOrder = 1
        ExplicitLeft = 118
        ExplicitTop = 40
        ExplicitWidth = 395
        ExplicitHeight = 21
      end
      object lblRegraFiscal: TLabel
        Left = 54
        Top = 70
        Width = 58
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Regra Fiscal'
      end
      inline fraRegraFiscal: TfrmRegraFiscalSelecaoFrame
        Left = 118
        Top = 67
        Width = 395
        Height = 37
        TabOrder = 2
        ExplicitLeft = 118
        ExplicitTop = 67
        ExplicitWidth = 395
        ExplicitHeight = 37
      end
      object lblInicioVigencia: TLabel
        Left = 30
        Top = 116
        Width = 82
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'In'#237'cio da vig'#234'ncia'
      end
      object edInicioVigencia: TMaskEdit
        Left = 118
        Top = 113
        Width = 67
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object lblFimVigencia: TLabel
        Left = 199
        Top = 116
        Width = 73
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fim da vig'#234'ncia'
      end
      object edFimVigencia: TMaskEdit
        Left = 278
        Top = 113
        Width = 67
        Height = 21
        Enabled = False
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
      object ckFimVigencia: TCheckBox
        Left = 348
        Top = 113
        Width = 21
        Height = 21
        TabOrder = 5
        OnClick = ckFimVigenciaClick
      end
      object lblEmpresas: TLabel
        Left = 66
        Top = 143
        Width = 46
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Empresas'
      end
      inline fraEmpresas: TfrmEmpresaChecklistFrame
        Left = 118
        Top = 140
        Width = 395
        Height = 59
        TabOrder = 6
        ExplicitLeft = 118
        ExplicitTop = 140
        ExplicitWidth = 600
        ExplicitHeight = 110
      end
    end
    object tsCondicoes: TTabSheet
      Caption = 'Condi'#231#245'es'
      object lblEscopo: TLabel
        Left = 16
        Top = 12
        Width = 51
        Height = 13
        Caption = 'Escopo:'
      end
      object gbTipoEmissao: TGroupBox
        Left = 16
        Top = 36
        Width = 240
        Height = 110
        Caption = 'Tipo de emiss'#227'o'
        TabOrder = 0
        object clbTipoEmissao: TCheckListBox
          Left = 12
          Top = 20
          Width = 216
          Height = 80
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object gbNatureza: TGroupBox
        Left = 268
        Top = 36
        Width = 240
        Height = 110
        Caption = 'Natureza'
        TabOrder = 1
        object clbNatureza: TCheckListBox
          Left = 12
          Top = 20
          Width = 216
          Height = 80
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object gbTipoOrgaoPublico: TGroupBox
        Left = 16
        Top = 156
        Width = 492
        Height = 170
        Caption = 'Tipo de '#243'rg'#227'o p'#250'blico'
        TabOrder = 2
        object clbTipoOrgaoPublico: TCheckListBox
          Left = 12
          Top = 20
          Width = 468
          Height = 140
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object btnVerificarCondicoes: TSpeedButton
        Left = 16
        Top = 340
        Width = 140
        Height = 25
        Caption = 'Verificar condi'#231#245'es'
        OnClick = btnVerificarCondicoesClick
      end
    end
  end
  inline fraValidacao: TfrmValidationPanelFrame
    Left = 0
    Top = 420
    Width = 752
    Height = 120
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 420
    ExplicitWidth = 736
    ExplicitHeight = 120
  end
end
