inherited frmCadNF_Ajuste_Estoque: TfrmCadNF_Ajuste_Estoque
  Caption = 'Notas Fiscais de Ajuste de estoque'
  ClientHeight = 579
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 792
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  object pn_principal: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 579
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object pg_ajuste: TPageControl
      Left = 6
      Top = 6
      Width = 772
      Height = 567
      ActivePage = ts_balanco
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object ts_balanco: TTabSheet
        Caption = 'Balan'#231'os'
        OnEnter = ts_balancoEnter
        object pn_balanco: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 536
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pn_balanco_pesquisa: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 41
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object ed_bal_dtini: TLabel
              Left = 17
              Top = 12
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'In'#237'cio:'
            end
            object ed_bal_dtfim: TLabel
              Left = 142
              Top = 12
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fim:'
            end
            object lbBalanco: TLabel
              Left = 247
              Top = 12
              Width = 41
              Height = 13
              Caption = 'Balan'#231'o:'
            end
            object ed_data_ini: TMaskEdit
              Left = 52
              Top = 9
              Width = 73
              Height = 21
              EditMask = '!99/99/0000;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnExit = ed_data_iniExit
            end
            object ed_data_fim: TMaskEdit
              Left = 168
              Top = 9
              Width = 73
              Height = 21
              EditMask = '!99/99/0000;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = ed_data_iniExit
            end
            object bt_balanco_visualizar: TBitBtn
              Left = 511
              Top = 6
              Width = 85
              Height = 25
              Hint = '[NF0205] - BT VISUALIZAR BALANCOS'
              Caption = 'Visualizar'
              TabOrder = 2
              OnClick = bt_balanco_visualizarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                424242424242424242422B39180B42424242424242424242424243443C180B42
                4242424242424242424242444438180B42424242424242424242424244433918
                0A424242424242424242424242444335004201101A114242424242424242453D
                05072F343434291942424242424242221A2D34343437403E0442424242424206
                231C303437404146284242424242421B210F30373A414140310D42424242421F
                20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                4227312D21252314424242424242424242420E141B1B42424242}
            end
            object lkBalanco: TDBLookupComboBox
              Left = 295
              Top = 9
              Width = 210
              Height = 21
              TabOrder = 3
            end
            object bt_ajuste_manter: TBitBtn
              Left = 602
              Top = 6
              Width = 100
              Height = 25
              Hint = '[NF0206] - BT MANTER AJUSTE BALANCOS'
              Caption = 'Manter ajuste'
              TabOrder = 4
              OnClick = bt_ajuste_manterClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000420B0000420B00000001000000010000000000000084
                0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                3D3D3D3D320D0801010241412426262626242426210C410A0A41}
            end
          end
          object group_intes_pendentes: TGroupBox
            Left = 0
            Top = 41
            Width = 764
            Height = 495
            Align = alClient
            Caption = 'Rela'#231#227'o de itens pendentes de emiss'#227'o de documento'
            TabOrder = 1
            object pn_balanco_itens: TPanel
              Left = 2
              Top = 15
              Width = 760
              Height = 478
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              Caption = 'Sem itens para a pesquisa efetuada'
              TabOrder = 0
              object grid_balanco: TDBGrid
                Left = 6
                Top = 6
                Width = 748
                Height = 445
                Align = alClient
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Visible = False
              end
              object pn_balanco_bottom: TPanel
                Left = 6
                Top = 451
                Width = 748
                Height = 21
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object lb_title_custo_pos: TLabel
                  Left = 186
                  Top = 2
                  Width = 68
                  Height = 13
                  Caption = 'Custo ( + ) :'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_custo_pos: TLabel
                  Left = 257
                  Top = 2
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_title_custo_neg: TLabel
                  Left = 386
                  Top = 2
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Custo ( - ) :'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_custo_neg: TLabel
                  Left = 457
                  Top = 2
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 7434751
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
            end
          end
        end
      end
      object ts_hist: TTabSheet
        Caption = 'Hist'#243'rico de ajustes(EFD ICMS IPI)'
        ImageIndex = 1
        OnEnter = ts_histEnter
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pn_hist: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 536
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pn_hit_top: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 41
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object lb_hist_dtini: TLabel
              Left = 17
              Top = 12
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'In'#237'cio:'
            end
            object lb_hist_dtfim: TLabel
              Left = 142
              Top = 12
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fim:'
            end
            object ed_hist_dtini: TMaskEdit
              Left = 52
              Top = 9
              Width = 73
              Height = 21
              EditMask = '!99/99/0000;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnExit = ed_data_iniExit
            end
            object ed_hist_dtfim: TMaskEdit
              Left = 168
              Top = 9
              Width = 73
              Height = 21
              EditMask = '!99/99/0000;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = ed_data_iniExit
            end
            object bt_hist_visualizar: TBitBtn
              Left = 247
              Top = 6
              Width = 85
              Height = 25
              Caption = 'Visualizar'
              TabOrder = 2
              OnClick = bt_hist_visualizarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
                73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
                8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
                9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
                A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
                AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
                BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
                D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
                E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
                F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
                424242424242424242422B39180B42424242424242424242424243443C180B42
                4242424242424242424242444438180B42424242424242424242424244433918
                0A424242424242424242424242444335004201101A114242424242424242453D
                05072F343434291942424242424242221A2D34343437403E0442424242424206
                231C303437404146284242424242421B210F30373A414140310D42424242421F
                20032434373A3A37321342424242421D25030F2D37373737311042424242420D
                2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
                4227312D21252314424242424242424242420E141B1B42424242}
            end
            object bt_hist_manter: TBitBtn
              Left = 338
              Top = 6
              Width = 100
              Height = 25
              Hint = '[NF0206] - BT MANTER AJUSTE BALANCOS'
              Caption = 'Manter ajuste'
              TabOrder = 3
              OnClick = bt_hist_manterClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000420B0000420B00000001000000010000000000000084
                0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                3D3D3D3D320D0801010241412426262626242426210C410A0A41}
            end
          end
          object group_hist: TGroupBox
            Left = 0
            Top = 41
            Width = 764
            Height = 495
            Align = alClient
            Caption = 'Hist'#243'rico de ajustes'
            TabOrder = 1
            object pn_hist_grid: TPanel
              Left = 2
              Top = 15
              Width = 760
              Height = 478
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              Caption = 'Sem itens para a pesquisa efetuada'
              TabOrder = 0
              object grid_hist: TDBGrid
                Left = 6
                Top = 6
                Width = 748
                Height = 425
                Align = alClient
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Visible = False
              end
              object pn_hit_bottom: TPanel
                Left = 6
                Top = 431
                Width = 748
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
              end
            end
          end
        end
      end
      object ts_ajuste: TTabSheet
        Caption = 'ts_ajuste'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pn_ajuste: TPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 536
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pn_ajuste_bottom: TPanel
            Left = 0
            Top = 495
            Width = 764
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object bt_voltar: TBitBtn
              Left = 678
              Top = 6
              Width = 75
              Height = 25
              Caption = '&Voltar'
              TabOrder = 0
              OnClick = bt_voltarClick
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
          object pn_notas_group: TPanel
            Left = 0
            Top = 0
            Width = 764
            Height = 495
            Align = alClient
            BevelOuter = bvNone
            Padding.Bottom = 3
            TabOrder = 1
            OnResize = pn_notas_groupResize
            object Splitter1: TSplitter
              Left = 381
              Top = 45
              Height = 447
              ExplicitLeft = 377
              ExplicitTop = 42
            end
            object group_ajuste_entrada: TGroupBox
              Left = 0
              Top = 45
              Width = 381
              Height = 447
              Align = alLeft
              Caption = 'Itens de ajustes de entrada'
              TabOrder = 0
              object pn_ajuste_itens_entrada_top: TPanel
                Left = 2
                Top = 15
                Width = 377
                Height = 32
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object lb_ajuste_itens_entrada_fator: TLabel
                  Left = 73
                  Top = 6
                  Width = 26
                  Height = 13
                  Caption = 'Fator'
                end
                object ed_ajuste_itens_entrada_fator: TEditHw
                  Left = 103
                  Top = 3
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  Text = '                      1,000000'
                  Formato = fFixed
                  FormatSize = '0.6'
                  AsValue = 1.000000000000000000
                end
                object bt_ajuste_itens_entrada_fator_save: TBitBtn
                  Left = 230
                  Top = 1
                  Width = 127
                  Height = 25
                  Hint = '[NF0208] - BT SALVAR FATOR DE AJUSTE'
                  Caption = 'Aplicar e Salvar'
                  TabOrder = 1
                  OnClick = bt_ajuste_itens_entrada_fator_saveClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B00000001000000010000942929009431
                    31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                    4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                    5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                    73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                    8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                    A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                    BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                    CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                    E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                    33343433332505050B4848191516111B27384647452D0002131048191515111A
                    05184046492E0102121048191515111C03032F42493200011210481915151120
                    0601243A493200011210481915151221231D1F27322C04041310481915151515
                    1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                    4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                    3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                    4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                    4343434343434630130F4848092D3A363636363636363A2A0748}
                end
              end
              object pn_ajuste_itens_entrada_bottom: TPanel
                Left = 2
                Top = 375
                Width = 377
                Height = 70
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object lb_ajuste_itens_entrada_custo: TLabel
                  Left = 13
                  Top = 9
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Custo total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_entrada_custo_val: TLabel
                  Left = 85
                  Top = 9
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_entrada_total: TLabel
                  Left = 10
                  Top = 28
                  Width = 69
                  Height = 13
                  Caption = 'Ajuste total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_entrada_ajuste_val: TLabel
                  Left = 85
                  Top = 28
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_entrada_custo_fator_val: TLabel
                  Left = 85
                  Top = 47
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '1,000'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_entrada_custo_fator: TLabel
                  Left = 8
                  Top = 47
                  Width = 71
                  Height = 13
                  Caption = 'Fator m'#233'dio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object bt_ajuste_itens_entrada_save: TBitBtn
                  Left = 230
                  Top = 6
                  Width = 127
                  Height = 25
                  Hint = '[NF0208] - BT SALVAR FATOR DE AJUSTE'
                  Caption = 'Salvar'
                  Enabled = False
                  TabOrder = 0
                  OnClick = bt_ajuste_itens_entrada_saveClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B00000001000000010000942929009431
                    31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                    4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                    5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                    73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                    8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                    A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                    BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                    CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                    E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                    33343433332505050B4848191516111B27384647452D0002131048191515111A
                    05184046492E0102121048191515111C03032F42493200011210481915151120
                    0601243A493200011210481915151221231D1F27322C04041310481915151515
                    1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                    4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                    3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                    4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                    4343434343434630130F4848092D3A363636363636363A2A0748}
                end
                object bt_ajuste_itens_entrada_notas: TBitBtn
                  Left = 230
                  Top = 36
                  Width = 127
                  Height = 25
                  Hint = '[NF0209] - BT MANTER NOTAS FISCAIS DE AJUSTE'
                  Caption = 'Notas Fiscais'
                  TabOrder = 1
                  OnClick = bt_ajuste_itens_entrada_notasClick
                end
              end
              object grid_ajuste_itens_entrada: TDBGrid
                Left = 2
                Top = 47
                Width = 377
                Height = 328
                Align = alClient
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = grid_ajuste_itens_entradaDblClick
              end
            end
            object group_ajuste_saida: TGroupBox
              Left = 384
              Top = 45
              Width = 380
              Height = 447
              Align = alClient
              Caption = 'Itens de ajustes de Sa'#237'da'
              TabOrder = 1
              object pn_ajuste_itens_saida_top: TPanel
                Left = 2
                Top = 15
                Width = 376
                Height = 32
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object lb_ajuste_itens_saida_fator: TLabel
                  Left = 73
                  Top = 6
                  Width = 26
                  Height = 13
                  Caption = 'Fator'
                end
                object ed_ajuste_itens_saida_fator: TEditHw
                  Left = 103
                  Top = 3
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  Text = '                      1,000000'
                  Formato = fFixed
                  FormatSize = '0.6'
                  AsValue = 1.000000000000000000
                end
                object bt_ajuste_itens_saida_fator_save: TBitBtn
                  Left = 230
                  Top = 1
                  Width = 127
                  Height = 25
                  Hint = '[NF0208] - BT SALVAR FATOR DE AJUSTE'
                  Caption = 'Aplicar e Salvar'
                  TabOrder = 1
                  OnClick = bt_ajuste_itens_saida_fator_saveClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B00000001000000010000942929009431
                    31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                    4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                    5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                    73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                    8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                    A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                    BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                    CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                    E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                    33343433332505050B4848191516111B27384647452D0002131048191515111A
                    05184046492E0102121048191515111C03032F42493200011210481915151120
                    0601243A493200011210481915151221231D1F27322C04041310481915151515
                    1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                    4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                    3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                    4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                    4343434343434630130F4848092D3A363636363636363A2A0748}
                end
              end
              object grid_ajuste_itens_saida: TDBGrid
                Left = 2
                Top = 47
                Width = 376
                Height = 328
                Align = alClient
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = grid_ajuste_itens_saidaDblClick
              end
              object pn_ajuste_itens_saida_bottom: TPanel
                Left = 2
                Top = 375
                Width = 376
                Height = 70
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object lb_ajuste_itens_saida_custo: TLabel
                  Left = 14
                  Top = 9
                  Width = 66
                  Height = 13
                  Caption = 'Custo total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_saida_custo_val: TLabel
                  Left = 85
                  Top = 9
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_saida_total: TLabel
                  Left = 11
                  Top = 28
                  Width = 69
                  Height = 13
                  Caption = 'Ajuste total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_saida_ajuste_val: TLabel
                  Left = 85
                  Top = 26
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '5.999.888,55'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_saida_custo_fator_val: TLabel
                  Left = 86
                  Top = 43
                  Width = 99
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '1,000'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 8404992
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lb_ajuste_itens_saida_custo_fator: TLabel
                  Left = 9
                  Top = 47
                  Width = 71
                  Height = 13
                  Caption = 'Fator m'#233'dio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object bt_ajuste_itens_saida_save: TBitBtn
                  Left = 230
                  Top = 6
                  Width = 127
                  Height = 25
                  Hint = '[NF0208] - BT SALVAR FATOR DE AJUSTE'
                  Caption = 'Salvar'
                  Enabled = False
                  TabOrder = 0
                  OnClick = bt_ajuste_itens_saida_saveClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B00000001000000010000942929009431
                    31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                    4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                    5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                    73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                    8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                    A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                    BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                    CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                    E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                    33343433332505050B4848191516111B27384647452D0002131048191515111A
                    05184046492E0102121048191515111C03032F42493200011210481915151120
                    0601243A493200011210481915151221231D1F27322C04041310481915151515
                    1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                    4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                    3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                    4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                    4343434343434630130F4848092D3A363636363636363A2A0748}
                end
                object bt_ajuste_itens_saida_notas: TBitBtn
                  Left = 230
                  Top = 37
                  Width = 127
                  Height = 25
                  Hint = '[NF0209] - BT MANTER NOTAS FISCAIS DE AJUSTE'
                  Caption = 'Notas Fiscais'
                  TabOrder = 1
                  OnClick = bt_ajuste_itens_saida_notasClick
                end
              end
            end
            object group_ajuste_top: TGroupBox
              Left = 0
              Top = 0
              Width = 764
              Height = 45
              Align = alTop
              Caption = 'Dados do ajuste'
              TabOrder = 2
              object lb_ajuste_dtbalanco: TLabel
                Left = 124
                Top = 19
                Width = 154
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data da confirma'#231#227'o do balan'#231'o'
              end
              object lb_ajuste_dtapuracao: TLabel
                Left = 369
                Top = 19
                Width = 191
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data de apura'#231#227'o para o EFD ICMS IPI:'
              end
              object ed_ajuste_data_confirm: TMaskEdit
                Left = 284
                Top = 16
                Width = 72
                Height = 21
                Enabled = False
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
                OnExit = ed_data_iniExit
              end
              object ed_ajuste_data_apuracao: TMaskEdit
                Left = 568
                Top = 16
                Width = 73
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
                OnExit = ed_data_iniExit
              end
              object bt_ajuste_data_apuracao_save: TBitBtn
                Left = 678
                Top = 12
                Width = 75
                Height = 25
                Hint = '[NF0207] - BT SALVAR DATA APURACAO AJUSTE'
                Caption = 'Salvar'
                TabOrder = 2
                OnClick = bt_ajuste_data_apuracao_saveClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000220B0000220B00000001000000010000942929009431
                  31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
                  4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
                  5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
                  73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
                  8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
                  A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
                  BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
                  CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
                  E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
                  33343433332505050B4848191516111B27384647452D0002131048191515111A
                  05184046492E0102121048191515111C03032F42493200011210481915151120
                  0601243A493200011210481915151221231D1F27322C04041310481915151515
                  1515151313151515160F48190D111E282B292B2828292B26150C481909384544
                  4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
                  3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
                  4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
                  4343434343434630130F4848092D3A363636363636363A2A0748}
              end
            end
          end
        end
      end
      object ts_modais: TTabSheet
        Caption = 'ts_modais'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pn_alterar_custo: TPanel
          Left = 68
          Top = 56
          Width = 293
          Height = 185
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object lb_alterar_custo_tot_aj: TLabel
            Left = 33
            Top = 108
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Custo total aj.:'
          end
          object lb_alterar_custo_qtde: TLabel
            Left = 46
            Top = 13
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Quantidade:'
          end
          object dbt_alterar_custo_qtde: TDBText
            Left = 112
            Top = 13
            Width = 113
            Height = 17
            DataField = 'QUANTIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_alterar_custo_tot: TLabel
            Left = 49
            Top = 59
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Custo total:'
          end
          object dbt_alterar_custo_un: TDBText
            Left = 112
            Top = 36
            Width = 113
            Height = 17
            DataField = 'CUSTO_UN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_alterar_custo_un: TLabel
            Left = 35
            Top = 36
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Custo unitario:'
          end
          object lb_alterar_custo_tot_val: TLabel
            Left = 112
            Top = 59
            Width = 138
            Height = 13
            Caption = 'lb_alterar_custo_tot_val'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lb_alterar_custo_fator: TLabel
            Left = 76
            Top = 81
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fator:'
          end
          object ed_alterar_custo_tot_aj: TEditHw
            Left = 112
            Top = 105
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '                      0,000000'
            OnExit = ed_alterar_custo_tot_ajExit
            Formato = fFixed
            FormatSize = '0.2'
          end
          object ed_alterar_custo_fator: TEditHw
            Left = 112
            Top = 78
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '                              0,00'
            OnExit = ed_alterar_custo_fatorExit
            Formato = fFixed
            FormatSize = '0.8'
          end
          object bt_alterar_custo_ok: TBitBtn
            Left = 66
            Top = 143
            Width = 75
            Height = 25
            Caption = '&OK'
            ModalResult = 1
            TabOrder = 2
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000D30E0000D30E00000001000000010000008C00000094
              0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
              210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
              420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
              94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
              04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
              0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
              170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
              13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
              1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
              1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
              1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
          end
          object bt_alterar_custo_cancel: TBitBtn
            Left = 147
            Top = 143
            Width = 75
            Height = 25
            Caption = '&Cancela'
            ModalResult = 2
            TabOrder = 3
            Glyph.Data = {
              E6010000424DE60100000000000036000000280000000C0000000C0000000100
              180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
              9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
              ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
              A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
              0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
              B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
              01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
              0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
              ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
              39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
              4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
              DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
              A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
              5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF7D7DE9A4A4EDFFFFFF}
          end
        end
      end
      object ts_nf: TTabSheet
        Caption = 'ts_nf'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pn_nf: TPanel
          Left = 20
          Top = 6
          Width = 741
          Height = 502
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          OnEnter = pn_nfEnter
          object pn_nf_bottom: TPanel
            Left = 6
            Top = 451
            Width = 725
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object bt_nf_voltar: TBitBtn
              Left = 638
              Top = 6
              Width = 75
              Height = 25
              Caption = '&Voltar'
              ModalResult = 2
              TabOrder = 0
              OnClick = bt_nf_voltarClick
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
          object tv_nf: TTreeView
            Left = 6
            Top = 77
            Width = 725
            Height = 374
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Lucida Console'
            Font.Style = []
            Indent = 19
            ParentFont = False
            TabOrder = 2
          end
          object pn_nf_top: TPanel
            Left = 6
            Top = 6
            Width = 725
            Height = 71
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object lb_cfop: TLabel
              Left = 8
              Top = 43
              Width = 31
              Height = 13
              Caption = 'CFOP:'
            end
            object lb_cst_icms: TLabel
              Left = 104
              Top = 43
              Width = 47
              Height = 13
              Caption = 'CST ICMS'
            end
            object lb_information: TLabel
              Left = 8
              Top = 7
              Width = 497
              Height = 24
              AutoSize = False
              Caption = 
                '*** A nota fiscal ser'#225' gerada em nome da pr'#243'pria empresa, ap'#243's a' +
                ' cria'#231#227'o o usu'#225'rio deve entrar no modulo da nota fiscal e proced' +
                'er com a emiss'#227'o ***'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object lb_information_entrada: TLabel
              Left = 208
              Top = 43
              Width = 316
              Height = 13
              Caption = '*Informar 99 para deixar o CST conforme o cadastro do produto*'
            end
            object ed_cfop: TEditHw
              Left = 45
              Top = 40
              Width = 41
              Height = 21
              TabOrder = 0
              Text = '   5927'
              OnExit = ed_cfopExit
              Formato = fInteger
              FormatSize = '0.0'
              DisplayFormat = '0000'
              AsValue = 5927.000000000000000000
            end
            object ed_cst_icms: TEditHw
              Left = 160
              Top = 40
              Width = 33
              Height = 21
              TabOrder = 1
              Text = '    41'
              OnExit = ed_cst_icmsExit
              Formato = fInteger
              FormatSize = '0.0'
              DisplayFormat = '00'
              AsValue = 41.000000000000000000
            end
            object bt_nf_atualizar: TBitBtn
              Left = 557
              Top = 22
              Width = 75
              Height = 25
              Hint = '[NF0210] - Visualizar como ser'#227'o montadas as notas fiscais'
              Caption = 'Prever'
              TabOrder = 2
              OnClick = bt_nf_atualizarClick
              Glyph.Data = {
                92020000424D9202000000000000920100002800000010000000100000000100
                08000000000000010000120B0000120B0000570000005700000000000000FFFF
                FF00FF00FF00634B5400A46769008E5D5900D8C2C00080504B00DCC7C500A067
                5B00A7756B00DAC1BA00C1836C00B56D4D00BF7A5C00BC826800F8F2EF00FBF4
                F000FAF3EF00CF8E6800D1926D00F7F2EF00DA9D7500EDD8C900FBF4EF00E7AB
                7900FAEFE500F8EADC00E68F3100E19E5500F6E3CF00F8E9D900F2D5B100F2D5
                B200F3DABB00F3DABC00F2D9BC00F6E0C600F7E5CF00F8B55C00E9BD8100EDC2
                8B00EDC79300EECB9E00F0D0A700F2DABC00F4E0C500F4E0C600F7E5CE00F8E7
                D100FFF4E500E9BD7F00FEEFDA00FCF3E600EFC48000EFC48100EBCFA400DECE
                B400FCEACE00FBEACE00B1A08100B2A18000B6AA9300B7AF9F00BBB09800B7AF
                9D00B6A68100FFFBF000BAB5A600BBBAB500BABAB500FFFFFC00BCBFBD00BCBD
                BD00C1D3E200BDC7CF00409DF2002588ED002C8CEF003796F000C0CCD8001F82
                EB002587ED00C0CBD7000F73E9001678EA0007397A0002020202020202020202
                0202020202020204050505050505050505050507020202043A23202C2B2A2928
                333337070202020934252D21565656563C3337070202020932262E2220415654
                563D36070202020A431B1E2F24203F56555642070202020A474B56482E56564F
                4E5156560202020F4A5654564945564C4C4F56030202020F564C5254561E4656
                4C56400702020256564C4C4D5656304556443807020202144A564C56501A1F31
                3B393E0702020216014A564C56533517090909090202021601014A565656560B
                091D1C0D02020219010101010101010809270E02020202191118121210151506
                090C0202020202191313131313131313090202020202}
            end
            object bt_nf_criar: TBitBtn
              Left = 638
              Top = 22
              Width = 75
              Height = 25
              Hint = '[NF0211] - Cria as notas prontas para emiss'#227'o'
              Caption = 'Criar'
              TabOrder = 3
              OnClick = bt_nf_criarClick
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000DE0E0000DE0E00000001000000010000000000009431
                31009C3939009C4A4A00AD524A00AD5A5A00B55A5A00C65A5A00B5737300BD7B
                7300C6948C00BDA5A500CEB5B500E7C6C600C6CEC600D6D6D600F7F7F700FFF7
                F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121212121212
                121212121212121212121205050D0D0E0E0E0E050112121212120907070D0208
                0E1010070112121212120907070A02030D0E10070100011212120907070A0A0B
                0B0D0E0701070112121209040607070707070707010701000112090411111111
                1111110701070107011209041111111111111107010701070112090411111111
                1111110701070107011209041111111111111107010701070112090411111111
                1111110701070107011209040F0C0C0C0C0C0F04010701070112121209041111
                11111111110701070112121209040F0C0C0C0C0C0F0401070112121212120904
                111111111111110701121212121209040F0C0C0C0C0C0F040112}
            end
          end
        end
      end
    end
  end
end
