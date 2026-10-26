object FrameIbsCbs: TFrameIbsCbs
  Left = 0
  Top = 0
  Width = 750
  Height = 413
  TabOrder = 0
  TabStop = True
  object pageGrupos: TPageControl
    Left = 0
    Top = 46
    Width = 750
    Height = 367
    ActivePage = tsGIbsCbs
    Align = alTop
    Style = tsFlatButtons
    TabOrder = 0
    object tsGIbsCbs: TTabSheet
      Caption = 'IBS e CBS'
      inline FrameGrupoIbsCbs1: TFrameGrupoIbsCbs
        Left = 0
        Top = 0
        Width = 742
        Height = 336
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 742
        ExplicitHeight = 336
        inherited pnBase: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited Panel2: TPanel
          Width = 742
          ExplicitWidth = 742
          inherited Panel3: TPanel
            Width = 742
            ExplicitWidth = 742
          end
          inherited Panel4: TPanel
            Width = 742
            ExplicitWidth = 742
          end
          inherited Panel5: TPanel
            Width = 742
            ExplicitWidth = 742
          end
          inherited pnTribRegular: TPanel
            Width = 742
            ExplicitWidth = 742
            inherited FrameGrupoIbsCbsTribRegular1: TFrameGrupoIbsCbsTribRegular
              Width = 742
              ExplicitWidth = 742
              inherited pn1: TPanel
                Width = 742
                ExplicitWidth = 742
                inherited lbcClassTrib: TLabel
                  Height = 21
                end
              end
              inherited pn2: TPanel
                Width = 742
                ExplicitWidth = 742
              end
            end
            inherited pn_0: TPanel
              Width = 736
              ExplicitWidth = 736
            end
          end
          inherited pnCompraGovIt: TPanel
            Width = 742
            ExplicitWidth = 742
            inherited FrameGrupoIbsCbsCompraGovItem1: TFrameGrupoIbsCbsCompraGovItem
              Width = 742
              ExplicitWidth = 742
              inherited pn1: TPanel
                Width = 742
                ExplicitWidth = 742
              end
              inherited pn2: TPanel
                Width = 742
                ExplicitWidth = 742
              end
            end
            inherited Panel6: TPanel
              Width = 736
              ExplicitWidth = 736
            end
          end
        end
      end
    end
    object tsGMono: TTabSheet
      Caption = 'Monofasia'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      inline FrameMonofasiaIbsCbs1: TFrameMonofasiaIbsCbs
        Left = 0
        Top = 0
        Width = 742
        Height = 159
        Align = alTop
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 742
        inherited pnPadrao: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pn1: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pnReten: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pnRet: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pnDifer: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pnTot: TPanel
          Width = 742
          ExplicitWidth = 742
        end
      end
    end
    object tsGTransfCred: TTabSheet
      Caption = 'Transfer'#234'ncia de Cr'#233'dito'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object pn2: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbPCbs: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 125
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor IBS transf'
          Layout = tlCenter
        end
        object lbVCbs: TLabel
          AlignWithMargins = True
          Left = 215
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor CBS transf'
          Layout = tlCenter
          ExplicitLeft = 392
        end
        object edTransfCredVIbs: TEditHw
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
        object edTransfCredVCbs: TEditHw
          AlignWithMargins = True
          Left = 311
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 1
          Text = '               0,00'
          Formato = fNumber
          FormatSize = '0.2'
        end
      end
    end
    object tsGAjusteCompet: TTabSheet
      Caption = 'Ajuste de Compet'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label3: TLabel
          AlignWithMargins = True
          Left = 213
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr Ajuste do IBS'
          Layout = tlCenter
        end
        object Label4: TLabel
          AlignWithMargins = True
          Left = 390
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr Ajuste do IBS'
          Layout = tlCenter
          ExplicitLeft = 392
        end
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 124
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Ano m'#234's referencia'
          Layout = tlCenter
        end
        object edAjusteCompetvIBS: TEditHw
          AlignWithMargins = True
          Left = 309
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 0
          Text = '               0,00'
          Formato = fNumber
          FormatSize = '0.2'
        end
        object edAjusteCompetvCbs: TEditHw
          AlignWithMargins = True
          Left = 486
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 1
          Text = '               0,00'
          Formato = fNumber
          FormatSize = '0.2'
        end
        object edcompetApur: TMaskEdit
          AlignWithMargins = True
          Left = 133
          Top = 3
          Width = 74
          Height = 21
          Align = alLeft
          EditMask = '!9999-00;1;_'
          MaxLength = 7
          TabOrder = 2
          Text = '    -  '
        end
      end
    end
    object tsGNenhum: TTabSheet
      Caption = 'Regime tribut'#225'rio'
      ImageIndex = 6
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Nenhum regime tribut'#225'rio para essa opera'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object tsEstornoCred: TTabSheet
      Caption = 'Estorno de Cr'#233'dito'
      ImageIndex = 4
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label5: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 125
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr IBS estornada'
          Layout = tlCenter
        end
        object Label6: TLabel
          AlignWithMargins = True
          Left = 215
          Top = 3
          Width = 90
          Height = 21
          Align = alLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr CBS estornada'
          Layout = tlCenter
          ExplicitLeft = 392
        end
        object edvIBSEstCred: TEditHw
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
        object edvCBSEstCred: TEditHw
          AlignWithMargins = True
          Left = 311
          Top = 3
          Width = 75
          Height = 21
          Align = alLeft
          TabOrder = 1
          Text = '               0,00'
          Formato = fNumber
          FormatSize = '0.2'
        end
      end
    end
    object tsCreditoPresumido: TTabSheet
      Caption = 'Cr'#233'dito Presumido'
      ImageIndex = 5
      inline FrameCreditoPresumidoIbsCbs1: TFrameCreditoPresumidoIbsCbs
        Left = 0
        Top = 0
        Width = 742
        Height = 197
        Align = alTop
        TabOrder = 0
        TabStop = True
        ExplicitWidth = 742
        inherited pn1: TPanel
          Width = 742
          ExplicitWidth = 742
        end
        inherited pnCredOper: TPanel
          Width = 742
          ExplicitWidth = 742
          inherited lbCompraGovIt: TLabel
            Width = 736
          end
          inherited Panel1: TPanel
            Width = 742
            ExplicitWidth = 742
          end
          inherited pnCredPresIbs: TPanel
            Width = 742
            ExplicitWidth = 742
            inherited Label8: TLabel
              ExplicitLeft = 160
            end
          end
          inherited Panel2: TPanel
            Width = 742
            ExplicitWidth = 742
            inherited Label11: TLabel
              ExplicitLeft = 215
            end
          end
        end
        inherited Panel3: TPanel
          Width = 742
          ExplicitWidth = 742
          inherited Label3: TLabel
            Width = 736
          end
          inherited Panel4: TPanel
            Width = 742
            ExplicitWidth = 742
            inherited Label5: TLabel
              ExplicitLeft = 214
            end
          end
          inherited Panel5: TPanel
            Width = 742
            ExplicitWidth = 742
          end
        end
      end
    end
  end
  object pn1: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 353
      Top = 0
      Height = 46
      ExplicitLeft = 376
      ExplicitTop = -24
      ExplicitHeight = 100
    end
    object pn1_1: TPanel
      Left = 0
      Top = 0
      Width = 353
      Height = 46
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object pnRegraCaption: TPanel
        Left = 0
        Top = 0
        Width = 75
        Height = 46
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lbRegraFiscal: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 23
          Width = 69
          Height = 13
          Margins.Top = 1
          Align = alTop
          Alignment = taCenter
          Caption = '**Vazio**'
          WordWrap = True
          ExplicitWidth = 49
        end
        object Label9: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 6
          Width = 69
          Height = 13
          Margins.Top = 6
          Align = alTop
          Alignment = taRightJustify
          Caption = 'Regra Fiscal'
          Layout = tlCenter
          ExplicitLeft = 14
          ExplicitWidth = 58
        end
      end
      inline ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame
        AlignWithMargins = True
        Left = 78
        Top = 3
        Width = 272
        Height = 37
        Margins.Bottom = 6
        Align = alClient
        TabOrder = 1
        TabStop = True
        ExplicitLeft = 78
        ExplicitTop = 3
        ExplicitWidth = 272
        inherited btDetalhes: TSpeedButton
          Left = 250
          ExplicitLeft = 250
        end
        inherited edRegrasFiscais: TComboBox
          Width = 247
          ExplicitWidth = 247
        end
        inherited pnVigencia: TPanel
          Width = 272
          ExplicitWidth = 272
        end
      end
    end
    object pn1_2: TPanel
      Left = 356
      Top = 0
      Width = 394
      Height = 46
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lbFlags: TLabel
        Left = 0
        Top = 27
        Width = 394
        Height = 19
        Align = alClient
        Caption = 'lbFlags'
        ExplicitWidth = 33
        ExplicitHeight = 13
      end
      object pn1_2_1: TPanel
        Left = 0
        Top = 0
        Width = 394
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        object ckIndDoacao: TCheckBox
          AlignWithMargins = True
          Left = 57
          Top = 3
          Width = 124
          Height = 21
          Hint = 
            'Indica a natureza da opera'#231#227'o de doa'#231#227'o, orientando a apura'#231#227'o e' +
            ' a gera'#231#227'o de d'#233'bitos ou estornos conforme o cen'#225'rio'
          Align = alLeft
          Caption = 'Opera'#231#227'o de Doa'#231#227'o'
          TabOrder = 0
        end
        object pnClassificacao: TPanel
          Left = 184
          Top = 0
          Width = 204
          Height = 27
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
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
            Width = 48
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            Caption = 'cClassTrib'
            Layout = tlCenter
            ExplicitHeight = 13
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
            Left = 128
            Top = 3
            Width = 73
            Height = 21
            Align = alLeft
            EditMask = '000-000;0;_'
            MaxLength = 7
            TabOrder = 1
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 512
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
    object HabilitarRegimetributrio1: TMenuItem
      Caption = 'Habilitar Regime tribut'#225'rio'
      object RegimePadrao1: TMenuItem
        Caption = 'Regime Padr'#227'o'
        RadioItem = True
        OnClick = RegimePadrao1Click
      end
      object RegimeMonofasia1: TMenuItem
        Tag = 1
        Caption = 'Monofasia'
        RadioItem = True
        OnClick = RegimePadrao1Click
      end
      object RegimeTransferenciaDeCredito1: TMenuItem
        Tag = 2
        Caption = 'Transfer'#234'ncia de Cr'#233'dito'
        RadioItem = True
        OnClick = RegimePadrao1Click
      end
      object RegimeAjusteCompetencia1: TMenuItem
        Tag = 3
        Caption = 'Ajuste de Compet'#234'ncia'
        RadioItem = True
        OnClick = RegimePadrao1Click
      end
      object RegimeNenhum1: TMenuItem
        Tag = 4
        Caption = 'Nenhum'
        OnClick = RegimePadrao1Click
      end
    end
    object MenuEstornoDeCredito1: TMenuItem
      Caption = 'Estorno de Cr'#233'dito'
      OnClick = MenuEstornoDeCredito1Click
    end
    object MenuCreditoPresumido1: TMenuItem
      Caption = 'Cr'#233'dito Presumido'
      OnClick = MenuCreditoPresumido1Click
    end
  end
end
