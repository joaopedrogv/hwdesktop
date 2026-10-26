object NFSeTributosDFeFrame: TNFSeTributosDFeFrame
  Left = 0
  Top = 0
  Width = 663
  Height = 278
  TabOrder = 0
  TabStop = True
  object pageGrupos: TPageControl
    Left = 0
    Top = 27
    Width = 663
    Height = 251
    ActivePage = tsGIbsCbs
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object tsGIbsCbs: TTabSheet
      Caption = 'IBS CBS'
      inline TribDFeIbsCbsGrupoFrame1: TTribDFeIbsCbsGrupoFrame
        Left = 0
        Top = 0
        Width = 660
        Height = 223
        TabOrder = 0
        TabStop = True
        ExplicitHeight = 223
      end
    end
    object tsCreditoPresumido: TTabSheet
      Caption = '    Cred Presumido    '
      ImageIndex = 1
      object pnCredOper: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 100
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 655
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 79
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'BC Cred Pres'
            Layout = tlCenter
          end
          object Label4: TLabel
            AlignWithMargins = True
            Left = 169
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Classifica'#231#227'o'
            Layout = tlCenter
          end
          object edvBCCredPres: TEditHw
            AlignWithMargins = True
            Left = 88
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
          end
          object edcCredPres: TComboBox
            AlignWithMargins = True
            Left = 250
            Top = 3
            Width = 399
            Height = 21
            Align = alLeft
            ItemHeight = 13
            TabOrder = 1
            Text = 'edcCredPres'
          end
        end
        object pnCredPresIbs: TPanel
          Left = 0
          Top = 27
          Width = 655
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label8: TLabel
            AlignWithMargins = True
            Left = 169
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vlr Crd Prs IBS'
            Layout = tlCenter
          end
          object Label5: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 79
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = '% Crd Pres IBS'
            Layout = tlCenter
          end
          object edpCredPresIbs: TEditHw
            AlignWithMargins = True
            Left = 88
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,0000'
            Formato = fNumber
            FormatSize = '0.4'
            Nullable = True
          end
          object edvCredPresIbs: TEditHw
            AlignWithMargins = True
            Left = 250
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 54
          Width = 655
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label11: TLabel
            AlignWithMargins = True
            Left = 169
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Vlr Crd Prs CBS'
            Layout = tlCenter
          end
          object Label6: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 79
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = '% Crd Pres CBS'
            Layout = tlCenter
          end
          object edpCredPresCbs: TEditHw
            AlignWithMargins = True
            Left = 88
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 0
            Text = '0,0000'
            Formato = fNumber
            FormatSize = '0.4'
            Nullable = True
          end
          object edvCredPresCbs: TEditHw
            AlignWithMargins = True
            Left = 250
            Top = 3
            Width = 75
            Height = 21
            Align = alLeft
            TabOrder = 1
            Text = '0,00'
            Formato = fNumber
            FormatSize = '0.2'
            Nullable = True
          end
        end
      end
    end
  end
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 366
      Top = 0
      Height = 27
      ExplicitLeft = 376
      ExplicitTop = -24
      ExplicitHeight = 100
    end
    object pn1_1: TPanel
      Left = 0
      Top = 0
      Width = 366
      Height = 27
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbRegr: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 6
        Width = 83
        Height = 18
        Margins.Top = 6
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Regra Fiscal'
        Layout = tlCenter
      end
      inline ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame
        AlignWithMargins = True
        Left = 92
        Top = 3
        Width = 271
        Height = 21
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 92
        ExplicitTop = 3
        ExplicitWidth = 271
        ExplicitHeight = 21
        inherited pnVigencia: TPanel
          Top = 5
          Width = 271
          ExplicitTop = 5
          ExplicitWidth = 271
        end
        inherited pnRegras: TPanel
          Width = 271
          ExplicitWidth = 271
          inherited btDetalhes: TSpeedButton
            Left = 249
            ExplicitLeft = 249
          end
          inherited edRegrasFiscais: TComboBox
            Width = 246
            ExplicitWidth = 246
          end
        end
      end
    end
    object pn1_2_1: TPanel
      Left = 369
      Top = 0
      Width = 294
      Height = 27
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object btOptions: TSpeedButton
        AlignWithMargins = True
        Left = 0
        Top = 2
        Width = 23
        Height = 23
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C57C25BA6806B86706B76606B56507B36407B26307B06208AE6108AD6009AB5F
          09B47329FFFFFFFFFFFFFFFFFFFFFFFFBD6A05BC6905BA6806B86706B76606B3
          6407B16307B26307B06208AE6108AD6009AB5F09FFFFFFFFFFFFFFFFFFFFFFFF
          BF6B04BD6A05BC6905BA6806B66606E9D8C4E9D8C4B16307B26307B06208AE61
          08AD6009FFFFFFFFFFFFFFFFFFFFFFFFC16C04BF6B04BD6A05BC6905B86706EA
          DAC6E9D8C4B36407B36407B26307B06208AE6108FFFFFFFFFFFFFFFFFFFFFFFF
          C26D04C16C04BF6B04BD6A05BC6905B66606B46506B76606B56507B36407B263
          07B06208FFFFFFFFFFFFFFFFFFFFFFFFC46E03C26D04C16C04BF6B04BB6905EB
          D9C4EAD8C3B66606B76606B56507B36407B26307FFFFFFFFFFFFFFFFFFFFFFFF
          C66F03C46E03C26D04C16C04BD6A04EBDBC6EBD9C4B86706B86706B76606B565
          07B36407FFFFFFFFFFFFFFFFFFFFFFFFC77002C66F03C46E03C26D04C16C04BB
          6904B96805BC6905BA6806B86706B76606B56507FFFFFFFFFFFFFFFFFFFFFFFF
          C97102C77002C66F03C46E03BF6C04EBDAC4EBD9C3BB6905BC6905BA6806B867
          06B76606FFFFFFFFFFFFFFFFFFFFFFFFCB7202C97102C77002C66F03C16D03EC
          DBC6EBDAC4BD6A04BD6A05BC6905BA6806B86706FFFFFFFFFFFFFFFFFFFFFFFF
          CC7301CB7202C97102C77002C66F03C16D03BF6C04C16C04BF6B04BD6A05BC69
          05BA6806FFFFFFFFFFFFFFFFFFFFFFFFD48622CC7301CB7202C97102C77002C6
          6F03C46E03C26D04C16C04BF6B04BD6A05C57C25FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = btOptionsClick
        ExplicitLeft = -3
      end
      object btCalc: TSpeedButton
        AlignWithMargins = True
        Left = 29
        Top = 2
        Width = 22
        Height = 23
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFE9E9E9
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCE9E9E9FFFFFFE3E3E362626263636364646464646464646464646464
          6464646464646464646464646464646464636363626262E5E5E5D3D3D3888888
          A3A3A3A5A5A5A7A7A7A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A7A7A7A5A5
          A5A3A3A3878787D4D4D4D4D4D4B3B3B375757561616162626266666666666662
          62626262626A6A6A74A1C773A1C872A1C881A0BBB3B3B3D6D6D6D6D6D6B4B4B4
          5A5A5A7A7A7A7B7B7B5656565656565F5F5F5C5C5C5A5A5A68B4F566B5F866B4
          F86EAEE6B4B4B4D7D7D7D7D7D7B4B4B45B5B5BA0A0A0A7A7A7575757595959A3
          A3A39E9E9E5B5B5B69B4F567B5F867B5F86EAFE6B4B4B4D9D9D9D9D9D9B4B4B4
          6565655D5D5D5E5E5E6262626262626161616060606666666FB7F5ACD6FBA7D4
          FA70AFE6B4B4B4DADADADADADAB5B5B55C5C5C56565659595959595959595953
          53535353535E5E5E70B8F5ADD7FBA7D4FA70B0E6B5B5B5DBDBDBDADADAB5B5B5
          5E5E5EA3A3A3ACACAC5E5E5E5D5D5D9999999797975F5F5F6DB6F56BB7F86BB7
          F871B1E6B5B5B5DCDCDCDCDCDCB6B6B66A6A6A6565656C6C6C5F5F5F5F5F5F59
          595959595963636373B9F472BAF771B9F77DB1DFB6B6B6DEDEDEDDDDDD7D7D7D
          7D7D7D7C7C7C7E7E7E7F7F7F8080808080808080808080807F7F7F7E7E7E7C7C
          7C7D7D7D7D7D7DDEDEDEDDDDDD3B3B3B6078767DA39E7DA29E7EA39F7EA39F7E
          A49F7EA49F7EA39F7EA49F6C8C88779B965F77743B3B3BDEDEDEDEDEDE3B3B3B
          6D8B8794C4BE93C3BC95C4BE95C4BE96C4BE96C5BE95C3BD8BB6B16E908B789E
          996C8B873B3B3BE0E0E0E0E0E03C3C3C6D8B8895C5BF95C4BE96C5BF97C6BF97
          C6C098C6C096C5BF8FBCB668888485AFA96D8B873C3C3CE1E1E1EDEDED474747
          485150515E5D53605F55626156636257646357646356636255626153605F515E
          5D485050474747EEEEEEFFFFFFDDDDDDC3C3C3C3C3C3C3C3C3C4C4C4C4C4C4C4
          C4C4C4C4C4C4C4C4C4C4C4C3C3C3C3C3C3C3C3C3DDDDDDFFFFFF}
        OnClick = btCalcClick
        ExplicitLeft = 0
        ExplicitTop = 5
        ExplicitHeight = 394
      end
      object pnClassificacao: TPanel
        Left = 54
        Top = 0
        Width = 233
        Height = 27
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 24
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'CST'
          Layout = tlCenter
          ExplicitLeft = 190
        end
        object Label2: TLabel
          AlignWithMargins = True
          Left = 74
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'cClassTrib'
          Layout = tlCenter
        end
        object edCst: TMaskEdit
          AlignWithMargins = True
          Left = 33
          Top = 3
          Width = 35
          Height = 21
          Align = alLeft
          EditMask = '!999;1;_'
          MaxLength = 3
          TabOrder = 0
          Text = '   '
        end
        object edcClassTrib: TMaskEdit
          AlignWithMargins = True
          Left = 155
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          EditMask = '000-000;0;_'
          MaxLength = 7
          TabOrder = 1
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 392
    Top = 32
    object RegraFiscalAutomatica1: TMenuItem
      Caption = 'Deixar Regra Fiscal Autom'#225'tica'
      OnClick = RegraFiscalAutomatica1Click
    end
    object RegraFiscalManual1: TMenuItem
      Tag = 1
      Caption = 'Alterar Regra Fiscal'
      OnClick = RegraFiscalAutomatica1Click
    end
    object RegraFiscalVazia1: TMenuItem
      Tag = 2
      Caption = 'N'#227'o usar nenhuma Regra Fiscal'
      OnClick = RegraFiscalAutomatica1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RegimePadrao1: TMenuItem
      Caption = 'Regime padr'#227'o'
      OnClick = RegimePadrao1Click
    end
    object MenuCreditoPresumido1: TMenuItem
      Caption = 'Cr'#233'dito Presumido'
      OnClick = MenuCreditoPresumido1Click
    end
  end
end
