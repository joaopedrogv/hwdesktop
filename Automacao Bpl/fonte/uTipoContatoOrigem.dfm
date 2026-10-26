inherited frmTipoContatoOrigem: TfrmTipoContatoOrigem
  Caption = 'Origem por Tipo de Contato '
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
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 771
                    Height = 427
                    Align = alClient
                    Caption = 'Origem por Tipo de Contato '
                    TabOrder = 0
                    object Label7: TLabel
                      Left = 84
                      Top = 36
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo de Contato:'
                    end
                    object Label6: TLabel
                      Left = 127
                      Top = 66
                      Width = 38
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Origem:'
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 171
                      Top = 34
                      Width = 504
                      Height = 21
                      DataField = 'ID_TIPO_CONTATO'
                      DataSource = dtmConfig.dsMsgTipoContatoOrigem
                      KeyField = 'ID'
                      ListField = 'TIPO_CONTATO'
                      ListSource = dtmConfig.dsTipoContato
                      TabOrder = 0
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 171
                      Top = 63
                      Width = 504
                      Height = 21
                      DataField = 'ID_MSG_ORIGEM'
                      DataSource = dtmConfig.dsMsgTipoContatoOrigem
                      KeyField = 'ID'
                      ListField = 'ORIGEM'
                      ListSource = dtmConfig.dsMsgOrigem
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [CFG069]'
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
            object SpeedButton9: TSpeedButton [6]
              Left = 620
              Top = 44
              Width = 23
              Height = 21
              Hint = 'Selecionar todos'
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
              OnClick = SpeedButton9Click
            end
            object SpeedButton10: TSpeedButton [7]
              Left = 649
              Top = 44
              Width = 23
              Height = 21
              Hint = 'Desfazer sele'#231#227'o'
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
              OnClick = SpeedButton10Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CFG065]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CFG066]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
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
                Hint = 'Editar Registro - [CFG067]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CFG068]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 292
                Enabled = False
                Visible = False
                ExplicitLeft = 292
              end
              inherited SpeedButton4: TSpeedButton
                Left = 293
                Enabled = False
                Visible = False
                ExplicitLeft = 293
              end
              inherited SpeedButton5: TSpeedButton
                Left = 406
                Enabled = False
                Visible = False
                ExplicitLeft = 406
              end
              inherited SpeedButton6: TSpeedButton
                Left = 121
                Hint = 'Cadastro em Lote'
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
                Left = 235
                Enabled = False
                Visible = False
                ExplicitLeft = 235
              end
              inherited SpeedButton8: TSpeedButton
                Left = 178
                Enabled = False
                Visible = False
                ExplicitLeft = 178
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
                Left = 349
                Enabled = False
                Visible = False
                ExplicitLeft = 349
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
        object tsOrigemTipoContrato: TTabSheet
          Caption = 'tsOrigemTipoContrato'
          ImageIndex = 3
          object pnOrigemTipoContato: TPanel
            Left = 1
            Top = 3
            Width = 779
            Height = 469
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnOrigemTipoContatoEnter
            object ScrollBox5: TScrollBox
              Left = 0
              Top = 0
              Width = 779
              Height = 428
              Align = alTop
              TabOrder = 0
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 775
                Height = 424
                Align = alClient
                Caption = 'Origem por Tipo de Contato '
                TabOrder = 0
                object Label8: TLabel
                  Left = 25
                  Top = 36
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo de Contato:'
                end
                object Label9: TLabel
                  Left = 404
                  Top = 36
                  Width = 38
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Origem:'
                end
                object SpeedButton13: TSpeedButton
                  Left = 324
                  Top = 33
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
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
                  OnClick = SpeedButton13Click
                end
                object SpeedButton14: TSpeedButton
                  Left = 353
                  Top = 33
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
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
                  OnClick = SpeedButton14Click
                end
                object SpeedButton15: TSpeedButton
                  Left = 702
                  Top = 33
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
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
                  OnClick = SpeedButton15Click
                end
                object SpeedButton16: TSpeedButton
                  Left = 731
                  Top = 33
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
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
                  OnClick = SpeedButton16Click
                end
                object CheckListBoxTipoContrato: TCheckListBox
                  Left = 25
                  Top = 55
                  Width = 350
                  Height = 354
                  ItemHeight = 13
                  TabOrder = 0
                end
                object CheckListBoxOrigem: TCheckListBox
                  Left = 404
                  Top = 55
                  Width = 350
                  Height = 354
                  ItemHeight = 13
                  TabOrder = 1
                end
              end
            end
            object Panel5: TPanel
              Left = 0
              Top = 428
              Width = 779
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOrigemTipoContatoOK: TBitBtn
                Left = 308
                Top = 5
                Width = 75
                Height = 26
                Hint = 'OK - [CFG072/CFG075]'
                Caption = '&OK'
                Default = True
                TabOrder = 0
                OnClick = btnOrigemTipoContatoOKClick
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
              object btnOrigemTipoContatoCancelar: TBitBtn
                Left = 392
                Top = 5
                Width = 75
                Height = 26
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnOrigemTipoContatoCancelarClick
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
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
