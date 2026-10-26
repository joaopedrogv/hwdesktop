inherited frmCadProcessos: TfrmCadProcessos
  Caption = 'Cadastro de Processos'
  Scaled = False
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
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Width = 754
                    Height = 432
                    Caption = 'Dados do Processo'
                    ExplicitWidth = 754
                    ExplicitHeight = 432
                    object Label6: TLabel
                      Left = 36
                      Top = 69
                      Width = 94
                      Height = 13
                      Caption = 'C'#243'digo do processo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 42
                      Top = 97
                      Width = 88
                      Height = 13
                      Caption = 'Nome do Processo'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 46
                      Top = 125
                      Width = 84
                      Height = 13
                      Caption = 'N'#237'vel do Processo'
                    end
                    object Label9: TLabel
                      Left = 58
                      Top = 152
                      Width = 72
                      Height = 13
                      Caption = 'Senha Gerente'
                    end
                    object Label10: TLabel
                      Left = 80
                      Top = 180
                      Width = 50
                      Height = 13
                      Caption = 'Formul'#225'rio'
                      FocusControl = DBEdit5
                    end
                    object DBEdit1: TDBEdit
                      Left = 136
                      Top = 66
                      Width = 134
                      Height = 21
                      DataField = 'COD_PROCESSO'
                      DataSource = dtmConfig.dsProcessos
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 136
                      Top = 94
                      Width = 382
                      Height = 21
                      DataField = 'NOME_PROCESSO'
                      DataSource = dtmConfig.dsProcessos
                      TabOrder = 1
                    end
                    object DBEdit5: TDBEdit
                      Left = 136
                      Top = 178
                      Width = 382
                      Height = 21
                      DataField = 'FORM'
                      DataSource = dtmConfig.dsProcessos
                      TabOrder = 4
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 136
                      Top = 149
                      Width = 65
                      Height = 21
                      DataField = 'SENHA_GERENTE'
                      DataSource = dtmConfig.dsProcessos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 3
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 136
                      Top = 122
                      Width = 65
                      Height = 21
                      DataField = 'NIVEL_PROCESSO'
                      DataSource = dtmConfig.dsProcessos
                      ItemHeight = 13
                      Items.Strings = (
                        '1'
                        '2'
                        '3'
                        '4'
                        '5'
                        '6'
                        '7'
                        '8'
                        '9'
                        '10')
                      TabOrder = 2
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [PRC003]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
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
              Left = 604
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
              OnClick = btSelectAllClick
            end
            object btUnSelectAll: TSpeedButton [7]
              Left = 631
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
              OnClick = btUnSelectAllClick
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRC001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRC002]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitTop = 57
              ExplicitHeight = 379
            end
            inherited DBGrid1: TDBGrid
              DataSource = dtmConfig.dsProcessos
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_PROCESSO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_PROCESSO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NIVEL_PROCESSO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SENHA_GERENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRC004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRC005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [PRC006]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRC008]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Definir Exce'#231#245'es para usu'#225'rios - [PRC009]'
                Glyph.Data = {
                  F2040000424DF204000000000000B20200002800000018000000180000000100
                  08000000000040020000120B0000120B00009F0000009F00000000000000FFFF
                  FF00FF00FF00D3FFFF00CCFEFF00C6FBFF00C9FBFF00C6FAFF00BFF8FF009EF0
                  FF00A5F3FF00AFF2FE00B5F3FE00C0F6FF0055E1FF0068E6FF0070E7FF0082EA
                  FF0087EAFF008EE9FB0091EBFE00A0EEFF00A5F0FE00B7F0FB00BBF3FF00BCF4
                  FF00BDF4FF00BFF4FF0022D3FF0032D7FF0036D7FF0043DDFF0045D7FC004BDE
                  FF0057E0FF005BDEFF0065E0FF0066E0FF0067E2FF006EE3FF006FE2FF0075E5
                  FF007AE6FE007DE5FF0082E7FF0083E6FF0086E7FF008CE9FF0092EAFF0093EB
                  FF0095EAFF009CEBFF00A3EEFF00A4EDFF00AAEFFF00ABEFFF00B1F0FF00BAF2
                  FF00BBF2FF0009CBFF0011C9FE0012CEFF0012C9FE0013CFFF0014CBFF0016CB
                  FF0016CAFE0017CAFE0019CCFF001ACFFF001BCEFF001CCCFE001FCBFB0020CE
                  FE0021D1FF0022CEFE0026CFFE0028CFFE0027CAF7002AD0FE002DD0FE002FD1
                  FE0033D3FE0035D4FF0038D4FE003AD4FE003AD3FB003FD5FE0040D5FE0043D7
                  FE0045D8FE0049D8FF004BD9FF004DDAFF0050DAFE0052DAFF0054D9FC0058DC
                  FF0058DDFF0057D8FA005DDDFF005EDEFF0069E0FF006CE1FF0066D3F0006DD9
                  F7006CD7F40073E2FF0076E3FF0078E3FF007FE5FF007DDDF80084E2FB008BE7
                  FF00A0E2F300ACEAFA00B6F0FF0009C5FF0009C5FE000AC5FF000AC7FF0009AD
                  E2000BC5FE000CC6FF000DC7FF000DC6FE000FAFE20011ABDE0016A3D1001AAB
                  DA001EA4D00027B5E00035A9CF0070C0DA0072C1DA007BC7DE008CD3E9008FD5
                  EA001A8FBB0023A1CC00269AC5002896BF0055ADCC0069BAD5002A93BB000E73
                  A0001079A7000F729E00025F8F000464920004639100056A9A00056999000567
                  9600056695000565930006689700066796000667950002029B9B9B0202020202
                  0202020202020202020202020202029B0B36169B020202020202020202020202
                  0202020202029E9B013231139B02020202020202020202020202020202029370
                  9B016E116A9B020202020202020202020202020202029C902A9B016710849B02
                  020202020202020202020202020202948D269B01236092020202020202020202
                  02020202020202029C8C0E9B01218A0202020202020202020202020202020202
                  02968B1F9B01839D02029A02020202020202020202020202020295821D9B0181
                  9A9A409A02020202020202020202020202020296801C9B014441403D9A9A9A9A
                  9A9A9C020202020202020202997F3F9B017B777675787C3C4246489A02020202
                  020202020298793B9B7A7D3E4347494C4F511E569A020202020202020202977E
                  454A4B4D50525457595B5E22639A020202020202020202964E5355585A5C5F62
                  64242729689C02020202020202020296205D5F616525676B6D126F14149C0202
                  02020202020202960F66286C2B2D71300A019B0C0C9C02020202020202029169
                  2C2E2F3233343708019B9B04049C020202020202020296091535373874390601
                  9B029B05059C02020202020202029C8E01183A3A3A07019B02029B19199C0202
                  02020202020202958F013A390D879B9B9B9B9B19199C02020202020202020202
                  9A85011B1A88897273190317179C02020202020202020202029C860117171717
                  171717179C020202020202020202020202029C9C9C9C9C9C9C9C9C9C02020202
                  02020202020202020202020202020202020202020202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Atualizar informa'#231#245'es do processo'
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
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRC007]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
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
        object tsEx: TTabSheet
          Caption = 'tsEx'
          ImageIndex = 3
          object GroupBox4: TGroupBox
            Left = 0
            Top = 70
            Width = 775
            Height = 422
            Caption = 'Controle de Exce'#231#245'es'
            TabOrder = 0
            object BitBtn7: TBitBtn
              Left = 260
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Adicionar Usu'#225'rio - [PRC010]'
              Caption = '&Adicinar'
              TabOrder = 0
              OnClick = BitBtn7Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000420B0000420B00000001000000010000CE630000FFD6
                AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
                FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
                090909090909090909090900000000000000000000000000000009000B0B0505
                0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
                0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
                0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
                0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
                0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
                00000000000A080A000009090000000000000000000A0A0A0009090909090909
                0909090909090909090909090909090909090909090909090909}
            end
            object BitBtn8: TBitBtn
              Left = 607
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Remover Usu'#225'rio - [PRC011]'
              Caption = '&Remover'
              TabOrder = 1
              OnClick = BitBtn8Click
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
            object BitBtn10: TBitBtn
              Left = 688
              Top = 382
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              TabOrder = 2
              OnClick = BitBtn10Click
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
            object GroupBox5: TGroupBox
              Left = 18
              Top = 24
              Width = 319
              Height = 345
              Caption = 'Usu'#225'rios'
              TabOrder = 3
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 315
                Height = 328
                Hint = '[Ins : Incluir] - Usu'#225'rios do Sistema'
                Align = alClient
                DataSource = dtmConfig.dsUsuario
                Options = [dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'USUARIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_VENDEDOR'
                    Visible = True
                  end>
              end
            end
            object GroupBox6: TGroupBox
              Left = 343
              Top = 24
              Width = 422
              Height = 345
              Caption = 'Usu'#225'rios permitidos'
              TabOrder = 4
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 418
                Height = 328
                Hint = '[Del: Apagar] - Usu'#225'rio permitidos para o processo selecionado'
                TabStop = False
                Align = alClient
                DataSource = dtmConfig.dsExececao
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'USUARIO'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'USUARIO_AUTORIZOU'
                    Width = 122
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_AUTORIZACAO'
                    Visible = True
                  end>
              end
            end
          end
          object GroupBox68: TGroupBox
            Left = 0
            Top = 0
            Width = 783
            Height = 73
            Cursor = crMultiDrag
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Processo'
            Ctl3D = True
            ParentBiDiMode = False
            ParentCtl3D = False
            TabOrder = 1
            object DBText27: TDBText
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              AutoSize = True
              DataField = 'NOME_PROCESSO'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText28: TDBText
              Left = 97
              Top = 47
              Width = 100
              Height = 17
              DataField = 'COD_PROCESSO'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText29: TDBText
              Left = 266
              Top = 47
              Width = 105
              Height = 17
              DataField = 'NIVEL_PROCESSO'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label201: TLabel
              Left = 8
              Top = 47
              Width = 81
              Height = 13
              Caption = 'Cod Processo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label202: TLabel
              Left = 216
              Top = 47
              Width = 33
              Height = 13
              Caption = 'N'#237'vel: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object tsRel: TTabSheet
          Caption = 'tsRel'
          ImageIndex = 2
          object QuickRep1: TQuickRep
            Left = 0
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmConfig.cdsProcessos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = QuickRep1Preview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              100.000000000000000000
              100.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            ReportTitle = 'Rela'#231#227'o de Processos'
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object PageHeaderBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 87
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                230.187500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel1: TQRLabel
                Left = 257
                Top = 11
                Width = 208
                Height = 23
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  60.854166666666680000
                  679.979166666666800000
                  29.104166666666670000
                  550.333333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Rela'#231#227'o de Processos'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
              object QRLabel2: TQRLabel
                Left = 27
                Top = 63
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  71.437500000000000000
                  166.687500000000000000
                  121.708333333333300000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'C'#243'digo'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object Transportador: TQRLabel
                Left = 95
                Top = 63
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  251.354166666666700000
                  166.687500000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Nome'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRHRule1: TQRHRule
                Left = 9
                Top = 53
                Width = 704
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  23.812500000000000000
                  140.229166666666700000
                  1862.666666666667000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRHRule2: TQRHRule
                Left = 9
                Top = 81
                Width = 704
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  26.458333333333330000
                  23.812500000000000000
                  214.312500000000000000
                  1862.666666666667000000)
                VertAdjust = 0
                Pen.Width = 2
              end
              object QRLabel3: TQRLabel
                Left = 9
                Top = 40
                Width = 64
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  23.812500000000000000
                  105.833333333333300000
                  169.333333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data/hora:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel4: TQRLabel
                Left = 608
                Top = 40
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1608.666666666667000000
                  105.833333333333300000
                  124.354166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 79
                Top = 40
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  209.020833333333300000
                  105.833333333333300000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDateTime
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 661
                Top = 40
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1748.895833333334000000
                  105.833333333333300000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel5: TQRLabel
                Left = 508
                Top = 64
                Width = 33
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1344.083333333333000000
                  169.333333333333300000
                  87.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#237'vel'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel6: TQRLabel
                Left = 553
                Top = 64
                Width = 71
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1463.145833333333000000
                  169.333333333333300000
                  187.854166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Formul'#225'rio'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 125
              Width = 718
              Height = 21
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                55.562500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText1: TQRDBText
                Left = -30
                Top = 1
                Width = 103
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  -79.375000000000000000
                  2.645833333333333000
                  272.520833333333400000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmConfig.cdsProcessos
                DataField = 'COD_PROCESSO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText2: TQRDBText
                Left = 95
                Top = 1
                Width = 111
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  251.354166666666700000
                  2.645833333333333000
                  293.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmConfig.cdsProcessos
                DataField = 'NOME_PROCESSO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 508
                Top = 1
                Width = 33
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1344.083333333333000000
                  2.645833333333333000
                  87.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmConfig.cdsProcessos
                DataField = 'NIVEL_PROCESSO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = False
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 553
                Top = 1
                Width = 35
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1463.145833333333000000
                  2.645833333333333000
                  92.604166666666680000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmConfig.cdsProcessos
                DataField = 'FORM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
            end
          end
        end
        object tsAlterDadosProc: TTabSheet
          Caption = 'tsAlterDadosProc'
          ImageIndex = 5
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 76
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosProd: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosProdClick
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
            Top = 76
            Width = 783
            Height = 59
            Align = alTop
            Caption = 'Processo'
            TabOrder = 1
            Visible = False
            object DBText56: TDBText
              Left = 8
              Top = 24
              Width = 55
              Height = 13
              AutoSize = True
              DataField = 'NOME_PROCESSO'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label456: TLabel
              Left = 525
              Top = 24
              Width = 30
              Height = 13
              Caption = 'N'#237'vel:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText60: TDBText
              Left = 562
              Top = 24
              Width = 30
              Height = 17
              DataField = 'NIVEL_PROCESSO'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 645
              Top = 24
              Width = 87
              Height = 13
              Caption = 'Senha Gerente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText61: TDBText
              Left = 740
              Top = 24
              Width = 30
              Height = 17
              DataField = 'SENHA_GERENTE'
              DataSource = dtmConfig.dsProcessos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btVoltarDadosProd2: TBitBtn
              Left = 811
              Top = 29
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
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
          object pnCenterAlterDadosProd: TPanel
            Left = 0
            Top = 135
            Width = 783
            Height = 54
            Align = alTop
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object SpeedButtonAlterarProduto: TSpeedButton
              Left = 62
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Editar Registro - [PRO004]'
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
              OnClick = SpeedButton1Click
            end
            object SpeedButtonAlterarProduto2: TSpeedButton
              Left = 5
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Editar Registro Selecionados  - [PRO361]'
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
              OnClick = SpeedButtonAlterarProduto2Click
            end
            object btExcluirRegistro: TSpeedButton
              Left = 121
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Enviar para Lixeira -  [PRO006]'
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
            object btLixeiraVazia: TSpeedButton
              Left = 179
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Lixeira vazia'
              Flat = True
              Glyph.Data = {
                76060000424D7606000000000000360400002800000018000000180000000100
                08000000000040020000C30E0000C30E00000001000000010000009C0000089C
                080010A5100018A5180021A5210029AD290031AD310039B5390042B542004AB5
                4A0052BD52005ABD5A0063C65A006BC6630073C66300EFB56B007BC66B007373
                7300EFB57300F7B57300F7BD73007BC6730073CE73007B7B7B00F7BD7B008CCE
                7B00F7BD8400F7C68400FFC6840094CE84008CD684008C8C8C00EFBD8C00F7C6
                8C00FFC68C0094D68C00949494009C9C9400A5A59400B5AD9400F7C69400FFC6
                9400F7CE9400FFCE940094D694009CD69400BDD694009CDE9400B5DE94009C9C
                9C00A5A59C00ADAD9C00C6B59C00D6BD9C00DEBD9C00FFCE9C00CED69C00FFD6
                9C00B5DE9C00C6DE9C00CEDE9C00A5A5A500ADADA500BDBDA500C6BDA500D6C6
                A500EFD6A500FFD6A500ADDEA500D6DEA500F7DEA500ADADAD00B5B5AD00C6C6
                AD00D6C6AD00DEC6AD00FFD6AD00FFDEAD00D6E7AD00B5B5B500C6BDB500D6C6
                B500DEC6B500D6CEB500E7CEB500E7DEB500FFDEB500C6E7B500DEE7B500E7E7
                B500EFE7B500FFE7B500D6CEBD00DECEBD00FFE7BD00CEEFBD00DEEFBD00F7EF
                BD00FFEFBD00CEEFC600D6EFC600DEEFC600F7EFC600FFEFC600F7EFCE00FFF7
                CE00FFF7D600FFFFD600E7F7DE00FFF7DE00FFFFDE00F7FFE700FFFFE700FFFF
                EF00FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373737373
                73495353534033482573737373737373737373737373735E5E5E5E5B5656565E
                673F2647737373737373737373735E5E675E564D4D5656565E67676724737373
                7373737373735E675E5E564C43594E676A6D6D696748737373737373735C5E69
                5E5B4D433758061907082C6F6A673E737373737373210F5E69694D4343380000
                0000000A6D6E674F7373737373211212185E69695E2E0000010C09011E5E4224
                7373737373211A1A1A1A1A212A2E0000026C6F4405612A31737373735C212121
                2121212143380402000B71682D2E28254773737321292929292929295E3B5960
                574472706D3A37263D73737321373737373737374D15666A5F06080B2D683727
                3D73737321434343434343434C0E1D696E150000086743342473735C4D565656
                565656565645020D5F2D000008675641247373215E5E5E5E5E5E5E5E5E5E1000
                0100000008675E551F73732167676767676767676767660E0301020708696768
                1F7373216A6A6A6A6A6A6A6A6A6A6A6A6457636F236A6A6A177373216E6E6E6E
                6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E177373216E6E6E6E6E6E6E6E6A5E5B46
                4656676A6E6E6E6E17737354696B6B6B6A695E2A1A120F121212181B46696E6E
                17737373512121212151351A121212121218181A1A215B6E1173737373737373
                737373737373351A18181A1A1B21214C11737373737373737373737373737373
                4A201A1B21212929117373737373737373737373737373737373412121222928
                31737373737373737373737373737373737373734B2035507373}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton25Click
            end
            object btRestaurarRegistro: TSpeedButton
              Left = 236
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Recuperar registro - [PRO007]'
              Flat = True
              Glyph.Data = {
                72040000424D7204000000000000320200002800000018000000180000000100
                08000000000040020000120B0000120B00007F0000007F00000000000000FFFF
                FF00FF00FF0000520200005101000051020000500100004F0100015703000156
                03000155030001540300015302000153030001520200025A0400025904000258
                040002570300025704000159040001580400025C0500025B0500037909000372
                080003630700047D0A00047A0A0003600600035F070006910D00056209000562
                0A00058F0D00058E0D00058C0D0006900E00068F0F00068E0E00079111000790
                1000056A0B000896120007790E0009931300076A0E000A961400086A0F000A96
                15000B9617000C9717000A7D13000A7B14000D991B00096D11000A7413000E9A
                1C000A6E13000F9D1F00109F1F000C741700119F22000E841B000D7919000D78
                180012A022000D761800108B1D000F831B000F7E1C001398230013A3270014A4
                260015A7280016A72B0016A62A001181200018AA2D0018A92D00169528001383
                23001689270019AB2F00169229001AAA31001CAF35001CAD33001BA531001A9F
                2F0018952C00178C2A001FB439001FB43B001C9932001C99340022B63E001C98
                33001F9C37001FA1390025BD440025BB430023AA400021A13B0022A03C0027B1
                440027BC48002CC64F002CC44F0027AF45002CC14E0028B0470028AD470028AC
                46002DBF4F002DC452002FBD540035D05E0036D05F0035CC5F0038D3640035CA
                5F003CD86A003CD76A003BD1680042E2760041DC720002020202020202020202
                0202020202020202020202020202020202020902020202020202020202020202
                0202020202020202020909020202020202020202020202020202020202020202
                02091102020202020202020202020202020202020202020202112A1302020202
                02020202020202020202020202020202020F4010020202020202020202020202
                0202020202020202020F5E1A0202020202020202060602020202020202020202
                02146F410D020202020202020920060202020202020202020215746313020202
                020202020A1820060202020202020202020A7079430D02020202020204681820
                0602020202020202020D527D6D210A0202020202066226182004020202020202
                02023A7C7B69371D090E0504075F2B23193006020202020202020B617E78725A
                38343545502C2F2523183D06020202020202020A717A76736A60564F483B3229
                24221B5B0A020202020202020B6777756C655D574C42362D27241F1C0A020202
                02020202020B4D666E6B645C53493B332822510C02020202020202020202090D
                46545958554E3E3931410602020202020202020202020202090B0D0A16474A3C
                2E0602020202020202020202020202020202020212444B1E0302020202020202
                020202020202020202020202103F170D02020202020202020202020202020202
                0202020208090902020202020202020202020202020202020202020209090202
                0202020202020202020202020202020202020202020202020202020202020202
                02020202020202020202020202020202020202020202}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton5Click
            end
            object btLixeiraCheia: TSpeedButton
              Left = 178
              Top = 2
              Width = 51
              Height = 45
              Hint = 'Ver registros da lixeira - [PRO008]'
              Flat = True
              Glyph.Data = {
                F6060000424DF606000000000000360000002800000018000000180000000100
                180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFEFFFFFFFFFFFFFFFFFEFFE8E8E0D1D1C9DDDCDFDEDFE1B7BEC2CCCDCEE3D9
                DDF6EBEEFFF8FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBC3C0B6CBC8B8D7CFB8EAE3B3E3E1B0
                D0D1A4BFBF9FB2AE9D95928B98A097BDCDC1FCFAFDFFFEFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2D0F8EFD9F7E7CDFB
                E4C6FBE6B4FDE3B4EDD1AADBBEA1EAD2BAF8EED5DFE1C2B0B899948883B8AEAD
                FEFAFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFCFCF5F8F5
                D5FCEFCCFDE6C5FDE0C3E6CBBADBB4AEE8B5B7FAD2D0DFB5A7FCDDC3FDE4C3FD
                E8C8F7EBDCC2B8AE8E867ED1D0CEFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDE1D7B6FEF6CDFDEAC3FDE3C4EACDB6D4C5B4D4BBB6DFC0C0D6C7BBE5EA
                CAEBF6D3F4FBD9F7F9DFE9F5D4F4F4D9ECE3D18F897FCBD0CCFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFEF7D4BC93E9CFA2FFF1CDEAD2BCE4CFC5DCC9C6D5C1C1
                D6D5C566975E5AC45D28AA2D2BA3344EAC54B2E4ADE9FCD0FCF9DBF1EADA9691
                8BFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D7DCB588D9B082F4D3B5F5E1D8DE
                D1D7F1CEDFE4C5D0D3DDC552A44D05990700A200019202178B191F8527B3DFA0
                FBFCD3FEEFD8A99B92E5E7E4FFFFFFFFFFFFFFFFFFFFFFFFF8DEBBE7B78AF2C5
                9CFFF0D8ECE0DFE2DCE7F7D9D8EECDC4C9D4A7369B040995000498046CC96AAA
                D8A649AF57478D39EFF7C3DDC6A4B5A293DBD9D8FDF2FDFFFFFFFFFFFFFFFFFD
                F7C8ACE9B99AFCEFD9F0F3EAEDEBEEFAE8EFF6D4CBCFAEA1BBCE963499011391
                03009E0555B75DEAF8EADDF6DD8CBB79AEC789D6D190BEAE89CDCACCECE5ECFF
                FFFFFFFFFFFFF8ECF1C1A8F4D3B7FFFFEFF7FEFAF9F4F8FDE2F1DE9CBAD3C2B6
                D7E7C1B7CAA585B77B55B74F50A846C6E5B8E6F7DFDCFAC6B0BF8CEFDBA4D7BA
                9BBBB1B5E8DDE8FDFDFDFFFFFFF6EADBE8C5ADFDF0D7FBFEEEFAFEFCFFF9FDE2
                B4C1E09DBACEBBB0B3CA9EE3EFD1F1E9E0F6F1E59CC38EA1E497BCE3B5CAF3B5
                E4E9C2FEDDB6F3C7B3AD9DA1F2FFF0FFFFFFFFFFFFEFDDD0E8D1B9FFFEE7F7FC
                EEFBFEFBFAE9EBCB9C9FD5ACA1DFB4AFC8CCA788C479DDF9D2FBEAF6A5BDA509
                85141E841D2C841CCFEDB4F4D6AEFECFBFA99398F3FCEDFFFFFFFFFFFFE7D7C8
                F6EAD0FEFFE7F8FFEFF9FCF5D5C3C1D0A9A5D2B2A6E6B3BDE4E0C841973966CA
                68D4FAD4D1FFD621A92B0198020F9608BDFBAEE7DCA9FFD8C0AC9697EDF3E4FF
                FEFFFFFFFFE8DCC9FEF9DEFFFEE5FCFEEDF9F8ECE5D8CDF8E8E0FDE2F3E2CBD9
                CBD2C5A9DCA71C841C139D131FA319198B0E069A05049304B3FAADEEEDB8FEE0
                C1AD9B97EFF2E5FFFEFFFFFFFFF2E6CEFFFFE0FFFDDFFEFDEAFCFBEBFDFCE9FE
                FEECFCF5FDE3EDE9DEE7E1DFE0DE9FCA9C1B8F1911900929851824921D208B1E
                C2F2C0F4EFC6FFEBCAB2AA9DE2EBDAFFFFFFFFFFFFFFFADFFDFAD6FEFCDCFDF8
                DDFAF9E5F8FBE4F1FCE0E5FFE4EAFFEAF7FAF6F1DEEDF0E9ECD8F9D5A2DCA199
                D898CEFFC795CC92D3E9D1FFF8DDFFF5D5BABAA7D3E0CCFFFFFFFFFFFFFFFFF0
                F6FDDDF3FDD9F7FEDBFAFDE2F4FCE7EEFEEEDEFFF3E7FFFAF5FFFCFCFAF8F2EE
                E8F5F8EBF9FFF3F5FFF1F3FDF9F3FBF2F5F8E8FFFEE5FDFADDCBC9B4CFCEC0FF
                FCFFFFFFFFFFFCE3FDFDDBFDFEDAFFFED9FAF8D8F2FCE3ECFEECE7FDF8E7F8F4
                EFF3EFFAF3EFEDE1DBEEE2DAF9EFE7FEFCF4F9F8F4FFFEF7FEFDE7FFFEE2FEFC
                E0D5D3C1B8B8B1FFFFFFFFFFFFF6EDD4FDF8DBFFFCDAFFFADBFCF8E0EDF5E0D9
                F3E0DDF0EBEAF6F4FAFBFAFFFCFBECE1E0DACBC8F9EFECFFFDF7F1E5D3D9C8AF
                F8EBCAFFFBD7FFFEDEE7E4D1ADB0AEFFFFFFFFFFFFFCFAF2EDE0CEF4DFCCF8E5
                D3F0E8D8D5E7D8D8FBF0E5FFFEEAFFFFF1FFFFF5FDFCEBF0EFD8DBDBF9FCFCFA
                FCF8EBCEAADEBA8DE2C18EF0D6A2FFF8CFF7F0D9A7A59FFFFEFFFFFFFFFFFFFF
                FFFEFFFFFFFFFFFEFFFFFCFFD8EEEDCFFAF8D4FEFCD7FFFDDCFEFEDDFEFDD9FB
                FBCDF0EFDAFCFCDFFAF4E8C494F2C184F7C685F3C587F1CD99FCEBCCADA296FF
                FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3F4FAD0F5F8C8EEEFC9F2F2
                CDF8F7CCFAFACDFEFFCAFEFFC2F9FABDE8E3DDBE90F3C289FDCA8AFAC98BF8CE
                9AE0C4A2C5B7A8FFFDFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFF5FFFFDBF5F7CEF0F2C7F3F7C2F4F9C2F8FD98C5C7DCC8A9E9C59C
                EDC394F4C898E8C29ADEC6ACF2EAE1FFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFDCF8FDCFF4FCBFEBF6B0
                D6DDFDFBEDFDF3DBF6E4C3F4DDBAF8E8C9FDF4E4FFF4FFFFFFFF}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton25Click
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 189
            Width = 783
            Height = 321
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 3
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 6
          object ScrollBoxAlterDadosLote: TScrollBox
            Left = 0
            Top = 0
            Width = 783
            Height = 481
            Align = alClient
            TabOrder = 0
            object GbAlterarProdLote: TGroupBox
              Left = 0
              Top = 0
              Width = 779
              Height = 476
              Align = alTop
              Caption = 'ATUALIZAR INFORMA'#199#213'ES DO PROCESSO'
              TabOrder = 0
              object Label473: TLabel
                Left = 8
                Top = 13
                Width = 762
                Height = 13
                Caption = 
                  'Dados  do Processo        -                    -                ' +
                  '    -                    -                    -                 ' +
                  '   -                    -                    -                  ' +
                  '  -                    -                    -'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object pnNivelProcesso: TPanel
                Left = 1
                Top = 32
                Width = 280
                Height = 28
                TabOrder = 0
                object lbNivelProcesso: TLabel
                  Left = 109
                  Top = 7
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N'#237'vel Processo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckBox23: TCheckBox
                  Left = 1
                  Top = 101
                  Width = 40
                  Height = 17
                  TabOrder = 1
                end
                object ckNivelProcesso: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 19
                  Height = 17
                  TabOrder = 0
                  OnClick = ckNivelProcessoClick
                end
                object cbNivelProcesso: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'N'#237'vel Processo'
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  TabOrder = 2
                  OnExit = cbNivelProcessoExit
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                end
              end
              object pnSenhaGerente: TPanel
                Left = 287
                Top = 32
                Width = 280
                Height = 28
                TabOrder = 1
                object lbSenhaGerente: TLabel
                  Left = 109
                  Top = 7
                  Width = 72
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Senha Gerente'
                end
                object ckSenhaGerente: TCheckBox
                  Left = 21
                  Top = 5
                  Width = 22
                  Height = 17
                  TabOrder = 0
                  OnClick = ckSenhaGerenteClick
                end
                object cbSenhaGerente: TComboBox
                  Left = 188
                  Top = 3
                  Width = 80
                  Height = 21
                  Hint = 'Senha Gerente'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  TabOrder = 1
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
              end
              object pnFormularioProcesso: TPanel
                Left = 1
                Top = 60
                Width = 566
                Height = 28
                TabOrder = 2
                object lbFormularioProcesso: TLabel
                  Left = 132
                  Top = 7
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Formul'#225'rio'
                end
                object EdFormularioProcesso: TEdit
                  Left = 188
                  Top = 2
                  Width = 367
                  Height = 21
                  Hint = 'Formul'#225'rio Processo'
                  CharCase = ecUpperCase
                  MaxLength = 30
                  TabOrder = 1
                end
                object ckFormularioProcesso: TCheckBox
                  Left = 21
                  Top = 6
                  Width = 40
                  Height = 17
                  TabOrder = 0
                  OnClick = ckFormularioProcessoClick
                end
              end
            end
          end
          object Panel119: TPanel
            Left = 0
            Top = 481
            Width = 783
            Height = 29
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object btSalvarProcLote: TBitBtn
              Left = 312
              Top = 0
              Width = 75
              Height = 25
              Hint = 'OK - [PRO361]'
              Caption = '&OK'
              TabOrder = 0
              OnClick = btSalvarProcLoteClick
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
            object btnCancProcLote: TBitBtn
              Left = 393
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Cancelar'
              Caption = '&Cancela'
              TabOrder = 1
              OnClick = btnCancProcLoteClick
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
            object btSairProcLote: TBitBtn
              Left = 604
              Top = 0
              Width = 75
              Height = 25
              Hint = 'Sair'
              Caption = '&Sair'
              TabOrder = 2
              OnClick = BitBtn2Click
              Glyph.Data = {
                2E020000424D2E020000000000002E0100002800000010000000100000000100
                08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                0202020202020202020202020202020202020204040404040404040404040402
                020202040132302E28272125242F04020202020401050F221B1614130B260402
                0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                0202020203040404040404043D383D0202020202020202020202023D353D393D
                020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                020202020202020202020202020202020202}
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
  inherited PopupMenu1: TPopupMenu
    object Selecionartodosprocessos1: TMenuItem
      Caption = 'Marcar todos processos'
      OnClick = Selecionartodosprocessos1Click
    end
    object Desmarcatodosprocessos1: TMenuItem
      Caption = 'Desmarca todos processos'
      OnClick = Desmarcatodosprocessos1Click
    end
  end
  inherited Timer1: TTimer
    Left = 606
    Top = 211
  end
end
