inherited frmCadManutencaoEquip: TfrmCadManutencaoEquip
  Left = 238
  Top = 74
  Caption = 'Manuten'#231#245'es de Equipamentos'
  ClientWidth = 804
  ExplicitWidth = 812
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 804
    ExplicitWidth = 804
    inherited PanelLeft: TPanel
      Width = 799
      ExplicitWidth = 799
      inherited PageControl1: TPageControl
        Width = 797
        ExplicitWidth = 797
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 789
            ExplicitWidth = 789
            inherited PageControl3: TPageControl
              Width = 789
              ExplicitWidth = 789
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 781
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 781
                  ExplicitWidth = 781
                  inherited GroupBox1: TGroupBox
                    Width = 777
                    Height = 177
                    Caption = 'Manuten'#231#227'o de Equipamentos'
                    ExplicitWidth = 777
                    ExplicitHeight = 177
                    object Label6: TLabel
                      Left = 116
                      Top = 40
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 87
                      Top = 67
                      Width = 66
                      Height = 13
                      Caption = 'Equipamento:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 94
                      Top = 94
                      Width = 59
                      Height = 13
                      Caption = 'Fornecedor:'
                      FocusControl = DBEdit3
                    end
                    object Label10: TLabel
                      Left = 57
                      Top = 121
                      Width = 96
                      Height = 13
                      Caption = 'Dados Manuten'#231#227'o:'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 94
                      Top = 148
                      Width = 59
                      Height = 13
                      Caption = 'Valor Custo:'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 351
                      Top = 148
                      Width = 68
                      Height = 13
                      Caption = 'Data Entrada:'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 562
                      Top = 148
                      Width = 81
                      Height = 13
                      Caption = 'Data Prev Saida:'
                      FocusControl = DBEdit8
                    end
                    object Label9: TLabel
                      Left = 555
                      Top = 40
                      Width = 88
                      Height = 13
                      Caption = 'Data Lan'#231'amento:'
                      FocusControl = DBEdit9
                    end
                    object DBEdit1: TDBEdit
                      Left = 159
                      Top = 32
                      Width = 134
                      Height = 21
                      DataField = 'COD_MANUTENCAO'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 159
                      Top = 59
                      Width = 134
                      Height = 21
                      DataField = 'COD_EQUIP'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 1
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 299
                      Top = 59
                      Width = 420
                      Height = 21
                      DataField = 'COD_EQUIP'
                      DataSource = DtmEquipamentos.dsManuEquip
                      KeyField = 'COD_EQUIP'
                      ListField = 'NOM_EQUIP;MARCA;MODELO;N_SERIE'
                      ListSource = DtmEquipamentos.dsLocEquip
                      TabOrder = 2
                    end
                    object DBEdit3: TDBEdit
                      Left = 159
                      Top = 86
                      Width = 134
                      Height = 21
                      DataField = 'CODIGO_F'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 3
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit4: TDBEdit
                      Left = 299
                      Top = 86
                      Width = 420
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOME_FORNECEDOR'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 4
                    end
                    object DBEdit5: TDBEdit
                      Left = 159
                      Top = 113
                      Width = 560
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 5
                    end
                    object DBEdit6: TDBEdit
                      Left = 159
                      Top = 140
                      Width = 134
                      Height = 21
                      DataField = 'CUSTO_MANUTEN'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 6
                    end
                    object DBEdit7: TDBEdit
                      Left = 425
                      Top = 140
                      Width = 70
                      Height = 21
                      DataField = 'DAT_ENTRADA'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 7
                    end
                    object DBEdit8: TDBEdit
                      Left = 649
                      Top = 140
                      Width = 70
                      Height = 21
                      DataField = 'DAT_PREV_SAIDA'
                      DataSource = DtmEquipamentos.dsManuEquip
                      TabOrder = 8
                    end
                    object DBEdit9: TDBEdit
                      Left = 649
                      Top = 32
                      Width = 70
                      Height = 21
                      DataField = 'DATA_LANCAMENTO'
                      DataSource = DtmEquipamentos.dsManuEquip
                      Enabled = False
                      TabOrder = 9
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 789
              ExplicitWidth = 789
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [EQU025]'
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
          ExplicitWidth = 789
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 789
            ExplicitWidth = 789
            inherited imgInformation: TImage
              Left = 763
              ExplicitLeft = 763
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [EQU020]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [EQU019]'
            end
          end
          inherited Panel1: TPanel
            Width = 789
            ExplicitWidth = 789
            inherited DBGrid1: TDBGrid
              Width = 496
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_MANUTENCAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EQUIP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUSTO_MANUTEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DAT_ENTRADA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DAT_PREV_SAIDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_F'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_FORNECEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_DOC_DESP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_LANCAMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ENVIO_CAIXA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CONTRP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 785
              ExplicitWidth = 785
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [EQU021]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [EQU022]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [EQU024]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Enviar para o caixa geral - [EQU026]'
                Glyph.Data = {
                  42060000424D4206000000000000020400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F3000000F300000000000000FFFF
                  FF00F4F2FA00F6F3F800F2EEF400FF00FF008C6F7D00CFBBC500D4BFC900C6B1
                  BA00D4A1B40096758100E0C0CC00E2C6CF009D576A00BCA3AA00D4C5C900E9DA
                  DE009A747D009A636F0097697300DDCACE00F2EDEE008F636B00916870008263
                  6900B28A9000834F5600B29C9F00AF959800DED4D500BD9FA000C5ABAC00653B
                  3B00E7E0E000EFEAEA00C1A5A400D1BDBA00E6DCDA00B196900068494100AD8C
                  8300BB9F97009E270000D1BDB700A05F48007E4D3C00BFA09500E2D7D300A630
                  0000A9745E00C1A49800CAB4AB00A933010096330600872D0700C7AFA400A538
                  00008F32020096492200CFBAB000D0C2BB00AB491200D1BBAF00C1480000B141
                  0000D3AC9500BB998400C19F8B00DC5B00009F400200A4420300B04A0400A747
                  0500A3480B00B4500D00AB7F6000DED0C700D95C0000D4BBA900D35E0100DC67
                  0300D96D1300B0896A0064350B00A5764C00B18E7000D4B59800A9682600A774
                  4000AB845F00C19A7500C9721200935B1C00B46E2300AB6F2E00C07F3600B787
                  5200C5700D00CA7B1B00C2833A00B88F6000D0842000BF7A2300CB862F00C181
                  3100CC914100CC995400D3A36400CBA36D00E08C1700E3962500D48B2600D893
                  3000D9983B00E19F3A00CF9E5100D9A95D00D5B48100DCBF9100E2A94700EAB1
                  5100DAB26F00DDB87A00EFBD5F00E6BA6800E7BD6F00EFDAA100DDD1B200FEE7
                  9F00E6D8AD00F7E9AC00F0E6AB0055561A003C432300384923006E8364003F74
                  2D00345C280015480D001C4F16003D7239000C4F090000510000004D0000004C
                  0000004B0000004A00000044000001500100014C0100025202001F681F000056
                  0100004F0100015303000151020002540300024F030003560400578C5800005C
                  0400035E06000358060005600900055E080007590A00036A0A00096A0F00056E
                  0E00077711000C6F14000D731500107D1B000C841A0011801E00117F1E001282
                  1F0016892400187D230034964000118B220016902800168C2700168B26001B97
                  2D001FA0350063AC6E0017952F0023AB3E0025AF410018A539001EB4400024B8
                  45002ABA4A002BBD4B002DBF4E0031C755002EB64E002EC9540034DE5F004BD1
                  6E0039DA64003ADA650041F3750043F4770051C9FF004DC2FF0050C6FF0046B8
                  FF0048B8FE0042B4FF003DA5EA002E8BD3003090D8003395DC003595DC003DA7
                  F20041B0FF002C8ADA00287FC7002D8BD9002E8CD7002889ED002070BD002F99
                  FF001F70C5001C79E9001F83FF001F82FA002086FF002087FF002188FF00258B
                  FF000A4391000D4DA1000C489800135FC4001462C6001C7FFF001972E3001F81
                  FF00115DC60005050505050596969C9B9D979C9A929305050505050505050505
                  05059EA8AFB8B7B2B1ADACA8A49F9591050505050505050594ABBDC4C2BEBAB9
                  B6B5AEAAA9A7A29B91920505050505A5B0CACBC5C3C1C0BFBCB3988A878CA6A1
                  99909205050505A3CACDC8C7C6B48985542E1D1A211B28868B979005050505A5
                  CCC9A0885D4836352B2D081F2117130E218E8F0505050505A5BB0A0C52454641
                  312D071F211718132193050505050505A58D0D155C504A4B3E32102421181414
                  210505050505050505211511574224242009070F21060B122105050505050505
                  052125251C27435B4C61605E213B2E1921050505050505050521767B55747873
                  58666E6221403A37210505050505050505218381657E7C795F716F63214E4739
                  21050505050505050521827F5A7B7D75596A7269215149412105050505050505
                  05213D4D343C34382A2F3329ECECECECECECECEC0505050505215777536D6C6B
                  5964685EECD7D5D8D4DCDCEC0505050505218481617D7C785F706E5CECD6CED0
                  D2E0EA05050505050521808256767A75596A7167ECDECFD1DADFEC0505050505
                  05211E232226304D2C3F4F44ECDDD9D3E1E9F0EC050505050521232316040302
                  03040202ECDBECE2E7EFE8E3EC050505052121212121212121212121ECEC21EC
                  F2E6F1E5EBEC050505050505050505050505050505050505ECEEE4EDEC050505
                  0505050505050505050505050505050505ECEDEC050505050505050505050505
                  05050505050505050505EC050505050505050505050505050505050505050505
                  050505050505}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Detalhes no caixa geral - [EQU027]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000010000212121000018
                  290029292900393939005A39390042424200181852005252520073635200315A
                  5A005A5A5A0094735A000039630063636300736B63004A6B6B006B6B6B007B73
                  6B00735A73007373730073737B007B7B7B0094847B00A5847B00BD9C7B006384
                  84008C8C8C009C948C00AD948C0094949400A59C940084849C009C9C9C00B5AD
                  9C00CEBD9C00849CA500A5A5A5009494AD00ADADAD00D6BDAD00FFE7AD00B59C
                  B500E7CEB500BDBDBD00D6C6BD009CADC600ADC6C600C6C6C600EFD6C600C6C6
                  CE00CECECE00FFDECE00D6D6D600F7E7D600DEDEDE00EFE7DE00D6DEE700DEE7
                  E700E7E7E700EFE7E700F7EFE700DEE7EF00EFEFEF00F7F7F700FFF7F700FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424242424242
                  4242424242424242424242424242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424224000A42424242
                  42424242424242424242424242424242240210101A4242424242424242424242
                  424242424242422002152B241A4242424242424242424242424242424242420A
                  0A2B2B1A42424242424242424242424242420D1A1A4242030A1D1A4242424242
                  42424242424242424202110B080300241A2042424242424242424242201F1F20
                  07223335271B0705201F1F1F241F1F2B42424242010101020E241B1B1B201B03
                  010101010101010142424242090A1E07222B1C17182C2A0D060109141A1E0A04
                  424242420919370A2A2C2C2C2C2C2A1613201D262F37191242424242091F4313
                  22283C3E412A2A152636434343432509424242421F09432B1B28333C352A211A
                  4343413F43430F1F4242424223094340241D2A302A211A3E3F3E3E3E40430929
                  42424242230C433F3E2F24202020243F3E3E3E3E3E430929424242422E06413E
                  3A3A3A3A3E24243E3A3A3A3A3E410629424242422E063F3A3636363A3A24243A
                  3A3636363A3F0629424242422E0C2D322F2F2F2F322020322F2F2F2F322F0C2B
                  42424242422E24242B2B2B2B2B20202B2B2B2B2B24242B424242424242424242
                  2B242424242020242424242B4242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424242424242424242
                  4242424242424242424242424242424242424242424242424242}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [EQU023]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 789
          ExplicitHeight = 510
        end
        object tsEnvio: TTabSheet
          Caption = 'Envio para o Financeiro'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 789
            Height = 329
            Align = alTop
            Caption = 'Dados para o Financeiro'
            TabOrder = 0
            object Label14: TLabel
              Left = 290
              Top = 45
              Width = 98
              Height = 13
              Caption = 'N'#250'mero Documento:'
              FocusControl = DBEdit10
            end
            object DBEdit10: TDBEdit
              Left = 394
              Top = 37
              Width = 105
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NUM_DOC_DESP'
              DataSource = DtmEquipamentos.dsManuEquip
              TabOrder = 0
            end
            object GroupBox6: TGroupBox
              Left = 202
              Top = 72
              Width = 385
              Height = 185
              Caption = 'Forma de Pagamento'
              TabOrder = 1
              object Label16: TLabel
                Left = 14
                Top = 19
                Width = 40
                Height = 13
                Caption = 'Parcelas'
              end
              object Label17: TLabel
                Left = 66
                Top = 19
                Width = 61
                Height = 13
                Caption = 'Outra Forma'
              end
              object edParcelas: TSpinEdit
                Left = 13
                Top = 38
                Width = 41
                Height = 22
                MaxValue = 99
                MinValue = 0
                TabOrder = 0
                Value = 0
              end
              object cbCondPag: TComboBox
                Left = 66
                Top = 38
                Width = 140
                Height = 21
                Style = csDropDownList
                DropDownCount = 10
                ItemHeight = 0
                TabOrder = 1
              end
              object ListBox1: TListBox
                Left = 14
                Top = 70
                Width = 358
                Height = 97
                ItemHeight = 13
                TabOrder = 3
              end
              object BitBtn7: TBitBtn
                Left = 297
                Top = 34
                Width = 75
                Height = 25
                Caption = 'Limpar'
                TabOrder = 4
                OnClick = BitBtn7Click
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
              end
              object BitBtn8: TBitBtn
                Left = 212
                Top = 34
                Width = 75
                Height = 25
                Caption = 'Gerar'
                TabOrder = 2
                OnClick = BitBtn8Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000430B0000430B000000010000000100008C5A5A009C6B
                  6B00A57B73000000840084848400B58C8C0039529C00395AAD004A6BBD005A73
                  C600C6C6C6006384CE00F7E7CE00F7EFDE00FFF7E700FFFFEF00FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101010070606
                  0606060606060607101010100805000000000000000000000710101008050D0D
                  0D0D0D0D0D0D0D000610101008050D040404040404040D000610101008050D0C
                  0C0C0C0C0C0C0D000610101008050D040404040404040D000610101008050D0D
                  0D0D0D0D0D0D0D010610101008050E0E030D0A03030A0E010610101009050F0F
                  030F030F0F030F010610101009050F0F030F0F0F0F030F020610101009050F0F
                  030F0303030A0F02061010100B0511030311031111111105061010100B051111
                  0311030303031105061010100B0511111111111111111105061010100B050505
                  050505050505050507101010100B090808080808080808081010}
              end
            end
            object Panel11: TPanel
              Left = 41
              Top = 269
              Width = 609
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn45: TBitBtn
                Left = 265
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Enviar Conta Caixa Geral - [EQU026]'
                Caption = 'Salvar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = BitBtn45Click
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
              object BitBtn47: TBitBtn
                Left = 522
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Sair'
                TabOrder = 1
                OnClick = BitBtn47Click
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
        object tsDetalhes: TTabSheet
          Caption = 'Detalhes no Financeiro'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 789
            Height = 249
            Align = alTop
            Caption = 'Detalhes no Contas a Pagar'
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 2
              Top = 15
              Width = 785
              Height = 186
              Align = alTop
              DataSource = DtmEquipamentos.dsCPManutEq
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CONTRP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_CTRL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_DOC_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_VENC_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_FOR_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATQ_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_PAGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ENT_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO_CTP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_FORN_NFE'
                  Visible = True
                end>
            end
            object BitBtn9: TBitBtn
              Left = 357
              Top = 215
              Width = 75
              Height = 25
              Caption = 'OK'
              TabOrder = 1
              OnClick = BitBtn9Click
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
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 0
      ExplicitWidth = 0
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 804
    ExplicitWidth = 804
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 646
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 614
    Top = 3
  end
end
