inherited frmCadNfAlterarDados: TfrmCadNfAlterarDados
  Caption = 'Nota Fiscal - Modifica'#231#227'o de Dados'
  ClientHeight = 473
  ClientWidth = 791
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 807
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 779
      Height = 67
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 97
        Top = 8
        Width = 37
        Height = 13
        Caption = 'Num NF'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 178
        Top = 8
        Width = 16
        Height = 13
        Caption = 'E/S'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 203
        Top = 8
        Width = 20
        Height = 13
        Caption = 'Tipo'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 230
        Top = 8
        Width = 75
        Height = 13
        Caption = 'Emissao Propria'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 319
        Top = 8
        Width = 47
        Height = 13
        Caption = 'Status NF'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 400
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Situacao NF-e'
        FocusControl = DBEdit7
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 75
        Height = 21
        DataField = 'COD_NF'
        DataSource = dtmNF.dsNf
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 97
        Top = 24
        Width = 75
        Height = 21
        DataField = 'NUM_NF'
        DataSource = dtmNF.dsNf
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 178
        Top = 24
        Width = 19
        Height = 21
        DataField = 'NATUREZA_NF'
        DataSource = dtmNF.dsNf
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 203
        Top = 24
        Width = 21
        Height = 21
        DataField = 'TIPO_NF'
        DataSource = dtmNF.dsNf
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 230
        Top = 24
        Width = 83
        Height = 21
        DataField = 'EMISSAO_PROPRIA'
        DataSource = dtmNF.dsNf
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 319
        Top = 24
        Width = 75
        Height = 21
        DataField = 'STATUS'
        DataSource = dtmNF.dsNf
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 400
        Top = 24
        Width = 75
        Height = 21
        DataField = 'SITUACAO_NFE'
        DataSource = dtmNF.dsNf
        TabOrder = 6
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 73
      Width = 779
      Height = 353
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 6
      TabOrder = 1
      object page_princ: TPageControl
        Left = 0
        Top = 6
        Width = 779
        Height = 347
        ActivePage = ts_item_alt
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object ts_nota_completa: TTabSheet
          Caption = 'Nota Fiscal'
          object pn_nota: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Label441: TLabel
              Left = 34
              Top = 24
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Remetente'
            end
            object Label442: TLabel
              Left = 522
              Top = 24
              Width = 71
              Height = 13
              Caption = 'Dt/Hr Emissao:'
            end
            object Label443: TLabel
              Left = 60
              Top = 46
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'CFOP'
            end
            object Label444: TLabel
              Left = 514
              Top = 51
              Width = 79
              Height = 13
              Caption = 'Dt/Hr Ent.Saida:'
            end
            object Label448: TLabel
              Left = 36
              Top = 73
              Width = 51
              Height = 13
              Caption = 'Base ICMS'
              FocusControl = DBEdit246
            end
            object Label449: TLabel
              Left = 222
              Top = 73
              Width = 52
              Height = 13
              Caption = 'Valor ICMS'
              FocusControl = DBEdit247
            end
            object Label450: TLabel
              Left = 386
              Top = 73
              Width = 72
              Height = 13
              Caption = 'Base ICMS Sub'
              FocusControl = DBEdit248
            end
            object Label451: TLabel
              Left = 566
              Top = 73
              Width = 73
              Height = 13
              Caption = 'Valor ICMS Sub'
              FocusControl = DBEdit249
            end
            object Label452: TLabel
              Left = 34
              Top = 100
              Width = 53
              Height = 13
              Caption = 'Valor Frete'
              FocusControl = DBEdit250
            end
            object Label453: TLabel
              Left = 213
              Top = 100
              Width = 61
              Height = 13
              Caption = 'Valor Seguro'
              FocusControl = DBEdit251
            end
            object Label454: TLabel
              Left = 413
              Top = 100
              Width = 45
              Height = 13
              Caption = 'Desconto'
              FocusControl = DBEdit252
            end
            object Label455: TLabel
              Left = 579
              Top = 100
              Width = 60
              Height = 13
              Caption = 'Outras Desp'
              FocusControl = DBEdit253
            end
            object Label458: TLabel
              Left = 44
              Top = 127
              Width = 43
              Height = 13
              Caption = 'Valor PIS'
              FocusControl = DBEdit254
            end
            object Label459: TLabel
              Left = 209
              Top = 127
              Width = 65
              Height = 13
              Caption = 'Valor COFINS'
              FocusControl = DBEdit255
            end
            object Label460: TLabel
              Left = 400
              Top = 127
              Width = 58
              Height = 13
              Caption = 'Valor PIS ST'
              FocusControl = DBEdit256
            end
            object Label461: TLabel
              Left = 559
              Top = 127
              Width = 80
              Height = 13
              Caption = 'Valor COFINS ST'
              FocusControl = DBEdit257
            end
            object Label445: TLabel
              Left = 222
              Top = 154
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Itens'
              FocusControl = DBEdit242
            end
            object Label446: TLabel
              Left = 417
              Top = 154
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor IPI'
              FocusControl = DBEdit243
            end
            object Label544: TLabel
              Left = 30
              Top = 181
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'Chave NF-e'
              FocusControl = DBEdit277
            end
            object Label545: TLabel
              Left = 53
              Top = 154
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Modelo'
              FocusControl = DBEdit278
            end
            object Label626: TLabel
              Left = 564
              Top = 154
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie / Subserie'
              FocusControl = DBEdit321
            end
            object Label698: TLabel
              Left = 587
              Top = 182
              Width = 52
              Height = 13
              Hint = 
                'Data de Lancamento, usada normalmente para a apura'#231#227'o dos arquiv' +
                'os fiscais'
              Alignment = taRightJustify
              Caption = 'Data Lanc:'
            end
            object SpeedButton29: TSpeedButton
              Left = 715
              Top = 178
              Width = 23
              Height = 22
              Hint = 'Alterar data de lan'#231'amento - [NF0218]'
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
              OnClick = SpeedButton29Click
            end
            object DBEdit237: TDBEdit
              Left = 93
              Top = 16
              Width = 50
              Height = 21
              DataField = 'COD_CLIENTE'
              DataSource = dtmNF.dsNf
              Enabled = False
              TabOrder = 0
            end
            object DBEdit238: TDBEdit
              Left = 149
              Top = 16
              Width = 237
              Height = 21
              DataField = 'NOME_CLIENTE'
              DataSource = dtmNF.dsClF
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit239: TDBEdit
              Left = 392
              Top = 16
              Width = 116
              Height = 21
              DataField = 'CPFCGC'
              DataSource = dtmNF.dsClF
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit240: TDBEdit
              Left = 93
              Top = 43
              Width = 50
              Height = 21
              DataField = 'CODIGO_NOP'
              DataSource = dtmNF.dsNf
              TabOrder = 3
            end
            object DBEdit241: TDBEdit
              Tag = 1
              Left = 149
              Top = 43
              Width = 322
              Height = 21
              DataField = 'DESC_NATOP'
              DataSource = dtmNF.dsNf
              TabOrder = 4
            end
            object DBEdit245: TDBEdit
              Left = 599
              Top = 16
              Width = 64
              Height = 21
              DataField = 'DATA_CONTABIL'
              DataSource = dtmNF.dsNf
              TabOrder = 5
            end
            object DBEdit246: TDBEdit
              Left = 93
              Top = 70
              Width = 74
              Height = 21
              DataField = 'BASE_ICM'
              DataSource = dtmNF.dsNf
              TabOrder = 6
            end
            object DBEdit247: TDBEdit
              Left = 280
              Top = 70
              Width = 74
              Height = 21
              DataField = 'VALOR_ICM'
              DataSource = dtmNF.dsNf
              TabOrder = 7
            end
            object DBEdit248: TDBEdit
              Left = 464
              Top = 70
              Width = 74
              Height = 21
              DataField = 'BASE_ICMSUB'
              DataSource = dtmNF.dsNf
              TabOrder = 8
            end
            object DBEdit249: TDBEdit
              Left = 645
              Top = 70
              Width = 74
              Height = 21
              DataField = 'VALOR_ICMSUB'
              DataSource = dtmNF.dsNf
              TabOrder = 9
            end
            object DBEdit250: TDBEdit
              Left = 93
              Top = 97
              Width = 74
              Height = 21
              DataField = 'VALOR_FRETE'
              DataSource = dtmNF.dsNf
              TabOrder = 10
            end
            object DBEdit251: TDBEdit
              Left = 280
              Top = 97
              Width = 74
              Height = 21
              DataField = 'VALOR_SEGURO'
              DataSource = dtmNF.dsNf
              TabOrder = 11
            end
            object DBEdit252: TDBEdit
              Left = 464
              Top = 97
              Width = 74
              Height = 21
              DataField = 'VALOR_DESC'
              DataSource = dtmNF.dsNf
              TabOrder = 12
            end
            object DBEdit253: TDBEdit
              Left = 645
              Top = 97
              Width = 74
              Height = 21
              DataField = 'VALOR_OUT_DESP'
              DataSource = dtmNF.dsNf
              TabOrder = 13
            end
            object DBEdit254: TDBEdit
              Left = 93
              Top = 124
              Width = 74
              Height = 21
              DataField = 'VALOR_PIS'
              DataSource = dtmNF.dsNf
              TabOrder = 14
            end
            object DBEdit255: TDBEdit
              Left = 280
              Top = 124
              Width = 74
              Height = 21
              DataField = 'VALOR_COFINS'
              DataSource = dtmNF.dsNf
              TabOrder = 15
            end
            object DBEdit256: TDBEdit
              Left = 464
              Top = 124
              Width = 74
              Height = 21
              DataField = 'VALOR_PIS_ST'
              DataSource = dtmNF.dsNf
              TabOrder = 16
            end
            object DBEdit257: TDBEdit
              Left = 645
              Top = 124
              Width = 74
              Height = 21
              DataField = 'VALOR_COFINS_ST'
              DataSource = dtmNF.dsNf
              TabOrder = 17
            end
            object DBEdit242: TDBEdit
              Left = 280
              Top = 151
              Width = 74
              Height = 21
              DataField = 'VALOR_PROD'
              DataSource = dtmNF.dsNf
              TabOrder = 18
            end
            object DBEdit243: TDBEdit
              Left = 464
              Top = 151
              Width = 74
              Height = 21
              DataField = 'VALOR_IPI'
              DataSource = dtmNF.dsNf
              TabOrder = 19
            end
            object DBEdit277: TDBEdit
              Left = 93
              Top = 178
              Width = 365
              Height = 21
              DataField = 'CHAVE_NFE'
              DataSource = dtmNF.dsNf
              TabOrder = 20
              OnExit = DBEdit277Exit
            end
            object DBEdit278: TDBEdit
              Left = 93
              Top = 151
              Width = 74
              Height = 21
              DataField = 'MODELO_NF'
              DataSource = dtmNF.dsNf
              TabOrder = 21
            end
            object DBEdit41: TDBEdit
              Left = 669
              Top = 16
              Width = 50
              Height = 21
              DataField = 'HORA_EMISSAO'
              DataSource = dtmNF.dsNf
              TabOrder = 22
            end
            object DBEdit267: TDBEdit
              Left = 599
              Top = 43
              Width = 64
              Height = 21
              DataField = 'DATA_ENT_SAIDA'
              DataSource = dtmNF.dsNf
              TabOrder = 23
            end
            object DBEdit315: TDBEdit
              Left = 669
              Top = 43
              Width = 50
              Height = 21
              DataField = 'HORA_ENT_SAIDA'
              DataSource = dtmNF.dsNf
              TabOrder = 24
            end
            object DBEdit321: TDBEdit
              Left = 645
              Top = 151
              Width = 34
              Height = 21
              DataField = 'SERIE'
              DataSource = dtmNF.dsNf
              TabOrder = 25
            end
            object DBEdit322: TDBEdit
              Left = 685
              Top = 151
              Width = 34
              Height = 21
              DataField = 'SUBSERIE'
              DataSource = dtmNF.dsNf
              TabOrder = 26
            end
            object ed_altent_data_lanc: TDBEdit
              Left = 645
              Top = 178
              Width = 64
              Height = 21
              Hint = 
                'Data de Lancamento, usada normalmente para a apura'#231#227'o dos arquiv' +
                'os fiscais'
              DataField = 'DATA_LANC'
              DataSource = dtmNF.dsNf
              Enabled = False
              TabOrder = 27
              OnExit = ed_altent_data_lancExit
            end
          end
        end
        object ts_nota_cc: TTabSheet
          Caption = 'Nota Fiscal'
          ImageIndex = 4
          object Label25: TLabel
            Left = 34
            Top = 46
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Remetente'
          end
          object Label26: TLabel
            Left = 9
            Top = 19
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Natureza da op.'
          end
          object Label27: TLabel
            Left = 68
            Top = 73
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'CEP'
          end
          object Label28: TLabel
            Left = 159
            Top = 73
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Logradouro'
          end
          object Label29: TLabel
            Left = 50
            Top = 100
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Numero'
          end
          object Label30: TLabel
            Left = 149
            Top = 102
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Complemento'
          end
          object Label31: TLabel
            Left = 340
            Top = 102
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro'
          end
          object Label32: TLabel
            Left = 29
            Top = 127
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o'
          end
          object Label33: TLabel
            Left = 8
            Top = 194
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dados adicionais'
          end
          object Label35: TLabel
            Left = 35
            Top = 263
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso bruto'
          end
          object Label36: TLabel
            Left = 312
            Top = 263
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso l'#237'quido'
          end
          object DBEdit19: TDBEdit
            Left = 93
            Top = 43
            Width = 50
            Height = 21
            DataField = 'COD_CLIENTE'
            DataSource = dtmNF.dsNf
            Enabled = False
            TabOrder = 1
          end
          object DBEdit20: TDBEdit
            Left = 149
            Top = 43
            Width = 312
            Height = 21
            DataField = 'NOME_CLIENTE'
            DataSource = dtmNF.dsNf
            TabOrder = 2
          end
          object DBEdit39: TDBEdit
            Tag = 1
            Left = 93
            Top = 16
            Width = 368
            Height = 21
            DataField = 'DESC_NATOP'
            DataSource = dtmNF.dsNf
            TabOrder = 0
          end
          object DBEdit40: TDBEdit
            Left = 93
            Top = 70
            Width = 50
            Height = 21
            DataField = 'DEST_CEP'
            DataSource = dtmNF.dsNf
            TabOrder = 3
          end
          object DBEdit42: TDBEdit
            Left = 220
            Top = 70
            Width = 241
            Height = 21
            DataField = 'DEST_XLGR'
            DataSource = dtmNF.dsNf
            TabOrder = 4
          end
          object DBEdit43: TDBEdit
            Left = 93
            Top = 97
            Width = 50
            Height = 21
            DataField = 'DEST_NRO'
            DataSource = dtmNF.dsNf
            TabOrder = 5
          end
          object DBEdit44: TDBEdit
            Left = 220
            Top = 97
            Width = 114
            Height = 21
            DataField = 'DEST_XCPL'
            DataSource = dtmNF.dsNf
            TabOrder = 6
          end
          object DBEdit45: TDBEdit
            Left = 374
            Top = 97
            Width = 89
            Height = 21
            DataField = 'DEST_XBAIRRO'
            DataSource = dtmNF.dsNf
            TabOrder = 7
          end
          object DBMemo1: TDBMemo
            Left = 93
            Top = 124
            Width = 370
            Height = 61
            DataField = 'OBS'
            DataSource = dtmNF.dsNf
            TabOrder = 8
          end
          object DBMemo2: TDBMemo
            Left = 93
            Top = 191
            Width = 370
            Height = 61
            DataField = 'DADOS_INTERESSE_FISCO'
            DataSource = dtmNF.dsNf
            TabOrder = 9
          end
          object DBEdit47: TDBEdit
            Left = 93
            Top = 258
            Width = 89
            Height = 21
            DataField = 'PESO_B'
            DataSource = dtmNF.dsNf
            TabOrder = 10
          end
          object DBEdit48: TDBEdit
            Left = 374
            Top = 258
            Width = 89
            Height = 21
            DataField = 'PESO_L'
            DataSource = dtmNF.dsNf
            TabOrder = 11
          end
        end
        object ts_nota_liberado: TTabSheet
          Caption = 'Nota Fiscal *'
          ImageIndex = -1
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Label39: TLabel
              Left = 60
              Top = 46
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'CFOP'
            end
            object DBEdit52: TDBEdit
              Left = 93
              Top = 43
              Width = 50
              Height = 21
              DataField = 'CODIGO_NOP'
              DataSource = dtmNF.dsNf
              TabOrder = 0
            end
          end
        end
        object ts_nf_cont_rej: TTabSheet
          Caption = 'ts_nf_cont_rej'
          ImageIndex = 7
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
        object ts_item: TTabSheet
          Caption = 'Itens da nota'
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            Padding.Left = 4
            Padding.Top = 4
            Padding.Right = 4
            TabOrder = 0
            object DBGrid13: TDBGrid
              Left = 4
              Top = 4
              Width = 759
              Height = 267
              Align = alClient
              DataSource = dtmNF.dsINf
              DragCursor = crDefault
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
                  FieldName = 'NITEM'
                  Width = 39
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_ITEM'
                  Width = 243
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANTIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_UNITARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_FAB_PROD'
                  Title.Caption = 'C'#243'digo'
                  Width = 83
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_NOP'
                  Width = 41
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CSOSN'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEST'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NCM'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REFERENCIA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NPED'
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_PED'
                  Title.Caption = 'Tipo Vnd'
                  Width = 43
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_DESCONTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RATEIO_DESCONTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_ICM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ICM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VICMDESON'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_RED_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MVA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_ICMSUB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ICMSUB'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICMSUB'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_IPI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_IPI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_IPI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_RED_IPI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_ICM_SIMPLES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ICM_SIMPLES'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICM_SIMPLES'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ICMANT_SUB'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICMANT_SUB'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RATEIO_SEGURO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RATEIO_OUTDESP'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RATEIO_FRETE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLISENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLOUTRAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLN_TRIB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_ISS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ISS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ISS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_ITEM'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANTEC_TRIB'
                  Title.Caption = 'Ant Trib'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_ICMSUB_ANT'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICMSUB_ANT'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORT_XML'
                  Title.Caption = 'N Calc ST'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST_PIS'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VPISDESON'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANT_BC_PIS'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_PIS_QUANT'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CST_COFINS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_COFINS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_COFINS'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_COFINS'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VCOFINSDESON'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANT_BC_COFINS'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALIQ_COFINS_QUANT'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALTERA_ESTOQUE_CFOP'
                  Title.Caption = 'Alt Est'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VTOTTRIB'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'XPED_COMPRA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NITEMPED_COMPRA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INDTOT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERMITIR_DESCONTO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_CALC'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_CALC_PC'
                  Width = 64
                  Visible = True
                end>
            end
            object Panel7: TPanel
              Left = 4
              Top = 271
              Width = 759
              Height = 41
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object bt_item_alterar: TBitBtn
                Left = 333
                Top = 8
                Width = 105
                Height = 25
                Caption = 'Alterar Item'
                TabOrder = 0
                OnClick = bt_item_alterarClick
                Glyph.Data = {
                  6E030000424D6E030000000000006E0200002800000010000000100000000100
                  08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                  FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                  5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                  5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                  8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                  2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                  C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                  3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                  EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                  E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                  CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                  8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                  BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                  6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                  F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                  F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                  A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                  DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                  B400010B9900010A95002732D000000081000202020202020202020202020202
                  020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                  02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                  02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                  020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                  02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                  02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                  878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                  848B403A3A3A3A3A3A3A3A2C0202028C8902}
              end
            end
          end
        end
        object ts_item_alt: TTabSheet
          Caption = 'Altera'#231#227'o de item'
          ImageIndex = 2
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object page_det: TPageControl
              Left = 6
              Top = 6
              Width = 755
              Height = 259
              ActivePage = TabSheet7
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 0
              object ts_det_item: TTabSheet
                Caption = 'Item'
                object pn_det_item: TPanel
                  Left = 0
                  Top = 0
                  Width = 747
                  Height = 228
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object Label447: TLabel
                    Left = 190
                    Top = 19
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Unidade'
                  end
                  object Label485: TLabel
                    Left = 417
                    Top = 19
                    Width = 27
                    Height = 13
                    BiDiMode = bdRightToLeft
                    Caption = 'CFOP'
                    ParentBiDiMode = False
                  end
                  object Label579: TLabel
                    Left = 225
                    Top = 59
                    Width = 26
                    Height = 13
                    Alignment = taRightJustify
                    BiDiMode = bdRightToLeft
                    Caption = 'Frete'
                    ParentBiDiMode = False
                  end
                  object Label15: TLabel
                    Left = 299
                    Top = 19
                    Width = 22
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'NCM'
                    FocusControl = DBEdit15
                  end
                  object Label19: TLabel
                    Left = 69
                    Top = 59
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Desconto'
                    FocusControl = DBEdit33
                  end
                  object Label20: TLabel
                    Left = 350
                    Top = 59
                    Width = 34
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Seguro'
                    FocusControl = DBEdit34
                  end
                  object Label21: TLabel
                    Left = 485
                    Top = 59
                    Width = 67
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Out Despesas'
                    FocusControl = DBEdit35
                  end
                  object DBEdit244: TDBEdit
                    Left = 235
                    Top = 16
                    Width = 45
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'REFERENCIA'
                    DataSource = dtmNF.dsINf
                    TabOrder = 0
                  end
                  object DBEdit281: TDBEdit
                    Left = 450
                    Top = 16
                    Width = 44
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'CODIGO_NOP'
                    DataSource = dtmNF.dsINf
                    TabOrder = 2
                  end
                  object DBEdit296: TDBEdit
                    Left = 255
                    Top = 56
                    Width = 89
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'RATEIO_FRETE'
                    DataSource = dtmNF.dsINf
                    TabOrder = 4
                  end
                  object DBEdit15: TDBEdit
                    Left = 327
                    Top = 16
                    Width = 75
                    Height = 21
                    DataField = 'NCM'
                    DataSource = dtmNF.dsINf
                    TabOrder = 1
                  end
                  object DBEdit33: TDBEdit
                    Left = 120
                    Top = 56
                    Width = 89
                    Height = 21
                    DataField = 'RATEIO_DESCONTO'
                    DataSource = dtmNF.dsINf
                    TabOrder = 3
                  end
                  object DBEdit34: TDBEdit
                    Left = 390
                    Top = 56
                    Width = 89
                    Height = 21
                    DataField = 'RATEIO_SEGURO'
                    DataSource = dtmNF.dsINf
                    TabOrder = 5
                  end
                  object DBEdit35: TDBEdit
                    Left = 558
                    Top = 56
                    Width = 89
                    Height = 21
                    DataField = 'RATEIO_OUTDESP'
                    DataSource = dtmNF.dsINf
                    TabOrder = 6
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'ICMS'
                ImageIndex = 1
                object pn_det_icm: TPanel
                  Left = 0
                  Top = 0
                  Width = 747
                  Height = 228
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox76: TGroupBox
                    Left = 6
                    Top = 40
                    Width = 731
                    Height = 44
                    Align = alTop
                    Caption = 'ICMS'
                    TabOrder = 1
                    object Label504: TLabel
                      Left = 478
                      Top = 17
                      Width = 23
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Base'
                      FocusControl = DBEdit300
                    end
                    object Label505: TLabel
                      Left = 184
                      Top = 17
                      Width = 39
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Al'#237'quota'
                      FocusControl = DBEdit301
                    end
                    object Label508: TLabel
                      Left = 611
                      Top = 17
                      Width = 24
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor'
                      FocusControl = DBEdit304
                      ParentBiDiMode = False
                    end
                    object Label8: TLabel
                      Left = 308
                      Top = 17
                      Width = 56
                      Height = 13
                      Alignment = taRightJustify
                      Caption = '% Redu'#231#227'o'
                      FocusControl = DBEdit8
                    end
                    object DBEdit300: TDBEdit
                      Left = 507
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Base de C'#225'lculo de ICMS'
                      DataField = 'BASE_ICM'
                      DataSource = dtmNF.dsINf
                      TabOrder = 2
                    end
                    object DBEdit301: TDBEdit
                      Left = 229
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Aliquota de ICMS'
                      DataField = 'ALIQ_ICM'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                    object DBEdit304: TDBEdit
                      Left = 641
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Valor de ICMS'
                      DataField = 'VALOR_ICM'
                      DataSource = dtmNF.dsINf
                      TabOrder = 3
                    end
                    object DBEdit8: TDBEdit
                      Left = 370
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Base de C'#225'lculo de ICMS'
                      DataField = 'PERC_RED_PROD'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                  end
                  object GroupBox71: TGroupBox
                    Left = 6
                    Top = 84
                    Width = 731
                    Height = 72
                    Align = alTop
                    Caption = 'ICMS ST'
                    TabOrder = 2
                    object Label487: TLabel
                      Left = 478
                      Top = 17
                      Width = 23
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Base'
                      FocusControl = DBEdit283
                    end
                    object Label488: TLabel
                      Left = 184
                      Top = 17
                      Width = 39
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Al'#237'quota'
                      FocusControl = DBEdit284
                    end
                    object Label489: TLabel
                      Left = 611
                      Top = 17
                      Width = 24
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor'
                      FocusControl = DBEdit285
                      ParentBiDiMode = False
                    end
                    object Label582: TLabel
                      Left = 326
                      Top = 44
                      Width = 38
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ant Trib'
                      FocusControl = DBEdit303
                    end
                    object Label9: TLabel
                      Left = 308
                      Top = 17
                      Width = 56
                      Height = 13
                      Alignment = taRightJustify
                      Caption = '% Redu'#231#227'o'
                      FocusControl = DBEdit9
                    end
                    object Label10: TLabel
                      Left = 465
                      Top = 44
                      Width = 36
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mod BC'
                      FocusControl = DBEdit10
                    end
                    object Label11: TLabel
                      Left = 614
                      Top = 44
                      Width = 21
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'MVA'
                      FocusControl = DBEdit11
                    end
                    object DBEdit283: TDBEdit
                      Left = 507
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Base de C'#225'lculo de ICMS Substitui'#231#227'o Tribut'#225'ria'
                      DataField = 'BASE_ICMSUB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 2
                    end
                    object DBEdit284: TDBEdit
                      Left = 229
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Aliquota de Substitui'#231#227'o Tribut'#225'ria'
                      DataField = 'ALIQ_ICMSUB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                    object DBEdit285: TDBEdit
                      Left = 641
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Valor de Substitui'#231#227'o Tribut'#225'ria'
                      DataField = 'VALOR_ICMSUB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 3
                    end
                    object DBEdit303: TDBEdit
                      Left = 370
                      Top = 41
                      Width = 74
                      Height = 21
                      Hint = 'Base de C'#225'lculo de ICMS Substitui'#231#227'o Tribut'#225'ria'
                      DataField = 'ANTEC_TRIB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 4
                    end
                    object DBEdit9: TDBEdit
                      Left = 370
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Base de C'#225'lculo de ICMS'
                      DataField = 'PERC_RED_PROD_SUB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                    object DBEdit10: TDBEdit
                      Left = 507
                      Top = 41
                      Width = 74
                      Height = 21
                      DataField = 'MODBCST'
                      DataSource = dtmNF.dsINf
                      TabOrder = 5
                    end
                    object DBEdit11: TDBEdit
                      Left = 641
                      Top = 41
                      Width = 74
                      Height = 21
                      DataField = 'MVA'
                      DataSource = dtmNF.dsINf
                      TabOrder = 6
                    end
                  end
                  object Panel16: TPanel
                    Left = 6
                    Top = 6
                    Width = 731
                    Height = 34
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label503: TLabel
                      Left = 174
                      Top = 8
                      Width = 49
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cst/Csosn'
                      FocusControl = DBEdit299
                    end
                    object Label17: TLabel
                      Left = 474
                      Top = 10
                      Width = 25
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CEST'
                      FocusControl = DBEdit17
                    end
                    object DBEdit299: TDBEdit
                      Left = 229
                      Top = 5
                      Width = 27
                      Height = 21
                      Hint = 'CST de ICMS'
                      DataField = 'CST'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                    object ed_alt_sped_csosn: TDBEdit
                      Left = 262
                      Top = 5
                      Width = 32
                      Height = 21
                      Hint = 'CSOSN de ICMS'
                      DataField = 'CSOSN'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                    object DBEdit17: TDBEdit
                      Left = 505
                      Top = 5
                      Width = 75
                      Height = 21
                      DataField = 'CEST'
                      DataSource = dtmNF.dsINf
                      TabOrder = 2
                    end
                  end
                  object GroupBox2: TGroupBox
                    Left = 6
                    Top = 156
                    Width = 731
                    Height = 45
                    Align = alTop
                    Caption = 'ICMS Desonerado'
                    TabOrder = 3
                    object Label706: TLabel
                      Left = 226
                      Top = 17
                      Width = 32
                      Height = 13
                      Hint = 
                        'A desonera'#231#227'o de ICMS somente '#233' aplicada nos seguintes CSTs: [20' +
                        ', 30, 40, 70, 90]'
                      Alignment = taRightJustify
                      Caption = 'Motivo'
                    end
                    object Label18: TLabel
                      Left = 611
                      Top = 17
                      Width = 24
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor'
                      FocusControl = DBEdit18
                      ParentBiDiMode = False
                    end
                    object lkDesoneracao: TDBLookupComboBox
                      Left = 264
                      Top = 14
                      Width = 279
                      Height = 21
                      Hint = 
                        'A desonera'#231#227'o de ICMS somente '#233' aplicada nos seguintes CSTs: [20' +
                        ', 30, 40, 70, 90]'
                      DataField = 'IND_DESONERACAO'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                    object DBEdit18: TDBEdit
                      Left = 641
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Valor de ICMS'
                      DataField = 'VICMDESON'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'IPI'
                ImageIndex = 2
                object pn_det_ipi: TPanel
                  Left = 0
                  Top = 0
                  Width = 747
                  Height = 228
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox1: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 731
                    Height = 44
                    Align = alTop
                    TabOrder = 0
                    object Label12: TLabel
                      Left = 358
                      Top = 17
                      Width = 23
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Base'
                      FocusControl = DBEdit12
                    end
                    object Label13: TLabel
                      Left = 224
                      Top = 17
                      Width = 39
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Al'#237'quota'
                      FocusControl = DBEdit13
                    end
                    object Label14: TLabel
                      Left = 491
                      Top = 17
                      Width = 24
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Valor'
                      FocusControl = DBEdit14
                      ParentBiDiMode = False
                    end
                    object Label16: TLabel
                      Left = 161
                      Top = 17
                      Width = 19
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'CST'
                      FocusControl = DBEdit16
                    end
                    object DBEdit12: TDBEdit
                      Left = 387
                      Top = 14
                      Width = 74
                      Height = 21
                      DataField = 'BASE_IPI'
                      DataSource = dtmNF.dsINf
                      TabOrder = 2
                    end
                    object DBEdit13: TDBEdit
                      Left = 269
                      Top = 14
                      Width = 74
                      Height = 21
                      DataField = 'ALIQ_IPI'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                    object DBEdit14: TDBEdit
                      Left = 521
                      Top = 14
                      Width = 74
                      Height = 21
                      Hint = 'Valor de ICMS'
                      DataField = 'VALOR_IPI'
                      DataSource = dtmNF.dsINf
                      TabOrder = 3
                    end
                    object DBEdit16: TDBEdit
                      Left = 185
                      Top = 14
                      Width = 27
                      Height = 21
                      Hint = 'CST de ICMS'
                      DataField = 'CST_IPI'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                  end
                end
              end
              object TabSheet7: TTabSheet
                Caption = 'PIS COFINS'
                ImageIndex = 3
                object pn_det_pc: TPanel
                  Left = 0
                  Top = 0
                  Width = 747
                  Height = 228
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object pn_piscofins_tributos: TPanel
                    Left = 6
                    Top = 6
                    Width = 731
                    Height = 169
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object pn_det_pc_pis: TPanel
                      Left = 0
                      Top = 81
                      Width = 731
                      Height = 40
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 2
                      object gb_pis_aliq: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 293
                        Height = 40
                        Align = alLeft
                        Caption = 'PIS Al'#237'quota %'
                        TabOrder = 0
                        object Label711: TLabel
                          Left = 41
                          Top = 17
                          Width = 39
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Al'#237'quota'
                        end
                        object Label713: TLabel
                          Left = 158
                          Top = 19
                          Width = 58
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Base c'#225'lculo'
                        end
                        object DBEdit23: TDBEdit
                          Left = 87
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'ALIQ_PIS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                        object DBEdit25: TDBEdit
                          Left = 222
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'BASE_PIS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 1
                        end
                      end
                      object GroupBox111: TGroupBox
                        Left = 586
                        Top = 0
                        Width = 145
                        Height = 40
                        Align = alClient
                        Caption = 'PIS'
                        TabOrder = 2
                        object Label723: TLabel
                          Left = 40
                          Top = 17
                          Width = 24
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor'
                        end
                        object DBEdit31: TDBEdit
                          Left = 70
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'VALOR_PIS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                      end
                      object gb_pis_qtde: TGroupBox
                        Left = 293
                        Top = 0
                        Width = 293
                        Height = 40
                        Align = alLeft
                        Caption = 'PIS Quantidade'
                        TabOrder = 1
                        object Label721: TLabel
                          Left = 8
                          Top = 17
                          Width = 72
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Al'#237'quota em R$'
                        end
                        object Label722: TLabel
                          Left = 160
                          Top = 19
                          Width = 56
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Quantidade'
                        end
                        object DBEdit27: TDBEdit
                          Left = 87
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'ALIQ_PIS_QUANT'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                        object DBEdit28: TDBEdit
                          Left = 222
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'QUANT_BC_PIS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 1
                        end
                      end
                    end
                    object pn_det_pc_cofins: TPanel
                      Left = 0
                      Top = 121
                      Width = 731
                      Height = 40
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 3
                      object gb_cofins_aliq: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 293
                        Height = 40
                        Align = alLeft
                        Caption = 'COFINS Al'#237'quota %'
                        TabOrder = 0
                        object Label724: TLabel
                          Left = 41
                          Top = 17
                          Width = 39
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Al'#237'quota'
                        end
                        object Label725: TLabel
                          Left = 158
                          Top = 19
                          Width = 58
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Base c'#225'lculo'
                        end
                        object DBEdit24: TDBEdit
                          Left = 87
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'ALIQ_COFINS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                        object DBEdit26: TDBEdit
                          Left = 222
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'BASE_COFINS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 1
                        end
                      end
                      object GroupBox113: TGroupBox
                        Left = 586
                        Top = 0
                        Width = 145
                        Height = 40
                        Align = alClient
                        Caption = 'COFINS'
                        TabOrder = 2
                        object Label726: TLabel
                          Left = 40
                          Top = 17
                          Width = 24
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Valor'
                        end
                        object DBEdit32: TDBEdit
                          Left = 70
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'VALOR_COFINS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                      end
                      object gb_cofins_qtde: TGroupBox
                        Left = 293
                        Top = 0
                        Width = 293
                        Height = 40
                        Align = alLeft
                        Caption = 'COFINS Quantidade'
                        TabOrder = 1
                        object Label727: TLabel
                          Left = 8
                          Top = 17
                          Width = 72
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Al'#237'quota em R$'
                        end
                        object Label728: TLabel
                          Left = 160
                          Top = 19
                          Width = 56
                          Height = 13
                          Alignment = taRightJustify
                          Caption = 'Quantidade'
                        end
                        object DBEdit29: TDBEdit
                          Left = 87
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'ALIQ_COFINS_QUANT'
                          DataSource = dtmNF.dsINf
                          TabOrder = 0
                        end
                        object DBEdit30: TDBEdit
                          Left = 222
                          Top = 14
                          Width = 62
                          Height = 21
                          DataField = 'QUANT_BC_COFINS'
                          DataSource = dtmNF.dsINf
                          TabOrder = 1
                        end
                      end
                    end
                    object GroupBox115: TGroupBox
                      Left = 0
                      Top = 41
                      Width = 731
                      Height = 40
                      Align = alTop
                      Caption = 'PIS COFINS - Desonera'#231#227'o'
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGray
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      object Label730: TLabel
                        Left = 45
                        Top = 17
                        Width = 32
                        Height = 13
                        Hint = 
                          'A desonera'#231#227'o de ICMS somente '#233' aplicada nos seguintes CSTs: [20' +
                          ', 30, 40, 70, 90]'
                        Alignment = taRightJustify
                        Caption = 'Motivo'
                      end
                      object Label729: TLabel
                        Left = 466
                        Top = 17
                        Width = 43
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor PIS'
                      end
                      object Label731: TLabel
                        Left = 585
                        Top = 17
                        Width = 65
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor COFINS'
                      end
                      object ed_piscofins_motivo_deson: TDBLookupComboBox
                        Left = 84
                        Top = 14
                        Width = 279
                        Height = 21
                        DataField = 'MOTDES_PC'
                        DataSource = dtmNF.dsINf
                        TabOrder = 0
                      end
                      object DBEdit21: TDBEdit
                        Left = 515
                        Top = 13
                        Width = 62
                        Height = 21
                        DataField = 'VPISDESON'
                        DataSource = dtmNF.dsINf
                        TabOrder = 1
                      end
                      object DBEdit22: TDBEdit
                        Left = 656
                        Top = 13
                        Width = 62
                        Height = 21
                        DataField = 'VCOFINSDESON'
                        DataSource = dtmNF.dsINf
                        TabOrder = 2
                      end
                    end
                    object pn_det_pc_cod: TGroupBox
                      Left = 0
                      Top = 0
                      Width = 731
                      Height = 41
                      Align = alTop
                      Caption = 'C'#243'digo'
                      TabOrder = 0
                      object lb_cst_pis: TLabel
                        Left = 151
                        Top = 18
                        Width = 19
                        Height = 13
                        Caption = 'CST'
                      end
                      object lb_pc_nat_rec: TLabel
                        Left = 212
                        Top = 18
                        Width = 98
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Natureza da Receita'
                      end
                      object Label732: TLabel
                        Left = 380
                        Top = 18
                        Width = 34
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'C'#225'lculo'
                      end
                      object imgInformation: TImage
                        Left = 499
                        Top = 11
                        Width = 24
                        Height = 24
                        Cursor = crHelp
                        Picture.Data = {
                          055449636F6E0000010001001818000001002000880900001600000028000000
                          1800000030000000010020000000000060090000000000000000000000000000
                          00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000000000000000000000000000000000000000000000000000000000021
                          0000002700000000000000000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          00000000000000000000000000000000000000000000000000000023170B0088
                          27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          000000000000000000000000000000000000000604000050492A0CC3BE9263FF
                          B4895BEE5D2F0033492702004122010041220100412201004222010042220100
                          FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
                          0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
                          C29667E0502700210A0600000000000000000000000000000000000000000000
                          FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
                          150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
                          996F44E20000003A000000000000000000000000020100000301000003010000
                          FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
                          BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
                          C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
                          FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
                          FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
                          FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
                          FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
                          FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
                          FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
                          FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
                          FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
                          E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
                          FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
                          FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
                          E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
                          FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
                          FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
                          FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
                          FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
                          FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
                          FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
                          FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
                          FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
                          FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
                          FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
                          FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
                          FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
                          FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
                          FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
                          FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
                          FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
                          FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
                          FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
                          FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
                          FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
                          FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
                          FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
                          FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
                          E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
                          FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
                          FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
                          EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
                          FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
                          E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
                          FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
                          894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
                          C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
                          FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
                          8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
                          8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
                          FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
                          E0000F00C0000700800007008000030080000100800001008000010080000100
                          8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
                          FFFFFF00}
                      end
                      object ed_pc_cst: TDBEdit
                        Left = 178
                        Top = 14
                        Width = 28
                        Height = 21
                        DataField = 'CST_PIS'
                        DataSource = dtmNF.dsINf
                        TabOrder = 0
                      end
                      object ed_pc_nat_rec: TDBEdit
                        Left = 316
                        Top = 14
                        Width = 47
                        Height = 21
                        DataField = 'NAT_REC'
                        DataSource = dtmNF.dsINf
                        TabOrder = 1
                      end
                      object ed_tipoCalcPC: TDBLookupComboBox
                        Left = 420
                        Top = 14
                        Width = 73
                        Height = 21
                        DataField = 'TIPO_CALC_PC'
                        DataSource = dtmNF.dsINf
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object ts_outras: TTabSheet
                Caption = 'Outros'
                ImageIndex = 4
                object pn_det_outros: TPanel
                  Left = 0
                  Top = 0
                  Width = 747
                  Height = 228
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  BorderWidth = 6
                  TabOrder = 0
                  object GroupBox3: TGroupBox
                    Left = 6
                    Top = 6
                    Width = 731
                    Height = 59
                    Align = alTop
                    TabOrder = 0
                    object Label22: TLabel
                      Left = 120
                      Top = 21
                      Width = 31
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Isenta'
                      FocusControl = DBEdit36
                    end
                    object Label23: TLabel
                      Left = 251
                      Top = 21
                      Width = 66
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#227'o tributada'
                      FocusControl = DBEdit37
                    end
                    object Label24: TLabel
                      Left = 434
                      Top = 21
                      Width = 33
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Outras'
                      FocusControl = DBEdit38
                    end
                    object DBEdit36: TDBEdit
                      Left = 157
                      Top = 18
                      Width = 74
                      Height = 21
                      DataField = 'VLISENTO'
                      DataSource = dtmNF.dsINf
                      TabOrder = 0
                    end
                    object DBEdit37: TDBEdit
                      Left = 323
                      Top = 18
                      Width = 74
                      Height = 21
                      DataField = 'VLN_TRIB'
                      DataSource = dtmNF.dsINf
                      TabOrder = 1
                    end
                    object DBEdit38: TDBEdit
                      Left = 473
                      Top = 18
                      Width = 74
                      Height = 21
                      DataField = 'VLOUTRAS'
                      DataSource = dtmNF.dsINf
                      TabOrder = 2
                    end
                  end
                end
              end
            end
            object Panel9: TPanel
              Left = 6
              Top = 265
              Width = 755
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object bt_item_save: TBitBtn
                Left = 298
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para salvar o item'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = bt_item_saveClick
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
              object bt_item_cancel: TBitBtn
                Left = 379
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = bt_item_cancelClick
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
        object ts_item_alt_cc: TTabSheet
          Caption = 'Altera'#231#227'o de item'
          ImageIndex = 5
          object Label34: TLabel
            Left = 92
            Top = 18
            Width = 27
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'CFOP'
            ParentBiDiMode = False
          end
          object Label37: TLabel
            Left = 216
            Top = 18
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cst/Csosn ICMS'
            FocusControl = DBEdit49
          end
          object Label38: TLabel
            Left = 48
            Top = 45
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descri'#231#227'o Item'
            FocusControl = DBEdit51
          end
          object DBEdit46: TDBEdit
            Left = 125
            Top = 15
            Width = 44
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO_NOP'
            DataSource = dtmNF.dsINf
            TabOrder = 0
          end
          object DBEdit49: TDBEdit
            Left = 299
            Top = 15
            Width = 27
            Height = 21
            Hint = 'CST de ICMS'
            DataField = 'CST'
            DataSource = dtmNF.dsINf
            TabOrder = 1
          end
          object DBEdit50: TDBEdit
            Left = 332
            Top = 15
            Width = 32
            Height = 21
            Hint = 'CSOSN de ICMS'
            DataField = 'CSOSN'
            DataSource = dtmNF.dsINf
            TabOrder = 2
          end
          object DBEdit51: TDBEdit
            Left = 125
            Top = 42
            Width = 412
            Height = 21
            DataField = 'DESCRICAO_ITEM'
            DataSource = dtmNF.dsINf
            TabOrder = 3
          end
          object Panel5: TPanel
            Left = 0
            Top = 275
            Width = 771
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 4
            object BitBtn1: TBitBtn
              Left = 298
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Clique neste bot'#227'o para salvar o item'
              Caption = 'Salvar'
              TabOrder = 0
              OnClick = bt_item_saveClick
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
            object BitBtn2: TBitBtn
              Left = 379
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = bt_item_cancelClick
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
        object ts_dados_consumo: TTabSheet
          Caption = 'Dados de Consumo'
          ImageIndex = 3
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Label433: TLabel
              Left = 56
              Top = 25
              Width = 82
              Height = 13
              Caption = 'Classe Consumo:'
            end
            object Label434: TLabel
              Left = 60
              Top = 52
              Width = 78
              Height = 13
              Caption = 'Valor Fornecido:'
              FocusControl = DBEdit229
            end
            object Label435: TLabel
              Left = 284
              Top = 52
              Width = 118
              Height = 13
              Caption = 'Valor Serv Nao Trib ICM:'
              FocusControl = DBEdit230
            end
            object Label436: TLabel
              Left = 63
              Top = 79
              Width = 75
              Height = 13
              Caption = 'Valor Terceiros:'
              FocusControl = DBEdit236
            end
            object dbComboConsumo: TDBComboBox
              Left = 144
              Top = 17
              Width = 337
              Height = 21
              DataField = 'COD_CONS'
              DataSource = dtmNF.dsNf
              ItemHeight = 13
              Items.Strings = (
                '01 - Comercial;'
                '02 - Consumo Pr'#243'prio;'
                '03 - Ilumina'#231#227'o P'#250'blica;'
                '04 - Industrial;'
                '05 - Poder P'#250'blico;'
                '06 - Residencial;'
                '07 - Rural;'
                '08 - Servi'#231'o P'#250'blico;')
              TabOrder = 0
            end
            object dbComboAgua: TDBComboBox
              Left = 144
              Top = 17
              Width = 398
              Height = 21
              DataField = 'COD_CONS'
              DataSource = dtmNF.dsNf
              ItemHeight = 13
              Items.Strings = (
                '00 - Consumo residencial at'#233' R$ 50,00;'
                '01 - Consumo residencial de R$ 50,01 a R$ 100,00;'
                '02 - Consumo residencial de R$ 100,01 a R$ 200,00;'
                '03 - Consumo residencial de R$ 200,01 a R$ 300,00;'
                '04 - Consumo residencial de R$ 300,01 a R$ 400,00;'
                '05 - Consumo residencial de R$ 400,01 a R$ 500,00;'
                '06 - Consumo residencial de R$ 500,01 a R$ 1000,00;'
                '07 - Consumo residencial acima de R$ 1.000,01;'
                '20 - Consumo comercial/industrial at'#233' R$ 50,00;'
                '21 - Consumo comercial/industrial de R$ 50,01 a R$ 100,00;'
                '22 - Consumo comercial/industrial de R$ 100,01 a R$ 200,00;'
                '23 - Consumo comercial/industrial de R$ 200,01 a R$ 300,00;'
                '24 - Consumo comercial/industrial de R$ 300,01 a R$ 400,00;'
                '25 - Consumo comercial/industrial de R$ 400,01 a R$ 500,00;'
                '26 - Consumo comercial/industrial de R$ 500,01 a R$ 1.000,00;'
                '27 - Consumo comercial/industrial acima de R$ 1.000,01;'
                '80 - Consumo de '#243'rg'#227'o p'#250'blico;'
                '90 - Outros tipos de consumo at'#233' R$ 50,00;'
                '91 - Outros tipos de consumo de R$ 50,01 a R$ 100,00;'
                '92 - Outros tipos de consumo de R$ 100,01 a R$ 200,00;'
                '93 - Outros tipos de consumo de R$ 200,01 a R$ 300,00;'
                '94 - Outros tipos de consumo de R$ 300,01 a R$ 400,00;'
                '95 - Outros tipos de consumo de R$ 400,01 a R$ 500,00;'
                '96 - Outros tipos de consumo de R$ 500,01 a R$ 1.000,00;'
                '97 - Outros tipos de consumo acima de R$ 1.000,01;'
                '99 - Registro por documento fiscal emitido;'
                '')
              TabOrder = 1
            end
            object DBEdit229: TDBEdit
              Left = 144
              Top = 44
              Width = 134
              Height = 21
              DataField = 'VL_FORN'
              DataSource = dtmNF.dsNf
              TabOrder = 2
            end
            object DBEdit230: TDBEdit
              Left = 408
              Top = 44
              Width = 134
              Height = 21
              DataField = 'VL_SERV_NT'
              DataSource = dtmNF.dsNf
              TabOrder = 3
            end
            object DBEdit236: TDBEdit
              Left = 144
              Top = 71
              Width = 134
              Height = 21
              DataField = 'VL_TERC'
              DataSource = dtmNF.dsNf
              TabOrder = 4
            end
          end
        end
        object ts_it_cont_rej: TTabSheet
          Caption = 'ts_it_cont_rej'
          ImageIndex = 8
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 316
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label40: TLabel
              Left = 92
              Top = 18
              Width = 27
              Height = 13
              BiDiMode = bdRightToLeft
              Caption = 'CFOP'
              ParentBiDiMode = False
            end
            object DBEdit53: TDBEdit
              Left = 125
              Top = 15
              Width = 44
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODIGO_NOP'
              DataSource = dtmNF.dsINf
              TabOrder = 0
            end
            object Panel13: TPanel
              Left = 0
              Top = 275
              Width = 771
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn3: TBitBtn
                Left = 298
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para salvar o item'
                Caption = 'Salvar'
                TabOrder = 0
                OnClick = bt_item_saveClick
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
              object BitBtn4: TBitBtn
                Left = 379
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = bt_item_cancelClick
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
    object Panel4: TPanel
      Left = 6
      Top = 426
      Width = 779
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object bt_nota_save: TBitBtn
        Left = 309
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Clique neste bot'#227'o para salvar o item'
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = bt_nota_saveClick
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
      object bt_nota_cancel: TBitBtn
        Left = 390
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
        Caption = 'Cancelar'
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
    end
  end
end
