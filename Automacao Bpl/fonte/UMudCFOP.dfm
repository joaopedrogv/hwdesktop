inherited FrmMudCFOP: TFrmMudCFOP
  Left = 221
  Top = 54
  Caption = 'Cadastro de CFOP Interestaduais'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 789
          ExplicitHeight = 513
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de CFOP Interestaduais'
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 781
                ExplicitHeight = 437
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Height = 185
                    Caption = ''
                    ExplicitHeight = 185
                    object Label11: TLabel
                      Left = 124
                      Top = 44
                      Width = 76
                      Height = 13
                      Caption = 'Estado Destino:'
                    end
                    object Label10: TLabel
                      Left = 46
                      Top = 153
                      Width = 154
                      Height = 13
                      Caption = 'ICMS Externo N'#227'o Contribuinte:'
                    end
                    object Label9: TLabel
                      Left = 11
                      Top = 129
                      Width = 190
                      Height = 13
                      Caption = 'Natureza Op Externa N'#227'o Contribuinte:'
                    end
                    object Label8: TLabel
                      Left = 48
                      Top = 104
                      Width = 152
                      Height = 13
                      Caption = 'ICMS Interno N'#227'o Contribuinte:'
                    end
                    object Label7: TLabel
                      Left = 13
                      Top = 80
                      Width = 188
                      Height = 13
                      Caption = 'Natureza Op Interna N'#227'o Contribuinte:'
                    end
                    object Label6: TLabel
                      Left = 112
                      Top = 17
                      Width = 89
                      Height = 13
                      Caption = 'Estado de Origem:'
                    end
                    object Label15: TLabel
                      Left = 308
                      Top = 80
                      Width = 166
                      Height = 13
                      Caption = 'Natureza Op Interna Contribuinte:'
                    end
                    object Label14: TLabel
                      Left = 344
                      Top = 106
                      Width = 130
                      Height = 13
                      Caption = 'ICMS Interno Contribuinte:'
                    end
                    object Label13: TLabel
                      Left = 306
                      Top = 129
                      Width = 168
                      Height = 13
                      Caption = 'Natureza Op Externa Contribuinte:'
                    end
                    object Label12: TLabel
                      Left = 342
                      Top = 155
                      Width = 132
                      Height = 13
                      Caption = 'ICMS Externo Contribuinte:'
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 207
                      Top = 40
                      Width = 242
                      Height = 21
                      Hint = 'Estado de destino'
                      DataField = 'UF_DESTINO'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      KeyField = 'CODIGO_UF'
                      ListField = 'NOME_UF'
                      ListSource = DtmCadBasicos.dsCfopUFDestino
                      TabOrder = 1
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 207
                      Top = 150
                      Width = 84
                      Height = 21
                      Hint = 'ICMS Externo para N'#227'o Contribuinte:'
                      DataField = 'ICM_EXT_NC'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 8
                    end
                    object DBEdit6: TDBEdit
                      Left = 207
                      Top = 126
                      Width = 84
                      Height = 21
                      Hint = 'Natureza de Opera'#231#227'o Externa para N'#227'o Contribuinte'
                      DataField = 'NATOP_EXT_NC'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 6
                      OnKeyDown = DBEdit6KeyDown
                    end
                    object DBEdit4: TDBEdit
                      Left = 207
                      Top = 101
                      Width = 84
                      Height = 21
                      Hint = 'ICMS Interno para N'#227'o Contribuinte'
                      DataField = 'ICM_INT'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 4
                    end
                    object DBEdit2: TDBEdit
                      Left = 207
                      Top = 77
                      Width = 84
                      Height = 21
                      Hint = 'Natureza de Opera'#231#227'o Interna para N'#227'o Contribuinte'
                      DataField = 'NATOP_INT_NC'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 2
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 207
                      Top = 12
                      Width = 241
                      Height = 21
                      Hint = 'Estado de Origem'
                      DataField = 'CODIGO_UF'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      KeyField = 'CODIGO_UF'
                      ListField = 'NOME_UF'
                      ListSource = DtmCadBasicos.dsCfopUFOrigem
                      TabOrder = 0
                      OnExit = DBLookupComboBox2Exit
                    end
                    object DBEdit3: TDBEdit
                      Left = 478
                      Top = 77
                      Width = 84
                      Height = 21
                      Hint = 'Natureza de Opera'#231#227'o Interna para Contribuinte'
                      DataField = 'NATOP_INT_C'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 3
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 478
                      Top = 103
                      Width = 84
                      Height = 21
                      Hint = 'ICMS Interno para Contribuinte'
                      DataField = 'ICM_INT_C'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 478
                      Top = 126
                      Width = 84
                      Height = 21
                      Hint = 'Natureza de Opera'#231#227'o Externa para Contribuinte'
                      DataField = 'NATOP_EXT_C'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 7
                      OnKeyDown = DBEdit7KeyDown
                    end
                    object DBEdit9: TDBEdit
                      Left = 478
                      Top = 152
                      Width = 84
                      Height = 21
                      Hint = 'ICMS Externo para Contribuinte'
                      DataField = 'ICM_EXT_C'
                      DataSource = DtmCadBasicos.dsCFOPMud
                      TabOrder = 9
                    end
                  end
                  object Panel4: TPanel
                    Left = 0
                    Top = 185
                    Width = 771
                    Height = 41
                    Align = alTop
                    TabOrder = 1
                    ExplicitWidth = 777
                    object SpeedButton16: TSpeedButton
                      Left = 48
                      Top = 6
                      Width = 36
                      Height = 25
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000E30E0000E30E0000000100000001000010630000006B
                        0000086B00000073000008730000007B0000107B000000840000088400001084
                        0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                        000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                        000008630800087B0800107B080010840800008C0800088C0800009408001094
                        0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                        1000187B10001084100018841000088C1000188C1000109410001894100010D6
                        100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                        18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                        210018842100189421002194210029A521001873290029AD290031DE290029E7
                        290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                        420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                        63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                        7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                        C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                        DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                        772F4F777777777777777777777777777712394F777777777777777777777777
                        770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
                        131F0A4457294F777777225840161413100A1E073957344F7777215817151413
                        120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
                        12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
                        240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
                        770E0A082D4F7777777777777777777777213B384F7777777777777777777777
                        770E3B4F77777777777777777777777777444F77777777777777}
                      OnClick = SpeedButton16Click
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 9
                      Top = 6
                      Width = 36
                      Height = 25
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000E30E0000E30E0000000100000001000010630000006B
                        0000086B00000073000008730000007B0000107B000000840000088400001084
                        0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
                        000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
                        000008630800087B0800107B080010840800008C0800088C0800009408001094
                        0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
                        1000187B10001084100018841000088C1000188C1000109410001894100010D6
                        100018D61000107B1800187B18001884180029841800108C1800188C1800218C
                        18001094180018941800189C1800219C180010C6180018C6180018D61800187B
                        210018842100189421002194210029A521001873290029AD290031DE290029E7
                        290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
                        420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
                        63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
                        7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
                        C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
                        DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
                        774F2F777777777777777777777777774F39127777777777777777777777774F
                        353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
                        440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
                        071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
                        071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
                        070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
                        080A0E7777777777777777777777774F383B2177777777777777777777777777
                        4F3B0E77777777777777777777777777774F4477777777777777}
                      OnClick = SpeedButton15Click
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS033]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS034]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnShow = TabSheet2Show
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS028]'
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
            inherited Splitter1: TSplitter
              ExplicitHeight = 402
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATOP_INT_NC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICM_INT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATOP_INT_C'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICM_INT_C'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATOP_EXT_NC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATOP_EXT_C'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICM_EXT_NC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ICM_EXT_C'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UF_DESTINO'
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
                Hint = 'Editar Registro - [BAS029]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS030]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS032]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
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
                Hint = 'Ver registros da lixeira - [BAS031]'
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
          ExplicitWidth = 783
          ExplicitHeight = 510
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
