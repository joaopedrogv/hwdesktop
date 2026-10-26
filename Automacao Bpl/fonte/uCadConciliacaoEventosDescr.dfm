inherited frmCadConciliacaoEventosDescr: TfrmCadConciliacaoEventosDescr
  Caption = 'C'#243'digos de Ajuste (Concilia'#231#227'o Cart'#227'o)'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'C'#243'digo de Ajuste'
                  TabOrder = 0
                  object Label7: TLabel
                    Left = 103
                    Top = 63
                    Width = 50
                    Height = 13
                    Caption = 'Descri'#231#227'o:'
                    Enabled = False
                  end
                  object Label8: TLabel
                    Left = 41
                    Top = 122
                    Width = 112
                    Height = 13
                    Caption = 'N'#186' da Conta (Entrada):'
                  end
                  object Label6: TLabel
                    Left = 53
                    Top = 150
                    Width = 100
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#186' da Conta (Sa'#237'da):'
                  end
                  object Label9: TLabel
                    Left = 139
                    Top = 39
                    Width = 14
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Id:'
                    Enabled = False
                  end
                  object DBEdit2: TDBEdit
                    Left = 156
                    Top = 119
                    Width = 71
                    Height = 21
                    DataField = 'N_CONTA_PLC_E'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    TabOrder = 1
                    OnExit = DBEdit2Exit
                    OnKeyDown = DBEdit2KeyDown
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 233
                    Top = 119
                    Width = 523
                    Height = 21
                    Hint = 'Descri'#231#227'o da Conta'
                    DataField = 'N_CONTA_PLC_E'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC'
                    ListSource = DtmCadBasicos.dsPContasCodAjusteE
                    TabOrder = 2
                  end
                  object DBEdit3: TDBEdit
                    Left = 156
                    Top = 147
                    Width = 71
                    Height = 21
                    DataField = 'N_CONTA_PLC_S'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    TabOrder = 3
                    OnExit = DBEdit3Exit
                    OnKeyDown = DBEdit3KeyDown
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 233
                    Top = 147
                    Width = 523
                    Height = 21
                    Hint = 'Descri'#231#227'o da Conta'
                    DataField = 'N_CONTA_PLC_S'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC'
                    ListSource = DtmCadBasicos.dsPContasCodAjusteS
                    TabOrder = 4
                  end
                  object DBEdit4: TDBEdit
                    Left = 156
                    Top = 33
                    Width = 71
                    Height = 21
                    DataField = 'ID'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    Enabled = False
                    TabOrder = 5
                  end
                  object DBMemo1: TDBMemo
                    Left = 156
                    Top = 60
                    Width = 600
                    Height = 51
                    DataField = 'DESCRICAO'
                    DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
                    Enabled = False
                    TabOrder = 0
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS456]'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            object btSelectAll: TSpeedButton [6]
              Left = 605
              Top = 46
              Width = 23
              Height = 21
              Hint = '[ F2 ] - Selecionar todos'
              Flat = True
              Glyph.Data = {
                CE010000424DCE01000000000000CE0000002800000010000000100000000100
                08000000000000010000120B0000120B0000260000002600000000000000FFFF
                FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                0202020202020202020202020202020202020202020202021212020202020202
                0202020202020212181B120202020202020202020202121F1C141D1202020202
                02020202021223211E12171A1202020202020202122425201202121519120202
                02020202021222120A03020212161202020202020203120C080B030202121312
                02020202030F0E0803070903020202121202020310110D030203050803020202
                12120202030E0302020202030603020202020202020302020202020203040302
                0202020202020202020202020202030302020202020202020202020202020203
                030202020202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btSelectAllClick
            end
            object btUnSelectAll: TSpeedButton [7]
              Left = 634
              Top = 46
              Width = 23
              Height = 21
              Hint = '[ F4 ] - Desfazer sele'#231#227'o'
              Flat = True
              Glyph.Data = {
                AA010000424DAA01000000000000AA0000002800000010000000100000000100
                08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                02020202020202020202020202020202020202021C1C02020202020202020202
                0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                020202020202020202021B1B0202020202020202020202020202021B1B020202
                0202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = btUnSelectAllClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [BAS453]'
            end
            inherited BitBtn3: TBitBtn
              Hint = ''
              Enabled = False
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS454]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Remover n'#186' da conta (E / S) - [BAS455]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 178
                Enabled = False
                Visible = False
                ExplicitLeft = 178
              end
              inherited SpeedButton4: TSpeedButton
                Left = 177
                Enabled = False
                Visible = False
                ExplicitLeft = 177
              end
              inherited SpeedButton5: TSpeedButton
                Left = 292
                Enabled = False
                Visible = False
                ExplicitLeft = 292
              end
              inherited SpeedButton6: TSpeedButton
                Left = 121
                Hint = 'Atualizar informa'#231#245'es dos c'#243'digos de ajuste'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton6Click
                ExplicitLeft = 121
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 234
                Enabled = False
                Visible = False
                ExplicitLeft = 234
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
        object tsAlterDadosCodAjuste: TTabSheet
          Caption = 'tsAlterDadosCodAjuste'
          ImageIndex = 4
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosCodAjuste: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosCodAjusteClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 783
            Height = 59
            Align = alTop
            Caption = 'Cod Ajuste'
            TabOrder = 1
            Visible = False
            object DBText57: TDBText
              Left = 152
              Top = 14
              Width = 75
              Height = 17
              DataField = 'ID'
              DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText58: TDBText
              Left = 152
              Top = 33
              Width = 620
              Height = 17
              DataField = 'DESCRICAO'
              DataSource = DtmCadBasicos.dsConciliacaoCodAjuste
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label450: TLabel
              Left = 131
              Top = 14
              Width = 15
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 88
              Top = 33
              Width = 58
              Height = 13
              Alignment = taRightJustify
              BiDiMode = bdLeftToRight
              Caption = 'Descri'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 169
            Width = 783
            Height = 341
            Align = alClient
            TabOrder = 2
            object pnCenterAlterDadosCodAjuste: TPanel
              Left = 1
              Top = 1
              Width = 781
              Height = 54
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarCodAjuste: TSpeedButton
                Left = 62
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [BAS454]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarCodAjusteClick
              end
              object SpeedButtonAlterarCodAjuste2: TSpeedButton
                Left = 5
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [BAS517]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarCodAjuste2Click
              end
              object btExcluirRegistro: TSpeedButton
                Left = 121
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Remover n'#186' da conta (E / S) - [BAS455]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
                  FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 441
                Top = 18
                Width = 310
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 3
          object pnAlteracaoEmLote: TPanel
            Left = 16
            Top = 10
            Width = 713
            Height = 121
            TabOrder = 0
            object GroupBoxAlteracaoEmLote: TGroupBox
              Left = 1
              Top = 1
              Width = 711
              Height = 74
              Align = alClient
              Caption = 'Altera'#231#227'o em lote de contratos'
              TabOrder = 0
              object pnNumContaE: TPanel
                Left = 2
                Top = 15
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 0
                object lbNumContaE: TLabel
                  Left = 61
                  Top = 7
                  Width = 112
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N'#186' da Conta (Entrada):'
                end
                object EdNumContaE: TEditHw
                  Left = 176
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  OnExit = EdNumContaEExit
                  OnKeyDown = EdNumContaEKeyDown
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object DBLNumContaE: TDBLookupComboBox
                  Left = 248
                  Top = 4
                  Width = 395
                  Height = 21
                  KeyField = 'N_CONTA_PLC'
                  ListField = 'DESC_PLC;N_CONTA_PLC'
                  ListSource = DtmCadBasicos.dsPContasTiposLancE
                  TabOrder = 2
                  OnExit = DBLNumContaEExit
                end
                object ckNumContaE: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNumContaEClick
                end
              end
              object pnNumContaS: TPanel
                Left = 2
                Top = 46
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 1
                object lbNumContaS: TLabel
                  Left = 73
                  Top = 7
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N'#186' da Conta (Sa'#237'da):'
                end
                object EdNumContaS: TEditHw
                  Left = 176
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  OnExit = EdNumContaSExit
                  OnKeyDown = EdNumContaSKeyDown
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object DBLNumContaS: TDBLookupComboBox
                  Left = 248
                  Top = 4
                  Width = 395
                  Height = 21
                  KeyField = 'N_CONTA_PLC'
                  ListField = 'DESC_PLC;N_CONTA_PLC'
                  ListSource = DtmCadBasicos.dsPContasTiposLancS
                  TabOrder = 2
                  OnExit = DBLNumContaSExit
                end
                object ckNumContaS: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNumContaSClick
                end
              end
            end
            object Panel7: TPanel
              Left = 1
              Top = 75
              Width = 711
              Height = 45
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOKAlteracaoEmLote: TBitBtn
                Left = 280
                Top = 6
                Width = 75
                Height = 25
                Hint = 'OK - [BAS517]'
                Caption = 'OK'
                TabOrder = 0
                OnClick = btnOKAlteracaoEmLoteClick
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
              object btnCancelarAlteracaoEmLote: TBitBtn
                Left = 361
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancela'
                TabOrder = 1
                OnClick = btnCancelarAlteracaoEmLoteClick
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
            end
          end
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    Top = 481
    ExplicitTop = 481
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
