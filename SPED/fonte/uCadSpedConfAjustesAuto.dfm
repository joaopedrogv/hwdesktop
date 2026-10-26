inherited frmCadSpedConfAjustesAuto: TfrmCadSpedConfAjustesAuto
  Caption = 'Regras de Ajustes autom'#225'tico'
  ClientHeight = 578
  ExplicitWidth = 806
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 559
    ExplicitHeight = 559
    inherited Splitter2: TSplitter
      Height = 557
      ExplicitHeight = 557
    end
    inherited PanelLeft: TPanel
      Height = 557
      ExplicitHeight = 557
      inherited PageControl1: TPageControl
        Height = 555
        ExplicitHeight = 555
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 524
          inherited ScrollBox1: TScrollBox
            Height = 524
            ExplicitHeight = 524
            inherited PageControl3: TPageControl
              Height = 476
              ActivePage = tsCadastro
              ExplicitHeight = 476
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 445
                inherited ScrollBox3: TScrollBox
                  Height = 445
                  ExplicitHeight = 445
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                object pn_cadastro: TPanel
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 445
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  OnEnter = pn_cadastroEnter
                  object Panel5: TPanel
                    Left = 0
                    Top = 0
                    Width = 775
                    Height = 49
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 17
                      Top = 0
                      Width = 33
                      Height = 13
                      Caption = 'Codigo'
                      FocusControl = ed_id
                    end
                    object Label7: TLabel
                      Left = 157
                      Top = 0
                      Width = 46
                      Height = 13
                      Caption = 'Descri'#231#227'o'
                      FocusControl = ed_descr
                    end
                    object lb_data_cad: TDBText
                      Left = 487
                      Top = 23
                      Width = 130
                      Height = 17
                      DataField = 'DATA_CADASTRO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 487
                      Top = 0
                      Width = 68
                      Height = 13
                      Caption = 'Data cadastro'
                      FocusControl = ed_descr
                    end
                    object lb_data_mod: TDBText
                      Left = 625
                      Top = 23
                      Width = 130
                      Height = 17
                      DataField = 'DATA_MODIFICACAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label46: TLabel
                      Left = 625
                      Top = 0
                      Width = 82
                      Height = 13
                      Caption = 'Data modifica'#231#227'o'
                      FocusControl = ed_descr
                    end
                    object ed_id: TDBEdit
                      Left = 17
                      Top = 19
                      Width = 134
                      Height = 21
                      DataField = 'SEQ'
                      Enabled = False
                      TabOrder = 0
                    end
                    object ed_descr: TDBEdit
                      Left = 157
                      Top = 19
                      Width = 324
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      TabOrder = 1
                    end
                  end
                  object PageControl2: TPageControl
                    Left = 0
                    Top = 49
                    Width = 775
                    Height = 396
                    ActivePage = tab_confs
                    Align = alClient
                    Style = tsFlatButtons
                    TabOrder = 1
                    object tab_confs: TTabSheet
                      Caption = 'Configura'#231#245'es'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object ScrollBox5: TScrollBox
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 365
                        Align = alClient
                        BorderStyle = bsNone
                        TabOrder = 0
                        object GridPanel1: TGridPanel
                          Left = 0
                          Top = 0
                          Width = 750
                          Height = 410
                          Align = alTop
                          BevelOuter = bvNone
                          ColumnCollection = <
                            item
                              Value = 40.245531112658090000
                            end
                            item
                              Value = 59.754468887341910000
                            end>
                          ControlCollection = <
                            item
                              Column = 0
                              Control = pn_C197
                              Row = 0
                            end
                            item
                              Column = 1
                              Control = pn_1921
                              Row = 0
                            end>
                          RowCollection = <
                            item
                              Value = 100.000000000000000000
                            end>
                          TabOrder = 0
                          object pn_C197: TGridPanel
                            Left = 0
                            Top = 0
                            Width = 301
                            Height = 410
                            Align = alClient
                            BevelEdges = [beLeft, beTop, beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            ColumnCollection = <
                              item
                                Value = 50.000000000000000000
                              end
                              item
                                Value = 50.000000000000000000
                              end>
                            ControlCollection = <
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = Label8
                                Row = 1
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = ed_cod_obs
                                Row = 2
                              end
                              item
                                Column = 0
                                Control = Label9
                                Row = 3
                              end
                              item
                                Column = 0
                                Control = ed_cod_aj
                                Row = 4
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = Label12
                                Row = 7
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = pn_title_c197
                                Row = 0
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = ed_conf_c197
                                Row = 8
                              end
                              item
                                Column = 1
                                Control = Label10
                                Row = 3
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = Label11
                                Row = 5
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = ed_descr_c197
                                Row = 6
                              end
                              item
                                Column = 1
                                Control = ed_aliq_c197
                                Row = 4
                              end>
                            RowCollection = <
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                Value = 100.000000000000000000
                              end>
                            TabOrder = 0
                            object Label8: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 29
                              Width = 293
                              Height = 14
                              Align = alClient
                              Caption = 'Lan'#231'amento Fiscal - Registros 0460'
                              ExplicitWidth = 169
                              ExplicitHeight = 13
                            end
                            object ed_cod_obs: TDBLookupComboBox
                              AlignWithMargins = True
                              Left = 3
                              Top = 49
                              Width = 293
                              Height = 21
                              Align = alClient
                              TabOrder = 0
                              OnExit = ed_cod_obsExit
                            end
                            object Label9: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 75
                              Width = 143
                              Height = 14
                              Align = alClient
                              Caption = 'C'#243'digo de ajuste'
                              ExplicitWidth = 81
                              ExplicitHeight = 13
                            end
                            object ed_cod_aj: TMaskEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 95
                              Width = 143
                              Height = 20
                              Align = alClient
                              CharCase = ecUpperCase
                              EditMask = 'AA99999999;0;_'
                              MaxLength = 10
                              TabOrder = 1
                              ExplicitHeight = 21
                            end
                            object Label12: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 167
                              Width = 293
                              Height = 14
                              Align = alClient
                              Caption = 'Mais configura'#231#245'es'
                              ExplicitWidth = 91
                              ExplicitHeight = 13
                            end
                            object pn_title_c197: TPanel
                              Left = 0
                              Top = 0
                              Width = 299
                              Height = 26
                              Align = alClient
                              BevelEdges = [beBottom]
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 2
                              object Panel4: TPanel
                                Left = 0
                                Top = 0
                                Width = 238
                                Height = 24
                                Align = alClient
                                BevelOuter = bvNone
                                Caption = 'Registros 0460, C195 e C197'
                                TabOrder = 0
                              end
                              object ed_ativo_c197: TCheckBox
                                Left = 238
                                Top = 0
                                Width = 61
                                Height = 24
                                Align = alRight
                                Caption = 'Ativo'
                                TabOrder = 1
                                OnClick = ed_ativo_c197Click
                              end
                            end
                            object ed_conf_c197: TCheckListBox
                              AlignWithMargins = True
                              Left = 3
                              Top = 187
                              Width = 293
                              Height = 216
                              Align = alClient
                              ItemHeight = 13
                              Items.Strings = (
                                'Ajuste Por Item'
                                'Preencher Base ICMS'
                                'Usar Base Icms'
                                'Usar Base Icms St'
                                'Usar Valor Contabil'
                                'Preencher Aliquota Icms'
                                'Usar Aliquota Da Condicao'
                                'Usar Aliquota Icms Do Item'
                                'Usar Aliquota Icms St Do Item'
                                'Valor Icms Calculado'
                                'Usar Valor Icms'
                                'Usar Valor Icms St')
                              TabOrder = 3
                            end
                            object Label10: TLabel
                              AlignWithMargins = True
                              Left = 152
                              Top = 75
                              Width = 144
                              Height = 14
                              Align = alClient
                              Caption = 'Aliquota - C197'
                              ExplicitWidth = 74
                              ExplicitHeight = 13
                            end
                            object Label11: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 121
                              Width = 293
                              Height = 14
                              Align = alClient
                              Caption = 'Descri'#231#227'o complementar'
                              ExplicitWidth = 116
                              ExplicitHeight = 13
                            end
                            object ed_descr_c197: TMaskEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 141
                              Width = 293
                              Height = 20
                              Align = alClient
                              TabOrder = 4
                              Text = 'ed_descr_c197'
                              ExplicitHeight = 21
                            end
                            object ed_aliq_c197: TDBEdit
                              AlignWithMargins = True
                              Left = 152
                              Top = 95
                              Width = 144
                              Height = 20
                              Align = alClient
                              DataField = 'ALIQ_C197'
                              TabOrder = 5
                              ExplicitHeight = 21
                            end
                          end
                          object pn_1921: TGridPanel
                            Left = 301
                            Top = 0
                            Width = 449
                            Height = 410
                            Align = alClient
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            ColumnCollection = <
                              item
                                Value = 50.000000000000000000
                              end
                              item
                                Value = 50.000000000000000000
                              end>
                            ControlCollection = <
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = pn_title_1921
                                Row = 0
                              end
                              item
                                Column = 0
                                Control = Label13
                                Row = 1
                              end
                              item
                                Column = 0
                                Control = ed_cod_ajuste
                                Row = 2
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = Label15
                                Row = 3
                              end
                              item
                                Column = 0
                                ColumnSpan = 2
                                Control = ed_DescricaoComplementar1921
                                Row = 4
                              end
                              item
                                Column = 1
                                Control = Label17
                                Row = 1
                              end
                              item
                                Column = 0
                                Control = Label25
                                Row = 7
                              end
                              item
                                Column = 0
                                Control = ed_conf_1921
                                Row = 8
                                RowSpan = 3
                              end
                              item
                                Column = 1
                                Control = ed_aliq_1921
                                Row = 2
                              end>
                            RowCollection = <
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 20.000000000000000000
                              end
                              item
                                SizeStyle = ssAbsolute
                                Value = 26.000000000000000000
                              end
                              item
                                Value = 100.000000000000000000
                              end>
                            TabOrder = 1
                            object pn_title_1921: TPanel
                              Left = 0
                              Top = 0
                              Width = 445
                              Height = 26
                              Align = alClient
                              BevelEdges = [beBottom]
                              BevelKind = bkTile
                              BevelOuter = bvNone
                              Font.Charset = DEFAULT_CHARSET
                              Font.Color = clWindowText
                              Font.Height = -11
                              Font.Name = 'Tahoma'
                              Font.Style = [fsBold]
                              ParentFont = False
                              TabOrder = 0
                              object Panel8: TPanel
                                Left = 0
                                Top = 0
                                Width = 384
                                Height = 24
                                Align = alClient
                                BevelOuter = bvNone
                                Caption = 'Registros 1921 (Subapura'#231#227'o)'
                                TabOrder = 0
                              end
                              object ed_ativo_1921: TCheckBox
                                Left = 384
                                Top = 0
                                Width = 61
                                Height = 24
                                Align = alRight
                                Caption = 'Ativo'
                                TabOrder = 1
                                OnClick = ed_ativo_1921Click
                              end
                            end
                            object Label13: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 29
                              Width = 216
                              Height = 14
                              Align = alClient
                              Caption = 'C'#243'digo de ajuste - 1921'
                              ExplicitWidth = 115
                              ExplicitHeight = 13
                            end
                            object ed_cod_ajuste: TMaskEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 49
                              Width = 216
                              Height = 20
                              Align = alClient
                              CharCase = ecUpperCase
                              EditMask = 'AA999999;0;_'
                              MaxLength = 8
                              TabOrder = 1
                              ExplicitHeight = 21
                            end
                            object Label15: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 75
                              Width = 439
                              Height = 14
                              Align = alClient
                              Caption = 'Descri'#231#227'o complementar - 1921(Ajuste)'
                              ExplicitWidth = 189
                              ExplicitHeight = 13
                            end
                            object ed_DescricaoComplementar1921: TMaskEdit
                              AlignWithMargins = True
                              Left = 3
                              Top = 95
                              Width = 439
                              Height = 20
                              Align = alClient
                              TabOrder = 2
                              Text = 'ed_DescricaoComplementar1921'
                              ExplicitHeight = 21
                            end
                            object Label17: TLabel
                              AlignWithMargins = True
                              Left = 225
                              Top = 29
                              Width = 217
                              Height = 14
                              Align = alClient
                              Caption = 'Aliquota - 1921'
                              ExplicitWidth = 73
                              ExplicitHeight = 13
                            end
                            object Label25: TLabel
                              AlignWithMargins = True
                              Left = 3
                              Top = 167
                              Width = 216
                              Height = 14
                              Align = alClient
                              Caption = 'Mais configura'#231#245'es'
                              ExplicitWidth = 91
                              ExplicitHeight = 13
                            end
                            object ed_conf_1921: TCheckListBox
                              AlignWithMargins = True
                              Left = 3
                              Top = 187
                              Width = 216
                              Height = 66
                              Align = alClient
                              ItemHeight = 13
                              Items.Strings = (
                                'Usar Base Icms'
                                'Usar Base Icms St'
                                'Usar Valor Contabil')
                              TabOrder = 3
                            end
                            object ed_aliq_1921: TDBEdit
                              AlignWithMargins = True
                              Left = 225
                              Top = 49
                              Width = 217
                              Height = 20
                              Align = alClient
                              DataField = 'ALIQ_1921'
                              TabOrder = 4
                              ExplicitHeight = 21
                            end
                          end
                        end
                      end
                    end
                    object tab_cond: TTabSheet
                      Caption = 'Condi'#231#245'es / Gatilhos'
                      ImageIndex = 1
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Panel6: TPanel
                        Left = 0
                        Top = 0
                        Width = 767
                        Height = 365
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object ScrollBox4: TScrollBox
                          Left = 0
                          Top = 0
                          Width = 379
                          Height = 365
                          Align = alLeft
                          BorderStyle = bsNone
                          TabOrder = 0
                          object Panel7: TPanel
                            Left = 0
                            Top = 0
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 0
                            object Label26: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'CFOP'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object bt_cond_add_cfop: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = bt_cond_add_cfopClick
                              ExplicitTop = 21
                            end
                            object ed_cfop: TMaskEdit
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              TabOrder = 0
                              OnChange = ed_cfopChange
                              OnExit = ed_cfopExit
                            end
                          end
                          object Panel9: TPanel
                            Left = 0
                            Top = 48
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 2
                            object Label27: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'NCM'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton9: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton9Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object Panel10: TPanel
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Label37: TLabel
                                Left = 139
                                Top = 0
                                Width = 16
                                Height = 13
                                Align = alClient
                                Alignment = taCenter
                                Caption = 'at'#233
                                Layout = tlCenter
                              end
                              object ed_ncm_ini: TMaskEdit
                                Left = 0
                                Top = 0
                                Width = 139
                                Height = 21
                                Align = alLeft
                                EditMask = '00000000;1;_'
                                MaxLength = 8
                                TabOrder = 0
                                Text = '        '
                              end
                              object ed_ncm_fim: TMaskEdit
                                Left = 178
                                Top = 0
                                Width = 149
                                Height = 21
                                Align = alRight
                                EditMask = '00000000;1;_'
                                MaxLength = 8
                                TabOrder = 1
                                Text = '        '
                              end
                            end
                          end
                          object Panel11: TPanel
                            Left = 0
                            Top = 144
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 3
                            object Label28: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Estado'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton10: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton10Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object bt_cond_edit_uf: TSpeedButton
                              Left = 310
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
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
                              OnClick = bt_cond_edit_ufClick
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_uf: TMaskEdit
                              Left = 6
                              Top = 19
                              Width = 304
                              Height = 21
                              Align = alClient
                              TabOrder = 0
                            end
                          end
                          object Panel12: TPanel
                            Left = 0
                            Top = 192
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 4
                            object Label29: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Consumidor Final'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton13: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton13Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_cons_final: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                'Sim'
                                'N'#227'o')
                            end
                          end
                          object Panel13: TPanel
                            Left = 0
                            Top = 240
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 5
                            object Label30: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Contribuinte do ICMS'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton14: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton14Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_cont_icms: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                '1 - Contribuinte'
                                '2 - Isento'
                                '9 - N'#227'o Contribuinte')
                            end
                          end
                          object Panel14: TPanel
                            Left = 0
                            Top = 288
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 6
                            object Label31: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Pessoa f'#237'sica ou jur'#237'dica'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton15: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton15Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_pessoa: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                'PJ - Pessoa Jur'#237'dica'
                                'PF - Pessoa F'#237'sica')
                            end
                          end
                          object panl33: TPanel
                            Left = 0
                            Top = 336
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 7
                            object Label32: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Finalidade consumo'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton16: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton16Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_finalid: TDBLookupComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              TabOrder = 0
                            end
                          end
                          object Panel16: TPanel
                            Left = 0
                            Top = 384
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 8
                            object Label33: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Opera'#231#227'o Fiscal'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton17: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton17Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_opfiscal: TDBLookupComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              TabOrder = 0
                            end
                          end
                          object Panel17: TPanel
                            Left = 0
                            Top = 432
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 9
                            object Label34: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Origem Mercadoria'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton18: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton18Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_orig_merc: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                '0 '#8211' Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8;'
                                
                                  '1 '#8211' Estrangeira '#8211' Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
                                  ' 6;'
                                
                                  '2 '#8211' Estrangeira '#8211' Adquirida no mercado interno, exceto a indicad' +
                                  'a no c'#243'digo 7;'
                                
                                  '3 '#8211' Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                                  'ior a 40% (quarenta por cento) e igual ou inferior a 70% (setent' +
                                  'a por cento) ;'
                                
                                  '4 '#8211' Nacional, cuja produ'#231#227'o tenha sido feita em conformidade com' +
                                  ' os processos produtivos b'#225'sicos de que tratam o Decreto-Lei n'#186' ' +
                                  '288/1967 , e as Leis n'#186's 8.248/1991, 8.387/1991, 10.176/2001 e 1' +
                                  '1.484/2007;'
                                
                                  '5 '#8211' Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
                                  'ior ou igual a 40%;'
                                
                                  '6 '#8211' Estrangeira '#8211' Importa'#231#227'o direta, sem similar nacional, const' +
                                  'ante em lista de Resolu'#231#227'o Camex e g'#225's natural;'
                                
                                  '7 '#8211' Estrangeira '#8211' Adquirida no mercado interno, sem similar naci' +
                                  'onal, constante em lista de Resolu'#231#227'o Camex e g'#225's natural.'
                                
                                  '8 '#8211' Nacional '#8211' Mercadoria ou bem com Conte'#250'do de Importa'#231#227'o supe' +
                                  'rior a 70% (setenta por cento).')
                            end
                          end
                          object Panel18: TPanel
                            Left = 0
                            Top = 96
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 1
                            object Label35: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Aliquota ICMS'
                              ExplicitTop = 6
                            end
                            object SpeedButton19: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton19Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object Panel19: TPanel
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              BevelOuter = bvNone
                              TabOrder = 0
                              object Label36: TLabel
                                Left = 0
                                Top = 0
                                Width = 45
                                Height = 13
                                Align = alLeft
                                Caption = 'Quando: '
                                Layout = tlCenter
                              end
                              object Label38: TLabel
                                Left = 195
                                Top = 0
                                Width = 36
                                Height = 13
                                Align = alRight
                                Caption = 'Utilizar:'
                                Layout = tlCenter
                              end
                              object ed_aliq_cond: TEditHw
                                Left = 45
                                Top = 0
                                Width = 96
                                Height = 21
                                Align = alLeft
                                TabOrder = 0
                                Text = '               0,00'
                                Formato = fFixed
                                FormatSize = '0.2'
                              end
                              object ed_aliq_cond_usar: TEditHw
                                Left = 231
                                Top = 0
                                Width = 96
                                Height = 21
                                Align = alRight
                                TabOrder = 1
                                Text = '               0,00'
                                Formato = fFixed
                                FormatSize = '0.2'
                              end
                            end
                          end
                          object Panel15: TPanel
                            Left = 0
                            Top = 480
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 10
                            object Label39: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'CST do ICMS'
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitWidth = 377
                            end
                            object SpeedButton20: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton20Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_cst_icms: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                '00 '#8211' Tributada integralmente'
                                '02 - Tributa'#231#227'o monof'#225'sica pr'#243'pria sobre combust'#237'veis'
                                
                                  '10 '#8211' Tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
                                  'a'
                                
                                  '15 - Tributa'#231#227'o monof'#225'sica pr'#243'pria e com responsabilidade pela r' +
                                  'eten'#231#227'o sobre combust'#237'veis'
                                '20 '#8211' Com redu'#231#227'o de base de c'#225'lculo'
                                
                                  '30 '#8211' Isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
                                  'i'#231#227'o tribut'#225'ria'
                                '40 '#8211' Isenta'
                                '41 '#8211' N'#227'o tributada'
                                '50 '#8211' Suspens'#227'o'
                                '51 '#8211' Diferimento'
                                
                                  '53 - Tributa'#231#227'o monof'#225'sica sobre combust'#237'veis com recolhimento d' +
                                  'iferido'
                                '60 '#8211' ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
                                
                                  '61 - Tributa'#231#227'o monof'#225'sica sobre combust'#237'veis cobrada anteriorme' +
                                  'nte'
                                
                                  '70 '#8211' Com redu'#231#227'o de base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
                                  'itui'#231#227'o tribut'#225'ria'
                                '90 '#8211' Outras')
                            end
                          end
                          object Panel23: TPanel
                            Left = 0
                            Top = 528
                            Width = 362
                            Height = 48
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            BiDiMode = bdLeftToRight
                            Padding.Left = 6
                            Padding.Top = 3
                            Padding.Right = 6
                            Padding.Bottom = 6
                            ParentBiDiMode = False
                            TabOrder = 11
                            object Label14: TLabel
                              Left = 6
                              Top = 3
                              Width = 350
                              Height = 16
                              Align = alTop
                              AutoSize = False
                              Caption = 'Finalidade emiss'#227'o NF'
                              ExplicitTop = 6
                            end
                            object SpeedButton21: TSpeedButton
                              Left = 333
                              Top = 19
                              Width = 23
                              Height = 21
                              Hint = 'Adicionar nova condi'#231#227'o - [SPED116]'
                              Align = alRight
                              Flat = True
                              Glyph.Data = {
                                36050000424D3605000000000000360400002800000010000000100000000100
                                08000000000000010000130B0000130B000000010000000100002184290039B5
                                520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                                0505050505050505050505050505050503000003050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050300000000
                                0004010000000000030505020101010101010101010101010005050204040404
                                0404010404040404000505030202020202040100000000000305050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0204010005050505050505050505050502040100050505050505050505050505
                                0302020305050505050505050505050505050505050505050505}
                              OnClick = SpeedButton21Click
                              ExplicitLeft = 1
                              ExplicitTop = 1
                              ExplicitHeight = 177
                            end
                            object ed_finalid_emissao: TComboBox
                              Left = 6
                              Top = 19
                              Width = 327
                              Height = 21
                              Align = alClient
                              Style = csDropDownList
                              ItemHeight = 0
                              TabOrder = 0
                              Items.Strings = (
                                '1 - NF-e normal'
                                '2 - NF-e complementar'
                                '3 - NF-e de ajuste'
                                '4 - Devolu'#231#227'o de mercadoria')
                            end
                          end
                        end
                        object Panel20: TPanel
                          Left = 379
                          Top = 0
                          Width = 388
                          Height = 365
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 1
                          object Panel21: TPanel
                            Left = 0
                            Top = 0
                            Width = 388
                            Height = 28
                            Align = alTop
                            BevelEdges = [beBottom]
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            Caption = 'Lista das condi'#231#245'es ativas para efetuar o ajuste'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            object bt_cond_del: TSpeedButton
                              Left = 358
                              Top = 0
                              Width = 30
                              Height = 26
                              Hint = 'Remover condi'#231#227'o - [SPED117]'
                              Align = alRight
                              Flat = True
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
                              OnClick = bt_cond_delClick
                              ExplicitLeft = 0
                              ExplicitHeight = 30
                            end
                          end
                          object Panel22: TPanel
                            Left = 0
                            Top = 28
                            Width = 388
                            Height = 337
                            Align = alClient
                            BevelOuter = bvNone
                            BorderWidth = 6
                            TabOrder = 1
                            object DBGrid3: TDBGrid
                              Left = 6
                              Top = 6
                              Width = 376
                              Height = 325
                              Align = alClient
                              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                              TabOrder = 0
                              TitleFont.Charset = DEFAULT_CHARSET
                              TitleFont.Color = clWindowText
                              TitleFont.Height = -11
                              TitleFont.Name = 'Tahoma'
                              TitleFont.Style = []
                              OnDrawColumnCell = DBGrid3DrawColumnCell
                              Columns = <
                                item
                                  Expanded = False
                                  FieldName = 'COND'
                                  Title.Caption = 'Condi'#231#227'o'
                                  Width = 113
                                  Visible = True
                                end
                                item
                                  Expanded = False
                                  FieldName = 'NAME'
                                  Title.Caption = 'Valor'
                                  Width = 196
                                  Visible = True
                                end>
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 476
              ExplicitTop = 476
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar - [SPED113]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 524
          inherited GroupBox3: TGroupBox
            object SpeedButton59: TSpeedButton [6]
              Left = 575
              Top = 43
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton59Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [SPED110]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED111]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            object ck_lixeira: TCheckBox
              Left = 257
              Top = 48
              Width = 145
              Height = 17
              Caption = 'Pesquisar na Lixeira'
              TabOrder = 11
            end
          end
          inherited Panel1: TPanel
            Height = 451
            ExplicitHeight = 451
            inherited Splitter1: TSplitter
              Height = 390
              ExplicitHeight = 390
            end
            inherited DBGrid1: TDBGrid
              Height = 390
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED112]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED114]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 522
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 522
                ExplicitTop = -2
              end
              inherited SpeedButton4: TSpeedButton
                Left = 514
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 514
                ExplicitTop = -2
              end
              inherited SpeedButton5: TSpeedButton
                Left = 121
                Hint = 'Recuperar registro - [SPED115]'
                OnClick = SpeedButton5Click
                ExplicitLeft = 121
              end
              inherited SpeedButton6: TSpeedButton
                Left = 543
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 543
                ExplicitTop = -2
              end
              inherited SpeedButton7: TSpeedButton
                Left = 571
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 571
                ExplicitTop = 6
              end
              inherited SpeedButton8: TSpeedButton
                Left = 543
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 543
                ExplicitTop = 6
              end
              inherited SpeedButton11: TSpeedButton
                Left = 604
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 604
                ExplicitTop = 6
              end
              inherited SpeedButton12: TSpeedButton
                Left = 628
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 628
                ExplicitTop = 6
              end
              inherited SpeedButton23: TSpeedButton
                Left = 641
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 641
                ExplicitTop = 6
              end
              inherited SpeedButton24: TSpeedButton
                Left = 656
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 656
                ExplicitTop = 6
              end
              inherited SpeedButton25: TSpeedButton
                Left = 530
                Top = -2
                Enabled = False
                Visible = False
                ExplicitLeft = 530
                ExplicitTop = -2
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 390
              ExplicitHeight = 390
              inherited ScrollBox2: TScrollBox
                Height = 373
                ExplicitHeight = 373
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 524
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 2000
      ExplicitLeft = 2000
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 559
    ExplicitTop = 559
  end
  inherited pnStatusProcessamento: TPanel
    Left = 2000
    ExplicitLeft = 2000
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 766
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 726
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 694
    Top = 11
  end
end
