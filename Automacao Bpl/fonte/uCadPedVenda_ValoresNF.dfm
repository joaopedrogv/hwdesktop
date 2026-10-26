inherited frmCadPedVenda_ValoresNF: TfrmCadPedVenda_ValoresNF
  Caption = 'Valores de Nota Fiscal'
  ClientHeight = 550
  ClientWidth = 833
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 841
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  object pn_valores_nf: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 550
    Align = alClient
    BorderWidth = 6
    TabOrder = 0
    object pn_valores_nf_client: TPanel
      Left = 7
      Top = 7
      Width = 819
      Height = 495
      Margins.Bottom = 0
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 0
      object pn_valores_nf_dados: TPanel
        Left = 6
        Top = 6
        Width = 803
        Height = 155
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object lb_nf_ac_outras: TLabel
          Left = 42
          Top = 48
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Outros Acr'#233'scimos'
          FocusControl = ed_nf_ac_outras
        end
        object lb_nf_ac_seguro: TLabel
          Left = 281
          Top = 43
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seguro'
          FocusControl = ed_nf_ac_seguro
        end
        object lb_nf_ac_frete: TLabel
          Left = 465
          Top = 43
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Frete'
          FocusControl = ed_nf_ac_frete
        end
        object lb_nf_ac_ipi: TLabel
          Left = 90
          Top = 70
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = '*IPI(NF)'
          FocusControl = ed_nf_ac_ipi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_ac_icmsst: TLabel
          Left = 248
          Top = 70
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = '*ICMS ST(NF)'
          FocusControl = ed_nf_ac_icmsst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_ac_fcpst: TLabel
          Left = 430
          Top = 70
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = '*FCP ST(NF)'
          FocusControl = ed_nf_ac_fcpst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_ac_imposto_ii: TLabel
          Left = 7
          Top = 97
          Width = 124
          Height = 13
          Hint = 'Imposto Importacao(NF)'
          Alignment = taRightJustify
          Caption = '*Imposto Importacao(NF)'
          FocusControl = ed_nf_ac_imposto_ii
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_ac_calctrib: TLabel
          Left = 617
          Top = 97
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Caption = '*Calcular tributos NF'
          FocusControl = ed_nf_ac_frete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_freteconta: TLabel
          Left = 642
          Top = 70
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Frete por conta'
          FocusControl = ed_nf_ac_frete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_dc_desconto: TLabel
          Left = 604
          Top = 43
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desconto $'
          FocusControl = ed_nf_dc_desconto
        end
        object lb_nf_ac_vicmdeson: TLabel
          Left = 238
          Top = 97
          Width = 77
          Height = 13
          Hint = 'Outros acr'#233'scimo'
          Alignment = taRightJustify
          Caption = '*Outros AC(NF)'
          FocusControl = ed_nf_ac_vicmdeson
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_dc_vicmdeson: TLabel
          Left = 431
          Top = 97
          Width = 60
          Height = 13
          Hint = 
            'Valor do ICMS Desonerado na Nota Fiscal, o valor '#233' um desconto, ' +
            'portanto diminui o valor da Nota Fiscal'
          Alignment = taRightJustify
          Caption = '*Deson (NF)'
          FocusControl = ed_nf_dc_vicmdeson
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lb_nf_cf_deson: TLabel
          Left = 626
          Top = 124
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = '*Embutir Deson NF'
          FocusControl = ed_nf_ac_frete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object el_perc_desconto: TLabel
          Left = 720
          Top = 43
          Width = 11
          Height = 13
          Caption = '%'
        end
        object Label1: TLabel
          Left = 83
          Top = 21
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Finalidade'
        end
        object lb_finalidade: TLabel
          Left = 427
          Top = 16
          Width = 177
          Height = 13
          Caption = '** Nenhum finalidade selecionada **'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ed_nf_ac_outras: TDBEdit
          Left = 136
          Top = 40
          Width = 100
          Height = 21
          DataField = 'NF_AC_OUTRAS'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 1
          OnExit = ed_nf_ac_outrasExit
        end
        object ed_nf_ac_seguro: TDBEdit
          Left = 321
          Top = 40
          Width = 100
          Height = 21
          DataField = 'NF_AC_SEGURO'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 2
        end
        object ed_nf_ac_frete: TDBEdit
          Left = 497
          Top = 40
          Width = 100
          Height = 21
          DataField = 'NF_AC_FRETE'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 3
        end
        object ed_nf_ac_ipi: TDBEdit
          Left = 136
          Top = 67
          Width = 100
          Height = 21
          DataField = 'NF_AC_IPI'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 6
        end
        object ed_nf_ac_icmsst: TDBEdit
          Left = 321
          Top = 67
          Width = 100
          Height = 21
          DataField = 'NF_AC_ICMSST'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 7
        end
        object ed_nf_ac_fcpst: TDBEdit
          Left = 497
          Top = 67
          Width = 100
          Height = 21
          DataField = 'NF_AC_FCPST'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 8
        end
        object ed_nf_ac_imposto_ii: TDBEdit
          Left = 136
          Top = 94
          Width = 100
          Height = 21
          DataField = 'NF_AC_IMPOSTO_II'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 9
        end
        object bt_obter_valores_nf: TBitBtn
          Left = 7
          Top = 116
          Width = 45
          Height = 25
          Hint = 'Calcular valores da nota fiscal'
          TabOrder = 10
          OnClick = bt_obter_valores_nfClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000230B0000230B0000000100000001000000000000BD8C
            7300B5848400C6A59C00CEB5AD00D6B5AD00E7C6B500FFD6B500FFEFDE00FFEF
            E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
            0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0101010101
            0101010101010101010202020202020202020202020202020201030807070707
            0707070707070707020103080700090009000900090009070201030807070707
            0707070707070707020105080700090009000900090009070201050807070707
            0707070707070707020104080205050505050505070707070201060802080808
            0808080507070707020106080202020202020202070707070201060808080808
            080808080808080802010A06060606060606060606060606060A0A0A0A0A0A0A
            0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
        end
        object pn_valores_nf_tot_e_acres: TPanel
          Left = 58
          Top = 116
          Width = 548
          Height = 37
          BevelOuter = bvNone
          TabOrder = 11
          object lb_acrescimo_valores_nf: TLabel
            Left = 5
            Top = 8
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tot Acr'#233'scimo'
            FocusControl = ed_acrescimo_valores_nf
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lb_valor_total_valores_nf: TLabel
            Left = 382
            Top = 8
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Total'
            FocusControl = ed_valor_total_valores_nf
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lb_desconto_valor: TLabel
            Left = 193
            Top = 8
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tot Desconto'
            FocusControl = ed_desconto_valor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ed_acrescimo_valores_nf: TDBEdit
            Left = 78
            Top = 5
            Width = 100
            Height = 21
            DataField = 'ACRESCIMO'
            DataSource = DtmPedVenda.dsPedVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object ed_valor_total_valores_nf: TDBEdit
            Left = 439
            Top = 5
            Width = 100
            Height = 21
            DataField = 'VALOR_TOTAL'
            DataSource = DtmPedVenda.dsPedVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object ed_desconto_valor: TDBEdit
            Left = 263
            Top = 5
            Width = 100
            Height = 21
            DataField = 'DESCONTO'
            DataSource = DtmPedVenda.dsPedVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object ed_nf_ac_calctrib: TDBLookupComboBox
          Left = 723
          Top = 94
          Width = 65
          Height = 21
          DataField = 'NF_AC_CALCTRIB'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 12
        end
        object ed_nf_freteconta: TDBLookupComboBox
          Left = 723
          Top = 67
          Width = 65
          Height = 21
          DataField = 'NF_FRETECONTA'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 5
        end
        object ed_nf_dc_desconto: TDBEdit
          Left = 664
          Top = 40
          Width = 50
          Height = 21
          DataField = 'NF_DC_DESCONTO'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 4
          OnExit = ed_nf_dc_descontoExit
        end
        object ed_nf_ac_vicmdeson: TDBEdit
          Left = 321
          Top = 94
          Width = 100
          Height = 21
          DataField = 'NF_AC_VICMDESON'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 13
        end
        object ed_nf_dc_vicmdeson: TDBEdit
          Left = 497
          Top = 94
          Width = 100
          Height = 21
          Hint = 
            'Valor do ICMS Desonerado na Nota Fiscal, o valor '#233' um desconto, ' +
            'portanto diminui o valor da Nota Fiscal'
          DataField = 'NF_DC_VICMDESON'
          DataSource = DtmPedVenda.dsPedVenda
          Enabled = False
          TabOrder = 14
        end
        object ed_nf_cf_deson_emb: TDBLookupComboBox
          Left = 723
          Top = 121
          Width = 65
          Height = 21
          DataField = 'NF_CF_DESON_EMB'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 15
        end
        object ed_desc_p_prod: TDBEdit
          Left = 736
          Top = 40
          Width = 50
          Height = 21
          DataField = 'DESC_P_PROD'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 16
        end
        object lk_finalidadeid: TDBLookupComboBox
          Left = 137
          Top = 13
          Width = 284
          Height = 21
          Hint = 
            'A finalidade autom'#225'tica ser'#225' com base no cadastro do cliente cas' +
            'o preenchido l'#225
          DataField = 'FINALIDADEID'
          DataSource = DtmPedVenda.dsPedVenda
          TabOrder = 0
        end
      end
      object pn_valores_nf_tv: TPanel
        Left = 6
        Top = 161
        Width = 803
        Height = 324
        Align = alClient
        BevelOuter = bvNone
        Padding.Top = 6
        Padding.Bottom = 3
        TabOrder = 1
        object tv_nf_valores: TTreeView
          Left = 0
          Top = 6
          Width = 803
          Height = 315
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Indent = 19
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnCustomDrawItem = tv_nf_valoresCustomDrawItem
        end
      end
    end
    object pn_valores_nf_bottom: TPanel
      Left = 7
      Top = 502
      Width = 819
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object bt_valors_nf_voltar: TBitBtn
        Left = 728
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Voltar'
        ModalResult = 2
        TabOrder = 0
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
          0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
          0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
          1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
          3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
          5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
          2828281F05002828282828282828282828282817050713282828282828282828
          2828282817060715282828282828282828282828281507062328280004040404
          040404232828000701282802090807070707061B28282706062328040B090711
          2727272828282800071328060D070A07232828282828281C070128070E13020B
          082028282828281C0701280F101D28020D0818282828280107132816191E2828
          140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
          282827140808041B282828282828282828282828282828282828282828282828
          2828282828282828282828282828282828282828282828282828}
      end
    end
  end
end
