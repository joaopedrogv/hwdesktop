object FrameCreditoPresumidoIbsCbs: TFrameCreditoPresumidoIbsCbs
  Left = 0
  Top = 0
  Width = 748
  Height = 197
  TabOrder = 0
  TabStop = True
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 108
    TabOrder = 0
    object ckgCredPresOper: TCheckBox
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 178
      Height = 18
      Align = alLeft
      Caption = 'Cr'#233'dito Presumido da Opera'#231#227'o'
      TabOrder = 0
    end
    object ckgCredPresIBSZFM: TCheckBox
      AlignWithMargins = True
      Left = 295
      Top = 3
      Width = 290
      Height = 18
      Align = alLeft
      Caption = 'Cr'#233'dito Presumido de IBS sobre o saldo devedor na ZFM'
      TabOrder = 1
    end
  end
  object pnCredOper: TPanel
    Left = 0
    Top = 24
    Width = 748
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbCompraGovIt: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 742
      Height = 13
      Align = alTop
      Caption = 'Cr'#233'dito Presumido da Opera'#231#227'o >>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 179
    end
    object Panel1: TPanel
      Left = 0
      Top = 19
      Width = 748
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 125
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Base c'#225'lculo Cred Pres'
        Layout = tlCenter
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 215
        Top = 3
        Width = 90
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Classifica'#231#227'o'
        Layout = tlCenter
      end
      object edvBCCredPres: TEditHw
        AlignWithMargins = True
        Left = 134
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 0
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object edcCredPres: TComboBox
        AlignWithMargins = True
        Left = 311
        Top = 3
        Width = 429
        Height = 21
        Align = alLeft
        ItemHeight = 13
        TabOrder = 1
        Text = 'edcCredPres'
      end
    end
    object pnCredPresIbs: TPanel
      Left = 0
      Top = 46
      Width = 748
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label8: TLabel
        AlignWithMargins = True
        Left = 215
        Top = 3
        Width = 90
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vlr Cred Pres IBS'
        Layout = tlCenter
        ExplicitLeft = 295
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 392
        Top = 3
        Width = 267
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Cr'#233'dito Presumido em condi'#231#227'o Suspensiva - IBS'
        Layout = tlCenter
      end
      object edpCredPresIbs: TEditHw
        AlignWithMargins = True
        Left = 134
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 1
        Text = '           0,0000'
        Formato = fNumber
        FormatSize = '0.4'
      end
      object edvCredPresIbs: TEditHw
        AlignWithMargins = True
        Left = 311
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 2
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object edvCredPresCondSusIbs: TEditHw
        AlignWithMargins = True
        Left = 665
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 3
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object ckCredPresOpIbs: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 125
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = '% Cr'#233'dito Presum IBS'
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 73
      Width = 748
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label11: TLabel
        AlignWithMargins = True
        Left = 215
        Top = 3
        Width = 90
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vlr Cred Pres CBS'
        Layout = tlCenter
        ExplicitLeft = 295
      end
      object Label12: TLabel
        AlignWithMargins = True
        Left = 392
        Top = 3
        Width = 267
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Cr'#233'dito Presumido em condi'#231#227'o Suspensiva - CBS'
        Layout = tlCenter
      end
      object edpCredPresCbs: TEditHw
        AlignWithMargins = True
        Left = 134
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 1
        Text = '           0,0000'
        Formato = fNumber
        FormatSize = '0.4'
      end
      object edvCredPresCbs: TEditHw
        AlignWithMargins = True
        Left = 311
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 2
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object edvCredPresCondSusCbs: TEditHw
        AlignWithMargins = True
        Left = 665
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 3
        Text = '               0,00'
        Formato = fNumber
        FormatSize = '0.2'
      end
      object ckCredPresOpCbs: TCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 125
        Height = 21
        TabStop = False
        Align = alLeft
        Alignment = taLeftJustify
        Caption = '% Cr'#233'dito Presum CBS'
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 124
    Width = 748
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 742
      Height = 13
      Align = alTop
      Caption = 'Cr'#233'dito Presumido de IBS sobre o saldo devedor na ZFM >>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 296
    end
    object Panel4: TPanel
      Left = 0
      Top = 19
      Width = 748
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 125
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Ano m'#234's referencia'
        Layout = tlCenter
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 214
        Top = 3
        Width = 90
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Classifica'#231#227'o'
        Layout = tlCenter
        ExplicitLeft = 215
      end
      object edtpCredPresIBSZFM: TComboBox
        AlignWithMargins = True
        Left = 310
        Top = 3
        Width = 430
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '0 - Sem Cr'#233'dito Presumido'
        Items.Strings = (
          '0 - Sem Cr'#233'dito Presumido'
          '1 - Bens de consumo final (55%)'
          '2 - Bens de capital (75%)'
          '3 - Bens intermedi'#225'rios (90,25%)'
          '4 - Bens de inform'#225'tica e outros definidos em legisla'#231#227'o (100%)')
      end
      object edcompetApur: TMaskEdit
        AlignWithMargins = True
        Left = 134
        Top = 3
        Width = 74
        Height = 21
        Align = alLeft
        EditMask = '!9999-00;1;_'
        MaxLength = 7
        TabOrder = 0
        Text = '    -  '
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 46
      Width = 748
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label6: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 656
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Cr'#233'dito Presumido calculado sobre o saldo devedor apurado'
        Layout = tlCenter
      end
      object edvCredPresIBSZFM: TEditHw
        AlignWithMargins = True
        Left = 665
        Top = 3
        Width = 75
        Height = 21
        Align = alLeft
        TabOrder = 0
        Text = '           0,0000'
        Formato = fNumber
        FormatSize = '0.4'
      end
    end
  end
end
