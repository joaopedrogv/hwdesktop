inherited frmCadNF_lote: TfrmCadNF_lote
  Caption = 'Faturamento em lote'
  ClientHeight = 534
  ClientWidth = 801
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 809
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 534
    Align = alClient
    BorderWidth = 6
    Caption = 'Panel1'
    TabOrder = 0
    object Panel3: TPanel
      Left = 7
      Top = 7
      Width = 787
      Height = 479
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 6
      TabOrder = 0
      object pages: TPageControl
        Left = 0
        Top = 6
        Width = 787
        Height = 473
        ActivePage = ts_modais
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object ts_pedidos: TTabSheet
          Caption = 'Pedidos'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Splitter1: TSplitter
            Left = 0
            Top = 289
            Width = 779
            Height = 3
            Cursor = crVSplit
            Align = alBottom
            ExplicitTop = 0
            ExplicitWidth = 331
          end
          object pn_grid_ped: TPanel
            Left = 0
            Top = 0
            Width = 779
            Height = 289
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Sem registro para apresentar'
            Padding.Bottom = 3
            TabOrder = 0
            object grid_ped: TDBGrid
              Left = 0
              Top = 0
              Width = 779
              Height = 286
              Align = alClient
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = grid_pedCellClick
              OnDrawColumnCell = grid_pedDrawColumnCell
              OnDblClick = grid_pedDblClick
              OnKeyDown = grid_pedKeyDown
              OnMouseUp = grid_pedMouseUp
            end
          end
          object pn_erros_scroll: TPanel
            Left = 0
            Top = 292
            Width = 779
            Height = 150
            Align = alBottom
            BevelOuter = bvNone
            Padding.Top = 3
            Padding.Bottom = 3
            TabOrder = 1
            Visible = False
            object lb_erros_titulo: TLabel
              Left = 0
              Top = 3
              Width = 779
              Height = 15
              Align = alTop
              AutoSize = False
              Caption = 'Erros do processamento do Pedido'
              ExplicitTop = 0
              ExplicitWidth = 762
            end
            object db_memo_erros: TDBMemo
              Left = 366
              Top = 99
              Width = 762
              Height = 84
              Ctl3D = False
              DataField = 'erros'
              ParentCtl3D = False
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
              Visible = False
            end
            object memo_erros_scroll: TMemo
              Left = 0
              Top = 18
              Width = 779
              Height = 129
              Align = alClient
              Lines.Strings = (
                'memo_erros_ped')
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
        object ts_notas: TTabSheet
          Caption = 'Notas Ficais'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pn_nf_prev: TPanel
            Left = 3
            Top = 3
            Width = 880
            Height = 414
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object pn_nf_prev_bottom: TPanel
              Left = 6
              Top = 363
              Width = 864
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object bt_prev_nf_cancel: TBitBtn
                Left = 433
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                ModalResult = 2
                TabOrder = 1
                OnClick = bt_prev_nf_cancelClick
                Glyph.Data = {
                  12020000424D1202000000000000120100002800000010000000100000000100
                  08000000000000010000120B0000120B0000370000003700000000000000FFFF
                  FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                  DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                  EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                  EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                  E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                  DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                  E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                  0202020202020202020202020202020202020202020202020236360202020202
                  0236360202020202361A28360202020236302E36020202023621182A36020236
                  332B34360202020202362419293636312C353602020202020202361E11272D2B
                  3236020202020202020202361B26252F36020202020202020202023612172022
                  36020202020202020202360F06131C0A2336020202020202023607080E363614
                  0B1F3602020202023603041036020236160D1D36020202023605093602020202
                  36150C3602020202023636020202020202363602020202020202020202020202
                  02020202020202020202020202020202020202020202}
              end
              object bt_pedidos_faturar: TBitBtn
                Left = 352
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Faturar pedidos - [NF0204]'
                Caption = 'Faturar'
                TabOrder = 0
                OnClick = bt_pedidos_faturarClick
                Glyph.Data = {
                  CA020000424DCA02000000000000CA0100002800000010000000100000000100
                  08000000000000010000120B0000120B00006500000065000000FF00FF008E5D
                  590091605A00905F5A0090605B0082524C009C685F0096645C009F675A00A773
                  6400A06D6000AF796700BB775D00B67F6900C4896E00BC846C00CE927200D196
                  7400C98F7000CF8E6800F2A14100F4B66900F6D8B200DDCBB400FFFCF800FEF2
                  E100FEF4E600FFFAF300FFC46500F6CB8400F6CC8800F6CC8900F7CF9000F7D1
                  9300F8D9A600F8DAA900EFD3A700FADEB200FAE0B500FAE1B800FAE3BD00FCEA
                  CE00FBEACF00FEF6E900F6CE8B00F6D08F00F7D39500F7D39700F7D49900F7D5
                  9900F8D79C00F7D79E00F8D79F00F8D8A000F8D8A100F8D9A400F8D9A500F8DA
                  A700F8DCAB00F8DCAC00F8DDAC00F8DDAD00FADEAF00F8DEB000F8E0B400FAE1
                  B700FBE3BB00FAE3BA00FAE3BB00FBE5C000FAE5BF00FBE6C100FBE6C200FBE7
                  C400FBE9C900FBEBD000FCEDD300FCF0DA00FCF0DC00FEF8ED00FEF8EE00FFFB
                  F400FFFCF700F8E1B500FBE9C600FBE9C700FBEDD100B4AA9700FBEED400FBEE
                  D500FCF3E200FEF6E700FFFEFC00FCF2DD00FCF4E300FEFCF600FFFEFB00FEFE
                  FB00FEFFFE00FFFFFF0000000000000000000000000000000000000000000000
                  0103030303030303030303050000000002403C2235312E202C1E1D0500000000
                  0728413E2336040404041F0500000000064A4743403B383430212D0500000000
                  0A5604490426042304322F0500000000095D592A554527253A37330500000000
                  0B1A040404040442533D3905000000000D502B5A4E58295446413F0500000000
                  0F5F04040404044B4A484405000000000E5C181B4F5B194D4C16240500000000
                  126304040404045E5D17570500000000106304636152044F0808080800000000
                  1163040404040451081C140C00000000116363636363626008150C0000000000
                  1113131313131313080C00000000}
              end
            end
            object pn_nf_prev_top: TPanel
              Left = 6
              Top = 6
              Width = 864
              Height = 70
              Align = alTop
              Alignment = taLeftJustify
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object lb_dados_transporte: TLabel
                Left = 27
                Top = 8
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dados Transporte:'
              end
              object dbt_dados_transp: TDBText
                Left = 123
                Top = 8
                Width = 686
                Height = 26
                DataField = 'DADOS_TRANSP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object bt_change_trnasporta: TSpeedButton
                Left = 822
                Top = 8
                Width = 23
                Height = 22
                Hint = 'Alterar dados do transporte'
                Flat = True
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
                OnClick = bt_change_trnasportaClick
              end
              object lb_dadhora_saida: TLabel
                Left = 13
                Top = 43
                Width = 104
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data e hora da sa'#237'da:'
              end
              object bt_datahora_saida_clear: TSpeedButton
                Left = 292
                Top = 40
                Width = 23
                Height = 22
                Hint = 'Limpar data e hora'
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
                  8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                  0404040404040404040404040404040404040404040404040404040404040404
                  0404040404040404040404010000000000000104040404040404040002020202
                  0202000004040404040404000202020202020001000404040404040100020202
                  0202000101000404040404040003030303030300010100040404040404000303
                  0303030300010100040404040404000303030303030001010004040404040400
                  0303030303030001000404040404040400030303030303000004040404040404
                  0400030303030303000404040404040404040100000000010104040404040404
                  0404040404040404040404040404040404040404040404040404}
                OnClick = bt_datahora_saida_clearClick
              end
              object bt_tv_refresh: TSpeedButton
                Left = 373
                Top = 40
                Width = 23
                Height = 22
                Flat = True
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000220B0000220B0000000100000001000000840000088C
                  0800108C080018941000219410001894180029941800219C2100299C210029A5
                  2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
                  5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
                  6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
                  73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
                  7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
                  840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
                  9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
                  A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
                  B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
                  DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
                  F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
                  1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
                  0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
                  0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
                  2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
                  5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
                  00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
                  5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
                  575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
                OnClick = bt_tv_refreshClick
              end
              object bt_datahora_saida_set: TSpeedButton
                Left = 263
                Top = 40
                Width = 23
                Height = 22
                Hint = 'Alterar data e hora da sa'#237'da'
                Flat = True
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
                OnClick = bt_datahora_saida_setClick
              end
              object ed_data_saida: TMaskEdit
                Left = 123
                Top = 40
                Width = 77
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
                OnExit = ed_data_saidaExit
              end
              object ed_hora_saida: TMaskEdit
                Left = 206
                Top = 40
                Width = 51
                Height = 21
                EditMask = '!90:00:00;1;_'
                MaxLength = 8
                TabOrder = 1
                Text = '  :  :  '
              end
              object ck_usar_dados_transporte: TCheckBox
                Left = 560
                Top = 40
                Width = 285
                Height = 17
                Caption = 'Usar estes dados de transporte para emiss'#227'o das notas'
                TabOrder = 2
                OnClick = ck_usar_dados_transporteClick
              end
            end
            object pn_nf_prev_tv: TPanel
              Left = 6
              Top = 76
              Width = 864
              Height = 287
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object tv_nf: TTreeView
                Left = 0
                Top = 0
                Width = 860
                Height = 283
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Lucida Console'
                Font.Style = []
                Indent = 19
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                OnCustomDrawItem = tv_nfCustomDrawItem
                OnDblClick = tv_nfDblClick
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
          object sc_modais: TScrollBox
            Left = 0
            Top = 0
            Width = 779
            Height = 442
            Align = alClient
            TabOrder = 0
            object pn_transporte: TPanel
              Left = 1
              Top = 0
              Width = 772
              Height = 149
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Label27: TLabel
                Left = 11
                Top = 45
                Width = 69
                Height = 13
                Alignment = taRightJustify
                Caption = 'Transportador'
              end
              object Label28: TLabel
                Left = 428
                Top = 45
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'CNPJ'
              end
              object Label29: TLabel
                Left = 35
                Top = 72
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Endere'#231'o'
              end
              object Label32: TLabel
                Left = 409
                Top = 72
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Munic'#237'pio'
              end
              object Label35: TLabel
                Left = 597
                Top = 45
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ins/E'
              end
              object Label37: TLabel
                Left = 366
                Top = 18
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ve'#237'culo Placa e UF'
              end
              object Label38: TLabel
                Left = 609
                Top = 72
                Width = 13
                Height = 13
                Alignment = taRightJustify
                Caption = 'UF'
              end
              object Label640: TLabel
                Left = 26
                Top = 18
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Modalidade'
              end
              object Label680: TLabel
                Left = 592
                Top = 18
                Width = 27
                Height = 13
                Caption = 'RNTC'
                FocusControl = ed_rntc
              end
              object SpeedButton3: TSpeedButton
                Left = 721
                Top = 69
                Width = 23
                Height = 22
                Hint = 'Salvar dados de tranporte padr'#227'o'
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
                OnClick = SpeedButton3Click
              end
              object ed_codigo_tr: TDBEdit
                Left = 86
                Top = 42
                Width = 50
                Height = 21
                DataField = 'CODIGO_TR'
                TabOrder = 4
                OnExit = ed_codigo_trExit
                OnKeyDown = ed_codigo_trKeyDown
              end
              object ed_cnpj_tr: TDBEdit
                Left = 458
                Top = 42
                Width = 130
                Height = 21
                DataField = 'CNPJ_TR'
                TabOrder = 6
              end
              object ed_endereco_tr: TDBEdit
                Left = 86
                Top = 69
                Width = 313
                Height = 21
                DataField = 'END_TR'
                ReadOnly = True
                TabOrder = 8
              end
              object ed_municipio_tr: TDBEdit
                Left = 458
                Top = 69
                Width = 130
                Height = 21
                DataField = 'MUNICIPIO_TR'
                ReadOnly = True
                TabOrder = 9
              end
              object ed_ie_tr: TDBEdit
                Left = 628
                Top = 42
                Width = 116
                Height = 21
                DataField = 'IE_TR'
                ReadOnly = True
                TabOrder = 7
              end
              object ed_uf_placa: TDBEdit
                Left = 555
                Top = 15
                Width = 33
                Height = 21
                CharCase = ecUpperCase
                DataField = 'UF_PLACA'
                TabOrder = 2
              end
              object ed_placa: TDBEdit
                Left = 458
                Top = 15
                Width = 91
                Height = 21
                CharCase = ecUpperCase
                DataField = 'PLACA'
                TabOrder = 1
              end
              object ed_uf_tr: TDBEdit
                Left = 628
                Top = 69
                Width = 29
                Height = 21
                DataField = 'SIGLA_UF'
                ReadOnly = True
                TabOrder = 10
              end
              object ed_nome_tr: TDBEdit
                Left = 142
                Top = 42
                Width = 257
                Height = 21
                DataField = 'NOME_TR'
                ReadOnly = True
                TabOrder = 5
              end
              object lkmodalidade: TDBLookupComboBox
                Left = 86
                Top = 15
                Width = 263
                Height = 21
                DataField = 'MODALIDADE'
                TabOrder = 0
                OnExit = ed_codigo_trExit
              end
              object ed_rntc: TDBEdit
                Left = 628
                Top = 15
                Width = 116
                Height = 21
                CharCase = ecUpperCase
                DataField = 'RNTC'
                TabOrder = 3
              end
              object pn_transporte_bottom: TPanel
                Left = 6
                Top = 98
                Width = 756
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 11
                object bt_voltar_transporta: TBitBtn
                  Left = 663
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
            object pn_volumes: TPanel
              Left = 1
              Top = 155
              Width = 772
              Height = 102
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 1
              OnEnter = pn_volumesEnter
              object Label30: TLabel
                Left = 13
                Top = 20
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Quantidade'
              end
              object Label31: TLabel
                Left = 652
                Top = 20
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Peso L'
              end
              object Label33: TLabel
                Left = 135
                Top = 20
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Esp'#233'cie'
              end
              object Label34: TLabel
                Left = 265
                Top = 20
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Marca'
              end
              object Label39: TLabel
                Left = 544
                Top = 20
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Peso B'
              end
              object Label40: TLabel
                Left = 446
                Top = 20
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Numero'
              end
              object pn_volumes_bottom: TPanel
                Left = 6
                Top = 51
                Width = 756
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object bt_volumes_save: TBitBtn
                  Left = 245
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Salvar'
                  ModalResult = 1
                  TabOrder = 0
                  OnClick = bt_volumes_saveClick
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
                object bt_volumes_cancel: TBitBtn
                  Left = 407
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Cancelar'
                  ModalResult = 2
                  TabOrder = 1
                  Glyph.Data = {
                    12020000424D1202000000000000120100002800000010000000100000000100
                    08000000000000010000120B0000120B0000370000003700000000000000FFFF
                    FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                    DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                    EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                    EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                    E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                    DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                    E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                    0202020202020202020202020202020202020202020202020236360202020202
                    0236360202020202361A28360202020236302E36020202023621182A36020236
                    332B34360202020202362419293636312C353602020202020202361E11272D2B
                    3236020202020202020202361B26252F36020202020202020202023612172022
                    36020202020202020202360F06131C0A2336020202020202023607080E363614
                    0B1F3602020202023603041036020236160D1D36020202023605093602020202
                    36150C3602020202023636020202020202363602020202020202020202020202
                    02020202020202020202020202020202020202020202}
                end
                object bt_volumes_delete: TBitBtn
                  Left = 326
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Excluir'
                  ModalResult = 1
                  TabOrder = 2
                  OnClick = bt_volumes_deleteClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
              end
              object ed_qvol: TEditHw
                Left = 77
                Top = 17
                Width = 50
                Height = 21
                TabOrder = 1
                Text = '            0'
                Formato = fInteger
                FormatSize = '0.2'
              end
              object ed_esp: TMaskEdit
                Left = 177
                Top = 17
                Width = 78
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 60
                TabOrder = 2
                Text = 'ED_ESP'
              end
              object ed_marca: TMaskEdit
                Left = 300
                Top = 17
                Width = 136
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 60
                TabOrder = 3
                Text = 'ED_MARCA'
              end
              object ed_nvol: TMaskEdit
                Left = 489
                Top = 17
                Width = 45
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 4
                Text = 'ED_NVOL'
              end
              object ed_pesob: TEditHw
                Left = 584
                Top = 17
                Width = 60
                Height = 21
                TabOrder = 5
                Text = '          0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object ed_pesol: TEditHw
                Left = 689
                Top = 17
                Width = 60
                Height = 21
                TabOrder = 6
                Text = '          0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
            end
          end
        end
        object ts_erros: TTabSheet
          Caption = 'ts_erros'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pn_erros: TPanel
            Left = 19
            Top = 15
            Width = 574
            Height = 337
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Panel6: TPanel
              Left = 6
              Top = 290
              Width = 562
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn1: TBitBtn
                Left = 241
                Top = 6
                Width = 75
                Height = 25
                Caption = '&OK'
                ModalResult = 1
                TabOrder = 0
              end
            end
            object Panel7: TPanel
              Left = 6
              Top = 6
              Width = 562
              Height = 284
              Align = alClient
              BevelOuter = bvNone
              Padding.Bottom = 6
              TabOrder = 1
              object memo_erros: TMemo
                Left = 0
                Top = 25
                Width = 562
                Height = 253
                Align = alClient
                Lines.Strings = (
                  'memo_erros')
                ScrollBars = ssBoth
                TabOrder = 0
              end
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 562
                Height = 25
                Align = alTop
                BevelOuter = bvNone
                Caption = 'Log de erro do '#250'ltimo processamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 7
      Top = 486
      Width = 787
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object btSelectAll: TSpeedButton
        Left = 8
        Top = 8
        Width = 23
        Height = 21
        Hint = 'Op'#231#245'es'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btSelectAllClick
      end
      object bt_erros_show: TSpeedButton
        Left = 37
        Top = 8
        Width = 23
        Height = 21
        Hint = 'Op'#231#245'es'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000D30E0000D30E00000001000000010000080000000808
          0800310010004A08180031101800391821005A1821004A182900632929005221
          31006B21310039314200843142001042420018394A0010424A008C524A003139
          5200084252006B4A5200085252005A525200845252005A5A5A00635A5A006B5A
          5A00845A5A008C5A5A00635A6300845A63005A63630084636300946363008C6B
          6B00A56B6B00086B7300426B730094737300396B7B009C7B7B00A57B7B00AD84
          8400187B9400188C9C00298C9C0029949C002994A500B5A5A500218CAD00089C
          AD0021A5AD0021ADAD009CA5B5007BB5B500089CBD00219CBD0021B5BD00089C
          C60008BDC60010A5CE0018B5CE0008BDD60000B5DE0008B5DE0010B5DE0008DE
          DE0000BDE70008BDE70000C6E70008C6E70018C6E70008CEE70052CEE70000D6
          E70000DEE70018E7E70000BDEF0000C6EF0000CEEF0000D6EF0018D6EF0000DE
          EF0008DEEF0063DEEF0000E7EF0008E7EF0010E7EF004AE7EF0063E7EF0000EF
          EF004AEFEF0000C6F70000CEF7006BDEF70000E7F70094E7F7009CE7F70000EF
          F70008F7F70010F7F700FF00FF0000D6FF0000DEFF0008DEFF0000E7FF0008E7
          FF0000EFFF0008EFFF0010EFFF0000F7FF0008F7FF0010F7FF0018F7FF0000FF
          FF0008FFFF0010FFFF0018FFFF0031FFFF0052FFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00646464646464
          6464646464646464646464642F1F1D1D1D1D1D1D1D1D1D1D1B6464473E424242
          4D3F404C424242422C1064584D655C5C4E0F0D465C5C655C3329646447676565
          4F120E4765656C5C19646464584E6665665E5E66656667452164646464476C66
          663A3D6866704F1964646464645867696823266A6C6C4521646464646464476B
          6123266170681964646464646464585E540F04496C4521646464646464646447
          4100043852196464646464646464645855140D4B452164646464646464646464
          586E746D19646464646464646464646458627345216464646464646464646464
          6447633564646464646464646464646464535364646464646464}
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = bt_erros_showClick
      end
      object BitBtn2: TBitBtn
        Left = 516
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Clear NF'
        TabOrder = 0
        Visible = False
        OnClick = BitBtn2Click
      end
      object bt_pedidos_fechar: TBitBtn
        Left = 256
        Top = 6
        Width = 124
        Height = 25
        Hint = 'Fechar pedidos em aberto - [VND247]'
        Caption = 'Fechar pedidos'
        TabOrder = 1
        OnClick = bt_pedidos_fecharClick
        Glyph.Data = {
          CE010000424DCE01000000000000CE0000002800000010000000100000000100
          08000000000000010000120B0000120B0000260000002600000000000000FFFF
          FF00FF00FF00B73D3D00C95C5C00CA5F5F00CC656500CC666600CD696900CE6B
          6B00CE6C6C00CF6E6E00CF6F6F00D2777700D7868600DA909000DC959500DE9B
          9B0000660000149D210019AA2B00179D27001AB02D001BA92E001DB132001EB2
          31001FB133001EAE310022B7380021B4370025A83B0031C24F0031B54D003BCB
          5E0041C5630047D36D004FD6790053DE7F000202020202020202020202020202
          0202020202020202020202020202020202020202020202021212020202020202
          0202020202020212191A120202020202020202020202121F1C161D1202020202
          02020202021223211E121718120202020202020212242520120212151B120202
          02020202021222120A03020212141202020202020203120C080B030202121312
          02020202030F0E0803070903020202121202020310110D030203050803020202
          12120202030E0302020202030603020202020202020302020202020203040302
          0202020202020202020202020202030302020202020202020202020202020203
          030202020202020202020202020202020202}
      end
      object BitBtn118: TBitBtn
        Left = 676
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Voltar'
        TabOrder = 2
        OnClick = BitBtn118Click
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
      object bt_pedidos_faturamento: TBitBtn
        Left = 386
        Top = 6
        Width = 124
        Height = 25
        Caption = 'Come'#231'ar a faturar'
        TabOrder = 3
        OnClick = bt_pedidos_faturamentoClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130B0000130B00000001000000010000004A00000052
          000000630000089C2100109C210010A5290010AD390039AD390010B5390018B5
          4A004ABD520052BD52005ABD52005AC65A0063C663006BC663006BC66B007BD6
          7B008CD68C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313131313
          1313131313131313131313131313131313131313131313131313131313131300
          0200131313131313131313131313130203020013131313131313131313131302
          0403020013131313131313131313130205050302001313131313131313131302
          0805030302001313131313131313130209060606050201131313131313131302
          0B0C0A0A0A02011313131313131313020D100F0A020013131313131313131302
          101111020013131313131313131313020E120200131313131313131313131302
          0702001313131313131313131313130002001313131313131313131313131313
          1313131313131313131313131313131313131313131313131313}
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 488
    object Selecionar1: TMenuItem
      Caption = 'Selecionar'
      object odos1: TMenuItem
        Caption = 'Todos'
        OnClick = odos1Click
      end
      object PedidosAbertos: TMenuItem
        Caption = 'Pedidos abertos'
        OnClick = PedidosAbertosClick
      end
      object PedidosFechados: TMenuItem
        Caption = 'Pedidos fechados'
        OnClick = PedidosFechadosClick
      end
    end
    object Removerseleo1: TMenuItem
      Caption = 'Remover sele'#231#227'o'
      OnClick = Removerseleo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Atualizar1: TMenuItem
      Caption = 'Atualizar'
      OnClick = Atualizar1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Limpartela1: TMenuItem
      Caption = 'Limpar tela'
      OnClick = Limpartela1Click
    end
    object Configuraao1: TMenuItem
      Caption = 'Configura'#231'ao'
      OnClick = Configuraao1Click
    end
  end
  object ImageList1: TImageList
    Left = 80
    Top = 488
  end
end
