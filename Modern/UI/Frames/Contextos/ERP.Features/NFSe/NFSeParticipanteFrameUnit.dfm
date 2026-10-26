object NFSeParticipanteFrame: TNFSeParticipanteFrame
  Left = 0
  Top = 0
  Width = 815
  Height = 132
  TabOrder = 0
  TabStop = True
  object pnContentPart: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 132
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel13: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 809
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label34: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 67
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CPF/CNPJ'
        Layout = tlCenter
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 238
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Inscr Municipal'
        Layout = tlCenter
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 481
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Fone'
        Layout = tlCenter
        ExplicitLeft = 238
      end
      object edCpfCnpj: TMaskEdit
        AlignWithMargins = True
        Left = 76
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      object edInscMun: TMaskEdit
        AlignWithMargins = True
        Left = 319
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object edFone: TMaskEdit
        AlignWithMargins = True
        Left = 562
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 36
      Width = 809
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 67
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Nome'
        Layout = tlCenter
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 481
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'email'
        Layout = tlCenter
        ExplicitLeft = 238
      end
      object edNome: TMaskEdit
        AlignWithMargins = True
        Left = 76
        Top = 3
        Width = 399
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      object edEmail: TMaskEdit
        AlignWithMargins = True
        Left = 562
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 102
      Width = 809
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label11: TLabel
        AlignWithMargins = True
        Left = 319
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Bairro'
        Layout = tlCenter
        ExplicitLeft = 481
      end
      object Label12: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 67
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Complemento'
        Layout = tlCenter
      end
      object Label8: TLabel
        AlignWithMargins = True
        Left = 481
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Munic'#237'pio'
        Layout = tlCenter
        ExplicitLeft = 643
        ExplicitTop = 0
      end
      object edBairro: TMaskEdit
        AlignWithMargins = True
        Left = 400
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object edComplemento: TMaskEdit
        AlignWithMargins = True
        Left = 76
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      inline ComboBoxMunicipiosFrame1: TComboBoxMunicipiosFrame
        AlignWithMargins = True
        Left = 562
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        TabOrder = 2
        TabStop = True
        ExplicitLeft = 562
        ExplicitTop = 3
        ExplicitWidth = 237
        ExplicitHeight = 21
        inherited edMunicipios: TComboBox
          Width = 237
          ExplicitWidth = 237
        end
        inherited pnInfo: TPanel
          Top = 5
          Width = 237
          ExplicitTop = 5
          ExplicitWidth = 237
        end
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 69
      Width = 809
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 67
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'CEP'
        Layout = tlCenter
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 157
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Endere'#231'o'
        Layout = tlCenter
        ExplicitTop = 0
      end
      object Label10: TLabel
        AlignWithMargins = True
        Left = 643
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#250'mero'
        Layout = tlCenter
        ExplicitTop = 0
      end
      object edCep: TMaskEdit
        AlignWithMargins = True
        Left = 76
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
      object edEndereco: TMaskEdit
        AlignWithMargins = True
        Left = 238
        Top = 3
        Width = 399
        Height = 21
        Align = alLeft
        TabOrder = 1
      end
      object edNumero: TMaskEdit
        AlignWithMargins = True
        Left = 724
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 2
      end
    end
  end
end
