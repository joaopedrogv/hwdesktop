inherited frmCadServicoTransporte: TfrmCadServicoTransporte
  Caption = 'Servi'#231'os de Transporte'
  ClientHeight = 598
  ExplicitHeight = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 579
    ExplicitHeight = 579
    inherited Splitter2: TSplitter
      Height = 577
      ExplicitHeight = 577
    end
    inherited PanelLeft: TPanel
      Height = 577
      ExplicitHeight = 577
      inherited PageControl1: TPageControl
        Height = 575
        ExplicitHeight = 575
        inherited TabSheet1: TTabSheet
          ExplicitHeight = 544
          inherited ScrollBox1: TScrollBox
            Height = 544
            ExplicitHeight = 544
            inherited PageControl3: TPageControl
              Height = 496
              ExplicitHeight = 496
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro'
                ExplicitHeight = 465
                inherited ScrollBox3: TScrollBox
                  Height = 465
                  BorderStyle = bsNone
                  ExplicitHeight = 465
                  inherited GroupBox1: TGroupBox
                    Width = 758
                    Height = 469
                    Caption = 'Dados de Servi'#231'os de Transporte'
                    OnEnter = GroupBox1Enter
                    ExplicitWidth = 758
                    ExplicitHeight = 469
                    object Label6: TLabel
                      Left = 115
                      Top = 35
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label10: TLabel
                      Left = 84
                      Top = 251
                      Width = 64
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Emiss'#227'o'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 124
                      Top = 121
                      Width = 24
                      Height = 13
                      Caption = 'S'#233'rie'
                    end
                    object Label12: TLabel
                      Left = 436
                      Top = 121
                      Width = 45
                      Height = 13
                      Caption = 'Sub S'#233'rie'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 54
                      Top = 89
                      Width = 94
                      Height = 13
                      Caption = 'N'#250'mero Documento'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 85
                      Top = 143
                      Width = 63
                      Height = 13
                      Caption = 'C'#243'digo CFOP'
                    end
                    object Label15: TLabel
                      Left = 97
                      Top = 170
                      Width = 51
                      Height = 13
                      Caption = 'Valor Total'
                      FocusControl = DBEdit10
                    end
                    object Label16: TLabel
                      Left = 60
                      Top = 197
                      Width = 88
                      Height = 13
                      Caption = 'Base C'#225'lculo ICMS'
                      FocusControl = DBEdit11
                    end
                    object Label17: TLabel
                      Left = 424
                      Top = 197
                      Width = 52
                      Height = 13
                      Caption = 'Valor ICMS'
                      FocusControl = DBEdit12
                    end
                    object Label18: TLabel
                      Left = 39
                      Top = 224
                      Width = 109
                      Height = 13
                      Caption = 'Isento / N'#227'o Tributado'
                      FocusControl = DBEdit13
                    end
                    object Label19: TLabel
                      Left = 443
                      Top = 224
                      Width = 33
                      Height = 13
                      Caption = 'Outras'
                      FocusControl = DBEdit14
                    end
                    object Label23: TLabel
                      Left = 263
                      Top = 89
                      Width = 34
                      Height = 13
                      Caption = 'Modelo'
                    end
                    object Label25: TLabel
                      Left = 357
                      Top = 35
                      Width = 124
                      Height = 13
                      BiDiMode = bdRightToLeft
                      Caption = 'Usado em notas fiscais de'
                      ParentBiDiMode = False
                    end
                    object Label7: TLabel
                      Left = 43
                      Top = 67
                      Width = 105
                      Height = 13
                      Caption = 'C'#243'digo Transportador'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 548
                      Top = 175
                      Width = 19
                      Height = 13
                      Caption = 'CST'
                      FocusControl = DBEdit4
                    end
                    object Label21: TLabel
                      Left = 431
                      Top = 175
                      Width = 45
                      Height = 13
                      Caption = 'Aliq ICMS'
                      FocusControl = DBEdit6
                    end
                    object Label24: TLabel
                      Left = 392
                      Top = 251
                      Width = 84
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Lan'#231'amento'
                      FocusControl = DBEdit9
                    end
                    object Label38: TLabel
                      Left = 91
                      Top = 357
                      Width = 57
                      Height = 13
                      Caption = 'Chave CT-e'
                      FocusControl = DBEdit21
                    end
                    object lbChaveOperation: TLabel
                      Left = 154
                      Top = 381
                      Width = 61
                      Height = 13
                      Cursor = crHandPoint
                      Caption = 'Clique aqui'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                      OnClick = lbChaveOperationClick
                    end
                    object altDadosTrBtn: TSpeedButton
                      Left = 622
                      Top = 32
                      Width = 23
                      Height = 22
                      Hint = 'Alterar Transportador ou Numero de documento'
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
                      OnClick = altDadosTrBtnClick
                    end
                    object chaveOperationSearchBtn: TSpeedButton
                      Left = 622
                      Top = 354
                      Width = 23
                      Height = 22
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
                      OnClick = chaveOperationSearchBtnClick
                    end
                    object Label39: TLabel
                      Left = 79
                      Top = 403
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cidade Origem'
                    end
                    object Label40: TLabel
                      Left = 77
                      Top = 430
                      Width = 72
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Cidade Destino'
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 622
                      Top = 399
                      Width = 23
                      Height = 22
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
                      OnClick = SpeedButton9Click
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 622
                      Top = 426
                      Width = 23
                      Height = 22
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
                      OnClick = SpeedButton10Click
                    end
                    object Label41: TLabel
                      Left = 107
                      Top = 330
                      Width = 42
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo CTe'
                    end
                    object DBEdit1: TDBEdit
                      Left = 154
                      Top = 32
                      Width = 103
                      Height = 21
                      DataField = 'COD_SERV_TRANSP'
                      DataSource = dtmNF.dsServTransporte
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit5: TDBEdit
                      Left = 154
                      Top = 248
                      Width = 134
                      Height = 21
                      DataField = 'DATA_EMISSAO'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 17
                    end
                    object DBEdit7: TDBEdit
                      Left = 487
                      Top = 113
                      Width = 129
                      Height = 21
                      DataField = 'SUB_SERIE'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 7
                      OnExit = DBEdit7Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 154
                      Top = 86
                      Width = 103
                      Height = 21
                      DataField = 'NUM_DOCUMENTO'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 4
                    end
                    object DBEdit10: TDBEdit
                      Left = 154
                      Top = 167
                      Width = 134
                      Height = 21
                      DataField = 'VALOR_TOTAL'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 10
                    end
                    object DBEdit11: TDBEdit
                      Left = 154
                      Top = 194
                      Width = 134
                      Height = 21
                      DataField = 'BASE_CALC_ICMS'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 13
                      OnExit = DBEdit6Exit
                    end
                    object DBEdit12: TDBEdit
                      Left = 482
                      Top = 194
                      Width = 134
                      Height = 21
                      DataField = 'VALOR_ICMS'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 14
                      OnExit = DBEdit6Exit
                    end
                    object DBEdit13: TDBEdit
                      Left = 154
                      Top = 221
                      Width = 134
                      Height = 21
                      DataField = 'ISENTA_N_TRIBUT'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 15
                    end
                    object DBEdit14: TDBEdit
                      Left = 482
                      Top = 221
                      Width = 134
                      Height = 21
                      DataField = 'OUTRAS'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 16
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 263
                      Top = 59
                      Width = 353
                      Height = 21
                      DataField = 'COD_TRANSPORTADOR'
                      DataSource = dtmNF.dsServTransporte
                      KeyField = 'CODIGO_TR'
                      ListField = 'NOME_TR'
                      ListSource = dtmNF.dsTransp
                      TabOrder = 3
                      OnExit = DBLookupComboBox1Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 263
                      Top = 140
                      Width = 353
                      Height = 21
                      DataField = 'CFOP'
                      DataSource = dtmNF.dsServTransporte
                      KeyField = 'CODIGO_NOP'
                      ListField = 'DESCRICAO_NOP'
                      ListSource = dtmNF.dsNatOp
                      TabOrder = 9
                      OnExit = DBLookupComboBox2Exit
                    end
                    object DBRadioGroup1: TDBRadioGroup
                      Left = 105
                      Top = 275
                      Width = 315
                      Height = 46
                      Caption = 'Modalidade de Frete'
                      Columns = 3
                      DataField = 'CIF_FOB_OUTROS'
                      DataSource = dtmNF.dsServTransporte
                      Items.Strings = (
                        '0 - Outros'
                        '1 - CIF'
                        '2 - FOB')
                      ParentBackground = True
                      TabOrder = 19
                      Values.Strings = (
                        '0'
                        '1'
                        '2')
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 487
                      Top = 32
                      Width = 129
                      Height = 21
                      DataField = 'TIPO'
                      DataSource = dtmNF.dsServTransporte
                      ItemHeight = 13
                      Items.Strings = (
                        'E - Entrada'
                        'S - Sa'#237'da')
                      TabOrder = 1
                      OnExit = DBComboBox2Exit
                    end
                    object DBComboBox2: TDBComboBox
                      Tag = 1
                      Left = 154
                      Top = 113
                      Width = 103
                      Height = 21
                      DataField = 'SERIE'
                      DataSource = dtmNF.dsServTransporte
                      ItemHeight = 13
                      Items.Strings = (
                        'B - S'#201'RIE B'
                        'C - S'#201'RIE C'
                        'U - S'#201'RIE '#218'NICA'
                        'B - S'#201'RIE B '#218'NICA'
                        'C - S'#201'RIE C '#218'NICA')
                      TabOrder = 6
                      OnExit = DBComboBox2Exit
                    end
                    object DBComboBox3: TDBComboBox
                      Tag = 1
                      Left = 303
                      Top = 86
                      Width = 313
                      Height = 21
                      DataField = 'MODELO'
                      DataSource = dtmNF.dsServTransporte
                      ItemHeight = 13
                      Items.Strings = (
                        '07 - Nota Fiscal de Servi'#231'o de Transporte'
                        '08 - Conhecimento de Transporte Rodovi'#225'rio de Cargas'
                        '8B - Conhecimento de Transporte de Cargas Avulsos'
                        '09 - Conhecimento de Transporte Aquavi'#225'rio de Cargas '
                        '11 - Conhecimento de Transporte Ferrovi'#225'rio de Cargas'
                        '26 - Conhecimento de Transporte Multimodal de Cargas'
                        '27 - Nota Fiscal de Transporte Ferrovi'#225'rio de Cargas'
                        '57 - Conhecimento de Transporte Eletronico - CT-e')
                      TabOrder = 5
                      OnExit = DBComboBox2Exit
                    end
                    object DBEdit2: TDBEdit
                      Left = 154
                      Top = 59
                      Width = 103
                      Height = 21
                      DataField = 'COD_TRANSPORTADOR'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 2
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBEdit3: TDBEdit
                      Left = 154
                      Top = 140
                      Width = 103
                      Height = 21
                      DataField = 'CFOP'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 8
                      OnExit = DBEdit3Exit
                    end
                    object BitBtn7: TBitBtn
                      Left = 482
                      Top = 275
                      Width = 134
                      Height = 46
                      Caption = 'Notas Fiscais'
                      TabOrder = 20
                      OnClick = BitBtn7Click
                      Glyph.Data = {
                        FE020000424DFE02000000000000BE0000002800000018000000180000000100
                        08000000000040020000120B0000120B00002200000022000000FF00FF00A981
                        7E00A77F7B00F2EBEA00A1726600B47A6200B6846F00EBC7A300EBCAA500FFC5
                        7E00F3D5B200FFC98100FFCC8800F6DCBB00EBD3B500EBD9C100FFCC8400FFCE
                        8600FFD59A00FFD08800FFD38A00FFD18B00FFDD9D00FFE3AF00FFE6AD00FFEE
                        BD00FFF2C600FFF3CB00FFF8DC00FFFFDE00FFFFE600FFFFFA00FFFFFF000000
                        000000000000050404040404040404040404040404040404000000000000060F
                        0F0E0E0E0D0D07070808080A0A14140400000006062006062006062006062006
                        0620060620200904000000062020202020202020202020202020202020041304
                        000000202020202020202020202020202020202020040B040000000620202020
                        2020202020202020202020202020100400000006202020202020202020202020
                        2020202020041104000000202020202020202020202020202020202020040B04
                        0000000620202020202020202020202020202020202015040000000620202020
                        20202020202020202020202020040C0400000020202020202020202020202020
                        2020202020041604000000062020202020202020202020202020202020201204
                        0000000620202020202020202020202020202020200418040000002020202020
                        2020202020202020202020202004170400000006202020202020202020202020
                        2020202020201904000000062020202020202020202020202020202020041A04
                        000000202020202020202020202020202020202020041B040000000620202020
                        20202020202020202020202020201D0400000006202020202020202020202020
                        2020202020041C04000000022020202020202020202020202020202020041F04
                        000000202020202020202020202020202020202020201E040000000620202020
                        2020202020202020202020202004040400000006202020202020202020202020
                        2020202020040000000000200606030606200606200601200101200101200000
                        0000}
                    end
                    object DBEdit4: TDBEdit
                      Left = 573
                      Top = 167
                      Width = 43
                      Height = 21
                      DataField = 'CST_ICMS'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 12
                    end
                    object DBEdit6: TDBEdit
                      Left = 482
                      Top = 167
                      Width = 60
                      Height = 21
                      DataField = 'ALIQ_ICM'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 11
                      OnExit = DBEdit6Exit
                    end
                    object DBEdit9: TDBEdit
                      Left = 482
                      Top = 248
                      Width = 134
                      Height = 21
                      DataField = 'DATA_LANCAMENTO'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 18
                    end
                    object DBEdit21: TDBEdit
                      Left = 154
                      Top = 354
                      Width = 462
                      Height = 21
                      DataField = 'CHV_CTE'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 21
                    end
                    object lkCidadeOrigem: TDBLookupComboBox
                      Left = 155
                      Top = 400
                      Width = 461
                      Height = 21
                      DataField = 'COD_MUN_ORIG'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 23
                    end
                    object lkCidadeDestino: TDBLookupComboBox
                      Left = 155
                      Top = 427
                      Width = 461
                      Height = 21
                      DataField = 'COD_MUN_DEST'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 24
                    end
                    object lkTpCTe: TDBLookupComboBox
                      Left = 155
                      Top = 327
                      Width = 265
                      Height = 21
                      DataField = 'TP_CT_E'
                      DataSource = dtmNF.dsServTransporte
                      TabOrder = 22
                    end
                  end
                end
              end
              object tsNotas: TTabSheet
                Caption = 'Notas Fiscais'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 432
                  Align = alTop
                  Caption = 'Notas Fiscais do Frete'
                  TabOrder = 0
                  object Label9: TLabel
                    Left = 74
                    Top = 39
                    Width = 68
                    Height = 13
                    Caption = 'N'#250'mero da NF'
                  end
                  object Label20: TLabel
                    Left = 199
                    Top = 39
                    Width = 24
                    Height = 13
                    Caption = 'S'#233'rie'
                  end
                  object Label22: TLabel
                    Left = 270
                    Top = 39
                    Width = 191
                    Height = 13
                    Caption = 'C'#243'digo Cliente / Fornecedor - F3 Buscar'
                  end
                  object EditMoeda1: TEditMoeda
                    Left = 74
                    Top = 58
                    Width = 119
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 0
                    FormatReal = fInteger
                    FormatSize = '10.2'
                  end
                  object EditMoeda2: TEditMoeda
                    Left = 199
                    Top = 58
                    Width = 65
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 1
                    FormatReal = fInteger
                    FormatSize = '10.2'
                  end
                  object EditMoeda3: TEditMoeda
                    Left = 270
                    Top = 58
                    Width = 191
                    Height = 21
                    Alignment = taRightJustify
                    TabOrder = 2
                    FormatReal = fInteger
                    FormatSize = '10.2'
                    OnExit = EditMoeda3Exit
                    OnKeyDown = EditMoeda3KeyDown
                  end
                  object BitBtn9: TBitBtn
                    Left = 467
                    Top = 54
                    Width = 98
                    Height = 25
                    Caption = 'Adicionar'
                    TabOrder = 3
                    OnClick = BitBtn9Click
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
                  object BitBtn10: TBitBtn
                    Left = 571
                    Top = 54
                    Width = 75
                    Height = 25
                    Caption = 'Apagar'
                    TabOrder = 4
                    OnClick = BitBtn10Click
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
                  object BitBtn38: TBitBtn
                    Left = 571
                    Top = 355
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 5
                    OnClick = BitBtn38Click
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
                  object DBListBox1: TListBox
                    Left = 74
                    Top = 85
                    Width = 572
                    Height = 264
                    ItemHeight = 13
                    TabOrder = 6
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 496
              ExplicitTop = 496
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [NF0129]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitHeight = 544
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [NF0124]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [NF0125]'
            end
          end
          inherited Panel1: TPanel
            Height = 471
            ExplicitHeight = 471
            inherited Splitter1: TSplitter
              Height = 410
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 410
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_SERV_TRANSP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_FORNECEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_NOTA_NFE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_EMISSAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUB_SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_DOCUMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CFOP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_TOTAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE_CALC_ICMS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_ICMS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ISENTA_N_TRIBUT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OUTRAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIF_FOB_OUTROS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SITUACAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_TRANSPORTADOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODELO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOTAS_FISCAIS'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [NF0126]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [NF0127]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Left = 378
                Top = 6
                Enabled = False
                Visible = False
                OnClick = SpeedButton25Click
                ExplicitLeft = 378
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 295
                Top = 6
                Visible = False
                OnClick = SpeedButton5Click
                ExplicitLeft = 295
                ExplicitTop = 6
              end
              inherited SpeedButton6: TSpeedButton
                Left = 178
                Hint = 'Dados PISCOFINS para o SPED - [NF0128]'
                Glyph.Data = {
                  B6070000424DB6070000000000003604000028000000200000001C0000000100
                  08000000000080030000C40E0000C40E00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFF6080808EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEF07070707F7070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF07
                  070707F7F7F7F7F7F7F7F7F707F707EFEFEFEFEFEFEFEFEFEFEFEFEF07F5F7F7
                  ED07F7F7F7F7EE07EEF7F7F7F7F7A4A4F707EFEFEFEFEFEFEFEFEFEFED070707
                  07070707070808080808080808070707F5080707EFEFEFEFEFEFEFEF07070707
                  070707070808080808080808080707070707EFEFEFEFEFEFEFEFEFEFEF070707
                  F7070707070707070707070707070707070708EFEFEFEFEFEFEFEFEFEFEF0707
                  070707070707070707070707F7F7F7F7A4A5F707EFEFEFEFEFEFEFEFEF080707
                  0707070708F6F6F6F6F6F6F6F60808080707F70707EFEFEFEFEFEFEFEF080707
                  080708F6F6F6F6F6FFF6F6F6F608080707070708EFEFEFEFEFEFEFEFEFEF0808
                  080708F6F6F6F6F6F6F6F6080808080808070708EFEFEFEFEFEFEFEFEFEF0707
                  07080707070707F7F7F7F7F7F7F7F7A5A4ADF7F708EFEFEFEFEFEFEFEFEF0807
                  08080808070707F6F6F6F6F60808070707070707070707EFEFEFEFEFEFEFF608
                  0808080707F6F6070807F608F6F607F6F6F6F7F6EFEFEFEFEFEFEFEFEFEFEF07
                  08080807F6B6F608F6F60807F60707F6AEF607F6EFEFEFEFEFEFEFEFEFEFEFEF
                  07070807F7F60707F608F607F6B708F6F60708EFEFEFEFEFEFEFEFEFEFEFEFEF
                  0707070707F7070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EF07070707070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEF07F6F6F608F608F6F6F6F6F60807EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEF08F6FFFFF6F6F6F6F60707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEF07070707070708EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
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
                Left = 398
                Top = 6
                Enabled = False
                Visible = False
                OnClick = SpeedButton25Click
                ExplicitLeft = 398
                ExplicitTop = 6
              end
              inherited SpeedButton26: TSpeedButton
                Top = 6
                Visible = False
                ExplicitTop = 6
              end
              object SpeedButton13: TSpeedButton
                Left = 235
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Ajustes ICMS SPED - [NF0252]'
                Flat = True
                Glyph.Data = {
                  B6070000424DB6070000000000003604000028000000200000001C0000000100
                  08000000000080030000C40E0000C40E00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFF6080808EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEF07070707F7070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF07
                  070707F7F7F7F7F7F7F7F7F707F707EFEFEFEFEFEFEFEFEFEFEFEFEF07F5F7F7
                  ED07F7F7F7F7EE07EEF7F7F7F7F7A4A4F707EFEFEFEFEFEFEFEFEFEFED070707
                  07070707070808080808080808070707F5080707EFEFEFEFEFEFEFEF07070707
                  070707070808080808080808080707070707EFEFEFEFEFEFEFEFEFEFEF070707
                  F7070707070707070707070707070707070708EFEFEFEFEFEFEFEFEFEFEF0707
                  070707070707070707070707F7F7F7F7A4A5F707EFEFEFEFEFEFEFEFEF080707
                  0707070708F6F6F6F6F6F6F6F60808080707F70707EFEFEFEFEFEFEFEF080707
                  080708F6F6F6F6F6FFF6F6F6F608080707070708EFEFEFEFEFEFEFEFEFEF0808
                  080708F6F6F6F6F6F6F6F6080808080808070708EFEFEFEFEFEFEFEFEFEF0707
                  07080707070707F7F7F7F7F7F7F7F7A5A4ADF7F708EFEFEFEFEFEFEFEFEF0807
                  08080808070707F6F6F6F6F60808070707070707070707EFEFEFEFEFEFEFF608
                  0808080707F6F6070807F608F6F607F6F6F6F7F6EFEFEFEFEFEFEFEFEFEFEF07
                  08080807F6B6F608F6F60807F60707F6AEF607F6EFEFEFEFEFEFEFEFEFEFEFEF
                  07070807F7F60707F608F607F6B708F6F60708EFEFEFEFEFEFEFEFEFEFEFEFEF
                  0707070707F7070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EF07070707070707070707070707070707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEF07F6F6F608F608F6F6F6F6F60807EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEF08F6FFFFF6F6F6F6F60707EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEF07070707070708EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton13Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 410
              ExplicitHeight = 410
              inherited ScrollBox2: TScrollBox
                Height = 393
                ExplicitHeight = 393
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitHeight = 544
        end
        object tsContasAPagarCadastro: TTabSheet
          Caption = 'tsContasAPagarCadastro'
          ImageIndex = 2
          object pnCPCad: TPanel
            Left = 3
            Top = 3
            Width = 454
            Height = 270
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel5: TPanel
              Left = 8
              Top = 8
              Width = 433
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Contas a Pagar do Conhecimento de Transporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object GroupBox5: TGroupBox
              Left = 8
              Top = 55
              Width = 433
              Height = 154
              Caption = 'Informa'#231#245'es do Documento'
              TabOrder = 1
              object Label26: TLabel
                Left = 37
                Top = 32
                Width = 96
                Height = 13
                Alignment = taRightJustify
                Caption = 'Data de Vencimento'
              end
              object Label27: TLabel
                Left = 24
                Top = 59
                Width = 109
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#250'mero de Documento'
              end
              object Label28: TLabel
                Left = 96
                Top = 86
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'His'#243'rico'
              end
              object MaskEdit4: TMaskEdit
                Left = 139
                Top = 29
                Width = 118
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object MaskEdit5: TMaskEdit
                Left = 139
                Top = 56
                Width = 117
                Height = 21
                MaxLength = 20
                TabOrder = 1
              end
              object MaskEdit6: TMaskEdit
                Left = 139
                Top = 83
                Width = 278
                Height = 21
                MaxLength = 60
                TabOrder = 2
              end
              object CheckBox2: TCheckBox
                Left = 88
                Top = 110
                Width = 65
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Despesa'
                TabOrder = 3
              end
            end
            object Panel6: TPanel
              Left = 8
              Top = 215
              Width = 433
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn29: TBitBtn
                Left = 137
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn29Click
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
              object BitBtn34: TBitBtn
                Left = 218
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Clique neste bot'#227'o para cancelar os dados digitados'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn34Click
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
        object tsSPED: TTabSheet
          Caption = 'tsSPED'
          ImageIndex = 4
          object pnDadosSPED: TPanel
            Left = 1
            Top = 3
            Width = 793
            Height = 342
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnDadosSPEDEnter
            object Panel4: TPanel
              Left = 4
              Top = 7
              Width = 781
              Height = 277
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object Label29: TLabel
                Left = 10
                Top = 138
                Width = 107
                Height = 13
                Alignment = taRightJustify
                Caption = 'Natureza Base C'#225'lculo'
              end
              object Label30: TLabel
                Left = 79
                Top = 165
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST PIS'
              end
              object Label31: TLabel
                Left = 57
                Top = 192
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'CST COFINS'
              end
              object Label32: TLabel
                Left = 336
                Top = 219
                Width = 36
                Height = 13
                Caption = 'Aliq PIS'
                FocusControl = DBEdit15
              end
              object Label33: TLabel
                Left = 314
                Top = 246
                Width = 58
                Height = 13
                Caption = 'Aliq COFINS'
                FocusControl = DBEdit16
              end
              object Label34: TLabel
                Left = 75
                Top = 219
                Width = 42
                Height = 13
                Caption = 'Base PIS'
                FocusControl = DBEdit17
              end
              object Label35: TLabel
                Left = 57
                Top = 246
                Width = 64
                Height = 13
                Caption = 'Base COFINS'
                FocusControl = DBEdit18
              end
              object Label36: TLabel
                Left = 584
                Top = 219
                Width = 43
                Height = 13
                Caption = 'Valor PIS'
                FocusControl = DBEdit19
              end
              object Label37: TLabel
                Left = 562
                Top = 246
                Width = 65
                Height = 13
                Caption = 'Valor COFINS'
                FocusControl = DBEdit20
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 10
                Top = 5
                Width = 757
                Height = 124
                Caption = 'Indicador da Natureza do Frete Contratado, referente a:'
                DataField = 'IND_NAT_FRT'
                DataSource = dtmNF.dsServTransporte
                Items.Strings = (
                  
                    '0 - Opera'#231#245'es de vendas, com '#244'nus suportado pelo estabelecimento' +
                    ' vendedor;'
                  '1 - Opera'#231#245'es de vendas, com '#244'nus suportado pelo adquirente;'
                  
                    '2 - Opera'#231#245'es de compras (bens para revenda, mat'#233'riasprima e out' +
                    'ros produtos, geradores de cr'#233'dito);'
                  
                    '3 - Opera'#231#245'es de compras (bens para revenda, mat'#233'riasprima e out' +
                    'ros produtos, n'#227'o geradores de cr'#233'dito);'
                  
                    '4 - Transfer'#234'ncia de produtos acabados entre estabelecimentos da' +
                    ' pessoa jur'#237'dica;'
                  
                    '5 - Transfer'#234'ncia de produtos em elabora'#231#227'o entre estabeleciment' +
                    'os da pessoa jur'#237'dica'
                  '9 - Outras.')
                ParentBackground = True
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '9')
              end
              object DBComboBox4: TDBComboBox
                Left = 123
                Top = 135
                Width = 644
                Height = 21
                DataField = 'NAT_BC_CRED'
                DataSource = dtmNF.dsServTransporte
                ItemHeight = 13
                Items.Strings = (
                  '01 - Aquisi'#231#227'o de bens para revenda'
                  '02 - Aquisi'#231#227'o de bens utilizados como insumo'
                  '03 - Aquisi'#231#227'o de servi'#231'os utilizados como insumo'
                  '04 - Energia el'#233'trica e t'#233'rmica, inclusive sob a forma de vapor'
                  '05 - Alugu'#233'is de pr'#233'dios'
                  '06 - Alugu'#233'is de m'#225'quinas e equipamentos'
                  '07 - Armazenagem de mercadoria e frete na opera'#231#227'o de venda'
                  '08 - Contrapresta'#231#245'es de arrendamento mercantil'
                  
                    '09 - M'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                    'imobilizado (cr'#233'dito sobre encargos de deprecia'#231#227'o).'
                  
                    '10 - M'#225'quinas, equipamentos e outros bens incorporados ao ativo ' +
                    'imobilizado (cr'#233'dito com base no valor de aquisi'#231#227'o).'
                  
                    '11 - Amortiza'#231#227'o e Deprecia'#231#227'o de edifica'#231#245'es e benfeitorias em ' +
                    'im'#243'veis'
                  '12 - Devolu'#231#227'o de Vendas Sujeitas '#224' Incid'#234'ncia N'#227'o-Cumulativa'
                  '13 - Outras Opera'#231#245'es com Direito a Cr'#233'dito'
                  '14 - Atividade de Transporte de Cargas '#8211' Subcontrata'#231#227'o'
                  
                    '15 - Atividade Imobili'#225'ria '#8211' Custo Incorrido de Unidade Imobili'#225 +
                    'ria'
                  
                    '16 - Atividade Imobili'#225'ria '#8211' Custo Or'#231'ado de unidade n'#227'o conclu'#237 +
                    'da'
                  
                    '17 - Atividade de Presta'#231#227'o de Servi'#231'os de Limpeza, Conserva'#231#227'o ' +
                    'e Manuten'#231#227'o '#8211' vale-transporte, vale-refei'#231#227'o ou vale-alimenta'#231#227 +
                    'o, fardamento ou uniforme.'
                  '18 - Estoque de abertura de bens')
                TabOrder = 1
                OnExit = DBComboBox4Exit
              end
              object DBComboBox14: TDBComboBox
                Tag = 1
                Left = 123
                Top = 162
                Width = 644
                Height = 21
                Hint = 'CST de PIS'
                DataField = 'CST_PIS'
                DataSource = dtmNF.dsServTransporte
                ItemHeight = 13
                Items.Strings = (
                  
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
                TabOrder = 2
                OnExit = DBComboBox14Exit
              end
              object DBComboBox5: TDBComboBox
                Tag = 1
                Left = 123
                Top = 189
                Width = 644
                Height = 21
                Hint = 'CST de PIS'
                DataField = 'CST_PIS'
                DataSource = dtmNF.dsServTransporte
                ItemHeight = 13
                Items.Strings = (
                  
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
                TabOrder = 3
                OnExit = DBComboBox5Exit
              end
              object DBEdit15: TDBEdit
                Left = 378
                Top = 216
                Width = 134
                Height = 21
                DataField = 'ALIQ_PIS'
                DataSource = dtmNF.dsServTransporte
                TabOrder = 5
                OnExit = DBEdit17Exit
              end
              object DBEdit16: TDBEdit
                Left = 378
                Top = 243
                Width = 134
                Height = 21
                DataField = 'ALIQ_COFINS'
                DataSource = dtmNF.dsServTransporte
                TabOrder = 8
                OnExit = DBEdit17Exit
              end
              object DBEdit17: TDBEdit
                Left = 123
                Top = 216
                Width = 134
                Height = 21
                DataField = 'BASE_PIS'
                DataSource = dtmNF.dsServTransporte
                TabOrder = 4
                OnExit = DBEdit17Exit
              end
              object DBEdit18: TDBEdit
                Left = 123
                Top = 243
                Width = 134
                Height = 21
                DataField = 'BASE_COFINS'
                DataSource = dtmNF.dsServTransporte
                TabOrder = 7
                OnExit = DBEdit17Exit
              end
              object DBEdit19: TDBEdit
                Left = 633
                Top = 216
                Width = 134
                Height = 21
                DataField = 'VALOR_PIS'
                DataSource = dtmNF.dsServTransporte
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit20: TDBEdit
                Left = 633
                Top = 243
                Width = 134
                Height = 21
                DataField = 'VALOR_COFINS'
                DataSource = dtmNF.dsServTransporte
                ReadOnly = True
                TabOrder = 9
              end
            end
            object Panel8: TPanel
              Left = 4
              Top = 290
              Width = 781
              Height = 41
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn20: TBitBtn
                Left = 310
                Top = 6
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn20Click
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
              object BitBtn21: TBitBtn
                Left = 391
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn21Click
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
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 9999
      ExplicitLeft = 9999
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 579
    ExplicitTop = 579
  end
  inherited pnStatusProcessamento: TPanel
    Left = 9999
    ExplicitLeft = 9999
  end
  inherited PopupMenu1: TPopupMenu
    Left = 612
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 678
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 646
    Top = 3
  end
end
