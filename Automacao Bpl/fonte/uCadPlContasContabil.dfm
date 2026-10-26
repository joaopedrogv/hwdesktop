inherited frmPlContasContabil: TfrmPlContasContabil
  ActiveControl = ComboBox1
  Caption = 'Plano de Contas Cont'#225'bil'
  ClientWidth = 759
  ExplicitWidth = 767
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 759
    ExplicitWidth = 759
    inherited PanelLeft: TPanel
      Width = 754
      ExplicitWidth = 754
      inherited PageControl1: TPageControl
        Width = 752
        ExplicitWidth = 752
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 744
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            Width = 744
            ExplicitWidth = 744
            inherited PageControl3: TPageControl
              Width = 744
              ExplicitWidth = 744
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 736
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  Width = 736
                  ExplicitWidth = 736
                  inherited GroupBox1: TGroupBox
                    Width = 732
                    Height = 427
                    Align = alClient
                    Caption = 'Plano de Contas Cont'#225'bil'
                    ExplicitWidth = 732
                    ExplicitHeight = 427
                    object Label6: TLabel
                      Left = 40
                      Top = 61
                      Width = 92
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Codigo (COD_CTA)'
                      FocusControl = DBEdit1
                    end
                    object Label8: TLabel
                      Left = 39
                      Top = 88
                      Width = 93
                      Height = 13
                      Caption = 'Descri'#231#227'o da Conta'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 66
                      Top = 115
                      Width = 66
                      Height = 13
                      Caption = 'Cod Natureza'
                    end
                    object Label10: TLabel
                      Left = 87
                      Top = 142
                      Width = 45
                      Height = 13
                      Caption = 'Indicador'
                    end
                    object Label11: TLabel
                      Left = 109
                      Top = 169
                      Width = 23
                      Height = 13
                      Caption = 'N'#237'vel'
                      FocusControl = DBEdit6
                    end
                    object Label28: TLabel
                      Left = 16
                      Top = 196
                      Width = 116
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Montar no arquivo SPED'
                    end
                    object Label31: TLabel
                      Left = 14
                      Top = 223
                      Width = 118
                      Height = 13
                      Caption = 'Conta Referenciada RFB'
                      FocusControl = DBEdit4
                    end
                    object Label32: TLabel
                      Left = 8
                      Top = 269
                      Width = 124
                      Height = 13
                      Caption = ' CNPJ do estabelecimento'
                      FocusControl = DBEdit8
                    end
                    object Label33: TLabel
                      Left = 138
                      Top = 247
                      Width = 421
                      Height = 13
                      Caption = 
                        '*C'#243'digo da conta correlacionada no Plano de Contas Referenciado,' +
                        ' publicado pela RFB.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 138
                      Top = 293
                      Width = 552
                      Height = 13
                      Caption = 
                        '*CNPJ do estabelecimento, no caso da conta informada no campo CO' +
                        'D_CTA ser espec'#237'fica de um estabelecimento.'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label35: TLabel
                      Left = 18
                      Top = 315
                      Width = 114
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Contabilidade/Contador'
                      FocusControl = DBEdit8
                    end
                    object DBEdit1: TDBEdit
                      Left = 138
                      Top = 58
                      Width = 288
                      Height = 21
                      Hint = 'C'#243'digo da Conta Cont'#225'bil'
                      DataField = 'COD_CTA'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 0
                    end
                    object DBEdit3: TDBEdit
                      Left = 138
                      Top = 85
                      Width = 567
                      Height = 21
                      Hint = 'Descri'#231#227'o da Conta Cont'#225'bil'
                      DataField = 'NOME_CTA'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 1
                    end
                    object DBEdit6: TDBEdit
                      Left = 138
                      Top = 166
                      Width = 134
                      Height = 21
                      Hint = 'N'#237'vel da Conta'
                      DataField = 'NIVEL'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 4
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 138
                      Top = 112
                      Width = 288
                      Height = 21
                      Hint = 'Natureza da Conta'
                      DataField = 'COD_NAT_CC'
                      DataSource = dtmCIAP.dsPlContasC
                      ItemHeight = 0
                      Items.Strings = (
                        '01 - Contas de ativo;'
                        '02 - Contas de passivo;'
                        '03 - Patrim'#244'nio l'#237'quido;'
                        '04 - Contas de resultado;'
                        '05 - Contas de compensa'#231#227'o;'
                        '09 - Outras.')
                      TabOrder = 2
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 138
                      Top = 139
                      Width = 288
                      Height = 21
                      Hint = 'Indicados da Conta: Analitica / Sint'#233'tica'
                      DataField = 'IND_CTA'
                      DataSource = dtmCIAP.dsPlContasC
                      ItemHeight = 0
                      Items.Strings = (
                        'S - Sint'#233'tica (grupo de contas);'
                        'A - Anal'#237'tica (conta).')
                      TabOrder = 3
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 138
                      Top = 193
                      Width = 134
                      Height = 21
                      Style = csDropDownList
                      DataField = 'SPED'
                      DataSource = dtmCIAP.dsPlContasC
                      ItemHeight = 0
                      Items.Strings = (
                        'S'
                        'N')
                      TabOrder = 5
                    end
                    object DBEdit4: TDBEdit
                      Left = 138
                      Top = 220
                      Width = 567
                      Height = 21
                      DataField = 'COD_CTA_REF'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 6
                    end
                    object DBEdit8: TDBEdit
                      Left = 138
                      Top = 266
                      Width = 186
                      Height = 21
                      DataField = 'CNPJ_EST'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 7
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 138
                      Top = 312
                      Width = 567
                      Height = 21
                      DataField = 'COD_CONTADOR'
                      DataSource = dtmCIAP.dsPlContasC
                      TabOrder = 8
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Width = 744
              ExplicitWidth = 744
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 744
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Width = 744
            ExplicitWidth = 744
            inherited imgInformation: TImage
              Left = 718
              ExplicitLeft = 718
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [SPED061]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [SPED062]'
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
            Width = 744
            ExplicitWidth = 744
            inherited DBGrid1: TDBGrid
              Width = 451
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CTA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CTA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_NAT_CC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IND_CTA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NIVEL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_ALT'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 740
              ExplicitWidth = 740
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [SPED063]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [SPED064]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [SPED066]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Modificar dados da Conta em Grupo - [SPED067]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000F30E0000F30E00000001000000010000EF9C2100636B
                  6B00FFB56B008C8C8C00949494009C9C94009C9C9C00A5A5A500ADADAD00ADB5
                  B500B5B5B500D6D6D600DEDEDE00E7E7E700EFEFEF000073F700F7F7F700FF00
                  FF0010F7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                  1111111111111111111111111111111111111111110101010101010101010101
                  0101010101011111111111111103131313131313131313131313131313031111
                  1111111111041302020202020202020202020202130411111111111111041302
                  1313130213131302131313021304111111111111110413021313130213131302
                  1313130213041111111111111104130213131302131313021313130213041111
                  111111111104130F0F0F0F0F0F0F0F0F0F0F0F0F13041111111111111105130F
                  1212120F1212120F1212120F13051111111111111106130F1212120F1212120F
                  1212120F13061111111111111107130F1212120F1212120F1212120F13071111
                  111111111107100F0F0F0F0F0F0F0F0F0F0F0F0F100711111111111111071000
                  131313001313130013131300100711111111111111080E000E0E0E000E0E0E00
                  0E0E0E000E0811111111111111080D000D0D0D000D0D0D000D0D0D000D081111
                  1111111111080D000000000000000000000000000D0811111111111111090C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C09111111111111110A0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0A111111111111110A0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A1111
                  11111111110A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A11111111111111111111
                  1111111111111111111111111111111111111111111111111111111111111111
                  1111111111111111111111111111111111111111111111111111111111111111
                  1111111111111111111111111111111111111111111111111111}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 
                  'Rela'#231#227'o de CST de PIS COFISN com os tipo de opera'#231#245'es - [SPED081' +
                  ']'
                Caption = 'CST'
                Font.Charset = ANSI_CHARSET
                Font.Height = -16
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsUnderline]
                ParentFont = False
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Importar arquivo de Texto - [SPED068]'
                Glyph.Data = {
                  AE030000424DAE030000000000006E0100002800000018000000180000000100
                  08000000000040020000120B0000120B00004E0000004E00000000000000FFFF
                  FF00FF00FF0001560300068C0D00058C0D000790100007901100099213000B97
                  18000B9516000D981A000D9A1C000F9D1E00119F200011A0230013A3250015A4
                  280016A62B0018A92D001BAD33001DB035001FB2390023B63F0024B8420026BB
                  44002DC451002CC14E002FC5540032C95A0035CB5C0035CC5F0036CE620098D7
                  FF009AD8FF009AD9FF009CD9FF009CDAFF00A7DEFF0041B0FE0042B1FE0043B2
                  FE0044B4FE0046B6FE0096D4FF0097D4FF0097D5FF0098D5FF003EABFE003FAC
                  FE0040ADFE0041AFFE0091CFFF0092D0FF0093D1FF0095D3FF0038A4FE003AA6
                  FE003CA9FE00E0EFFB00339DFE00359FFE0036A1FE004786C1001F6FC1002070
                  C1002172C1002D96FF002273C1002374C1002F98FF00319AFF001F6EC1002C93
                  FF00DCEBFB000D5DC9000D3F7E001F81FF000202020202020202020202020203
                  0202020202020202020202020202020202020202020203030202020202020202
                  0202020202020202020202020203080302020202020202020202020202020202
                  0202020203100C0303030303030303020202020202020202020202031714110D
                  0A0605050505030202020202020202020202031D1B1815120E09070505050302
                  0202020202020202020202031E1A1916130F0B08040503020202024B4B4B4B4B
                  4B4B4C02031F1C03030303030303034B4B024B343D3C474643494C0202032003
                  02024A4D4D4D4D4D4D4B4B353E3D3C4746434C020202030302024A4D4D4D4D4D
                  4D4B4B36383E3D3C47464C020202020302024A4D4D4D4D4D4D4B4B3739383E3D
                  3C474C020202020202024A4D4D4D4D4D4D4B4B2C3A39383E3D3C4C0202020202
                  02024A4D4D4D4D4D4D4B4B2E303A39383E3D4C020202020202024A4D4D4D4D4D
                  4D4B4B2132303A39383E4C020202020202024A4A4A4A4A4A4A4A4B3F45444241
                  40484C4C4C4C4C4C4C4C4C020202020202024B23292732303A39483E3D3C4746
                  43494B020202020202024B242A292732303A40383E3D3C4746434B0202020202
                  02024B252B2A282732304139383E3D3C47464B020202020202024B252B2B2A28
                  3331423A39383E3D3C474B020202020202024B252B2B2B2A283344303A39383E
                  3D3C4B020202020202024B262B2B2B2B2A284531303A39383E3D4B0202020202
                  02024B3B2625252524223F2F2D2C373635344B02020202020202024B4B4B4B4B
                  4B4B4B4B4B4B4B4B4B4B0202020202020202}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Configurar DRE comparativo com a Contabilidade'
                Caption = 'DRE'
                Font.Height = -16
                Font.Name = 'Times New Roman'
                Font.Style = [fsBold, fsUnderline]
                ParentFont = False
                OnClick = SpeedButton11Click
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
          ExplicitWidth = 744
          ExplicitHeight = 510
        end
        object tsModGrupo: TTabSheet
          Caption = 'tsModGrupo'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnModGrupo: TPanel
            Left = 0
            Top = 3
            Width = 574
            Height = 214
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 16
              Top = 17
              Width = 537
              Height = 129
              Caption = 'Modificar dados selecionados com valores informados'
              TabOrder = 0
              object CheckBox2: TCheckBox
                Left = 104
                Top = 28
                Width = 75
                Height = 17
                Alignment = taLeftJustify
                Caption = 'N'#237'vel'
                TabOrder = 0
              end
              object CheckBox4: TCheckBox
                Left = 104
                Top = 56
                Width = 75
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Natureza'
                TabOrder = 1
              end
              object CheckBox5: TCheckBox
                Left = 104
                Top = 83
                Width = 75
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Indicador'
                TabOrder = 2
              end
              object SpinEdit1: TSpinEdit
                Left = 185
                Top = 26
                Width = 248
                Height = 22
                MaxValue = 999
                MinValue = 1
                TabOrder = 3
                Value = 1
              end
              object ComboBox4: TComboBox
                Left = 185
                Top = 54
                Width = 248
                Height = 21
                ItemHeight = 0
                ItemIndex = 0
                TabOrder = 4
                Text = '01 - Contas de ativo;'
                Items.Strings = (
                  '01 - Contas de ativo;'
                  '02 - Contas de passivo;'
                  '03 - Patrim'#244'nio l'#237'quido;'
                  '04 - Contas de resultado;'
                  '05 - Contas de compensa'#231#227'o;'
                  '09 - Outras.')
              end
              object ComboBox5: TComboBox
                Left = 185
                Top = 81
                Width = 248
                Height = 21
                ItemHeight = 0
                ItemIndex = 0
                TabOrder = 5
                Text = 'S - Sint'#233'tica (grupo de contas);'
                Items.Strings = (
                  'S - Sint'#233'tica (grupo de contas);'
                  'A - Anal'#237'tica (conta).')
              end
            end
            object Panel5: TPanel
              Left = 16
              Top = 152
              Width = 537
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 189
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Continuar'
                TabOrder = 0
                OnClick = BitBtn7Click
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
              object BitBtn8: TBitBtn
                Left = 270
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn8Click
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
        object tsImportacao: TTabSheet
          Caption = 'tsImportacao'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnImportacao: TPanel
            Left = 0
            Top = 3
            Width = 697
            Height = 454
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 16
              Top = 13
              Width = 113
              Height = 13
              Caption = 'Arquivo: C:\arquivo.txt'
            end
            object GroupBox5: TGroupBox
              Left = 16
              Top = 166
              Width = 662
              Height = 228
              Caption = 'Script de manuten'#231#227'o dos registros constantes no TXT'
              TabOrder = 1
              object Memo1: TMemo
                Left = 14
                Top = 24
                Width = 634
                Height = 193
                ScrollBars = ssBoth
                TabOrder = 0
                WordWrap = False
              end
            end
            object Panel6: TPanel
              Left = 16
              Top = 400
              Width = 662
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn9: TBitBtn
                Left = 251
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Continuar'
                TabOrder = 0
                OnClick = BitBtn9Click
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
              object BitBtn10: TBitBtn
                Left = 332
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn10Click
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
            object GroupBox6: TGroupBox
              Left = 16
              Top = 32
              Width = 662
              Height = 97
              Caption = 'Layout'
              TabOrder = 0
              object Label12: TLabel
                Left = 55
                Top = 16
                Width = 51
                Height = 13
                Caption = 'Cod Conta'
              end
              object Label13: TLabel
                Left = 154
                Top = 16
                Width = 46
                Height = 13
                Caption = 'Descri'#231#227'o'
              end
              object Label14: TLabel
                Left = 251
                Top = 16
                Width = 44
                Height = 13
                Caption = 'Natureza'
              end
              object Label15: TLabel
                Left = 360
                Top = 16
                Width = 29
                Height = 13
                Caption = 'Indice'
              end
              object Label16: TLabel
                Left = 461
                Top = 16
                Width = 23
                Height = 13
                Caption = 'Nivel'
              end
              object Label17: TLabel
                Left = 34
                Top = 40
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label18: TLabel
                Left = 15
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object Label19: TLabel
                Left = 128
                Top = 44
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label20: TLabel
                Left = 109
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object Label21: TLabel
                Left = 223
                Top = 40
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label22: TLabel
                Left = 204
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object Label23: TLabel
                Left = 317
                Top = 40
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label24: TLabel
                Left = 298
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object Label25: TLabel
                Left = 412
                Top = 40
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label26: TLabel
                Left = 393
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object Label36: TLabel
                Left = 533
                Top = 16
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conta Ref RFB'
              end
              object Label37: TLabel
                Left = 532
                Top = 40
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Inicio'
              end
              object Label38: TLabel
                Left = 513
                Top = 63
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tamanho'
              end
              object SpinEdit2: TSpinEdit
                Left = 65
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 0
                Value = 0
              end
              object SpinEdit3: TSpinEdit
                Left = 65
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 1
                Value = 0
              end
              object SpinEdit4: TSpinEdit
                Left = 159
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 2
                Value = 0
              end
              object SpinEdit5: TSpinEdit
                Left = 159
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 3
                Value = 0
              end
              object SpinEdit6: TSpinEdit
                Left = 254
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 4
                Value = 0
              end
              object SpinEdit7: TSpinEdit
                Left = 254
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 5
                Value = 0
              end
              object SpinEdit8: TSpinEdit
                Left = 348
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 6
                Value = 0
              end
              object SpinEdit9: TSpinEdit
                Left = 348
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 7
                Value = 0
              end
              object SpinEdit10: TSpinEdit
                Left = 443
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 8
                Value = 0
              end
              object SpinEdit11: TSpinEdit
                Left = 443
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 9
                Value = 0
              end
              object SpinEdit12: TSpinEdit
                Left = 563
                Top = 35
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 10
                Value = 0
              end
              object SpinEdit13: TSpinEdit
                Left = 563
                Top = 59
                Width = 41
                Height = 22
                MaxValue = 0
                MinValue = 0
                TabOrder = 11
                Value = 0
              end
            end
            object BitBtn11: TBitBtn
              Left = 303
              Top = 135
              Width = 75
              Height = 25
              Caption = 'Montar'
              TabOrder = 3
              OnClick = BitBtn11Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
                000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
                FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FFFF00FF000000FF
                00FF000000FF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF000000
                FF00FF000000FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FFFF00
                FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FF000000000000FF
                00FF000000FF00FF000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FF
                000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
                FF000000FF00FFFF00FFFF00FF8080808D5E5D8D5E5D8D5E5D8D5E5D8D5E5D8D
                5E5D8D5E5D8D5E5D8D5E5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
                FFFAEBF9F1E2F9F0DFF7EEDCF7EEDBF7EDDAF8EFDBF2E5D18E5F5EFF00FFFF00
                FFC00000FF00FFFF00FFFF00FF808080F9F1E4F5E2CDF5E0CAF4DFC9F3DEC5F2
                DDC3F2E2CDEBDBC98E5F5EFF00FFFF0000FF0000C00000FF00FFFF00FF808080
                FCF5EAFCD8B5FCD8B4FCD8B3FBD7B3FBD7B2FADAB8EBDECE926462FF0000FF00
                00FF0000FF0000C00000FF00FF808080FEFBF5FDD2A7FDD2A7FDD2A7FDD2A7FD
                D2A7FDD2A7F0E5DAA57A75FF00FFFF0000FF0000C00000FF00FFFF00FF808080
                FFFDFBFDEAD8FCE7D4FBE6D3FAE6D1FDE9D3FDF4E6E8E0D9C00000C00000FF00
                00FF0000C00000FF00FFFF00FF808080FFFFFFFDD2A7FDD2A7FDD2A7FDD2A7EB
                DFDBFF0000FF0000FF0000FF0000FF0000FF0000C00000FF00FFFF00FF808080
                FFFFFFFCE7D4FCE7D4FCE7D4FCE7D4B48E88B48E88B48E88B48E88FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
                8E88EBB56FC68C78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
                808080808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
        end
        object tsLog: TTabSheet
          Caption = 'tsLog'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnLog: TPanel
            Left = 3
            Top = 3
            Width = 694
            Height = 390
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Memo2: TMemo
              Left = 8
              Top = 8
              Width = 673
              Height = 337
              Lines.Strings = (
                'Memo2')
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
              WordWrap = False
            end
            object BitBtn12: TBitBtn
              Left = 308
              Top = 351
              Width = 75
              Height = 25
              Caption = 'OK'
              TabOrder = 0
              OnClick = BitBtn12Click
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
        object tsCSTRel: TTabSheet
          Caption = 'tsCSTRel'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnCSTRel: TPanel
            Left = 3
            Top = 3
            Width = 662
            Height = 246
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox7: TGroupBox
              Left = 8
              Top = 8
              Width = 641
              Height = 177
              Caption = 'Rela'#231#227'o'
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 637
                Height = 160
                Align = alClient
                DataSource = dtmCIAP.dsCSTRel
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CST'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SUBTIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CTA'
                    Visible = True
                  end>
              end
            end
            object Panel4: TPanel
              Left = 10
              Top = 191
              Width = 639
              Height = 41
              BevelKind = bkFlat
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn142: TBitBtn
                Left = 199
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Incluir'
                TabOrder = 0
                OnClick = BitBtn142Click
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
              object BitBtn143: TBitBtn
                Left = 280
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Alterar'
                TabOrder = 1
                OnClick = BitBtn143Click
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
              object BitBtn144: TBitBtn
                Left = 361
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Excluir'
                TabOrder = 2
                OnClick = BitBtn144Click
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
              object BitBtn140: TBitBtn
                Left = 552
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
                TabOrder = 3
                OnClick = BitBtn140Click
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
          object pnCSTCadastro: TPanel
            Left = 3
            Top = 255
            Width = 518
            Height = 218
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 1
            object Label27: TLabel
              Left = 32
              Top = 25
              Width = 79
              Height = 13
              Caption = 'CST PIS COFINS'
            end
            object Label29: TLabel
              Left = 70
              Top = 108
              Width = 41
              Height = 13
              Caption = 'Sub Tipo'
              FocusControl = DBEdit5
            end
            object Label30: TLabel
              Left = 39
              Top = 135
              Width = 72
              Height = 13
              Caption = 'Conta Anal'#237'tica'
              FocusControl = DBEdit7
            end
            object Panel127: TPanel
              Left = 0
              Top = 173
              Width = 514
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 4
              object BitBtn148: TBitBtn
                Left = 177
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para salvar o item'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = BitBtn148Click
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
              object BitBtn149: TBitBtn
                Left = 258
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn149Click
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
            object DBEdit5: TDBEdit
              Left = 117
              Top = 105
              Width = 364
              Height = 21
              DataField = 'SUBTIPO'
              DataSource = dtmCIAP.dsCSTRel
              Enabled = False
              TabOrder = 2
            end
            object DBEdit7: TDBEdit
              Left = 117
              Top = 132
              Width = 364
              Height = 21
              DataField = 'COD_CTA'
              DataSource = dtmCIAP.dsCSTRel
              TabOrder = 3
              OnKeyDown = DBEdit7KeyDown
            end
            object DBComboBox3: TDBComboBox
              Left = 117
              Top = 22
              Width = 364
              Height = 21
              DataField = 'CST'
              DataSource = dtmCIAP.dsCSTRel
              ItemHeight = 0
              Items.Strings = (
                '01 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota B'#225'sica'
                '02 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota Diferenciada'
                
                  '03 - Opera'#231#227'o Tribut'#225'vel com Al'#237'quota por Unidade de Medida de P' +
                  'roduto'
                '04 - Opera'#231#227'o Tribut'#225'vel Monof'#225'sica - Revenda a Al'#237'quota Zero'
                '05 - Opera'#231#227'o Tribut'#225'vel por Substitui'#231#227'o Tribut'#225'ria'
                '06 - Opera'#231#227'o Tribut'#225'vel a Al'#237'quota Zero'
                '07 - Opera'#231#227'o Isenta da Contribui'#231#227'o'
                '08 - Opera'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                '09 - Opera'#231#227'o com Suspens'#227'o da Contribui'#231#227'o'
                '49 - Outras Opera'#231#245'es de Sa'#237'da'
                
                  '50 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                  ' Receita Tributada no Mercado Interno'
                
                  '51 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                  ' Receita N'#227'o Tributada no Mercado Interno'
                
                  '52 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada Exclusivamente a' +
                  ' Receita de Exporta'#231#227'o'
                
                  '53 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                  'tadas e N'#227'o-Tributadas no Mercado Interno'
                
                  '54 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                  'tadas no Mercado Interno e de Exporta'#231#227'o'
                
                  '55 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas N'#227'o-T' +
                  'ributadas no Mercado Interno e de Exporta'#231#227'o'
                
                  '56 - Opera'#231#227'o com Direito a Cr'#233'dito - Vinculada a Receitas Tribu' +
                  'tadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta'#231#227'o'
                
                  '60 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                  'vamente a Receita Tributada no Mercado Interno'
                
                  '61 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                  'vamente a Receita N'#227'o-Tributada no Mercado Interno'
                
                  '62 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada Exclusi' +
                  'vamente a Receita de Exporta'#231#227'o'
                
                  '63 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                  'tas Tributadas e N'#227'o-Tributadas no Mercado Interno'
                
                  '64 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                  'tas Tributadas no Mercado Interno e de Exporta'#231#227'o'
                
                  '65 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                  'tas N'#227'o-Tributadas no Mercado Interno e de Exporta'#231#227'o'
                
                  '66 - Cr'#233'dito Presumido - Opera'#231#227'o de Aquisi'#231#227'o Vinculada a Recei' +
                  'tas Tributadas e N'#227'o-Tributadas no Mercado Interno, e de Exporta' +
                  #231#227'o'
                '67 - Cr'#233'dito Presumido - Outras Opera'#231#245'es'
                '70 - Opera'#231#227'o de Aquisi'#231#227'o sem Direito a Cr'#233'dito'
                '71 - Opera'#231#227'o de Aquisi'#231#227'o com Isen'#231#227'o'
                '72 - Opera'#231#227'o de Aquisi'#231#227'o com Suspens'#227'o'
                '73 - Opera'#231#227'o de Aquisi'#231#227'o a Al'#237'quota Zero'
                '74 - Opera'#231#227'o de Aquisi'#231#227'o sem Incid'#234'ncia da Contribui'#231#227'o'
                '75 - Opera'#231#227'o de Aquisi'#231#227'o por Substitui'#231#227'o Tribut'#225'ria'
                '98 - Outras Opera'#231#245'es de Entrada'
                '99 - Outras Opera'#231#245'es')
              TabOrder = 0
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 117
              Top = 49
              Width = 364
              Height = 50
              Caption = 'Tipo'
              Columns = 4
              DataField = 'TIPO'
              DataSource = dtmCIAP.dsCSTRel
              Items.Strings = (
                'Produtos'
                'Ve'#237'culos'
                'Servi'#231'os'
                'Outros')
              ParentBackground = True
              TabOrder = 1
              Values.Strings = (
                'P'
                'V'
                'S'
                'O')
            end
          end
        end
        object tsDRE: TTabSheet
          Caption = 'tsDRE'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnConfigDRE: TPanel
            Left = 3
            Top = 3
            Width = 694
            Height = 494
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            OnEnter = pnConfigDREEnter
            object GroupBox8: TGroupBox
              Left = 6
              Top = 6
              Width = 678
              Height = 139
              Align = alTop
              Caption = 'Configurar'
              TabOrder = 0
              object DBRadioGroup2: TDBRadioGroup
                Left = 11
                Top = 16
                Width = 110
                Height = 52
                Caption = 'Sinal da Conta'
                Columns = 2
                DataField = 'SINAL'
                DataSource = DataSource1
                Items.Strings = (
                  '+'
                  '-')
                ParentBackground = True
                TabOrder = 0
                Values.Strings = (
                  '+'
                  '-')
              end
              object DBRadioGroup3: TDBRadioGroup
                Left = 127
                Top = 16
                Width = 110
                Height = 52
                Caption = 'Conta de Soma'
                Columns = 2
                DataField = 'SOMARGRUPO'
                DataSource = DataSource1
                Items.Strings = (
                  'S'
                  'N')
                ParentBackground = True
                TabOrder = 1
                Values.Strings = (
                  'S'
                  'N')
              end
              object GroupBox10: TGroupBox
                Left = 11
                Top = 74
                Width = 647
                Height = 52
                Caption = 'F'#243'rmula'
                TabOrder = 3
                OnEnter = GroupBox10Enter
                OnExit = GroupBox10Exit
                object SpeedButton16: TSpeedButton
                  Left = 612
                  Top = 17
                  Width = 23
                  Height = 22
                  Hint = 'Validar f'#243'rmula'
                  Flat = True
                  Glyph.Data = {
                    DE010000424DDE01000000000000DE0000002800000010000000100000000100
                    08000000000000010000120B0000120B00002A0000002A00000000000000FFFF
                    FF00FF00FF009933000000920000008E000000800000006D0000006C0000006A
                    0000006600000065000000670100016702000166020002750300026D0400026D
                    050005A70A00079E0E000990100006700C0007780E000A9D1300098D12000874
                    0E000A801300097513000B7D16000B7B16000E9C1D000D871C000F821D0014AA
                    2A001189230015A52B00169E2E0017982E001BAF37001B9D380028BE51002BBE
                    5700020202020202020202020708020202020202020202020202020904060202
                    02020202020202020202101712050B0202020202020202020215262114130F02
                    02020202020202021B2928160E1E1802020202020202020202272002021A2311
                    0202020202020202020202020202241F02020202020202020202020202021C25
                    020202020202020202020202020202221D020202020202020202020202020202
                    190203020203020303030202020303020D0C0302020302030202030203020203
                    020A030303030203030303020302020202020302020302030202030203020203
                    0202020303020203030302020203030202020202020202020202020202020202
                    0202}
                  OnClick = SpeedButton16Click
                end
                object DBEdit2: TDBEdit
                  Left = 16
                  Top = 20
                  Width = 561
                  Height = 21
                  DataField = 'FORMULA'
                  DataSource = DataSource1
                  TabOrder = 0
                end
                object BitBtn20: TBitBtn
                  Left = 583
                  Top = 17
                  Width = 23
                  Height = 22
                  TabOrder = 1
                  OnClick = BitBtn20Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000D30E0000D30E00000001000000010000181810001818
                    18002929290031313100313931004A39310039393900423939004A423900524A
                    3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                    5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                    73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                    8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                    8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                    9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                    9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                    A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                    AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                    AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                    BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                    C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                    CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                    D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                    E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                    8080808080808080808080808080808080808080808052068080808080808080
                    8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                    808080471134612A80808080808080808080581634522A808080808080343434
                    34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                    7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                    386B1A18808080808080344271634444646C271F808080808080494056647474
                    5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                    4541588080808080808080803C3F453A53358080808080808080}
                end
              end
              object DBRadioGroup4: TDBRadioGroup
                Left = 243
                Top = 7
                Width = 415
                Height = 68
                Caption = 'Tipo de Conta'
                Columns = 4
                DataField = 'TIPO_REL'
                DataSource = DataSource1
                Items.Strings = (
                  'Receita Geral'
                  'Receita Produtos'
                  'Receita Servi'#231'os'
                  'Receita Ve'#237'culos'
                  'Devolu'#231#245'es'
                  'Custo'
                  'Cr'#233'dito PIS'
                  'Cr'#233'dito COFINS'
                  'Cr'#233'dito ICMS'
                  'D'#233'bito PIS'
                  'D'#233'bito COFINS'
                  'D'#233'bito ICMS'
                  'Outros')
                ParentBackground = True
                TabOrder = 2
                Values.Strings = (
                  'RECEITA'
                  'RECEITA P'
                  'RECEITA S'
                  'RECEITA V'
                  'DEVOLUCAO'
                  'CUSTO'
                  'CR PIS'
                  'CR COFINS'
                  'CR ICMS'
                  'DB PIS'
                  'DB COFINS'
                  'DB ICMS '
                  'OUTRAS')
              end
            end
            object GroupBox9: TGroupBox
              Left = 6
              Top = 145
              Width = 678
              Height = 298
              Align = alClient
              Caption = 'Visualiza'#231#227'o'
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 577
                Height = 281
                Align = alClient
                DataSource = DataSource1
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                PopupMenu = PopupMenu3
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
                    FieldName = 'NOME_CTA'
                    Title.Caption = 'Conta'
                    Width = 256
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_CTA'
                    Title.Caption = 'Codigo'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL'
                    Title.Caption = 'Nivel'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_REL'
                    Title.Caption = 'Tipo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SINAL'
                    Title.Caption = 'Sinal'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULA'
                    Title.Caption = 'Formula'
                    Width = 200
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SOMAGRUPO'
                    Title.Caption = 'Grupo de Soma'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ORDEM'
                    Visible = True
                  end>
              end
              object Panel8: TPanel
                Left = 579
                Top = 15
                Width = 97
                Height = 281
                Align = alRight
                BevelKind = bkTile
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 1
                object BitBtn13: TBitBtn
                  Left = 6
                  Top = 106
                  Width = 81
                  Height = 25
                  Align = alTop
                  Caption = 'Remover'
                  TabOrder = 0
                  OnClick = BitBtn13Click
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
                object BitBtn14: TBitBtn
                  Left = 6
                  Top = 56
                  Width = 81
                  Height = 50
                  Align = alTop
                  Caption = 'Inserir abaixo'
                  TabOrder = 1
                  WordWrap = True
                  OnClick = BitBtn14Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000320B0000320B0000000100000001000084000000C600
                    0000EFA54A00C6846B00BD8C7300CE947300EFB57300FFC67300BD847B00C694
                    7B00CE9C7B0084848400B5848400B58C8400CE9C840084FF8400B5948C00C6A5
                    9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                    A500F7D6A500C6BDAD00F7D6AD00DEBDB500DEC6B500E7C6B500EFC6B500EFCE
                    B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
                    C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                    DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0037370C0C0C0C
                    0C0C0C0C0C0C0C0C0C37373714302926231C1A15121212170C37373714300B0B
                    0B0B0B0B0B0B0B150C37373718322E2C2826221C151512150C37003718332E2C
                    292823221C1515120C37000000360B0B0B0B0B0B0B0B0B150C37000000000F0F
                    0F0F0F0F0F0F0F0F0C37010101010F0F0F0F0F0F0F0F0F0F0C37010101380B0B
                    0B0B0B0B0B0B0B230C3701371D3838383532312E2C2828220C3737371E383838
                    383532313130271B0C3737371F380B0B0B0B0B342E11100D0C3737371F383838
                    383838362A0406020337373725383838383838382B090705373737371F353434
                    343434342A090E37373737371F212121211F1F211D0837373737}
                  Layout = blGlyphTop
                end
                object Panel9: TPanel
                  Left = 6
                  Top = 192
                  Width = 81
                  Height = 79
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object SpeedButton9: TSpeedButton
                    Left = 26
                    Top = 3
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                      1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                      BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                      007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                      4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                      F05E00E15800D15200C74E00C04B00B64700AF4400AA4200A74100A54100AF44
                      00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300CA4F00C2
                      4C00BB4900B14500AA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                      FF7A16FF6C06FFFFFFFFFFFFD75400CF5100C74E00BD4A00FFFFFFFFFFFFAF44
                      00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFFFFFFFFFFFFFFFFFFDC
                      5600D45300FFFFFFFFFFFFFFFFFFB647009C3D00511F00FF00FFFF00FFCA4F00
                      FF9F4EFF7D19FF6A04FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC24C00C04B
                      00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FF6E08FF6601FEFEFEFF
                      FFFFFFFFFFFFFFFFD95500CF5100CC5000B145006A2900FF00FFFF00FFCA4F00
                      FFAD67FF8A2DFF7813FF730DFF6903FFFFFFFFFFFFEE5D00E65A00DE5700D955
                      00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FF720CFF
                      6B05FF6A04FF6400F05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                      FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                      00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                      9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                      EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                      00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    OnClick = SpeedButton9Click
                  end
                  object SpeedButton10: TSpeedButton
                    Left = 26
                    Top = 49
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                      1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                      BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                      007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                      4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                      F05E00E15800D15200C74E00C04B00B64700AF4400AA4200A74100A54100AF44
                      00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300CA4F00FF
                      FFFFFFFFFFB14500AA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                      FF7A16FF6C06F66000E35900FEFEFEFFFFFFFFFFFFFFFFFFB44600AC4300AF44
                      00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFF6601FEFEFEFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFB84800B647009C3D00511F00FF00FFFF00FFCA4F00
                      FF9F4EFF7D19FFFFFFFFFFFFFFFFFFE65A00DE5700FFFFFFFFFFFFFFFFFFC04B
                      00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FFFFFFFFFFFFF05E00EE
                      5D00EB5C00E15800FFFFFFFFFFFFCC5000B145006A2900FF00FFFF00FFCA4F00
                      FFAD67FF8A2DFF7813FF730DFF6903FF6400F86200EE5D00E65A00DE5700D955
                      00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FF720CFF
                      6B05FF6A04FF6400F05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                      FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                      00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                      9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                      EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                      00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    OnClick = SpeedButton10Click
                  end
                  object SpeedButton13: TSpeedButton
                    Left = 3
                    Top = 26
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                      1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                      BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                      007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                      4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                      F05E00E15800D15200C74E00C04B00B64700FFFFFFFFFFFFA74100A54100AF44
                      00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300CA4F00FE
                      FEFEFFFFFFFFFFFFAA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                      FF7A16FF6C06F66000E35900FEFEFEFFFFFFFFFFFFBD4A00B44600AC4300AF44
                      00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFF6601FFFFFFFFFFFFFF
                      FFFFD45300CA4F00C24C00B84800B647009C3D00511F00FF00FFFF00FFCA4F00
                      FF9F4EFF7D19FF6A04FFFFFFFFFFFFFFFFFFDE5700D45300CC5000C24C00C04B
                      00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FF6E08FF6601FFFFFFFF
                      FFFFFFFFFFE15800D95500CF5100CC5000B145006A2900FF00FFFF00FFCA4F00
                      FFAD67FF8A2DFF7813FF730DFF6903FFFFFFFFFFFFFFFFFFE65A00DE5700D955
                      00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FF720CFF
                      6B05FFFFFFFFFFFFF05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                      FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                      00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                      9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                      EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                      00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    OnClick = SpeedButton13Click
                  end
                  object SpeedButton14: TSpeedButton
                    Left = 49
                    Top = 26
                    Width = 23
                    Height = 22
                    Flat = True
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FF6C2A006828005D24005320004F1F004F
                      1F004F1F004F1F004F1F004F1F004F1F00401800FF00FFFF00FFFF00FF973B00
                      BB4900B44600AA4200A03F00993C00973B00973B00993C00993C00973B009E3E
                      007B3000401800FF00FFFF00FFB84800E35900D45300CC5000C54D00BB4900B1
                      4500AF4400AF4400AF4400AF4400B647009E3E004F1F00FF00FFFF00FFC74E00
                      F05E00E15800D15200C74E00FFFFFFFFFFFFAF4400AA4200A74100A54100AF44
                      00993C00511F00FF00FFFF00FFCA4F00FF6802F66000E35900D45300FFFFFFFF
                      FFFFFEFEFEB14500AA4200A74100AF4400993C004F1F00FF00FFFF00FFCA4F00
                      FF7A16FF6C06F66000E35900D75400FFFFFFFFFFFFFEFEFEB44600AC4300AF44
                      00993C004F1F00FF00FFFF00FFCA4F00FF9035FF750FFF6601F66000E65A00DC
                      5600FFFFFFFFFFFFFFFFFFB84800B647009C3D00511F00FF00FFFF00FFCA4F00
                      FF9F4EFF7D19FF6A04FB6300EE5D00E65A00FFFFFFFFFFFFFFFFFFC24C00C04B
                      00A34000592300FF00FFFF00FFCA4F00FFA65AFF8221FF6E08FF6601F05E00FF
                      FFFFFFFFFFFFFFFFD95500CF5100CC5000B145006A2900FF00FFFF00FFCA4F00
                      FFAD67FF8A2DFF7813FF730DFFFFFFFFFFFFFFFFFFEE5D00E65A00DE5700D955
                      00BD4A00792F00FF00FFFF00FFCA4F00FFB676FF9741FF7E1BFF7A16FFFFFFFF
                      FFFFFF6A04FF6400F05E00E95B00E65A00C74E00873500FF00FFFF00FFCA4F00
                      FFBB7FFFB472FFA456FF9A46FF9035FF8424FF7A16FF6B05F86200F05E00F05E
                      00D95500993C00FF00FFFF00FFCA4F00FFA558FFBB7FFFBD83FFB676FFAC65FF
                      9D4AFF8728FF740EFF6601F86200FB6300E35900A54100FF00FFFF00FFFF00FF
                      EE5D00FF700AFF720CFF700AFF6C06FF6601EE5D00DE5700D15200CC5000CF51
                      00B84800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    OnClick = SpeedButton14Click
                  end
                end
                object BitBtn19: TBitBtn
                  Left = 6
                  Top = 6
                  Width = 81
                  Height = 50
                  Align = alTop
                  Caption = 'Inserir acima'
                  TabOrder = 3
                  WordWrap = True
                  OnClick = BitBtn19Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000320B0000320B0000000100000001000084000000C600
                    0000EFA54A00C6846B00BD8C7300CE947300EFB57300FFC67300BD847B00C694
                    7B00CE9C7B0084848400B5848400B58C8400CE9C840084FF8400B5948C00C6A5
                    9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                    A500F7D6A500C6BDAD00F7D6AD00DEBDB500DEC6B500E7C6B500EFC6B500EFCE
                    B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
                    C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                    DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0037370C0C0C0C
                    0C0C0C0C0C0C0C0C0C37373714302926231C1A15121212170C37373714300B0B
                    0B0B0B0B0B0B0B150C37373718322E2C2826221C151512150C37003718332E2C
                    292823221C1515120C37000000360B0B0B0B0B0B0B0B0B150C37000000000F0F
                    0F0F0F0F0F0F0F0F0C37010101010F0F0F0F0F0F0F0F0F0F0C37010101380B0B
                    0B0B0B0B0B0B0B230C3701371D3838383532312E2C2828220C3737371E383838
                    383532313130271B0C3737371F380B0B0B0B0B342E11100D0C3737371F383838
                    383838362A0406020337373725383838383838382B090705373737371F353434
                    343434342A090E37373737371F212121211F1F211D0837373737}
                  Layout = blGlyphBottom
                end
              end
            end
            object Panel7: TPanel
              Left = 6
              Top = 443
              Width = 678
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn15: TBitBtn
                Left = 583
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
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
              object BitBtn16: TBitBtn
                Left = 299
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Salvar'
                TabOrder = 1
                OnClick = BitBtn16Click
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
          object pnEscolhaConta: TPanel
            Left = 713
            Top = -182
            Width = 694
            Height = 437
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 1
            object GroupBox11: TGroupBox
              Left = 6
              Top = 6
              Width = 678
              Height = 380
              Align = alClient
              Caption = 'Contas Cont'#225'beis'
              TabOrder = 0
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 674
                Height = 363
                Align = alClient
                DataSource = dtmCIAP.dsPlContasC
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid4DrawColumnCell
                OnKeyDown = DBGrid4KeyDown
                OnTitleClick = DBGrid4TitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_CTA'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_CTA'
                    Width = 256
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IND_CTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NIVEL'
                    Visible = True
                  end>
              end
            end
            object Panel10: TPanel
              Left = 6
              Top = 386
              Width = 678
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn17: TBitBtn
                Left = 554
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Voltar'
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
              object BitBtn18: TBitBtn
                Left = 293
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Selecionar'
                ModalResult = 1
                TabOrder = 1
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
                  B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
                  DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
                  4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
                  E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
                  7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
                  6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
                  4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 712
      Top = 393
      ExplicitLeft = 712
      ExplicitTop = 393
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 759
    ExplicitWidth = 759
  end
  inherited pnStatusProcessamento: TPanel
    Left = 712
    ExplicitLeft = 712
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 644
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 702
    Top = 11
  end
  inherited Timer1: TTimer
    Left = 670
    Top = 11
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = 'Arquivo de Texto (*.txt)|*.txt'
    Title = 'Selecionar Arquivo de Texto'
    Left = 704
    Top = 40
  end
  object DataSource1: TDataSource
    Left = 376
    Top = 288
  end
  object DataSource2: TDataSource
    AutoEdit = False
    Left = 408
    Top = 272
  end
  object PopupMenu3: TPopupMenu
    Left = 424
    Top = 256
    object Definircor1: TMenuItem
      Caption = 'Definir cor por n'#237'vel'
      object Fundo1: TMenuItem
        Caption = 'Fundo'
        OnClick = Fundo1Click
      end
      object Fonte1: TMenuItem
        Caption = 'Fonte'
        OnClick = Fonte1Click
      end
    end
    object DetalhesOLAP1: TMenuItem
      Caption = 'Detalhes OLAP'
    end
    object DetalhesdoRegistro1: TMenuItem
      Caption = 'Detalhes do Registro'
    end
  end
  object ColorDialog1: TColorDialog
    Left = 384
    Top = 272
  end
end
