inherited FrmCadContasAPagar: TFrmCadContasAPagar
  Left = 214
  Top = 91
  Caption = 'Contas a Pagar'
  ClientHeight = 574
  ClientWidth = 891
  Scaled = False
  ExplicitWidth = 907
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 891
    Height = 555
    ExplicitWidth = 891
    ExplicitHeight = 555
    inherited Splitter2: TSplitter
      Height = 553
      ExplicitLeft = 1001
      ExplicitHeight = 555
    end
    inherited PanelLeft: TPanel
      Width = 886
      Height = 553
      ExplicitWidth = 886
      ExplicitHeight = 553
      inherited PageControl1: TPageControl
        Width = 884
        Height = 551
        ExplicitWidth = 884
        ExplicitHeight = 551
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
          inherited ScrollBox1: TScrollBox
            Width = 876
            Height = 520
            ExplicitWidth = 876
            ExplicitHeight = 520
            inherited PageControl3: TPageControl
              Width = 876
              Height = 485
              ExplicitWidth = 876
              ExplicitHeight = 485
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 868
                ExplicitHeight = 454
                inherited ScrollBox3: TScrollBox
                  Width = 868
                  Height = 454
                  ExplicitWidth = 868
                  ExplicitHeight = 454
                  inherited GroupBox1: TGroupBox
                    Width = 847
                    Height = 545
                    Caption = 'Cadastro Conta a Pagar'
                    OnEnter = GroupBox1Enter
                    ExplicitWidth = 847
                    ExplicitHeight = 545
                    object Label7: TLabel
                      Left = 96
                      Top = 353
                      Width = 45
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Controle:'
                    end
                    object Label8: TLabel
                      Left = 78
                      Top = 41
                      Width = 63
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' da Conta:'
                    end
                    object Label9: TLabel
                      Left = 51
                      Top = 147
                      Width = 86
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Nome do Fornec.:'
                      FocusControl = DBEdit6
                    end
                    object Label11: TLabel
                      Left = 96
                      Top = 249
                      Width = 45
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Hist'#243'rico:'
                      FocusControl = DBEdit8
                    end
                    object Label12: TLabel
                      Left = 53
                      Top = 173
                      Width = 88
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' do Documento:'
                      FocusControl = DBEdit9
                    end
                    object Label13: TLabel
                      Left = 113
                      Top = 275
                      Width = 28
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor:'
                      FocusControl = DBEdit10
                    end
                    object Label6: TLabel
                      Left = 69
                      Top = 301
                      Width = 72
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data de Venc.:'
                      FocusControl = DBEdit1
                    end
                    object Label10: TLabel
                      Left = 70
                      Top = 405
                      Width = 71
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo de Conta:'
                    end
                    object Label15: TLabel
                      Left = 441
                      Top = 405
                      Width = 85
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Lancamento:'
                    end
                    object Label16: TLabel
                      Left = 107
                      Top = 379
                      Width = 34
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Aceite:'
                    end
                    object Label17: TLabel
                      Left = 300
                      Top = 486
                      Width = 50
                      Height = 13
                      Caption = 'Nominal a:'
                      FocusControl = DBEdit7
                    end
                    object Label18: TLabel
                      Left = 85
                      Top = 486
                      Width = 56
                      Height = 13
                      Caption = 'N'#186' Cheque:'
                      FocusControl = DBEdit11
                    end
                    object Label20: TLabel
                      Left = 83
                      Top = 327
                      Width = 58
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Banco Doc.:'
                      FocusControl = DBEdit13
                    end
                    object Label23: TLabel
                      Left = 106
                      Top = 459
                      Width = 35
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Chassi:'
                    end
                    object Label24: TLabel
                      Left = 61
                      Top = 431
                      Width = 80
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'N'#186' Nota compra:'
                    end
                    object Label25: TLabel
                      Left = 44
                      Top = 224
                      Width = 97
                      Height = 13
                      Caption = 'Data de Refer'#234'ncia:'
                      FocusControl = DBEdit16
                    end
                    object Label26: TLabel
                      Left = 416
                      Top = 379
                      Width = 110
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Previs'#227'o Compet'#234'ncia:'
                    end
                    object SpeedButton20: TSpeedButton
                      Left = 222
                      Top = 195
                      Width = 23
                      Height = 22
                      Hint = 'Modificar a data de cadastro da conta - [CTP043]'
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
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton20Click
                    end
                    object Label41: TLabel
                      Left = 67
                      Top = 199
                      Width = 74
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Cadastro:'
                      FocusControl = DBEdit9
                    end
                    object Label42: TLabel
                      Left = 93
                      Top = 16
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada:'
                      FocusControl = DBEdit1
                    end
                    object Label43: TLabel
                      Left = 444
                      Top = 429
                      Width = 82
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Serie NF compra:'
                    end
                    object Label131: TLabel
                      Left = 456
                      Top = 275
                      Width = 70
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor Cont'#225'bil:'
                      FocusControl = DBEdit68
                    end
                    object SpeedButtonObsCtp: TSpeedButton
                      Left = 634
                      Top = 246
                      Width = 58
                      Height = 21
                      Hint = 'Observa'#231#245'es da Conta'
                      Flat = True
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F6FBF7F5FAF5F4FAF5F3FBF6F5FCF7F5F8
                        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CECD93B1BC
                        9BB8C4AAD0DFA8CDDC9DB8C493B0BCB2ADABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFF12B8D813BADF127F9E167C9B10A3DA0E9ED8FF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6C7CB
                        04C5E51D323644545800A7DE91B9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDDDC5C7174545C5DC7D2D7FFFFFEE1
                        E7EAB5FFFFFFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFF4F36873746B6666D2C0BFCAD7DCB7FBFEB2FFFFB8C8CDC0C9CDF7F1F0FFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF67ACECC64D4D7A4F6FFA7F3FFA7
                        F4FFA7F4FFA9F6FFA9F6FF9DF3FFA1F2FFB6BDBFFBF5F4FFFFFFFFFFFFFFF9F6
                        90D1EFB7C7D1AEB9BF9BEAFF9DEBFF9DECFF9DEDFF9FF0FFA0F0FF9CEDFF96E8
                        FF98E8FFA6BBC3FFFFFFFFFFFF76D0F788D5F896DBF998DEFB99E1FC96E1FC8D
                        E0FE8CE0FE8AE1FF8AE1FF86DFFF86DEFF8BDFFF8AE1FFE9E1DFFFFFFF84D3F7
                        98DBF8A6E0FAA8E0FAA3E0FB9DE0FC8EDCFB89DCFC85DCFE81DCFE7BDAFE7CDA
                        FF84DCFF86DDFFCBD0D2FFFFFFCFEDFCD2EEFBD1EEFCCEEDFCBEE8FBB3E5FB9A
                        DDFA8ED9FA82D6FA7DD5FB76D4FC76D5FD82DBFF89DDFFE8E5E3FFFFFFB9E5F9
                        E3F4FCDFF3FCDBF1FCCEEDFCC2EAFCAAE1FA9EDEFA8FDAFA87D7FA7DD5FB7BD5
                        FC84DAFD87DFFFFFFFFEFFFFFFFFFFFFEAF5FBECF9FEF0FAFDE1F3FCD7F0FBC0
                        E9FBB4E4FAA5DFFA9FDFFA95DCFA8EDAFC9FD2E8FFF8F5FFFFFFFFFFFFFFFFFF
                        FFFFFFD2ECF9C5E9F9E5F6FDDFF3FCCAECFCBFE9FBAEE3FAA6DFFA86D5F894D1
                        EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton26Click
                    end
                    object SpeedButton22: TSpeedButton
                      Left = 222
                      Top = 220
                      Width = 23
                      Height = 22
                      Hint = 
                        'Modificar a data de refer'#234'ncia da conta - [Modificar a data de r' +
                        'efer'#234'ncia da conta - [CTP044]'
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
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton22Click
                    end
                    object DBEdit16: TDBEdit
                      Left = 143
                      Top = 221
                      Width = 73
                      Height = 21
                      Hint = 'Data de refer'#234'ncia do documento'
                      DataField = 'DTREFERENCIA'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      Enabled = False
                      TabOrder = 8
                      OnExit = DBEdit16Exit
                    end
                    object GroupBox10: TGroupBox
                      Left = 262
                      Top = 169
                      Width = 366
                      Height = 72
                      Caption = 'Parcelas'
                      TabOrder = 28
                      OnExit = GroupBox7Exit
                      object ListBox1: TListBox
                        Left = 2
                        Top = 15
                        Width = 262
                        Height = 55
                        Align = alClient
                        ItemHeight = 13
                        TabOrder = 0
                      end
                      object Panel43: TPanel
                        Left = 264
                        Top = 15
                        Width = 100
                        Height = 55
                        Align = alRight
                        BevelOuter = bvNone
                        TabOrder = 1
                        object BitBtn26: TBitBtn
                          Left = 0
                          Top = 0
                          Width = 100
                          Height = 21
                          Hint = 'Parcelas'
                          Align = alTop
                          Caption = 'Parcelas'
                          TabOrder = 0
                          OnClick = BitBtn26Click
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
                        object BitBtn30: TBitBtn
                          Left = 0
                          Top = 34
                          Width = 100
                          Height = 21
                          Hint = 'Apagar'
                          Align = alBottom
                          Caption = 'Apagar'
                          TabOrder = 1
                          OnClick = btApagarDespClick
                          Glyph.Data = {
                            36050000424D3605000000000000360400002800000010000000100000000100
                            08000000000000010000430B0000430B00000001000000000000000000000000
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
                            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFD5D5D5D
                            5D5D5D5D5D5D5D5DFDFDFDFD5EE49B9B9B9B9B9B9B9B9B9B5DFDFDFD5EE4B767
                            67AFF6F6B76767665DFDFDFD5EE467676767A466676767675DFDFDFD5EE40867
                            676767676767679D5DFDFDFD5EE4F666676767676767EF9B5DFDFDFD5EE4F6F6
                            EF67676767EFF69B5DFDFDFD5EE4FFFF1667676767AFFF9B5DFDFDFD66E4FFB7
                            676767676767FF9B5DFDFDFD66E4B767676767676767B7E45DFDFDFD66A66767
                            67671667676767E45DFDFDFDA667676767B701F6676767675DFDFDFDA6A56767
                            16FF01010D1FB7A65DFDFDFDA6E4FFFFFFFFFFFFFFFFFFE45DFDFDFDA6E4E4E4
                            E4E4E4E4E4E4E4E45DFDFDFDFDA6665E5E5E5E5E5E5E5E5EFDFD}
                        end
                      end
                    end
                    object DBEdit6: TDBEdit
                      Left = 202
                      Top = 144
                      Width = 426
                      Height = 21
                      Hint = 'Raz'#227'o do Fornecedor'
                      CharCase = ecUpperCase
                      DataField = 'NOME_FOR_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 5
                    end
                    object DBEdit8: TDBEdit
                      Left = 143
                      Top = 246
                      Width = 485
                      Height = 21
                      Hint = 'Hist'#243'rico do documento'
                      CharCase = ecUpperCase
                      DataField = 'HISTORICO_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 9
                    end
                    object DBEdit9: TDBEdit
                      Left = 143
                      Top = 170
                      Width = 100
                      Height = 21
                      Hint = 'N'#250'mero do documento'
                      CharCase = ecUpperCase
                      DataField = 'N_DOC_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 6
                    end
                    object DBEdit10: TDBEdit
                      Left = 143
                      Top = 272
                      Width = 113
                      Height = 21
                      Hint = 'Valor do documento'
                      DataField = 'VALOR_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 10
                      OnExit = DBEdit10Exit
                    end
                    object DBEdit1: TDBEdit
                      Left = 143
                      Top = 298
                      Width = 113
                      Height = 21
                      Hint = 'Data de Vencimento'
                      DataField = 'DATA_VENC_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 12
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 203
                      Top = 38
                      Width = 425
                      Height = 21
                      Hint = 'Descri'#231#227'o da Conta'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC;N_CONTA_PLC'
                      ListSource = dtmContasAPagar.dsPContas
                      TabOrder = 3
                      OnExit = DBLookupComboBox1Exit
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 202
                      Top = 350
                      Width = 426
                      Height = 21
                      Hint = 'Descri'#231#227'o do controle'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      KeyField = 'CODIGO_CTRL'
                      ListField = 'NOME_CTRL;CODIGO_CTRL'
                      ListSource = dtmContasAPagar.dsControles
                      TabOrder = 16
                      OnExit = DBLookupComboBox3Exit
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 143
                      Top = 402
                      Width = 113
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      ItemHeight = 13
                      Items.Strings = (
                        'D - DESPESAS'
                        'F - FORNECEDOR')
                      TabOrder = 19
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBEdit2: TDBEdit
                      Left = 143
                      Top = 38
                      Width = 57
                      Height = 21
                      Hint = 'N'#250'mero da Conta'
                      DataField = 'N_CONTA_PLC'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 2
                      OnEnter = DBEdit2Enter
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBEdit3: TDBEdit
                      Left = 143
                      Top = 350
                      Width = 57
                      Height = 21
                      Hint = 'C'#243'digo do controle do documento'
                      DataField = 'CODIGO_CTRL'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 15
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 143
                      Top = 144
                      Width = 57
                      Height = 21
                      Hint = '[F3: Consultar]  - C'#243'digo do Fornecedor'
                      DataField = 'COD_FORN_NFE'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 4
                      OnExit = DBEdit5Exit
                      OnKeyDown = DBEdit5KeyDown
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 528
                      Top = 402
                      Width = 100
                      Height = 21
                      Hint = 'Tipo de lan'#231'amento'
                      CharCase = ecUpperCase
                      DataField = 'TIP_CNT'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      ItemHeight = 13
                      Items.Strings = (
                        'C'
                        'N')
                      TabOrder = 20
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 143
                      Top = 376
                      Width = 113
                      Height = 21
                      Hint = 
                        'Indica para o sistema que a conta cadastrada realmente existe e ' +
                        'o documento dela est'#225' arquivado'
                      CharCase = ecUpperCase
                      DataField = 'ACEITE_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 17
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBEdit7: TDBEdit
                      Left = 352
                      Top = 483
                      Width = 276
                      Height = 21
                      Hint = 'Cheque Nominal a...'
                      CharCase = ecUpperCase
                      DataField = 'NOMINAL_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 25
                    end
                    object DBEdit11: TDBEdit
                      Left = 144
                      Top = 483
                      Width = 84
                      Height = 21
                      Hint = 'N'#250'mero do cheque'
                      DataField = 'N_CHEQ_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 24
                      OnExit = DBEdit11Exit
                    end
                    object DBEdit13: TDBEdit
                      Left = 143
                      Top = 324
                      Width = 113
                      Height = 21
                      Hint = 'Iidentifica para qual banco o documento foi emitido'
                      CharCase = ecUpperCase
                      DataField = 'NOME_BANCO_DUPL'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 13
                    end
                    object DBEdit14: TDBEdit
                      Left = 143
                      Top = 456
                      Width = 485
                      Height = 21
                      Hint = 'Chassi do ve'#237'culo(Moto) a que a conta pertence'
                      CharCase = ecUpperCase
                      DataField = 'CHASSI_CONC'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 23
                    end
                    object DBEdit15: TDBEdit
                      Left = 143
                      Top = 428
                      Width = 66
                      Height = 21
                      Hint = 'N'#250'mero da Nota Fical de Entrada'
                      DataField = 'NUM_NOTA_NFE'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 21
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 528
                      Top = 376
                      Width = 100
                      Height = 21
                      Hint = 'Previs'#227'o Compet'#234'ncia'
                      CharCase = ecUpperCase
                      DataField = 'ENTRA_PREVISAO'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 18
                      OnKeyPress = DBComboBox3KeyPress
                    end
                    object DBEdit27: TDBEdit
                      Left = 143
                      Top = 196
                      Width = 73
                      Height = 21
                      Hint = 'Data do caixa que a conta teve sua entrada'
                      DataField = 'DATA_ENT_CTP'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      Enabled = False
                      TabOrder = 7
                      OnExit = DBEdit27Exit
                    end
                    object DBEdit23: TDBEdit
                      Left = 143
                      Top = 13
                      Width = 57
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 0
                      OnExit = DBEdit23Exit
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 203
                      Top = 13
                      Width = 425
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmContasAPagar.dsEmpresasUnificadas
                      TabOrder = 1
                      OnExit = DBEdit23Exit
                    end
                    object DBEdit24: TDBEdit
                      Left = 528
                      Top = 427
                      Width = 100
                      Height = 21
                      Hint = 'Serie da Nota Fical de Entrada'
                      DataField = 'SERIE'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 22
                    end
                    object DBEdit68: TDBEdit
                      Left = 528
                      Top = 272
                      Width = 100
                      Height = 21
                      Hint = 'Valor cont'#225'bil da conta a ser paga'
                      DataField = 'VL_CONTABIL'
                      DataSource = dtmContasAPagar.dsContaAPagar
                      TabOrder = 11
                    end
                    object Panel29: TPanel
                      Left = 2
                      Top = 508
                      Width = 843
                      Height = 35
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 26
                      object BitBtn23: TBitBtn
                        Left = 325
                        Top = 3
                        Width = 75
                        Height = 25
                        Caption = '&OK'
                        TabOrder = 0
                        OnClick = BitBtn23Click
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
                      object BitBtn25: TBitBtn
                        Left = 406
                        Top = 3
                        Width = 75
                        Height = 25
                        Hint = 'Cancelar Altera'#231#227'o ou Inclus'#227'o - [CTP022]'
                        Caption = '&Cancela'
                        TabOrder = 1
                        OnClick = BitBtn25Click
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
                    object Panel40: TPanel
                      Left = 15
                      Top = 59
                      Width = 808
                      Height = 82
                      Alignment = taRightJustify
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 27
                      object Label19: TLabel
                        Left = 42
                        Top = 9
                        Width = 80
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Grupo da Conta:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label49: TLabel
                        Left = 6
                        Top = 34
                        Width = 120
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Departamento da Conta:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label134: TLabel
                        Left = 15
                        Top = 61
                        Width = 111
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo da Conta a Pagar:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clNavy
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Edit4: TEdit
                        Left = 128
                        Top = 31
                        Width = 485
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 1
                        Text = 'EDIT4'
                      end
                      object Edit5: TEdit
                        Left = 128
                        Top = 58
                        Width = 485
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 2
                        Text = 'EDIT5'
                      end
                      object Edit3: TEdit
                        Left = 128
                        Top = 5
                        Width = 485
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 0
                        Text = 'EDIT3'
                      end
                    end
                    object GroupBox7: TGroupBox
                      Left = 262
                      Top = 293
                      Width = 366
                      Height = 56
                      Caption = 'Replica'#231#227'o da Contas'
                      TabOrder = 14
                      OnExit = GroupBox7Exit
                      object Label60: TLabel
                        Left = 42
                        Top = 12
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Qtde a replicar'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label61: TLabel
                        Left = 194
                        Top = 12
                        Width = 88
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia de Vencimento'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label59: TLabel
                        Left = 31
                        Top = 36
                        Width = 251
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data refer'#234'ncia igual m'#234's anterior ao do vencimento'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object imgReplInformation: TImage
                        Left = 2
                        Top = 15
                        Width = 24
                        Height = 39
                        Cursor = crHelp
                        Align = alLeft
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
                        Visible = False
                        OnDblClick = imgReplInformationDblClick
                        ExplicitLeft = 747
                        ExplicitTop = 74
                        ExplicitHeight = 144
                      end
                      object SpeedButton50: TSpeedButton
                        Left = 348
                        Top = 15
                        Width = 16
                        Height = 39
                        Margins.Top = 30
                        Align = alRight
                        Caption = 'v'
                        OnClick = SpeedButton50Click
                        ExplicitLeft = 362
                        ExplicitHeight = 52
                      end
                      object edQtdeReplicarCadastro: TEditHw
                        Left = 119
                        Top = 9
                        Width = 51
                        Height = 21
                        TabOrder = 0
                        Text = '0'
                        OnExit = edQtdeReplicarCadastroExit
                        Formato = fInteger
                        FormatSize = '0.0'
                      end
                      object edDiaVencimentoReplicarCadastro: TEditHw
                        Left = 288
                        Top = 9
                        Width = 51
                        Height = 21
                        TabOrder = 1
                        Text = '0'
                        Formato = fInteger
                        FormatSize = '0.0'
                      end
                      object cbReferenciaMesCadastro: TComboBox
                        Left = 288
                        Top = 33
                        Width = 51
                        Height = 21
                        Style = csDropDownList
                        ItemHeight = 13
                        ItemIndex = 0
                        TabOrder = 2
                        Text = 'SIM'
                        Items.Strings = (
                          'SIM'
                          'N'#195'O')
                      end
                      object ckbReplAlterarNumQdeParcelaCadastro: TCheckBox
                        Left = 36
                        Top = 65
                        Width = 303
                        Height = 25
                        Alignment = taLeftJustify
                        Caption = 
                          'Replicar alterando o n'#250'mero e quantidade da parcela do documento' +
                          ' atual selecionado'
                        Checked = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        State = cbChecked
                        TabOrder = 3
                        WordWrap = True
                        OnClick = ckbReplAlterarNumQdeParcelaCadastroClick
                      end
                      object ckbReplNaoAlterarNumQdeParcelaCadastro: TCheckBox
                        Left = 36
                        Top = 97
                        Width = 303
                        Height = 25
                        Alignment = taLeftJustify
                        Caption = 
                          'Replicar sem alterar o n'#250'mero e quantidade da parcela do documen' +
                          'to atual selecionado'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                        TabOrder = 4
                        WordWrap = True
                        OnClick = ckbReplNaoAlterarNumQdeParcelaCadastroClick
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 485
              Width = 876
              Height = 35
              ExplicitTop = 485
              ExplicitWidth = 876
              ExplicitHeight = 35
              inherited LabelSeq: TLabel
                Top = 13
                ExplicitTop = 13
              end
              inherited BitBtn4: TBitBtn
                Left = 333
                Top = 3
                ExplicitLeft = 333
                ExplicitTop = 3
              end
              inherited BitBtn5: TBitBtn
                Left = 414
                Top = 3
                Hint = 'Cancelar Altera'#231#227'o ou Inclus'#227'o - [CTP022]'
                ExplicitLeft = 414
                ExplicitTop = 3
              end
              inherited BitBtn6: TBitBtn
                Top = 1
                ExplicitTop = 1
              end
              inherited CheckCadSeq: TCheckBox
                Top = 12
                ExplicitTop = 12
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
          inherited GroupBox3: TGroupBox
            Width = 876
            Height = 161
            ExplicitWidth = 876
            ExplicitHeight = 161
            object Bevel2: TBevel [0]
              Left = 731
              Top = 40
              Width = 49
              Height = 24
              Shape = bsLeftLine
            end
            inherited Label1: TLabel
              Left = 19
              Top = 19
              ExplicitLeft = 19
              ExplicitTop = 19
            end
            inherited Label2: TLabel
              Left = 5
              Top = 46
              ExplicitLeft = 5
              ExplicitTop = 46
            end
            inherited Label3: TLabel
              Left = 209
              Top = 19
              ExplicitLeft = 209
              ExplicitTop = 19
            end
            inherited Label4: TLabel
              Left = 140
              ExplicitLeft = 140
            end
            inherited Label5: TLabel
              Left = 205
              Top = 20
              ExplicitLeft = 205
              ExplicitTop = 20
            end
            object Bevel1: TBevel [6]
              Left = 520
              Top = 42
              Width = 221
              Height = 24
              Shape = bsLeftLine
            end
            object btSelectAll: TSpeedButton [7]
              Left = 748
              Top = 43
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
            object btUnSelectAll: TSpeedButton [8]
              Left = 775
              Top = 43
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
            inherited imgInformation: TImage
              Left = 850
              Height = 144
              ExplicitLeft = 914
              ExplicitHeight = 172
            end
            object SpeedButton18: TSpeedButton [10]
              Left = 821
              Top = 40
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
              OnClick = SpeedButton18Click
            end
            inherited MaskEdit3: TMaskEdit
              Left = 58
              ExplicitLeft = 58
            end
            inherited MaskEdit1: TMaskEdit
              Left = 58
              ExplicitLeft = 58
            end
            inherited MaskEdit2: TMaskEdit
              Left = 170
              ExplicitLeft = 170
            end
            inherited ComboBox1: TComboBox
              Left = 58
              ExplicitLeft = 58
            end
            inherited ComboBox2: TComboBox
              Left = 255
              ExplicitLeft = 255
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CTP020]'
            end
            inherited BitBtn2: TBitBtn
              Left = 589
              ExplicitLeft = 589
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CTP021]'
            end
            inherited CheckBox3: TCheckBox
              Left = 553
              Top = 72
              Enabled = False
              Visible = False
              ExplicitLeft = 553
              ExplicitTop = 72
            end
            inherited CheckBox1: TCheckBox
              Left = 435
              Top = 45
              Width = 84
              Caption = 'Adiciona (F9)'
              ExplicitLeft = 435
              ExplicitTop = 45
              ExplicitWidth = 84
            end
            inherited ComboBox3: TComboBox
              Left = 256
              Top = 16
              ExplicitLeft = 256
              ExplicitTop = 16
            end
            object CheckBoxNQuitado: TCheckBox
              Left = 250
              Top = 45
              Width = 101
              Height = 17
              Hint = 'Pesquisa adicional'
              Caption = 'N'#227'o Quitado (F6)'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 11
              OnClick = CheckBox1Click
            end
            object CheckBoxQuitado: TCheckBox
              Left = 354
              Top = 45
              Width = 79
              Height = 17
              Hint = 'Pesquisa adicional'
              Caption = 'Quitado(F7)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnClick = CheckBox1Click
            end
            object CheckBoxDespesa: TCheckBox
              Left = 525
              Top = 45
              Width = 97
              Height = 17
              Hint = 'Despesas'
              Caption = 'Despesas(F11)'
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 13
              OnClick = CheckBox1Click
            end
            object CheckBoxFornec: TCheckBox
              Left = 618
              Top = 45
              Width = 113
              Height = 17
              Hint = 'Fornecedores'
              Caption = 'Fornecedores(F12)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
              OnClick = CheckBox1Click
            end
            object GroupBox24: TGroupBox
              Left = 1
              Top = 70
              Width = 420
              Height = 85
              Caption = 'Pesquisa Adicional'
              TabOrder = 15
              Visible = False
              object Label109: TLabel
                Left = 4
                Top = 50
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label110: TLabel
                Left = 18
                Top = 23
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 146
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label112: TLabel
                Left = 204
                Top = 23
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 57
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 57
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object MaskEdit8: TMaskEdit
                Left = 169
                Top = 46
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 57
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 254
                Top = 20
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox12Enter
                OnExit = ComboBox12Exit
              end
            end
            object CheckBoxVerFormas: TCheckBox
              Left = 696
              Top = 17
              Width = 95
              Height = 17
              Hint = 'Ver Formas de Pagamento'
              Caption = 'Ver Formas (F8)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 16
              OnClick = CheckBox1Click
            end
          end
          inherited Panel1: TPanel
            Top = 161
            Width = 876
            Height = 359
            ExplicitTop = 161
            ExplicitWidth = 876
            ExplicitHeight = 359
            inherited Splitter1: TSplitter
              Height = 298
              ExplicitHeight = 337
            end
            inherited DBGrid1: TDBGrid
              Width = 583
              Height = 298
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              OnMouseUp = DBGrid1MouseUp
            end
            inherited Panel2: TPanel
              Width = 872
              ExplicitWidth = 872
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CTP001] - [CTP024]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CTP002]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [CTP003]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 754
                Top = 12
                Visible = False
                ExplicitLeft = 754
                ExplicitTop = 12
              end
              inherited SpeedButton5: TSpeedButton
                Left = 748
                Top = 20
                Visible = False
                ExplicitLeft = 748
                ExplicitTop = 20
              end
              inherited SpeedButton6: TSpeedButton
                Left = 178
                Hint = 'Quitar Contas a Pagar - [CTP004]'
                Caption = 'Quitar'
                Font.Style = [fsBold]
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF50A75B5C8E62
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B
                  B33009A41C00B71776917AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF44B5531BB73122B2351CAC2F10AE26AD9DABFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF6BB57429CF4331C2462DBF4329BA3E1DBF33509259FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF83B58A33E14D40D2573ED0543CCD5137C94C
                  32C3461AC634B1A3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AF8D3CEB584CDE6349DC6048
                  DC5F31D74C43D3593ED05438D350399E48FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70A87647F76455E8
                  6E53E66C51E96B3FD155C5D3C63AE45346D85D44D55B33E44D818E83FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54B260
                  53FE715AEB7259EB7158F0723EDD56FF00FFFF00FF67DA774CE5654CE0644BDF
                  622EC045AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8DC5944FF96C59EB7259EC7259F47441D959FF00FFFF00FFFF00FFFF00FF
                  3DE75954E76C51E46A4DF469528D5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF4FF96C31DC4C4BE4664BF0664CC85EFF00FFFF00FFFF
                  00FFFF00FFFF00FF89DA9553F26F56EA6E55E76F3EEA58A297A1FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FF96C69CF7598C49CFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46E15D59EE7359EC725CF67639
                  AD4AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBADFBE4AF1
                  665AED735AEC7355FF726B856CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF63D47353EC6D58EB715CEF753EE459AD9DABFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF38D8504FE16854E56B5AF4753EAB4D
                  AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBDEBF2ED44948
                  D95F4DDD654CF768608564FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF6DCA793FCD553BCD5243D35B35DE4F9D929AFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF3EBF5051C96442C7563ACE5227B23BCDB8
                  C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32BC4632BC464FC460
                  52C7644CD66240914AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8FCD9535B84A48BE584AC15C45D45B628565FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF50BA5D3AB34C42B85345BB5636C74B879088FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2BAB3B37AF493DB2
                  4E3DB75047A352FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  32BC4620A63121A73429AA3A32BC46FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF32BC46FF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                OnClick = SpeedButton6Click
                ExplicitLeft = 178
              end
              inherited SpeedButton7: TSpeedButton
                Left = 350
                Hint = 'Exirbir lotes de quita'#231#227'o - [CTP006]'
                Glyph.Data = {
                  EE050000424DEE05000000000000AE0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000DE000000DE00000000000000FFFF
                  FF003E3D5400413F4D00828089002423250087828800372A3800FF00FF003834
                  3500413B3B002D2A2A0044404000413D3D00504C4C005B595900676666007342
                  41008E5D590051353300412B2900704641007F4F4A007A4D4800694541008F6A
                  6400A0675B00A7756B007D7A7900BC826800F2E7E200E6D4CB0086807D00F6EE
                  EA0079757300E5D1C600EBDED700F8EFEA00F4EBE600D0916C00D1926D00E9DA
                  D100EEE1D900EEE3DC00FAF2ED00F7EFEA00DA9D7500E6D8CF00E3D0C200FAF3
                  EE00E7AB7900F8D1AF00F7D1AF0095837300DAC6B4007B706600E6D4C400E0A5
                  6B00AF815400EFB17300F2B47600EDB074008F6B4600EDB17500926D4800A57B
                  5200956F4A00F2B77B00F2B87F00F2B88000F0B87F00F2BA8100F6D1AB00F7D1
                  AC00F6D1AC00F2CFAB00D1B29300F7D3B000F7D4B100B1A08F00CFBDAC00F2DE
                  CA00E1D0C000E2D3C400827D7800FAF4EE00EFB47600A67D5200F2BA8000F4CE
                  A500F4D0AA00EFD3B400F6DCC100B7A49000D1BCA600C2B09D00BCAB9900BBAA
                  9800EAD8C400F2E0CC00ADA09200A1958800DECEBD00F0E0CE00EEDECC00F2E2
                  D00089807600F2E2D100D0BCA500E3CFB800E2CEB700EAD7C000DECCB700EFDC
                  C600E9D7C100EDDCC700EDDDCA00D8C9B800EFE0CE006F696200EDE1D300E7D5
                  BD00EBD9C200E5D4BD00EBDAC400EEDECA009F968A00EFE2D1007A746C00EFE3
                  D400F7EFE500EEDDC500EBDAC200F2E2CA00EDDDC600EADAC400EBDCC600F2E3
                  CE00E7D9C400EEE0CC00EEE1CF00F4E7D500CCC2B400F7EEE100F8F2E900EEDE
                  C500F3E5CF00F4EADA00F3E9D900F0E1C600F0E1C700F7EBD700EDE0C700F3E6
                  CB00F7F6F000F6F7F600B7B8B8008FE2F000A5E6F2007BD9ED00BCEAF30077D4
                  EE00B4E5F3006FCBEB006FC5E5006CCEF400B2E6FA0067C0E90060BFEF00ABDE
                  F70058AADA005EA4CE0088B0C90055B0EB0059A1D3004BA1E600478AC2005097
                  D0004193E1003686DD003B73B000467DBA004C82BA004F7EAF00436489004966
                  8A002D77D8004074B700648BBC005778A3008298B5003B5781004A6C9C004C6F
                  9F0050678A005974A40058698B0024428300324674003B528E0044528100555E
                  82001F2550001E214B001B1C45009F9FB500A3A3B800A6A6BB00A9A9BC001F1F
                  210076767700ACACAD00FEFEFE00FCFCFC00FAFAFA00EDEDED00EAEAEA00A7A7
                  A7007373730072727200626262003A3A3A000808080808080808080808080808
                  0808080808080808080808080808080808080808080808080808080808080808
                  0808121212121212121212121212121211080808080808080808123897928985
                  96959596969699791108080808080808080812308D768B7D737C7C7A847A916D
                  11080808080808080808122393817F8C68748887877A836D1108080808080808
                  08081A1F8F4E444745584546434B986D110808080808080808081A2F825C334D
                  344A485A595B866E110808080808080808081A2990946B69676351716F7B8A70
                  160808080808080808081B2455493B3F563C3C3D394C8E501708080808080808
                  08081B2A557852756662723660657E64150808080808080808081D2B9A535F4F
                  616C5E5D3537806A180808080808080808081D1E9BC33A404241573EBFC60277
                  130808080808080808082826D6BCC306205422BFABAACA031408080808080D0B
                  0B0B2821D5C8A0BE041CBFA4BFAEB0CB070808D2DDDD0D05D10A2E2DD4CDC9A0
                  ACBFA1BFA5BFB1B4CCCCCCD2D3D30D090A0A2E2501D4CEC49EBDBFA3BFA8BFAF
                  B2B3BAD2D9D90D0D0C0C322C0101D4CFC29DC1BFA7BFADAFB2B3BAD29C9C0D0E
                  0E0E3231010101D4D0B99FC0A7A8ADAFB2B3BAD2D7D80D0F0F0F322828282828
                  2719B8A2A5A8ADAFB2B3BAD2D7D70D101010080808080808080808BFA6A9ADAF
                  B2B3C5D2D7D70DDBDBDB0808080808080808080808B7B6B5BBC708D2D2D20DDA
                  DCDC08080808080808080808080808080808080808080D0D0D0D080808080808
                  080808080808080808080808080808080808}
                OnClick = SpeedButton7Click
                ExplicitLeft = 350
              end
              inherited SpeedButton8: TSpeedButton
                Left = 293
                Hint = 'Exibir Somat'#243'rio - [CTP005]'
                Caption = 'Somar'
                Font.Style = [fsBold]
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000330B0000330B00000001000000010000424242008484
                  8400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020000000000000000000000000002020202
                  0202020202020200000000020202020202020100020202020202020202020201
                  0000000102020202020202000202020202020202020202020100000001020202
                  0202020202020202020202020202020202010000000102020202020202020202
                  0202020202020202020201000000010202020202020202020202020202020202
                  0202020100000001020202020202020202020202020202020202020100000000
                  0202020202020202020202020202020202020100000001020202020202020202
                  0202020202020202020100000001020202020202020202020202020202020202
                  0100000001020202020202020202020202020202020202010000000102020202
                  0202020002020202020202020202020000000002020202020202010002020202
                  0202020202020200000000000000000000000000020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202}
                Layout = blGlyphTop
                ParentFont = False
                OnClick = SpeedButton8Click
                ExplicitLeft = 293
              end
              inherited SpeedButton11: TSpeedButton
                Left = 408
                Hint = 'Replica'#231#227'o de Conta - [CTP007]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8F6FAF3EBF7ECDDF2E4CCEE
                  DCBBEAD2A7E0CFB2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  F1EBD7F8F0E5F3EAD9EFE2C9ECDCBCE9D5AEE4CD9CDFC388DDBF80DDC07FDBBD
                  7ADBBB76DBB975DBBA76DCBA73CBB284F8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFE4D6B1DBCB9ADAC897DAC591DEC892DFC991E0C991E2CC95
                  E4CF98E6D19CE8D5A0EAD8A4EDDCA9EFE1AEF3E8B2DCD1AFFAFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8D5F1EBD7F5F0DEF7F5E3FBF9E8FF
                  FFEDFFFFECFAF9E1FAF7DBF8F5D7F8F5D2F7F3CDF7F1C7F7F0C3F9F2C2DACFA9
                  D9BA7FD8C6A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EBD7F1EBD7F6F0
                  E8EFE4D7E7D7C5DEC8B2E2C4A6FBF0D4F7F3D6F7F1D2F7F1CDF6F1C9F5EFC5F5
                  EEC0F8F1C2D9CCA5D3B16CD2BF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FED1A4FFD2A4A25D3B9E5B369F5D389A5835C27C4CFFEECDF8F9DFF7F7D8F7F7
                  D4F6F6D0F6F6CCF6F5C8F8F5C5DBD2ADF1ECBCDED5BBF8F0E6F4F2F2FFFFFFFF
                  FFFFFFFFFFFFFFFFFED1A4FED1A4A25D3B9C5F3FA56846AA6D49F4B57BF9D0A9
                  F4C7A0F4C49BF4C096F4BD92F4B98EF3B68AF6B489DAAF8DF1EFC0D5C59BDAB6
                  68D4C9B8FFFFFFFFFFFFFFFFFFFFFFFFF3BF99F7BF8CA25D3BA25D3B9C5F3FA2
                  5D3BFFC386F4BF93F0B283F1B384F0B384F0B384F0B284F0B384F3B484D9AF8B
                  F1F0C1D7C9A1E7CE8CD8CFC0FFFFFFFFFFFFFFFFFFFFFFFFF0BB93F5B381A25D
                  3BB26B44A25D3BA6613EFFB275F2B788EDAA77EDAB78EDAB78EDAB77EDAB78EE
                  AC7BF1AE7CD8AD88F0E5B8DCCDA9FAF6C2DBD5C8FFFFFFFFFFFFFFFFFFFFFFFF
                  ECB286F5AA79A25D3B9C4E2DA3512DAA552FA25D3BEFAB7BE7A068E8A06AE8A0
                  69E8A06AEAA46FECA974F1AE7CD7A782EDAF85DAB795F8F5BFDAD4C7FFFFFFFF
                  FFFFFFFFFFFFFFFFE9AC7CF39059A25D3BB75D37AA5837AB5A3AA25D3BEDA371
                  E4975CE5975DE5995EE79D63E9A26DECAA76F1B07ED8A984EAAD7ED9B894F9F9
                  C3DAD5C8FFFFFFFFFFFFFFFFFFFFFFFFE5A06BEC8A52F28650F88D54DE7E4FF0
                  8955F98D56EC9C66E28E4EE49152E7975BE99E64ECA670F0AD7AF5B685DBAC88
                  E8A878D9AF8AF8D09FDBCEC2FFFFFFFFFFFFFFFFFFFFFFFFF4D7C2F4D5BDE0A8
                  7AE1A67ADB9F73C9946ECB956ECF976FD69E76D5A27AD8A47CDCAA84DFB18FE3
                  BA99E9C2A3C49D7EEBAA79D7A883F5B282DACABEFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFE49C62F88953A25D3BB6542DA0492BA25D3BFD864BE7A16FDF92
                  57DF9157DE9359DE965EDE9A67E6A574F3B381D7A783F2AF7ADAC9BDFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8B4BEB8C55ED8D58F4945CEB8F59F8965D
                  F4925BE99A60E28E4EE59254E8995DEBA068EFAA74F1B07EF6B98AD8AA86F1AA
                  75DAC9BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9DDF9EADEE6AA77E9
                  9E71D6966EBB8566C08A69C88F6DDFA27AD7A57ED9A47CDBA981DDAE8ADFB493
                  E2BA9BCB9B76F3AD77DAC9BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE09152FA6C30A25D3BA25D3BB34A23A25D3BFE7D43E59D64E49051E4
                  9154E69659E89B61EBA36CF0AD7AF2B17EDACABDFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFDF8441E9A776E8A673EDA873EEA872EAA570E9A3
                  72E39358E49458E79A60E99F67ECA772EFAE7CF2B585F7B888D7C5B8FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFF9FFFFF6FCFF
                  F5F7F9F5F6F6F4F5F5F2F2F2EFEEEDEEEBE8EFEAE7EFEBE7EFEBE8EEEAE7EDE6
                  E0F0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton11Click
                ExplicitLeft = 408
              end
              inherited SpeedButton12: TSpeedButton
                Left = 465
                Hint = 'Atualizar Valor Pago - [CTP008]'
                Glyph.Data = {
                  9A040000424D9A040000000000005A0200002800000018000000180000000100
                  08000000000040020000120B0000120B0000890000008900000000000000FFFF
                  FF0047465D00FF00FF006D413D008E5D590080504B007547400073453F00784A
                  41007D4D420080514400D7B09E0095644B00D7B09C009A684D00D7AD9700A672
                  5100A06D4F00D1926D00D5AB9100B0795400AA765200D3A78A00B27E5600BA83
                  5800B7815700FEFBF800E5AD6300E6AD6400E6B06800E6B26B00E9B67500E9B8
                  7800E9BA7D00E9BB7D00E9BC8000EABD8100EBBF8400EBC18800EBC28C00EDC5
                  9000EDC79300EEC99800F2D5B000FFFCF800E6B06600E5B06600E6B46E00E7B6
                  7200EABF8400EEC58900FED39500EEC78E00FED59A00FFD79D00F2D4A900F2D7
                  B200FFF3E200EBC18000EBC28200EDC48400EBC48600EDC68900EDC68A00EEC9
                  8C00EEC98F00EECA9100EECB9100EFCC9700EFCE9900F0CF9C00F0D09C00F2D3
                  A100F0D1A100F0D3A300F2D5A600F2D5A700F3D8AD00F2D8AF00F3DAB400F4DE
                  BA00F6E1C000F8E7CC00F3DCB200F6E5C700F7E7CC00FAEED900FAF0DE00FBF3
                  E500F8EBD300FCF8F0007B7E72009ED79E007E837E007E84800088908B007F88
                  8700579290009EEBFF0082929800818F950082939C00579DC7008499A7008292
                  9D00869EB1003595EF003998F0003C9AF200409DF20087A1B800288AEE002C8C
                  EE003292F0003291EF003796F0003D9AF20088A4BF001A7DEA001B7DEB001F81
                  ED001F82ED001F82EB002587EE002D8CEF0089A7C7000F73E9001174E9001275
                  E9001377EA001678EA001679EA0007397A00747D9000737887004F4F5C000303
                  0308050505050505050505050505050505050603030303030304504F384A4643
                  403D3B3B3B3B3B3B3B3B0603030303030308504E4C4A48454341333E3C3B3B3B
                  3B3B06030303030303085227265E85858585855C1E2F1D2E1C3B060303030303
                  0307536885857F7F8585858585353F423E3C06030303030303095785807F7F85
                  5F242321203130311F3F060303030303030A6F85788285685251544E4D49484B
                  4544060303030303030B85737079852B2A292827322422252147060303030303
                  858585756B7D8585855A565552516685644D06030303030303856E6E6E6C7385
                  8717572B2A61857F85660603030303030388856E6E6E8560341459586A857F7F
                  7F85020303030303030D7E856E85673736105B65857884817F7F850303030303
                  030F018685625D63630E1B8585857B7783858585030303030312010C5D5D5D5D
                  3A0C01392C85717C7A850203030303030311010C3A3A3A3A3A0C01017E857472
                  85760603030303030316010C0C0C0C0C0C0C0169856E6E6D852D060303030303
                  0315010101010185858585856E6E85857E010603030303030318010101010101
                  7E85858585857E010101060303030303031A010C0C0C0C0C0C0C0C0C0C0C0C0C
                  0C010603030303030319010C0C0C0C0C0C0C0C0C0C0C0C0C0C01060303030303
                  0319010101010101010101010101010101010603030303030319131313131313
                  1313131313131313131313030303030303030303030303030303030303030303
                  030303030303030303030303030303030303030303030303030303030303}
                OnClick = SpeedButton12Click
                ExplicitLeft = 465
              end
              inherited SpeedButton23: TSpeedButton
                Left = 522
                Hint = 'Aceitar as Contas a Pagar - [CTP009]'
                Glyph.Data = {
                  52060000424D5206000000000000120400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F7000000F700000000000000FFFF
                  FF00050482000E0D87000F0D7700130F75001E115900574183004F4250003411
                  3500FF00FF0068446300442D3D00432835008B6477009A727F009D727E005445
                  480051343800EBDEDE00572625004E1F1C0064302C008F5E5A007B514C009667
                  6200996C67006F514E009867600095655F0093645E0095666000E6D7D5009866
                  5D0098686000996B630099675D00A1706600785D5700FBF7F60090605200B07A
                  6B00AA766700CC8F7E00BA877A00864D3C009E634E009A665400A6705C00B27E
                  6B00BB846D00FFFAF800AA6A4C00AF745A00C58C7300B5816B00C58C7000BD88
                  6F00D0A48F00FAF2EE00FCF8F600FAF6F400BF7B5400D3977500D1967500CE93
                  7400C9907200E3AD8E00B06F4800D1926D00D4987500E2986700F6D7BF00FBF7
                  F400FAC79C00F0CBAD00F0D4BD00FADDC600FEBB7E00FBBA8100F8B88000F7BB
                  8700F7C08F00F8CCA400FBD1AD00FBD7B800F7E5D500F8EDE300FFC08200FEC1
                  8600FFD0A300FFD5AB00FFD8B100FFDAB600F7D7B800FFDEBF00FFE5CC00FFEE
                  DE00EDA65600E9B27600FFC48300E2AD7400F0BB8200FFDEBB00FFE2C400FFEA
                  D400EF902300EF9D3B00FFD3A100FFDEB500FFE9CF00FFEED900FFF2E300FFD8
                  A600FFF7ED00FFCC8400FFE5C000FFEBC900FFEDCE00FFF4DD00FFF7DD00E1DA
                  BA00FFFEF700BDBA8400F2F2ED00FCFCFA00FFFFFE00BFC09C0095A467006990
                  4B007BA064005C844C004F833C00D4E5D00091C087003C7B320087AF820092B6
                  8E006397600072A56F002972270056B4540000810000007B0000007A00000077
                  0000007300000386030007890700229D220033A63300226D22004AB449003B81
                  3A003E823E005CBD5C00458845006CC46C004F8E4F005693560079CB79008BD1
                  8B008BB48B0090B89000B1E0B100CFEECF00D4EDD400DAE9DA00EEF6EE00F6FA
                  F6002B742C00347A350051925200A5C6A60056915800B4D1B500C4E2C5007AAA
                  7D00ADE1B00092BA9500D4E6D500E6F3E700F4FAF700656B6A007EFFFF0076DD
                  E0006DF7FF006AB5BB0063797B005AA1AD00628C93005E95A1005BD1F4005BC5
                  E7005A64680052C6FA00538CA5004F87A700557383004AB0ED004C92BB00419D
                  DE004593D50043688700289AFF004E6A82004186CC001E87FC00247FE6003080
                  D7002372DD00385C8C003F669700545C68002264CB002860B5002D5DAA003053
                  95003A517F0047526A000F39C7002856FF002959FF002B59FF002A56FE000C34
                  FF00113BFF002242E2002447E7002547E5000D2CE7002D397D000124FF00061F
                  C0001226C7000011E0000612AC003C3F62000813AA000911A1000B15AA000008
                  B40004077F000C12A00000008200020592004B4B63000A171C221C1C1C212124
                  2121212121212121300B02F5F50A0A1E4B54534A4A525251594F505050505058
                  0F02EEE5EAF50A1D5E675C5B5A6C522D3E4E73595858646603ECE5DFE2F10A1D
                  485F5D5C5B4A280DDB1B344758737310EFE3E0E2E8F10A1D4D1A1A1A1A2FCBCD
                  C8C3C4B7180E07F3E3DFE2E8EB0A0A1D4D6E685F7428BDBEC6BAB8C1F2F4ECE4
                  DEE6F1F10A0A0A1F56696068752ABEBBC2B8B8CEF4F0E5DFE605090A0A0A0A19
                  56616960761ACDC512BCBBCAEEE4DDE1E9D1DA150A0A0A23571A1A1A1A1A12DB
                  C7C8D51106EAE1EBDCCCCFD1ED0A0A255772706F6F4C16DBC8C0BAB9BEE70304
                  D6CFCFCFED0A0A253B7A7A7070574C3A2526B7BFC1C3C9D4EDEDD8DA150A0A2A
                  277E8B8C87827977786743371808D3D0CFD2D90C150A0A293DACAAA3A38A9984
                  827F68765D433518F6D9D70D0A0A0A2C8997A69B98A1B0AFB19C87817B6D6D6C
                  512E140A0A0A0A2B8AAEA192908F9396A0A6B4B397841A1A71440A0A0A0A0A2B
                  88AAA5958E908F90909496A1B5AB80675B440A0A0A0A0A367C999EB4A49D958E
                  8F9090919BAD84746D440A0A0A0A0A4233B68B8C9AA2A7A5A1958E908DAD835F
                  55440A0A0A0A0A41490101A8AD9F9A9FA3B0B2864444444444440A0A0A0A0A40
                  270101010101A9AF8B9C9C834463626B6A0A0A0A0A0A0A463C01010101010101
                  017D857F4463626B0A0A0A0A0A0A0A463C01010101010101010101134463620A
                  0A0A0A0A0A0A0A463B333C3C274949493D3D7D2044650A0A0A0A0A0A0A0A0A45
                  4646463F414238393237312A440A0A0A0A0A0A0A0A0A}
                OnClick = SpeedButton23Click
                ExplicitLeft = 522
              end
              inherited SpeedButton24: TSpeedButton
                Left = 579
                Hint = 'Marcar para Cancelamento - [CTP010]'
                Glyph.Data = {
                  56060000424D5606000000000000160400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F8000000F800000000000000FFFF
                  FF00050482000E0D87003D3BA6004543AA005150B4005352B4005352B2005D5B
                  B500110E76004E4AA900514EAB00706DBB00807EC4004A45A5008F8BC9009793
                  CE009D99CE00AAA6D5005249A0006058A6001E11590063559C006B5DA0009A8E
                  BB00574183007F6CA1009583AF004F425000C4B4C50034113500FF00FF00FEFC
                  FE0068446300AB91A500432835008B6477009A727F009D727E00544548005134
                  3800572625004E1F1C0064302C007B514C00996C67006F514E0095655F009364
                  5E0098696300D1B1AD00E6D7D500A1706700A9756800785D5700DEC2BB00FBF7
                  F60090605200864D3C00AF7A6A00A07365009E634E009A665400B27E6B00AC79
                  6700FAF7F600AF755E00AA6A4C00C0886F00BA846D00B5816B00C58C7000CE9C
                  8200D0A48E00FAF2EE00FEFAF800FCF8F600BF7B5400D3977500D1967500CE93
                  7400CA927300C9907200C9917300F0DCD100B06F4800D1926D00D4987500E3AD
                  8C00E2986700F3E5DC00FBF7F400FAC79C00F0CBAD00F6D5BA00F8D8BD00FCF0
                  E600FEBB7E00FBBA8100F8B88000F7BB8700F7C08F00F8CCA400FBD1AD00FAD7
                  B700F7DEC700F7E3D100FFC08200FEC18600FFD8B100FEDAB700FFE2C600FFE5
                  CC00FEFAF600FAF7F400FFC48300E2AD7400F0BB8200FFD1A100FFD7AA00FFDE
                  BA00FFE0BF00FFEAD400FFEEDC00EF902300EF9D3B00EDA65500E9B47500FFDE
                  B500FFCC8400FFEBCF00FFE0B100FFE5BD00FFE5B700FFEAC200FEFCF800FFED
                  BB00FFF0C600FEF2D300FFF8E500FFFCF400FFFBDC00FFFBD100FFFFEE00656B
                  6A007EFFFF0076DDE0006DF7FF006AB5BB0063797B005AA1AD00628C93005E95
                  A1005BD1F4005BC5E7005A64680052C6FA00538CA5004F87A700557383004AB0
                  ED004C92BB00419DDE004593D50043688700289AFF004E6A82004186CC001E87
                  FC00247FE6003080D7002372DD00385C8C003F669700545C68002264CB002860
                  B5002D5DAA00305395003A517F0047526A00FBFCFF000F39C7002856FF002959
                  FF002B59FF007895FF002A56FE004A6CFF005C7DFF006B89FF008AA1FF00ACBC
                  FF00B0C0FF00CED8FE000C34FF00113BFF001F44FF002242E2002447E7002547
                  E5002D51FF00385AFF005673FC00BFC9FB00D3DAFB000D2DEB002347FF002D39
                  7D000123FF000325FF000728FF00061FC0000D2BE300142AC900E3E5F400001D
                  FF000F21C500919AE6000013FF000015FF000016FF000017FF000011E0000612
                  AC003C3F6200000CFF000010FF000813AA000911A1000B15AA000008B4000407
                  7F000C12A000D3D4EF00000082000205920028289F003030A1005051B6006C6D
                  C2008A8ACE00A4A5DC004B4B6300B5B5E200C7C7EA00F8F8FC00202E2E2E2E2E
                  2E2E2E2E2E2E2E2E2E2E2E2E2E2202EDE82020315E68675D5D6666656D636464
                  6464646C2602E5C9D7E820305F796E787777663B4E62826D6C6C747603E1C9BA
                  C5E82030607A6F6E785D3A24B52F445A6C828227E6C7BCC5D2E820306A707A6F
                  813FA5A7A29D9E912D251AEAC7BAC5D2E02020306A2E2E2E2E3A9798A094929B
                  E9ECE1C8B9D6E8E8202020306B7B71708A4198959C9292A8ECE7C9BACF0A1F20
                  202020305B7C7B718349A79F299695A4E5C8B8C4D5ABB42B202020325B617C7B
                  835E29B5A1A2AF2816DAC4E0B7A6A9A9E2202035612E2E2E2E2E2CB5A29A9493
                  98D1030AB0A9A9A9E22020354B8D908C8E8B5F4A3D3791999B9DA3AEE2E2B2B2
                  24202036420110040F19558E8F7959472D1DADAAA9ACB3B32B20203C88F1EFF2
                  F20D0B151C38878A8459432DF4B3B1242020204513EECEBEBDC0CDF50E0C141B
                  33868477653E2A20202020540D09C0E3DCDFD3CABBCEEB11EE172E2E78562020
                  2020205212EFC3C6D9DCDEDEDDD4CBC0D8042384785620202020204839F008EB
                  C2BFD0D2DEDEDDE4BEF31889815620202020205372B6F2040510EBC3C0C6D9DD
                  CC13188569562020202020515C0101F7F5F1060911F6C1DB5656565656562020
                  20202050390101010101B6F6F209071756807F7E7D202020202020584D010101
                  010101010121D81E56807F7E20202020202020584D010101010101010101015B
                  56807F2020202020202020584B4C4D4D395C5C5C73734C345675202020202020
                  202020575858584F515348454647403656202020202020202020}
                Visible = False
                OnClick = SpeedButton24Click
                ExplicitLeft = 579
              end
              inherited SpeedButton25: TSpeedButton
                Left = 740
                Top = -10
                Visible = False
                ExplicitLeft = 740
                ExplicitTop = -10
              end
              inherited SpeedButton26: TSpeedButton
                Left = 636
                Hint = 'Observa'#231#245'es da Conta'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F5FCF7F6FBF7F5FAF6F4FAF5F4FAF5F3FA
                  F6F4FBF6F5FCF7F5FBF7F6F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CECD86A9B493B1BC9BB8C4A4C1
                  CCAAD0DFA8CDDCA7C2CD9DB8C493B0BC87A9B7B2ADABFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F660B1C3
                  0FC2EC18BBE712C1F41D4D5B3E647115B4ED1CADE210ADE75DACCAEBE3E0FFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFEDD7D312B8D813BADF11BCE7127F9E167C9B0DADE410A3DA0E9ED8
                  D4C4BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6C7CB04C5E514CAF01D323644545809
                  B9ED00A7DE91B9C9FAF3F1FFFFFFFFFFFFFCF9F8FFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEC53D7E32EE6
                  FC364E5248595C14CAF22FBAE0F1DBD5FFFFFFFFFFFFE2ECEEABCBD1FFFBFBFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFDBDDDC15EFFF5C7174545C5D16D8F7C7D2D7FFFFFEFFFFFFE1E7EAB5FF
                  FFA9D6DEFFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFF4F361E1E76873746B666666E3F3D2C0BFCAD7DC
                  BDD4DAB7FBFEB2FFFFA6DBE6B8C8CDC0C9CDDBD5D5F7F1F0FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D4D212D4DA15D6E0C2
                  C0C1AEFBFFB3FFFFB1FEFFB1FCFFB0FAFFA9F9FFA7FAFFACFAFFA2EBF9A3D1DC
                  B3C1C6E5DDDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6C4D9
                  E77ACECC64D4D7A5DAE7A4F6FFA7F3FFA7F4FFA7F4FFA7F4FFA8F5FFA9F6FFA9
                  F6FFA4F5FF9DF3FFA1F2FF9DD7EBB6BDBFFBF5F4FFFFFFFFFFFFFFFFFFFFFFFF
                  FFF9F690D1EF67D3FFB7C7D1AEB9BF91EBFF9BEAFF9DEBFF9DECFF9DECFF9DED
                  FF9DEEFF9FF0FFA0F0FF9FF0FF9CEDFF96E8FF90E4FF98E8FFA6BBC3F7F2EFFF
                  FFFFFFFFFFFFFFFD99D5F070D0F980D3F883D8FC8CDFFF93E2FD95E4FE95E4FF
                  94E4FF94E5FF93E5FF94E5FF95E7FF95E8FF94E8FF92E6FF90E3FF8DE1FF8DE1
                  FF97E9FFB0BCC1FFFFFFFFFFFFDEEEF576D0F788D5F891D8F996DBF998DEFB9A
                  E0FB99E1FC96E1FC90E0FD8DE0FE8CE0FE8BE1FF8AE1FF8AE1FF88E1FF86DFFF
                  86DEFF88DEFF8BDFFF8AE1FF98D8EFE9E1DFFFFFFFB5E1F584D3F798DBF8A1DE
                  F9A6E0FAA8E0FAA7E1FBA3E0FB9DE0FC96DEFB8EDCFB89DCFC86DBFD85DCFE81
                  DCFE7EDBFF7BDAFE7CDAFF81DBFF84DCFF86DDFF93E6FFCBD0D2FFFFFFB2E1F6
                  ABE1FAB4E4FAB5E5FAB7E6FAB7E6FBB4E5FBAFE3FAA7E0FB9DDFFB93DCFB8ADA
                  FB86D9FB81D7FC7CD5FC78D7FD75D5FE74D6FF79D8FF7FDAFF84DCFF8BE2FFCC
                  D5D8FFFFFFCBEAF8CFEDFCD2EEFBD2EEFCD1EEFCCEEDFCC7EBFBBEE8FBB3E5FB
                  A7E0FA9ADDFA8ED9FA87D7FA82D6FA7DD5FB78D5FB76D4FC76D5FD7AD8FE82DB
                  FF89DDFF90DEFCE8E5E3FFFFFFFEFDFDB9E5F9E3F4FCDFF3FCDFF3FCDBF1FCD5
                  F0FBCEEDFCC2EAFCB6E6FBAAE1FA9EDEFA95DCFA8FDAFA87D7FA81D6FA7DD5FB
                  7BD5FC7ED7FC84DAFD87DFFFA9D0E1FFFFFEFFFFFFFFFFFFE5F4FACBECFBEDFA
                  FDE9F8FDE6F6FDE0F3FCD9F0FBCFEDFCC2EAFCB5E5FAAAE0FAA0DFFA9ADDF994
                  DBFA8FD9FA8AD8FA87D8FA86D9FB86DBFF94D3EEFCF5F2FFFFFFFFFFFFFFFFFF
                  FFFFFFEAF5FBC4E9FAECF9FEF0FAFDE8F7FDE1F3FCD7F0FBCDECFCC0E9FBB4E4
                  FAAAE0FAA5DFFA9FDFFA9ADDFA95DCFA8EDAFC83D7FC9FD2E8FFF8F5FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED2ECF9C5E9F9DCF3FDE5F6FDDFF3FC
                  D5EFFCCAECFCBFE9FBB6E6FAAEE3FAA6DFFA98DDFA86D5F894D1EBD9E6ECFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE4
                  F2F9CDEBF8C2E7F7B8E3F6AFDFF6A4DDF6A2DAF5A5DBF4B0DEF3C9E6F4F2F4F5
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton26Click
                ExplicitLeft = 636
              end
              object SpeedButton19: TSpeedButton
                Left = 693
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Visualizar Imagens da Conta - [CTP037]'
                Flat = True
                Glyph.Data = {
                  9A050000424D9A050000000000005A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000C9000000C900000000000000FFFF
                  FF00FF00FF00811E0000FFA78800FFB47F00FFBA7B00FF810000FF810100FF82
                  0200FFB06000FFB16200FFB26300FFB26400FFB46800FFB56900FFB56A00FFB6
                  6B00FFB66C00FFB76D00FFB76F00FFB86F00FFB87000FFB87300FFBA7400FFBA
                  7500FFBA7600FFBB7600FFBB7800FAB77600FFBB7900FFBB7A00736F6B006A69
                  6800FF820100FF840200FF840300FF840400FF860500FF870500FF870600FF88
                  0600FF880800FF890900FF8A0900FF8A0A00FF8B0C00FF8B0D00FF8B0E00FF8C
                  0F00FF8F1100FF8F1300FF8F1400FF901600FF911600FF911700FF911800FF92
                  1800FF921A00FF921B00FF931B00FF931C00FF951D00FF951E00FF962000FF96
                  2100FF972300FF982400FF982500FF992700FF9A2800FF992900FF9A2A00FF9C
                  2C00FF9C2D00FF9C2E00FF9D2E00FF9D2F00FF9D3000FF9E3200FF9F3400FF9F
                  3500FF9F3600FFA03600FFA03800FFA13B00FFA33B00FFA33C00FFA33D00FFA4
                  3E00FFA33F00FFA43F00FFA44100FFA54200FFA64400FFA64500FFA74500FFA6
                  4600FFA74700FFA74800FFA94900FFA94A00FFA94B00FFAA4D00FFA94E00FFAB
                  4F00FFAB5000FFAB5100FFAC5200FFAD5300FFAD5500FFAD5800FFAF5900FFAF
                  5A00FFB05B00FFB05D00FFB15D00FFB15F00FFB46500FFB56700FFB56800FCB6
                  6D00F3B97C00FF961F00FF982300FF9C2B00E0A34700FFD9A100FAD59F00F3D0
                  9D00EBCA9A00E9C99900E5C59800E1C29600DABD9300D0B59000C9B18E009D90
                  7D00968A79009388780089817500877F740078746E006F6D6A00DEA95500EACA
                  9900D4BA9200C6AF8C00A59780009F927E00968B7A00867F74007B776F00C9AF
                  6F00CAB27600C6A95C00C7AD690074726C00B5B686006A6A6800107A1000117A
                  110026752600277527002D732D002E732E0033723300357035003B6F3B00486D
                  4800496C49004D6C4D00526B5200546A5400586A58005D695D005E685E007FB0
                  8B007FB8A5009AAFAA004AB2AB0059BBBC003EBCCE001FBAD5001FB8D4001FBD
                  E20010C1F30012C1F20002BDFB0002BDFA0004BCF70004BDF70006BCF30007BD
                  F60000BDFF0001BDFC0070AAC30051A5D70037A2EC0044A3E200676767000202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020203030303030303030303030303030303
                  030303030202020203736E675E565049433E37322E2A26090707070302020202
                  0377756F696059534C457B3933302B2723080703020202020315780B716A635C
                  544E46403A34312C2924220302020202031B16100D716C655D554F48423D3531
                  2D28250302020202031F1C171276746E686158514A443F36322E2A0302020202
                  031F1F1E18130E0A6F6A625B534D457B38332F0302020202031F1F1F1E19140F
                  0B706B645C544E47413B330302020202030405061F1F1A16110C726D665D554F
                  48423C030202020203C6C7C5C4B3877A1D7976736E675F57507D7C0302020202
                  03C2C2C2C2C3C1B9B6B5B29E9A999C905A524B030202020203C2C2C2C2C2C2C2
                  C2C2C2BCBFBEBDB7B19B7E030202020203C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
                  C0B8B4030202020203BABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBA0302020202
                  03A4A6A9ACABA4A1A0A5ADB0AFAEAAA7A3A2A8030202020203C8C8C8C8C8C8C8
                  C8C8C89F8C898B21C8C8C8030202020203968E8F9FC8C8C8C8C8978882808193
                  8A8D9803020202020381858692949DC82095837F7F7F7F7F8191840302020202
                  037F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F03020202020303030303030303
                  0303030303030303030303030202020202020202020202020202020202020202
                  020202020202020202020202020202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton19Click
              end
              object SpeedButton21: TSpeedButton
                Left = 236
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Quitar Parcial - [CTP004]'
                Caption = 'Parcial'
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF50A75B5C8E62
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B
                  B33009A41C00B71776917AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF44B5531BB73122B2351CAC2F10AE26AD9DABFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF6BB57429CF4331C2462DBF4329BA3E1DBF33509259FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF83B58A33E14D40D2573ED0543CCD5137C94C
                  32C3461AC634B1A3AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AF8D3CEB584CDE6349DC6048
                  DC5F31D74C43D3593ED05438D350399E48FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70A87647F76455E8
                  6E53E66C51E96B3FD155C5D3C63AE45346D85D44D55B33E44D818E83FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54B260
                  53FE715AEB7259EB7158F0723EDD56FF00FFFF00FF67DA774CE5654CE0644BDF
                  622EC045AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8DC5944FF96C59EB7259EC7259F47441D959FF00FFFF00FFFF00FFFF00FF
                  3DE75954E76C51E46A4DF469528D5AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF4FF96C31DC4C4BE4664BF0664CC85EFF00FFFF00FFFF
                  00FFFF00FFFF00FF89DA9553F26F56EA6E55E76F3EEA58A297A1FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FF96C69CF7598C49CFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF46E15D59EE7359EC725CF67639
                  AD4AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBADFBE4AF1
                  665AED735AEC7355FF726B856CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF63D47353EC6D58EB715CEF753EE459AD9DABFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF38D8504FE16854E56B5AF4753EAB4D
                  AD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBBDEBF2ED44948
                  D95F4DDD654CF768608564FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF6DCA793FCD553BCD5243D35B35DE4F9D929AFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF3EBF5051C96442C7563ACE5227B23BCDB8
                  C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32BC4632BC464FC460
                  52C7644CD66240914AAD9DABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8FCD9535B84A48BE584AC15C45D45B628565FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF50BA5D3AB34C42B85345BB5636C74B879088FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2BAB3B37AF493DB2
                  4E3DB75047A352FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  32BC4620A63121A73429AA3A32BC46FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF32BC46FF00FFFF00FFFF00FF}
                Layout = blGlyphTop
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton21Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 298
              ExplicitHeight = 298
              inherited ScrollBox2: TScrollBox
                Height = 281
                ExplicitHeight = 281
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 876
          ExplicitHeight = 520
        end
        object tsOutros: TTabSheet
          Caption = 'tsOutros'
          ImageIndex = 3
          object pgOutros: TPageControl
            Left = 0
            Top = 0
            Width = 876
            Height = 520
            ActivePage = tsRelContasApagar
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsRelContasApagar: TTabSheet
              Caption = 'tsRelContasApagar'
              object qrpContasAPagar: TQuickRep
                Left = -1
                Top = -27
                Width = 816
                Height = 1056
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                DataSet = dtmContasAPagar.cdsContaAPagar
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
                OnPreview = qrpContasAPagarPreview
                Options = [FirstPageHeader, LastPageFooter]
                Page.Columns = 1
                Page.Orientation = poPortrait
                Page.PaperSize = Letter
                Page.Values = (
                  100.000000000000000000
                  2794.000000000000000000
                  100.000000000000000000
                  2159.000000000000000000
                  100.000000000000000000
                  100.000000000000000000
                  0.000000000000000000)
                PrinterSettings.Copies = 1
                PrinterSettings.OutputBin = First
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
                SnapToGrid = True
                Units = MM
                Zoom = 100
                PrevFormStyle = fsNormal
                PreviewInitialState = wsNormal
                PrevInitialZoom = qrZoomToFit
                PreviewDefaultSaveType = stQRP
                object QRBand1: TQRBand
                  Left = 38
                  Top = 38
                  Width = 740
                  Height = 121
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
                    320.145833333333300000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbPageHeader
                  object QRLabel1: TQRLabel
                    Left = 2
                    Top = 36
                    Width = 343
                    Height = 24
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      63.500000000000000000
                      5.291666666666667000
                      95.250000000000000000
                      907.520833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'Relat'#243'rio de Contas a Pagar'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 14
                  end
                  object QRLabel2: TQRLabel
                    Left = 2
                    Top = 61
                    Width = 65
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      5.291666666666667000
                      161.395833333333300000
                      171.979166666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data/Hora:'
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
                    Left = 73
                    Top = 61
                    Width = 69
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      193.145833333333300000
                      161.395833333333300000
                      182.562500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    Color = clWhite
                    Data = qrsDateTime
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                    Transparent = False
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRLabel4: TQRLabel
                    Left = 631
                    Top = 61
                    Width = 47
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1669.520833333333000000
                      161.395833333333300000
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
                  object QRSysData4: TQRSysData
                    Left = 720
                    Top = 61
                    Width = 46
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1905.000000000000000000
                      161.395833333333300000
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
                    Left = 8
                    Top = 106
                    Width = 36
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      21.166666666666670000
                      280.458333333333400000
                      95.250000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Cad.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel6: TQRLabel
                    Left = 47
                    Top = 106
                    Width = 87
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      124.354166666666700000
                      280.458333333333400000
                      230.187500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Nome Fornecedor'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel7: TQRLabel
                    Left = 162
                    Top = 106
                    Width = 70
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      428.625000000000000000
                      280.458333333333400000
                      185.208333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'N'#186' Documento'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel8: TQRLabel
                    Left = 245
                    Top = 106
                    Width = 43
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      648.229166666666800000
                      280.458333333333400000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Hist'#243'rico'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel11: TQRLabel
                    Left = 466
                    Top = 106
                    Width = 40
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1232.958333333333000000
                      280.458333333333400000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Previsto'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel28: TQRLabel
                    Left = 577
                    Top = 106
                    Width = 43
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1526.645833333333000000
                      280.458333333333400000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Venc.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel69: TQRLabel
                    Left = 521
                    Top = 106
                    Width = 50
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1378.479166666667000000
                      280.458333333333400000
                      132.291666666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Realiz'#225'vel'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel73: TQRLabel
                    Left = 627
                    Top = 106
                    Width = 36
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1658.937500000000000000
                      280.458333333333400000
                      95.250000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Quit.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel74: TQRLabel
                    Left = 668
                    Top = 106
                    Width = 46
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1767.416666666667000000
                      280.458333333333400000
                      121.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data Ref.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object qrlNomeEmpresa: TQRLabel
                    Left = 3
                    Top = 5
                    Width = 179
                    Height = 25
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      66.145833333333340000
                      7.937500000000000000
                      13.229166666666670000
                      473.604166666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'qrlNomeEmpresa'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -21
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 16
                  end
                  object QRLabel32: TQRLabel
                    Left = 720
                    Top = 106
                    Width = 21
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1905.000000000000000000
                      280.458333333333400000
                      55.562500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Emp'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                end
                object qrBandDetalheCTP: TQRBand
                  Left = 38
                  Top = 173
                  Width = 740
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
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbDetail
                  object QRDBText3: TQRDBText
                    Left = 4
                    Top = 3
                    Width = 40
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      10.583333333333330000
                      7.937500000000000000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATA_ENT_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText4: TQRDBText
                    Left = 47
                    Top = 3
                    Width = 114
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      124.354166666666700000
                      7.937500000000000000
                      301.625000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'NOME_FOR_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText5: TQRDBText
                    Left = 162
                    Top = 3
                    Width = 82
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      428.625000000000000000
                      7.937500000000000000
                      216.958333333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'N_DOC_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText6: TQRDBText
                    Left = 245
                    Top = 3
                    Width = 187
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      648.229166666666800000
                      7.937500000000000000
                      494.770833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'HISTORICO_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText8: TQRDBText
                    Left = 574
                    Top = 3
                    Width = 46
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1518.708333333333000000
                      7.937500000000000000
                      121.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATA_VENC_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText34: TQRDBText
                    Left = 620
                    Top = 3
                    Width = 43
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1640.416666666667000000
                      7.937500000000000000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATQ_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText35: TQRDBText
                    Left = 671
                    Top = 3
                    Width = 43
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1775.354166666667000000
                      7.937500000000000000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DTREFERENCIA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText17: TQRDBText
                    Left = 720
                    Top = 3
                    Width = 17
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1905.000000000000000000
                      7.937500000000000000
                      44.979166666666670000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'COD_EMP_MULT'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel34: TQRLabel
                    Left = 434
                    Top = 3
                    Width = 72
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1148.291666666667000000
                      7.937500000000000000
                      190.500000000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel34'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel35: TQRLabel
                    Left = 510
                    Top = 3
                    Width = 61
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1349.375000000000000000
                      7.937500000000000000
                      161.395833333333300000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel35'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object qrBandPageFooter: TQRBand
                  Left = 38
                  Top = 215
                  Width = 740
                  Height = 49
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
                    129.645833333333300000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbPageFooter
                  object QRLabel30: TQRLabel
                    Left = 8
                    Top = 29
                    Width = 181
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      21.166666666666670000
                      76.729166666666680000
                      478.895833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'HW Sistemas e Computadores'
                    Color = clWhite
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRShape6: TQRShape
                    Left = 5
                    Top = 5
                    Width = 731
                    Height = 3
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      7.937500000000000000
                      13.229166666666670000
                      13.229166666666670000
                      1934.104166666667000000)
                    Brush.Color = clBlack
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRLabel31: TQRLabel
                    Left = 7
                    Top = 10
                    Width = 124
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      18.520833333333330000
                      26.458333333333330000
                      328.083333333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'TOTAL '#192' PAGAR....:'
                    Color = clWhite
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRLabel33: TQRLabel
                    Left = 417
                    Top = 8
                    Width = 89
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1103.312500000000000000
                      21.166666666666670000
                      235.479166666666700000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel13'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel72: TQRLabel
                    Left = 508
                    Top = 8
                    Width = 63
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1344.083333333333000000
                      21.166666666666670000
                      166.687500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel13'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object qrBandSubtotal: TQRBand
                  Left = 38
                  Top = 194
                  Width = 740
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
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbGroupFooter
                  object QRLabel59: TQRLabel
                    Left = 3
                    Top = 3
                    Width = 58
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      7.937500000000000000
                      7.937500000000000000
                      153.458333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'QRLabel59'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel66: TQRLabel
                    Left = 436
                    Top = 3
                    Width = 70
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1153.583333333333000000
                      7.937500000000000000
                      185.208333333333300000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel59'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel71: TQRLabel
                    Left = 508
                    Top = 3
                    Width = 63
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1344.083333333333000000
                      7.937500000000000000
                      166.687500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel59'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    OnPrint = QRLabel71Print
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object QRGroup1: TQRGroup
                  Left = 38
                  Top = 159
                  Width = 740
                  Height = 14
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
                    37.041666666666670000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  Expression = 'cdsContaAPagar.DATA_VENC_CTP'
                  FooterBand = qrBandSubtotal
                  Master = qrpContasAPagar
                  ReprintOnNewPage = False
                end
              end
              object qrpContasAPagar2: TQuickRep
                Left = -3
                Top = 267
                Width = 816
                Height = 1056
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                DataSet = dtmContasAPagar.cdsContaAPagar
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
                OnPreview = qrpContasAPagar2Preview
                Options = [FirstPageHeader, LastPageFooter]
                Page.Columns = 1
                Page.Orientation = poPortrait
                Page.PaperSize = Letter
                Page.Values = (
                  100.000000000000000000
                  2794.000000000000000000
                  100.000000000000000000
                  2159.000000000000000000
                  100.000000000000000000
                  100.000000000000000000
                  0.000000000000000000)
                PrinterSettings.Copies = 1
                PrinterSettings.OutputBin = First
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
                SnapToGrid = True
                Units = MM
                Zoom = 100
                PrevFormStyle = fsNormal
                PreviewInitialState = wsNormal
                PrevInitialZoom = qrZoomToFit
                PreviewDefaultSaveType = stQRP
                object QRBand2: TQRBand
                  Left = 38
                  Top = 38
                  Width = 740
                  Height = 121
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
                    320.145833333333300000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbPageHeader
                  object QRLabel3: TQRLabel
                    Left = 2
                    Top = 36
                    Width = 343
                    Height = 24
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      63.500000000000000000
                      5.291666666666667000
                      95.250000000000000000
                      907.520833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'Relat'#243'rio de Contas a Pagar'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 14
                  end
                  object QRLabel9: TQRLabel
                    Left = 2
                    Top = 61
                    Width = 65
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      5.291666666666667000
                      161.395833333333300000
                      171.979166666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data/Hora:'
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
                  object QRSysData2: TQRSysData
                    Left = 73
                    Top = 61
                    Width = 69
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      193.145833333333300000
                      161.395833333333300000
                      182.562500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    Color = clWhite
                    Data = qrsDateTime
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                    Transparent = False
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRLabel10: TQRLabel
                    Left = 631
                    Top = 61
                    Width = 47
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1669.520833333333000000
                      161.395833333333300000
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
                  object QRSysData3: TQRSysData
                    Left = 720
                    Top = 61
                    Width = 46
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1905.000000000000000000
                      161.395833333333300000
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
                  object QRLabel12: TQRLabel
                    Left = 8
                    Top = 106
                    Width = 36
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      21.166666666666670000
                      280.458333333333400000
                      95.250000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Cad.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel13: TQRLabel
                    Left = 47
                    Top = 106
                    Width = 87
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      124.354166666666700000
                      280.458333333333400000
                      230.187500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Nome Fornecedor'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel14: TQRLabel
                    Left = 175
                    Top = 106
                    Width = 70
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      463.020833333333400000
                      280.458333333333400000
                      185.208333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'N'#186' Documento'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel15: TQRLabel
                    Left = 267
                    Top = 106
                    Width = 43
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      706.437500000000000000
                      280.458333333333400000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Hist'#243'rico'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel16: TQRLabel
                    Left = 490
                    Top = 106
                    Width = 40
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1296.458333333333000000
                      280.458333333333400000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Previsto'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel17: TQRLabel
                    Left = 599
                    Top = 106
                    Width = 43
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1584.854166666667000000
                      280.458333333333400000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Venc.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel18: TQRLabel
                    Left = 544
                    Top = 106
                    Width = 50
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1439.333333333333000000
                      280.458333333333400000
                      132.291666666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Realiz'#225'vel'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel19: TQRLabel
                    Left = 648
                    Top = 106
                    Width = 36
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1714.500000000000000000
                      280.458333333333400000
                      95.250000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Dt.Quit.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel20: TQRLabel
                    Left = 695
                    Top = 107
                    Width = 46
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1838.854166666667000000
                      283.104166666666700000
                      121.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data Ref.'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object qrlNomeEmpresa2: TQRLabel
                    Left = 3
                    Top = 5
                    Width = 191
                    Height = 25
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      66.145833333333340000
                      7.937500000000000000
                      13.229166666666670000
                      505.354166666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'qrlNomeEmpresa2'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -21
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 16
                  end
                end
                object qrBandDetalheCTP2: TQRBand
                  Left = 38
                  Top = 190
                  Width = 740
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
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbDetail
                  object QRDBText1: TQRDBText
                    Left = 1
                    Top = 3
                    Width = 40
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      2.645833333333333000
                      7.937500000000000000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATA_ENT_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText2: TQRDBText
                    Left = 47
                    Top = 3
                    Width = 124
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      124.354166666666700000
                      7.937500000000000000
                      328.083333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'NOME_FOR_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText9: TQRDBText
                    Left = 175
                    Top = 3
                    Width = 88
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      463.020833333333300000
                      7.937500000000000000
                      232.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'N_DOC_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText10: TQRDBText
                    Left = 267
                    Top = 3
                    Width = 187
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      706.437500000000000000
                      7.937500000000000000
                      494.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'HISTORICO_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText12: TQRDBText
                    Left = 599
                    Top = 3
                    Width = 46
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1584.854166666667000000
                      7.937500000000000000
                      121.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATA_VENC_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText14: TQRDBText
                    Left = 648
                    Top = 3
                    Width = 43
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1714.500000000000000000
                      7.937500000000000000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DATQ_CTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText15: TQRDBText
                    Left = 695
                    Top = 3
                    Width = 43
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1838.854166666667000000
                      7.937500000000000000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'DTREFERENCIA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel36: TQRLabel
                    Left = 458
                    Top = 3
                    Width = 72
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1211.791666666667000000
                      7.937500000000000000
                      190.500000000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel36'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel37: TQRLabel
                    Left = 534
                    Top = 3
                    Width = 60
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1412.875000000000000000
                      7.937500000000000000
                      158.750000000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel37'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object qrBandPageFooter2: TQRBand
                  Left = 38
                  Top = 232
                  Width = 740
                  Height = 49
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
                    129.645833333333300000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbPageFooter
                  object QRLabel22: TQRLabel
                    Left = 8
                    Top = 29
                    Width = 181
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      21.166666666666670000
                      76.729166666666680000
                      478.895833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'HW Sistemas e Computadores'
                    Color = clWhite
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRShape1: TQRShape
                    Left = 5
                    Top = 5
                    Width = 731
                    Height = 3
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      7.937500000000000000
                      13.229166666666670000
                      13.229166666666670000
                      1934.104166666667000000)
                    Brush.Color = clBlack
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRLabel23: TQRLabel
                    Left = 7
                    Top = 10
                    Width = 124
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      18.520833333333330000
                      26.458333333333330000
                      328.083333333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'TOTAL '#192' PAGAR....:'
                    Color = clWhite
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 10
                  end
                  object QRLabel24: TQRLabel
                    Left = 441
                    Top = 8
                    Width = 89
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1166.812500000000000000
                      21.166666666666670000
                      235.479166666666700000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel13'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel25: TQRLabel
                    Left = 531
                    Top = 8
                    Width = 63
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1404.937500000000000000
                      21.166666666666670000
                      166.687500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel13'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object qrBandSubtotal2: TQRBand
                  Left = 38
                  Top = 211
                  Width = 740
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
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbGroupFooter
                  object QRLabel26: TQRLabel
                    Left = 3
                    Top = 3
                    Width = 58
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      7.937500000000000000
                      7.937500000000000000
                      153.458333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'QRLabel26'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel27: TQRLabel
                    Left = 460
                    Top = 3
                    Width = 70
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1217.083333333333000000
                      7.937500000000000000
                      185.208333333333300000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel59'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRLabel29: TQRLabel
                    Left = 531
                    Top = 3
                    Width = 63
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1404.937500000000000000
                      7.937500000000000000
                      166.687500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'QRLabel59'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    OnPrint = QRLabel71Print
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 6
                  end
                end
                object QRGroup2: TQRGroup
                  Left = 38
                  Top = 159
                  Width = 740
                  Height = 31
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
                    82.020833333333330000
                    1957.916666666667000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  Expression = 'cdsContaAPagar.COD_EMP_MULT'
                  FooterBand = qrBandSubtotal2
                  Master = qrpContasAPagar2
                  ReprintOnNewPage = False
                  object QRDBText16: TQRDBText
                    Left = 35
                    Top = 4
                    Width = 40
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      92.604166666666680000
                      10.583333333333330000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = dtmContasAPagar.cdsContaAPagar
                    DataField = 'COD_EMP_MULT'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel21: TQRLabel
                    Left = 3
                    Top = 4
                    Width = 27
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      7.937500000000000000
                      10.583333333333330000
                      71.437500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'EMP:'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                end
              end
            end
            object tsRelContasApagarOpcao: TTabSheet
              Caption = 'tsRelContasApagarOpcao'
              ImageIndex = 12
              object pnOpcoesImp: TPanel
                Left = -3
                Top = 3
                Width = 473
                Height = 328
                BevelOuter = bvNone
                BorderWidth = 6
                TabOrder = 0
                object GroupBox6: TGroupBox
                  Left = 6
                  Top = 6
                  Width = 461
                  Height = 276
                  Align = alClient
                  Caption = 'Op'#231#245'es de Impress'#227'o'
                  TabOrder = 0
                  object rbFormatoPadrao: TRadioButton
                    Left = 16
                    Top = 22
                    Width = 193
                    Height = 17
                    Caption = 'Formato Padr'#227'o - Consulta Pr'#233'via'
                    TabOrder = 0
                  end
                  object Panel26: TPanel
                    Left = 16
                    Top = 44
                    Width = 428
                    Height = 50
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label45: TLabel
                      Left = 33
                      Top = 6
                      Width = 32
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ordem'
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 203
                      Top = 3
                      Width = 23
                      Height = 22
                      Hint = 
                        'Alternar entre Data de Vencimento e Registro ordenado na consult' +
                        'a'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000E30E0000E30E00000001000000010000104A7B00184A
                        840018528C0018529400185A9C00185AA5001863AD001863B500186BBD00186B
                        C6001873CE001873D600187BDE00187BE7001884EF001884F700FF00FF00188C
                        FF001894FF002194FF00299CFF00319CFF0039A5FF004AADFF0052ADFF0063B5
                        FF006BBDFF0084C6FF00ADDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00101D1D1D1D1D
                        1D1D1D1D1D1D1D1D1D101D18030404040505040403030201171D1D05080A0A0A
                        0A0A0A0A0A090805001D1D060A0C0C0D0D111111110C0906021D1D090C0E0E1D
                        111C1C1C110E0A08031D1D0A0D11111D1D1D1D1D1C0E0B09041D1D0C1111111D
                        1D1111111D0D0B0A051D1D0D1111111D1D1D11110E0C0A0A061D1D0E11111111
                        1111110E0D0B0A0A061D1D1113131111110F1D1D1D0A0A0A061D1D111616131D
                        11110E1D1D0B0A0A061D1D131817141C1D1D1D1D1D0C0A0A061D1D161A181615
                        1C1C1C111D0E0C0A061D1D171B1A18171615141312110E0A041D1D1C17151311
                        1111110E0D0C0A08191D101D1D1D1D1D1D1D1D1D1D1D1D1D1D10}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton9Click
                    end
                    object ComboBox4: TComboBox
                      Left = 71
                      Top = 3
                      Width = 126
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 13
                      TabOrder = 0
                    end
                    object CheckBox4: TCheckBox
                      Left = 232
                      Top = 5
                      Width = 97
                      Height = 17
                      Caption = 'Selecionados'
                      TabOrder = 1
                    end
                    object CheckBox9: TCheckBox
                      Left = 232
                      Top = 26
                      Width = 169
                      Height = 17
                      Caption = 'Agrupar empresas unificadas'
                      TabOrder = 2
                    end
                  end
                  object rbFormatoCopiaConsultaPrevia: TRadioButton
                    Left = 16
                    Top = 99
                    Width = 193
                    Height = 17
                    Caption = 'Formato C'#243'pia - Consulta Pr'#233'via'
                    TabOrder = 2
                  end
                  object Panel27: TPanel
                    Left = 16
                    Top = 122
                    Width = 428
                    Height = 32
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object CheckBox5: TCheckBox
                      Left = 322
                      Top = 5
                      Width = 97
                      Height = 17
                      Caption = 'Selecionados'
                      TabOrder = 2
                    end
                    object CheckBox6: TCheckBox
                      Left = 215
                      Top = 5
                      Width = 97
                      Height = 17
                      Caption = 'Com assinatura '
                      TabOrder = 1
                    end
                    object CheckBox10: TCheckBox
                      Left = 13
                      Top = 5
                      Width = 169
                      Height = 17
                      Caption = 'Agrupar empresas unificadas'
                      TabOrder = 0
                    end
                  end
                  object rbFormatoCopiaPorData: TRadioButton
                    Left = 16
                    Top = 161
                    Width = 197
                    Height = 17
                    Caption = 'Formato C'#243'pia - Por per'#237'odo'
                    TabOrder = 4
                  end
                  object Panel28: TPanel
                    Left = 16
                    Top = 184
                    Width = 428
                    Height = 89
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 5
                    object Label46: TLabel
                      Left = 206
                      Top = 66
                      Width = 16
                      Height = 13
                      Caption = 'at'#233
                    end
                    object Label47: TLabel
                      Left = 13
                      Top = 11
                      Width = 52
                      Height = 13
                      Caption = 'Qual data?'
                    end
                    object ckRelQuitadas: TCheckBox
                      Left = 322
                      Top = 10
                      Width = 67
                      Height = 17
                      Caption = 'Quitadas'
                      TabOrder = 2
                    end
                    object MaskEdit10: TMaskEdit
                      Left = 125
                      Top = 60
                      Width = 75
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 4
                      Text = '  /  /    '
                    end
                    object MaskEdit11: TMaskEdit
                      Left = 230
                      Top = 60
                      Width = 75
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 5
                      Text = '  /  /    '
                    end
                    object ckRelAbertas: TCheckBox
                      Left = 215
                      Top = 10
                      Width = 67
                      Height = 17
                      Caption = 'Abertas'
                      TabOrder = 1
                    end
                    object ComboBox5: TComboBox
                      Left = 71
                      Top = 8
                      Width = 126
                      Height = 21
                      ItemHeight = 13
                      ItemIndex = 0
                      TabOrder = 0
                      Text = 'Vencimento'
                      Items.Strings = (
                        'Vencimento'
                        'Quitacao'
                        'Entrada')
                    end
                    object CheckBox8: TCheckBox
                      Left = 322
                      Top = 62
                      Width = 97
                      Height = 17
                      Caption = 'Com assinatura '
                      TabOrder = 6
                    end
                    object CheckBox11: TCheckBox
                      Left = 215
                      Top = 32
                      Width = 169
                      Height = 17
                      Caption = 'Agrupar empresas unificadas'
                      TabOrder = 3
                    end
                  end
                end
                object Panel13: TPanel
                  Left = 6
                  Top = 282
                  Width = 461
                  Height = 40
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn22: TBitBtn
                    Left = 191
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'OK'
                    ModalResult = 1
                    TabOrder = 0
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
            object tsReplicacao: TTabSheet
              Caption = 'tsReplicacao'
              ImageIndex = 1
              object pnReplicar: TPanel
                Left = 0
                Top = 3
                Width = 677
                Height = 485
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel30: TPanel
                  Left = 0
                  Top = 82
                  Width = 673
                  Height = 37
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label74: TLabel
                    Left = 59
                    Top = 5
                    Width = 110
                    Height = 26
                    Alignment = taRightJustify
                    Caption = 'Quantidade de Registros a replicar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    WordWrap = True
                  end
                  object edQtdeRepl: TEditHw
                    Left = 174
                    Top = 7
                    Width = 51
                    Height = 21
                    BiDiMode = bdRightToLeft
                    ParentBiDiMode = False
                    TabOrder = 0
                    Text = '1'
                    Formato = fInteger
                    FormatSize = '0.0'
                    AsValue = 1.000000000000000000
                  end
                end
                object Panel31: TPanel
                  Left = 0
                  Top = 119
                  Width = 673
                  Height = 33
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object Label76: TLabel
                    Left = 51
                    Top = 2
                    Width = 118
                    Height = 26
                    Alignment = taRightJustify
                    Caption = 'Dia de Vencimento a replicar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    WordWrap = True
                  end
                  object edDiaVencReplicar: TEditHw
                    Left = 174
                    Top = 5
                    Width = 51
                    Height = 21
                    BiDiMode = bdRightToLeft
                    ParentBiDiMode = False
                    TabOrder = 0
                    Text = '1'
                    Formato = fInteger
                    FormatSize = '0.0'
                    AsValue = 1.000000000000000000
                  end
                end
                object Panel32: TPanel
                  Left = 0
                  Top = 246
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 6
                  object BitBtn27: TBitBtn
                    Left = 256
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn27Click
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
                  object BitBtn28: TBitBtn
                    Left = 337
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
                object Panel8: TPanel
                  Left = 0
                  Top = 0
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label77: TLabel
                    Left = 16
                    Top = 5
                    Width = 42
                    Height = 13
                    Caption = 'Cliente:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label78: TLabel
                    Left = 6
                    Top = 19
                    Width = 52
                    Height = 13
                    Caption = 'Num Doc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label79: TLabel
                    Left = 275
                    Top = 19
                    Width = 32
                    Height = 13
                    Caption = 'Valor:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText9: TDBText
                    Left = 64
                    Top = 5
                    Width = 339
                    Height = 13
                    DataField = 'NOME_FOR_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText10: TDBText
                    Left = 64
                    Top = 19
                    Width = 87
                    Height = 13
                    DataField = 'N_DOC_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText11: TDBText
                    Left = 313
                    Top = 19
                    Width = 85
                    Height = 13
                    DataField = 'VALOR_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label80: TLabel
                    Left = 155
                    Top = 19
                    Width = 30
                    Height = 13
                    Caption = 'Venc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText12: TDBText
                    Left = 193
                    Top = 19
                    Width = 78
                    Height = 13
                    DataField = 'DATA_VENC_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel4: TPanel
                  Left = 0
                  Top = 152
                  Width = 673
                  Height = 37
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object Label14: TLabel
                    Left = 7
                    Top = 0
                    Width = 162
                    Height = 26
                    Alignment = taRightJustify
                    Caption = 'Data refer'#234'ncia igual ao m'#234's anterior ao do vencimento'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    WordWrap = True
                  end
                  object cbReferenciaMes: TComboBox
                    Left = 174
                    Top = 5
                    Width = 51
                    Height = 21
                    Style = csDropDownList
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'SIM'
                    Items.Strings = (
                      'SIM'
                      'N'#195'O')
                  end
                end
                object pnNumConta: TPanel
                  Left = 0
                  Top = 41
                  Width = 673
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object Label54: TLabel
                    Left = 103
                    Top = 11
                    Width = 66
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#186' da Conta'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object EditHwNumConta: TEditHw
                    Left = 174
                    Top = 8
                    Width = 51
                    Height = 21
                    BiDiMode = bdRightToLeft
                    ParentBiDiMode = False
                    TabOrder = 0
                    Text = '1,0000'
                    OnExit = EditHwNumContaExit
                    Formato = fNumber
                    FormatSize = '0.4'
                    AsValue = 1.000000000000000000
                  end
                  object DBLookupComboBoxNumConta: TDBLookupComboBox
                    Left = 227
                    Top = 8
                    Width = 342
                    Height = 21
                    Hint = 'Descri'#231#227'o da Conta'
                    DataField = 'N_CONTA_PLC'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC'
                    ListSource = dtmContasAPagar.dsPContas
                    TabOrder = 1
                    OnExit = DBLookupComboBoxNumContaExit
                  end
                end
                object MemoReplicar: TMemo
                  Left = 0
                  Top = 287
                  Width = 673
                  Height = 194
                  Align = alClient
                  Lines.Strings = (
                    'MemoReplicar')
                  TabOrder = 7
                end
                object Panel76: TPanel
                  Left = 0
                  Top = 189
                  Width = 673
                  Height = 57
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 5
                  object ckbReplAlterarNumQdeParcela: TCheckBox
                    Left = 43
                    Top = 7
                    Width = 510
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 
                      'Replicar alterando o n'#250'mero e quantidade da parcela do documento' +
                      ' atual selecionado'
                    Checked = True
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    State = cbChecked
                    TabOrder = 0
                    OnClick = ckbReplAlterarNumQdeParcelaClick
                  end
                  object ckbReplNaoAlterarNumQdeParcela: TCheckBox
                    Left = 33
                    Top = 28
                    Width = 520
                    Height = 17
                    Alignment = taLeftJustify
                    Caption = 
                      'Replicar sem alterar o n'#250'mero e quantidade da parcela do documen' +
                      'to atual selecionado'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    OnClick = ckbReplNaoAlterarNumQdeParcelaClick
                  end
                end
              end
            end
            object tsAtualizarValorPago: TTabSheet
              Caption = 'tsAtualizarValorPago'
              ImageIndex = 2
              object pnAtualizarValorPago: TPanel
                Left = 0
                Top = 3
                Width = 425
                Height = 238
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel6: TPanel
                  Left = 6
                  Top = 127
                  Width = 409
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label28: TLabel
                    Left = 11
                    Top = 11
                    Width = 185
                    Height = 13
                    Caption = 'Valor Para Pagamento da Conta: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBEdit4: TDBEdit
                    Left = 202
                    Top = 8
                    Width = 121
                    Height = 21
                    DataField = 'VALOR_PAGO'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    TabOrder = 0
                  end
                end
                object Panel9: TPanel
                  Left = 6
                  Top = 182
                  Width = 409
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn7: TBitBtn
                    Left = 125
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn7Click
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
                  object BitBtn8: TBitBtn
                    Left = 206
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
                object Panel10: TPanel
                  Left = 6
                  Top = 6
                  Width = 409
                  Height = 115
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label29: TLabel
                    Left = 32
                    Top = 5
                    Width = 42
                    Height = 13
                    Caption = 'Cliente:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label30: TLabel
                    Left = 22
                    Top = 21
                    Width = 52
                    Height = 13
                    Caption = 'Num Doc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label31: TLabel
                    Left = 6
                    Top = 53
                    Width = 68
                    Height = 13
                    Caption = 'Valor Conta:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText1: TDBText
                    Left = 79
                    Top = 5
                    Width = 339
                    Height = 13
                    DataField = 'NOME_FOR_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText2: TDBText
                    Left = 79
                    Top = 21
                    Width = 87
                    Height = 13
                    DataField = 'N_DOC_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText3: TDBText
                    Left = 79
                    Top = 53
                    Width = 85
                    Height = 13
                    DataField = 'VALOR_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label32: TLabel
                    Left = 44
                    Top = 37
                    Width = 30
                    Height = 13
                    Caption = 'Venc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText4: TDBText
                    Left = 79
                    Top = 37
                    Width = 78
                    Height = 13
                    DataField = 'DATA_VENC_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label27: TLabel
                    Left = 6
                    Top = 69
                    Width = 63
                    Height = 13
                    Caption = 'Valor Pago:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText5: TDBText
                    Left = 79
                    Top = 69
                    Width = 85
                    Height = 13
                    DataField = 'VALOR_PAGO'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
              end
            end
            object tsAceitarContaCTP: TTabSheet
              Caption = 'tsAceitarContaCTP'
              ImageIndex = 3
              object pnAceitarContaCTP: TPanel
                Left = 0
                Top = 0
                Width = 425
                Height = 129
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel7: TPanel
                  Left = 5
                  Top = 12
                  Width = 409
                  Height = 59
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label33: TLabel
                    Left = 6
                    Top = 0
                    Width = 105
                    Height = 13
                    Caption = 'Banco Documento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edNomeBanco: TEdit
                    Left = 6
                    Top = 19
                    Width = 395
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 0
                    Text = 'EDIT1'
                  end
                end
                object Panel11: TPanel
                  Left = 5
                  Top = 80
                  Width = 409
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn9: TBitBtn
                    Left = 125
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Confirmar aceite para as contas a pagar selecionadas na grade'
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn9Click
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
                  object BitBtn10: TBitBtn
                    Left = 206
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 
                      'Cancelar o processo de Aceite para as contas a pagar selecionada' +
                      's'
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
            object tsDadosQuitacao: TTabSheet
              Caption = 'tsDadosQuitacao'
              ImageIndex = 4
              object pnDadosQuitacao: TPanel
                Left = 3
                Top = 13
                Width = 494
                Height = 178
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel51: TPanel
                  Left = 0
                  Top = 133
                  Width = 490
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn41: TBitBtn
                    Left = 162
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'OK'
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn41Click
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
                  object BitBtn42: TBitBtn
                    Left = 243
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Cancelar quita'#231#227'o - [CTP019]'
                    Cancel = True
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn42Click
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
                object Panel49: TPanel
                  Left = 0
                  Top = 0
                  Width = 490
                  Height = 41
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label62: TLabel
                    Left = 116
                    Top = 13
                    Width = 121
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor da baixa parcial'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object edValorBaixaParcial: TEditHw
                    Left = 243
                    Top = 8
                    Width = 121
                    Height = 21
                    TabOrder = 0
                    Text = '0,00'
                    Formato = fNumber
                    FormatSize = '0.2'
                  end
                end
                object Panel56: TPanel
                  Left = 0
                  Top = 41
                  Width = 490
                  Height = 92
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Panel57: TPanel
                    Left = 0
                    Top = 0
                    Width = 490
                    Height = 48
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object CheckBox7: TCheckBox
                      Left = 107
                      Top = 16
                      Width = 270
                      Height = 17
                      Caption = 'Lan'#231'ar diferen'#231'a existente para mensurar valores'
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                    end
                  end
                  object Panel66: TPanel
                    Left = 0
                    Top = 48
                    Width = 490
                    Height = 41
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label108: TLabel
                      Left = 134
                      Top = 13
                      Width = 103
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data real da baixa'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object MaskEdit4: TMaskEdit
                      Left = 243
                      Top = 8
                      Width = 75
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 0
                      Text = '  /  /    '
                    end
                  end
                end
              end
            end
            object tsDetalhes: TTabSheet
              Caption = 'tsDetalhes'
              ImageIndex = 11
              object pnDetalhes: TPanel
                Left = 0
                Top = 3
                Width = 818
                Height = 331
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnDetalhesEnter
                object Panel54: TPanel
                  Left = 8
                  Top = 8
                  Width = 801
                  Height = 81
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label63: TLabel
                    Left = 58
                    Top = 11
                    Width = 44
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Cliente:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label70: TLabel
                    Left = 45
                    Top = 30
                    Width = 57
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Num Doc:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label71: TLabel
                    Left = 20
                    Top = 49
                    Width = 82
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Valor Original:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object DBText6: TDBText
                    Left = 108
                    Top = 11
                    Width = 501
                    Height = 17
                    DataField = 'NOME_FOR_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object DBText7: TDBText
                    Left = 108
                    Top = 30
                    Width = 109
                    Height = 15
                    DataField = 'N_DOC_CTP'
                    DataSource = dtmContasAPagar.dsContaAPagar
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label64: TLabel
                    Left = 319
                    Top = 49
                    Width = 255
                    Height = 18
                    Alignment = taRightJustify
                    Caption = 'Aten'#231#227'o! Conta ainda n'#227'o quitada'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -16
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Visible = False
                  end
                  object Label67: TLabel
                    Left = 108
                    Top = 49
                    Width = 45
                    Height = 15
                    Caption = 'Label67'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label68: TLabel
                    Left = 310
                    Top = 30
                    Width = 29
                    Height = 15
                    Alignment = taRightJustify
                    Caption = 'Lote:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object DBText8: TDBText
                    Left = 345
                    Top = 30
                    Width = 109
                    Height = 15
                    DataField = 'LOTE'
                    DataSource = dtmContasAPagar.dsDetalhesConta
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton27: TSpeedButton
                    Left = 766
                    Top = 30
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
                    OnClick = SpeedButton18Click
                  end
                end
                object Panel59: TPanel
                  Left = 8
                  Top = 95
                  Width = 801
                  Height = 177
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object DBGrid7: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 797
                    Height = 173
                    Align = alClient
                    DataSource = dtmContasAPagar.dsDetalhesConta
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid4KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DATQ_CTP'
                        Width = 95
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_PAGO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_DOC_CTP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NUM_NOTA_NFE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENC_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTORICO_CTP'
                        Width = 259
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_CTP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CONTRP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_FORN_NFE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_ENT_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_FOR_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CONTA_PLC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DTREFERENCIA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CTP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NATL_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NPARCELA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'QTDE_PARC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_FOR_DUP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SUBT_FOR_DUP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIP_CNT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CHEQ_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOMINAL_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DT_COMPENS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CHASSI_CONC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_BAIXA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ACEITE_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_CONTABIL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_EMP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CPF_CGC_F'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_BANCO_DUPL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_HONDA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_PREV_PG'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EQUIP'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTRAT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CONTA_PLC_OR'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TPRAT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ENTRA_PREVISAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SERIE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_DOC_CTP_ORIG'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_CTP_ORIG'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'REF_FRETE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SELEC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CX'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_OBS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NSU_RO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ARQ_EXTRATO_ADM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_DESPESA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMP_MULT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'IDENTIFICACAO_EMP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_USUARIO_PROCESS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_PROCESS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HORA_PROCESS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOMEARQ_PROCESS'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'US_CAD'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'US_BX'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_CTA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CTA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CONTRAPARTIDA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CONTRAPARTIDA_CTP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ID_FINANC_CONFERE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE_QUIT_PARC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CONTRP_ORIG'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
                object Panel62: TPanel
                  Left = 8
                  Top = 278
                  Width = 801
                  Height = 41
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object BitBtn37: TBitBtn
                    Left = 284
                    Top = 6
                    Width = 153
                    Height = 25
                    Hint = 'Detalhes despesas pagas'
                    Caption = '&Detalhes despesas pagas'
                    TabOrder = 0
                    OnClick = BitBtn37Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B0000000100000001000000000000CE63
                      0000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020201010102020202020101010202020202010301020000
                      0002010301020000000201010202020202020101020202020202020202020202
                      0202020202020202020202020202020202020202020202020202010101020202
                      0202010101020202020201030102000000020103010200000002010102020202
                      0202010102020202020202020202020202020202020202020202020202020202
                      0202020202020202020201010102020202020101010202020202010301020000
                      0002010301020000000201010202020202020101020202020202020202020202
                      0202020202020202020202020202020202020202020202020202}
                  end
                  object BitBtn38: TBitBtn
                    Left = 712
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = 'Voltar'
                    TabOrder = 1
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
                  object BitBtn44: TBitBtn
                    Left = 443
                    Top = 6
                    Width = 170
                    Height = 25
                    Hint = 'Visualizar lotes de quita'#231#227'o - [CTP006]'
                    Caption = '&Visualizar Lotes de Quita'#231#227'o'
                    TabOrder = 2
                    OnClick = BitBtn44Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000130B0000130B0000000100000001000000000000CE63
                      0000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201020200000000020000000200000002020202020202
                      0202020202020202020201010101010101010101010101010101020202020202
                      0202020202020202020202020200000000020000000200000002020202020202
                      0202020202020202020202020202020202020202020202020202}
                  end
                  object BitBtn36: TBitBtn
                    Left = 21
                    Top = 6
                    Width = 125
                    Height = 25
                    Hint = 'Imprimir - [CTP011]'
                    Caption = '&Imprimir'
                    TabOrder = 3
                    OnClick = BitBtn36Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000030F0000030F00000001000000010000000000002100
                      0000000808000808080010100800101010001818100018181800311818003918
                      1800421818001821180018291800181021004218210021212100292121004221
                      21004A21210021292100292929004A2929002921310031213100392131003129
                      31003131310039313100523131005A3131003939310031393900393939004242
                      420042D642004A4A4A00524A52007B4A5200844A52004A525200525252005A52
                      5200524A5A008C4A5A0052525A0063636300736363007B6363006B6B6300736B
                      63007B6B63006B5A6B00845A6B007B636B0084636B006B6B6B00846B6B008C6B
                      6B006B846B008C637300846B73008C6B73009C6B7300737373007B7373008473
                      73007B94730073C67300A56B7B00A5737B00737B7B007B7B7B00847B7B009C7B
                      7B00A57B7B00AD7B7B007B847B00A5847B0084CE7B008CFF7B00847B84008C7B
                      8400947B8400BD7B840073848400848484008C848400A5848400AD848400B584
                      84007BB584009C848C00848C8C008C8C8C00948C8C009C8C8C00BD8C8C00C68C
                      8C0084948C0094948C008CBD8C00BD8C9400C68C9400849494008C9494009494
                      94009C9494008C9C9400949C940094DE9400AD7B9C008C849C008C949C009494
                      9C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A59C009CEF9C00A57B
                      A500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5ADAD00ADAD
                      AD00B5ADAD00ADB5B500B5B5B500B5B5BD00BDB5BD00B5BDBD00BDBDBD00BDC6
                      BD00BDD6BD00C6C6C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6
                      CE00D6D6CE00D6CED600CED6D600D6D6D600DED6D600DEDED600D6DEDE00DEDE
                      DE00DEE7DE00E7D6E700DEE7E700E7E7E700EFE7E700E7EFE700EFEFE700E7EF
                      EF00EFEFEF00F7EFEF00F7F7EF00EFEFF700F7EFF700EFF7F700F7F7F700FF00
                      FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9A9A9A9A9
                      A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A95D5D5D5D5D7AA9A9A9A9A9A9A9A90346
                      A88E8B84AB8B0485A9A9A9A9A9A90037A895908BAB8D0028A9A9A9A90720145C
                      94745D56A28E191E0D30A94729481437818384847A71182C2720A92874676B68
                      69744C6268746F336D33A92888865E4838383435393B792B8D7DA93F94515358
                      4A4B49494A4D592B9B81A95D8F52261D110A090E111C26258D81A9A9907F0E77
                      ABABABABABAB0A128F84A9A98384415EABABABABABAA355F83A9A9A9A9A9A99A
                      A8AB8F755D55A9A9A9A9A9A9A9A9A990AAAB7A638B7AA9A9A9A9A9A9A9A9A98B
                      A8A881999D7AA9A9A9A9A9A9A9A9A988959584957AA9A9A9A9A9}
                  end
                  object BitBtn39: TBitBtn
                    Left = 153
                    Top = 6
                    Width = 125
                    Height = 25
                    Hint = 'Visualizar imagens do lote - [CTP037]'
                    Caption = '&Imagens'
                    TabOrder = 4
                    OnClick = BitBtn39Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000120B0000120B00000001000000000000000000000000
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
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                      FDFDFDFDFDFDFDFDFDFDFD8888888888888888888888888888FDFD88F3EAEAEA
                      E9E9E9E0E0E0E0E088FDFD8809F3EBEAEAEAE9E9E1E0E0E088FDFD8809F3F3EB
                      EAEAEAE9E9E0E0E088FDFD88090909F3F3EBEAEAE9E9E9E088FDFD88090909F3
                      F3EBEBEAEAE9E9E188FDFD886F6FAEF509F3F3EBEAEAEAE988FDFD8837373737
                      3776B5F4EBEBEAE988FDFD8837373737373737373737377588FDFD8837373737
                      373737373737373788FDFD889B9B9B9B9B9B9BA4AC9B9B9B88FDFD88A49B9B9B
                      9B9BA40909ECA4A388FDFD8809090909090909090909090988FDFD8888888888
                      888888888888888888FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                  end
                end
              end
            end
            object tsImpressaoLote: TTabSheet
              Caption = 'tsImpressaoLote'
              ImageIndex = 5
              object pnImpressaoLote: TPanel
                Left = 3
                Top = 13
                Width = 494
                Height = 308
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object Panel14: TPanel
                  Left = 0
                  Top = 263
                  Width = 490
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn13: TBitBtn
                    Left = 16
                    Top = 2
                    Width = 87
                    Height = 29
                    Hint = 'Imprimir Lote Selecionado - [CTP011]'
                    Caption = '&Imprimir'
                    TabOrder = 0
                    OnClick = BitBtn13Click
                    Glyph.Data = {
                      F6060000424DF606000000000000360000002800000018000000180000000100
                      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
                      6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
                      6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
                      BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
                      6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
                      C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
                      7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
                      A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
                      C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
                      2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
                      CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
                      A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
                      00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
                      EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
                      6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
                      F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
                      B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
                      F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
                      C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
                      6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
                      B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
                      00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
                      6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
                      B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
                      D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
                      CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
                      82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
                      8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
                      FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
                      E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
                      ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
                      FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
                      F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                  object BitBtn17: TBitBtn
                    Left = 364
                    Top = 2
                    Width = 87
                    Height = 29
                    Caption = '&Sair'
                    TabOrder = 2
                    OnClick = BitBtn17Click
                    Glyph.Data = {
                      3E040000424D3E04000000000000FE0100002800000018000000180000000100
                      08000000000040020000120B0000120B0000720000007200000000000000FFFF
                      FF00FF00FF004E1E1F00BF4C4D00BD4B4C00C04D4E00C14E4F00C4505100C24F
                      5000C5515200B64B4C00C9545500C7535400C6525300CA555600CB565700CE58
                      5900CC575800C5545500D05A5B00CF595A00D35C5D00D15B5C00D55E5F00D45D
                      5E00D8606200D75F6000AF4E4F00D9626300DD656600DC646500DA636400E067
                      6800DE666700E2696A00E1686900E56B6C00E36A6B00E96E6F00E76D6E00E66C
                      6D009F4B4C00EA6F7000A04C4D00EB707200A34E4F00EE737400ED7273009C4B
                      4C00F2767700F0757600EF747500E06D6E00A6515200F6797A00F4787900F377
                      7800A9535400F87B7D00F77A7B00FB7E7F00FA7D7E00AF585900AC5657009A4D
                      4E00FF818200FE808100FC7F8000F77E7F00B25B5C00EE7A7B00D56F7000B860
                      6200B6626300AF5E5F00FE8B8C0091515200FC929300EF909100FB9A9C00E690
                      9100EB959600FAA3A400F8AAAB00F2A9AA00EEA6A700F7B5B600A5505000994B
                      4B00AB555500B15A5A00B55D5D00B75F5F00914B4B00BB636300BF666600BD65
                      65008C4B4B00894B4B009F58580098555500824B4B00EB9C9C00F7B1B100EECE
                      AF00FFFFD300D9F6BD00B7EBAA0058A55B003F9E4C005ED3770045CA67001EBC
                      4C00020202020202020202020266030202020202020202020202020202020202
                      02026666625E0302020202020202020202020202020202666663310B052A0302
                      020202020202020202020202026666411C070604042A03596666666666666666
                      020202020266130C0D0E0A08092C034C4E505354685757660202020202661112
                      100F0C0D0E2E036E71717171717157660202020202661714151112100F58036E
                      71717171717157660202020202661818191617141536036E7171717171715766
                      020202020266201D1A1B1819163A036E7171717171715766020202020266221E
                      1F201D1A1B5A036E71717171717157660202020202662324212235511F40036D
                      7171717171715766020202020266282925265601673F03696C6F6F7070705766
                      0202020202662D2B27285501525B03696A6A6A6A6B6B5766020202020266342F
                      302D2B4F284603696A6A6A6A6A6A576602020202026639393233342F305C0369
                      6A6A6A6A6A6A57660202020202663B3C37383932335D03696A6A6A6A6A6A5766
                      020202020266443D3E3B3C37384903696A6A6A6A6A6A57660202020202664242
                      4344443D3E5F03696A6A6A6A6A6A576602020202026642424242424343610369
                      6A6A6A6A6A6A5766020202020266454242424242426003696A6A6A6A6A6A5766
                      020202020266664B48424242426003696A6A6A6A6A6A57660202020202020266
                      664D4A474260035E666666666666666602020202020202020202666665640302
                      0202020202020202020202020202020202020202026603020202020202020202
                      0202}
                  end
                  object BitBtn20: TBitBtn
                    Left = 203
                    Top = 2
                    Width = 129
                    Height = 29
                    Hint = 'Detalhes do Lote - [CTP012]'
                    Caption = '&Detalhes do Lote'
                    TabOrder = 1
                    OnClick = BitBtn20Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000010000CE630000CE63
                      6300FF9C9C00FFD6A500FFD6AD00FFDEB500FFE7C600FFEFD600FFF7E700FFFF
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
                      0A0A0A0A0A0A0A0A0A0A0A0000000000000000000000000000000A000B0B0908
                      070605040404040404000A000B010109010106010104010104000A000B0B0B0B
                      090807060504040404000A000B01010B020208020205020204000A000B0B0B0B
                      0B0B09080706050404000A000B01010B02020B020208020204000A000B0B0B0B
                      0B0B0B0B0908070305000A000B01010B02020B02020B020206000A000B0B0B0B
                      0B0B0B0B0B0B090807000A000B0B0B0B0B0B0B0B0B0B0B0908000A0000000000
                      000000000000000000000A0A000000000000000000000000000A0A0A0A0A0A0A
                      0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
                  end
                  object BitBtn40: TBitBtn
                    Left = 109
                    Top = 2
                    Width = 87
                    Height = 29
                    Hint = 'Visualizar imagens do lote -  [CTP037]'
                    Caption = '&Imagens'
                    TabOrder = 3
                    OnClick = BitBtn40Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000120B0000120B00000001000000000000000000000000
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
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                      FDFDFDFDFDFDFDFDFDFDFD8888888888888888888888888888FDFD88F3EAEAEA
                      E9E9E9E0E0E0E0E088FDFD8809F3EBEAEAEAE9E9E1E0E0E088FDFD8809F3F3EB
                      EAEAEAE9E9E0E0E088FDFD88090909F3F3EBEAEAE9E9E9E088FDFD88090909F3
                      F3EBEBEAEAE9E9E188FDFD886F6FAEF509F3F3EBEAEAEAE988FDFD8837373737
                      3776B5F4EBEBEAE988FDFD8837373737373737373737377588FDFD8837373737
                      373737373737373788FDFD889B9B9B9B9B9B9BA4AC9B9B9B88FDFD88A49B9B9B
                      9B9BA40909ECA4A388FDFD8809090909090909090909090988FDFD8888888888
                      888888888888888888FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                  end
                end
                object Panel15: TPanel
                  Left = 0
                  Top = 0
                  Width = 490
                  Height = 263
                  Align = alClient
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object DBGrid3: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 486
                    Height = 259
                    Align = alClient
                    DataSource = dtmContasAPagar.dsLoteLanc
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'N_LOTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_LOTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_EMP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SELEC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMP_MULT'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
              end
            end
            object tsDetalhesPagamento: TTabSheet
              Caption = 'tsDetalhesPagamento'
              ImageIndex = 6
              object pnDetalhesPagamento: TPanel
                Left = 0
                Top = 0
                Width = 868
                Height = 489
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Panel25: TPanel
                  Left = 0
                  Top = 458
                  Width = 868
                  Height = 31
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn19: TBitBtn
                    Left = 20
                    Top = 1
                    Width = 149
                    Height = 25
                    Hint = 'Estornar Pagamento - [CTP019]'
                    Caption = 'Estornar Pagamento'
                    TabOrder = 0
                    OnClick = BitBtn19Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D7E1E2D8321FF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FF2A70152D801F2F8F2830972E2E8B272D821FFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FF28660E2B781A2E8A25308E282F8E262F972D2F97
                      2E2F922A2E8E27FF00FFFF00FFFF00FFFF00FFFF00FF286811286B0F2862082D
                      811E2F8F282F932C2D9D3F2E9C372F9A302F9932309930256611FF00FFFF00FF
                      28650F2A72162D89262C7A1929680B2F8C282DA4442CAF582CB15D2CAC542D93
                      312F9129309F35297518255E0C2C791A2D84202F90292F902A2B70132B6F0A2F
                      921E2D992E2DA5462DB25C2DAA4E296E132B771B2FA7412A781B2355072A7418
                      3091282E8B262E9C362D7F0D2F7F032F80032F7B012F80062E93232CB1582DA7
                      4B2C902E2B8728286B12245A0A2D7F1D2F98302DA6492CB15B2E96222E7B022F
                      7F032F81032F80032F7F022EA03B2C983D276A11245807FF00FF255D0A2D9736
                      2CB55E2BAF592CAD572DAD542D972A2F870F2F83092F83072B7005286A0F286A
                      12FF00FFFF00FFFF00FFFF00FF286C162D993A0000662CB15B2CAD562CB4602C
                      B0582D9C392C7316286A12FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      0000660000662DA1452DB55D2CA54B2B8A2D286A12FF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000660000FF
                      0000FF0000FF0000FF0000FF000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      000066000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000066FF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                  object BitBtn24: TBitBtn
                    Left = 654
                    Top = 1
                    Width = 75
                    Height = 25
                    Hint = 'Voltar'
                    Caption = '&Voltar'
                    TabOrder = 2
                    OnClick = BitBtn24Click
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
                  object BitBtn35: TBitBtn
                    Left = 175
                    Top = 1
                    Width = 149
                    Height = 25
                    Hint = 'Visualizar Contrapartida'
                    Caption = 'Visualizar Contrapartida'
                    TabOrder = 1
                    OnClick = BitBtn35Click
                    Glyph.Data = {
                      36030000424D3603000000000000360000002800000010000000100000000100
                      18000000000000030000C30E0000C30E00000000000000000000FF00FF606060
                      2D2D2D2626262626262626262626262626262626262626262626262626262626
                      265B5B5BFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                      FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                      FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                      FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                      FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                      FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                      FF262626FF00FFFF00FFFF00FF262626FFFFFFC99167FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFC99167FFFFFF262626FF00FFFF00FFFF00FF262626
                      FFFFFFC99167C99167C99167C99167C99167C99167C99167C99167C99167FFFF
                      FF262626FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF262626FF00FFFF00FFFF00FF262626
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FF2D2D2DFF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF2626262626262626262D2D2DFF00FFFF00FFFF00FF262626
                      FFFFFF818181FFFFFF4E4E4E8B8B8B9F9F9FFFFFFFFFFFFF262626FFFFFFFFFF
                      FF434343FF00FFFF00FFFF00FF262626FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF262626C8C8C8434343FF00FFFF00FFFF00FFFF00FF2D2D2D
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2D434343FF00
                      FFFF00FFFF00FFFF00FFFF00FF6060602D2D2D26262626262626262626262626
                      2626262626262626262626FF00FFFF00FFFF00FFFF00FFFF00FF}
                  end
                end
                object Panel17: TPanel
                  Left = 0
                  Top = 0
                  Width = 868
                  Height = 17
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Lan'#231'amentos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                  object pnLanc: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 13
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnLanc'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel22: TPanel
                  Left = 0
                  Top = 47
                  Width = 868
                  Height = 17
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Cheques'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 2
                  object pnCh: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 13
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCh'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel52: TPanel
                  Left = 0
                  Top = 94
                  Width = 868
                  Height = 17
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Cr'#233'ditos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 3
                  object pnCr: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 13
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCr'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel24: TPanel
                  Left = 0
                  Top = 188
                  Width = 868
                  Height = 17
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Renegociados'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 4
                  object pnLancCTP: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 13
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnLancCTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel73: TPanel
                  Left = 0
                  Top = 141
                  Width = 868
                  Height = 17
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Contas Pagas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 5
                  object pnCTP: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 13
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel21: TPanel
                  Left = 0
                  Top = 17
                  Width = 868
                  Height = 30
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 6
                  object gridLancamento: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 26
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel44: TPanel
                  Left = 0
                  Top = 64
                  Width = 868
                  Height = 30
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 7
                  object gridCheques: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 26
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel72: TPanel
                  Left = 0
                  Top = 111
                  Width = 868
                  Height = 30
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 8
                  object gridCreditos: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 26
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel23: TPanel
                  Left = 0
                  Top = 205
                  Width = 868
                  Height = 30
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 9
                  object gridLancCTP: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 26
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel74: TPanel
                  Left = 0
                  Top = 158
                  Width = 868
                  Height = 30
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 10
                  object gridCTP: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 26
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
            end
            object tsDetalhesContrapartida: TTabSheet
              Caption = 'tsDetalhesContrapartida'
              ImageIndex = 10
              object pnDetalhesPagamentoContrapartida: TPanel
                Left = 0
                Top = 0
                Width = 868
                Height = 489
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Panel53: TPanel
                  Left = 0
                  Top = 0
                  Width = 868
                  Height = 23
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Lan'#231'amentos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 1
                  object pnLancContrapartida: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 19
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnLanc'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel55: TPanel
                  Left = 0
                  Top = 23
                  Width = 868
                  Height = 106
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object gridLancamentoContrapartida: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 102
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel58: TPanel
                  Left = 0
                  Top = 129
                  Width = 868
                  Height = 23
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Cheques'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 3
                  object pnChContrapartida: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 19
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCh'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel60: TPanel
                  Left = 0
                  Top = 410
                  Width = 868
                  Height = 106
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 6
                  object gridCTPContrapartida: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 102
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel61: TPanel
                  Left = 0
                  Top = 387
                  Width = 868
                  Height = 23
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Contas Pagas'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 5
                  object pnCTPContrapartida: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 19
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCTP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel63: TPanel
                  Left = 0
                  Top = 152
                  Width = 868
                  Height = 106
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object gridChequesContrapartida: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 102
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
                object Panel64: TPanel
                  Left = 0
                  Top = 448
                  Width = 868
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object btnVoltarContrapartida: TBitBtn
                    Left = 654
                    Top = 6
                    Width = 75
                    Height = 25
                    Hint = 'Voltar'
                    Caption = '&Voltar'
                    TabOrder = 0
                    OnClick = btnVoltarContrapartidaClick
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
                object Panel65: TPanel
                  Left = 0
                  Top = 258
                  Width = 868
                  Height = 23
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  Caption = 'Cr'#233'ditos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  TabOrder = 7
                  object pnCrContrapartida: TPanel
                    Left = 679
                    Top = 0
                    Width = 185
                    Height = 19
                    Align = alRight
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'pnCr'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -12
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel67: TPanel
                  Left = 0
                  Top = 281
                  Width = 868
                  Height = 106
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 8
                  object gridCreditosContrapartida: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 864
                    Height = 102
                    Align = alClient
                    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                  end
                end
              end
            end
            object tsLancDiferenca: TTabSheet
              Caption = 'tsLancDiferenca'
              ImageIndex = 7
              object pnLancDiferenca: TPanel
                Left = 0
                Top = 3
                Width = 585
                Height = 164
                TabOrder = 0
                object Label38: TLabel
                  Left = 20
                  Top = 13
                  Width = 89
                  Height = 13
                  Caption = 'Conta de Entrada:'
                end
                object Label39: TLabel
                  Left = 64
                  Top = 40
                  Width = 45
                  Height = 13
                  Caption = 'Hist'#243'rico:'
                end
                object Label40: TLabel
                  Left = 64
                  Top = 70
                  Width = 45
                  Height = 13
                  Caption = 'Controle:'
                end
                object Label44: TLabel
                  Left = 17
                  Top = 98
                  Width = 92
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Valor da Diferen'#231'a:'
                  FocusControl = DBEdit20
                end
                object BitBtn18: TBitBtn
                  Left = 214
                  Top = 127
                  Width = 75
                  Height = 25
                  Hint = 'OK'
                  Caption = '&OK'
                  Default = True
                  TabOrder = 6
                  OnClick = BitBtn18Click
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                end
                object BitBtn21: TBitBtn
                  Left = 295
                  Top = 127
                  Width = 75
                  Height = 25
                  Hint = 'Cancelar - [CTP035]'
                  Cancel = True
                  Caption = 'Cancelar'
                  TabOrder = 7
                  OnClick = BitBtn21Click
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    333333333333333333333333000033338833333333333333333F333333333333
                    0000333911833333983333333388F333333F3333000033391118333911833333
                    38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                    911118111118333338F3338F833338F3000033333911111111833333338F3338
                    3333F8330000333333911111183333333338F333333F83330000333333311111
                    8333333333338F3333383333000033333339111183333333333338F333833333
                    00003333339111118333333333333833338F3333000033333911181118333333
                    33338333338F333300003333911183911183333333383338F338F33300003333
                    9118333911183333338F33838F338F33000033333913333391113333338FF833
                    38F338F300003333333333333919333333388333338FFF830000333333333333
                    3333333333333333333888330000333333333333333333333333333333333333
                    0000}
                  NumGlyphs = 2
                end
                object DBEdit17: TDBEdit
                  Left = 111
                  Top = 11
                  Width = 73
                  Height = 21
                  Hint = 'Numero da conta do Plano de Contas'
                  DataField = 'N_CONTA_PLC'
                  TabOrder = 0
                  OnExit = DBEdit17Exit
                end
                object DBLookupComboBoxPContas: TDBLookupComboBox
                  Left = 188
                  Top = 11
                  Width = 380
                  Height = 21
                  Hint = 'Nome da Conta do Plano de Contas'
                  DataField = 'N_CONTA_PLC'
                  KeyField = 'N_CONTA_PLC'
                  ListField = 'DESC_PLC;N_CONTA_PLC'
                  ListSource = dtmContasAPagar.dsPContas
                  TabOrder = 1
                  OnExit = DBLookupComboBoxPContasExit
                end
                object DBEdit19: TDBEdit
                  Left = 111
                  Top = 38
                  Width = 457
                  Height = 21
                  Hint = 'Hist'#243'rico do Lan'#231'amento'
                  CharCase = ecUpperCase
                  DataField = 'HISTORICO_L'
                  TabOrder = 2
                end
                object DBEdit20: TDBEdit
                  Left = 111
                  Top = 95
                  Width = 134
                  Height = 21
                  Hint = 'Valor do lan'#231'amento'
                  DataField = 'VALOR_L'
                  Enabled = False
                  TabOrder = 5
                end
                object DBEdit18: TDBEdit
                  Left = 495
                  Top = 66
                  Width = 73
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CODIGO_CTRL'
                  Enabled = False
                  TabOrder = 4
                end
                object DBLookupComboBoxControle: TDBLookupComboBox
                  Left = 111
                  Top = 66
                  Width = 378
                  Height = 21
                  DataField = 'CODIGO_CTRL'
                  KeyField = 'CODIGO_CTRL'
                  ListField = 'NOME_CTRL;CODIGO_CTRL'
                  ListSource = dtmContasAPagar.dsControles
                  TabOrder = 3
                end
              end
            end
            object tsObs: TTabSheet
              Caption = 'tsObs'
              ImageIndex = 8
              object pnObs: TPanel
                Left = 3
                Top = 6
                Width = 790
                Height = 323
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBox9: TGroupBox
                  Left = 16
                  Top = 5
                  Width = 753
                  Height = 273
                  Caption = 'Observa'#231#245'es da Conta'
                  TabOrder = 0
                  object DBMemo1: TDBMemo
                    Left = 16
                    Top = 192
                    Width = 640
                    Height = 73
                    DataField = 'OBSERVACAO'
                    DataSource = dtmContasAPagar.dsObsCred
                    TabOrder = 1
                  end
                  object BitBtn49: TBitBtn
                    Left = 662
                    Top = 192
                    Width = 75
                    Height = 25
                    Caption = 'Salvar'
                    TabOrder = 2
                    OnClick = BitBtn49Click
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
                  object BitBtn48: TBitBtn
                    Left = 662
                    Top = 216
                    Width = 75
                    Height = 25
                    Caption = 'Cancelar'
                    TabOrder = 3
                    OnClick = BitBtn48Click
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
                  object BitBtn45: TBitBtn
                    Left = 662
                    Top = 240
                    Width = 75
                    Height = 25
                    Caption = 'Novo'
                    TabOrder = 4
                    OnClick = BitBtn45Click
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000010000B5847300AD73
                      8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                      D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                      1111111111111111111111111101020202020202020202020211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      1313131313131313021111111101131313131313131313130211111111011313
                      13131313131313130211111112121210101010101010101002111111120D120C
                      0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                      120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                      0808080806000211111111111212120707070707050011111111}
                  end
                  object DBGrid9: TDBGrid
                    Left = 16
                    Top = 21
                    Width = 721
                    Height = 165
                    DataSource = dtmContasAPagar.dsObsCred
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COD_OBS'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMPRESA'
                        Visible = False
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_OBS'
                        Width = 73
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HORA_OBS'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_VENDEDOR'
                        Width = 105
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBSERVACAO'
                        Width = 440
                        Visible = True
                      end>
                  end
                end
                object BitBtn47: TBitBtn
                  Left = 678
                  Top = 284
                  Width = 75
                  Height = 25
                  Caption = 'Voltar'
                  TabOrder = 1
                  OnClick = BitBtn47Click
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
            object tsImpressaCopia: TTabSheet
              Caption = 'tsImpressaCopia'
              ImageIndex = 9
              object pnImpressaoCopias: TPanel
                Left = 64
                Top = 16
                Width = 489
                Height = 321
                TabOrder = 0
              end
            end
          end
        end
        object tsPagando: TTabSheet
          Caption = 'tsPagando'
          ImageIndex = 4
          object pgPagando: TPageControl
            Left = 0
            Top = 0
            Width = 876
            Height = 520
            ActivePage = tsPagar
            Align = alClient
            Style = tsFlatButtons
            TabOrder = 0
            object tsPagar: TTabSheet
              Caption = 'tsPagar'
              object pnPagar: TPanel
                Left = 0
                Top = 0
                Width = 868
                Height = 489
                Align = alClient
                BevelKind = bkTile
                TabOrder = 0
                object Panel38: TPanel
                  Left = 1
                  Top = 1
                  Width = 862
                  Height = 48
                  Align = alTop
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label65: TLabel
                    Left = 16
                    Top = 4
                    Width = 113
                    Height = 14
                    Caption = 'Conta de Sa'#237'da Padr'#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object Label66: TLabel
                    Left = 402
                    Top = 4
                    Width = 83
                    Height = 14
                    Caption = 'Hist'#243'rico Padr'#227'o'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    ParentFont = False
                  end
                  object Edit1: TEdit
                    Left = 391
                    Top = 19
                    Width = 378
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDIT1'
                    OnExit = Edit1Exit
                    OnKeyDown = DBGrid5KeyDown
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 65
                    Top = 19
                    Width = 307
                    Height = 21
                    BiDiMode = bdLeftToRight
                    ParentBiDiMode = False
                    TabOrder = 0
                    OnExit = DBLookupComboBox2Exit
                    OnKeyDown = DBGrid5KeyDown
                  end
                  object DBEdit21: TDBEdit
                    Left = 11
                    Top = 19
                    Width = 51
                    Height = 21
                    Enabled = False
                    TabOrder = 2
                  end
                end
                object Panel37: TPanel
                  Left = 1
                  Top = 373
                  Width = 862
                  Height = 29
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label55: TLabel
                    Left = 79
                    Top = 6
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Dinheiro:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label56: TLabel
                    Left = 338
                    Top = 6
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cheque:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label57: TLabel
                    Left = 529
                    Top = 6
                    Width = 100
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Demais Controles:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbDinheiro: TLabel
                    Left = 138
                    Top = 6
                    Width = 59
                    Height = 13
                    Caption = 'lbDinheiro'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbCheque: TLabel
                    Left = 389
                    Top = 6
                    Width = 52
                    Height = 13
                    Caption = 'lbCheque'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbCreditos: TLabel
                    Left = 635
                    Top = 6
                    Width = 57
                    Height = 13
                    Caption = 'lbCreditos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                end
                object Panel36: TPanel
                  Left = 1
                  Top = 402
                  Width = 862
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 3
                  object Label81: TLabel
                    Left = 14
                    Top = 11
                    Width = 95
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor a Atingir:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbAtingir: TLabel
                    Left = 115
                    Top = 11
                    Width = 55
                    Height = 16
                    Caption = 'lbAtingir'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label83: TLabel
                    Left = 287
                    Top = 11
                    Width = 104
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor a Informar:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbInformar: TLabel
                    Left = 397
                    Top = 11
                    Width = 64
                    Height = 16
                    Caption = 'lbInformar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label85: TLabel
                    Left = 565
                    Top = 11
                    Width = 95
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor Atingido:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbAtingido: TLabel
                    Left = 666
                    Top = 11
                    Width = 66
                    Height = 16
                    Caption = 'lbAtingido'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                end
                object Panel39: TPanel
                  Left = 1
                  Top = 443
                  Width = 862
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 4
                  object lbPrevistoDesc: TLabel
                    Left = 20
                    Top = 11
                    Width = 90
                    Height = 16
                    Alignment = taRightJustify
                    Caption = 'Valor Previsto:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbPrevisto: TLabel
                    Left = 116
                    Top = 11
                    Width = 61
                    Height = 16
                    Caption = 'lbPrevisto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -13
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object BitBtn14: TBitBtn
                    Left = 266
                    Top = 6
                    Width = 130
                    Height = 25
                    Caption = 'Confirmar - [ F11 ]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 0
                    OnClick = BitBtn14Click
                    OnKeyDown = DBGrid5KeyDown
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
                  object BitBtn15: TBitBtn
                    Left = 402
                    Top = 6
                    Width = 130
                    Height = 25
                    Hint = 'Cancelar quita'#231#227'o - [CTP019]'
                    Caption = 'Cancelar - [ Esc ]'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    TabOrder = 1
                    OnClick = BitBtn15Click
                    OnKeyDown = DBGrid5KeyDown
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
                object Panel18: TPanel
                  Left = 1
                  Top = 49
                  Width = 862
                  Height = 324
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = 'Panel18'
                  TabOrder = 1
                  object Splitter3: TSplitter
                    Left = 255
                    Top = 0
                    Width = 5
                    Height = 324
                    ExplicitLeft = 241
                    ExplicitHeight = 320
                  end
                  object Panel19: TPanel
                    Left = 0
                    Top = 0
                    Width = 255
                    Height = 324
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Panel20: TPanel
                      Left = 0
                      Top = 0
                      Width = 251
                      Height = 22
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      Caption = 'Controles - [ F2 ]'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBGrid5: TDBGrid
                      Left = 0
                      Top = 22
                      Width = 251
                      Height = 281
                      Align = alClient
                      DataSource = dtmContasAPagar.dsControles
                      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                      ReadOnly = True
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnDblClick = DBGrid5DblClick
                      OnKeyDown = DBGrid5KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'CODIGO_CTRL'
                          Title.Caption = 'C'#243'digo'
                          Width = 39
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NOME_CTRL'
                          Title.Caption = 'Controle'
                          Width = 99
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SALDO_CTRL'
                          Title.Caption = 'Saldo'
                          Width = 86
                          Visible = True
                        end>
                    end
                    object Panel50: TPanel
                      Left = 0
                      Top = 303
                      Width = 251
                      Height = 17
                      Align = alBottom
                      BevelOuter = bvNone
                      TabOrder = 2
                      object CheckBox2: TCheckBox
                        Left = 32
                        Top = 0
                        Width = 156
                        Height = 17
                        Alignment = taLeftJustify
                        BiDiMode = bdLeftToRight
                        Caption = 'Usar "Valor a Atingir" [ F6 ]'
                        Checked = True
                        ParentBiDiMode = False
                        State = cbChecked
                        TabOrder = 0
                      end
                    end
                  end
                  object Panel33: TPanel
                    Left = 260
                    Top = 0
                    Width = 602
                    Height = 324
                    Align = alClient
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Panel34: TPanel
                      Left = 0
                      Top = 0
                      Width = 598
                      Height = 22
                      Align = alTop
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      Caption = 'Lan'#231'amentos Efetuados'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'Arial'
                      Font.Style = [fsBold, fsItalic]
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBGrid6: TDBGrid
                      Left = 0
                      Top = 22
                      Width = 598
                      Height = 257
                      Align = alClient
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                      TabOrder = 1
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      OnKeyDown = DBGrid5KeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'NOME_CTRL'
                          Title.Caption = 'Controle'
                          Width = 125
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'N_CONTA_PLC'
                          Title.Caption = 'Num Conta'
                          Width = 94
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'VALOR_L'
                          Title.Caption = 'Valor'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'HISTORICO_L'
                          Title.Caption = 'Hist'#243'rico Lan'#231'amento'
                          Width = 110
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'COD_LANC'
                          Title.Caption = 'Cod. Lanc'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'TIPO_L'
                          Title.Caption = 'Tipo'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'NDOC_L'
                          Title.Caption = 'Num. Documento'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'N_CHEQ_L'
                          Title.Caption = 'Num. Cheque'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_CTRL'
                          Title.Caption = 'Cod.Controle'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'CODIGO_CH'
                          Title.Caption = 'Cod. Cheque'
                          Visible = True
                        end>
                    end
                    object Panel35: TPanel
                      Left = 0
                      Top = 279
                      Width = 598
                      Height = 41
                      Align = alBottom
                      BevelKind = bkTile
                      BevelOuter = bvNone
                      TabOrder = 2
                      object SpeedButton13: TSpeedButton
                        Left = 141
                        Top = 7
                        Width = 110
                        Height = 23
                        Hint = 'Alterar lan'#231'amento selecionado - [CTP015]'
                        Caption = 'Alterar - [ F3 ]'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Arial'
                        Font.Style = [fsItalic]
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000320B0000320B0000000100000001000000000000CE63
                          00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                          A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                          C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                          1818181818181818181818010101010101010101010101010101180119191716
                          1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                          17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                          1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                          191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                          19191919091505020C0118011919191919191919190700140001180101010101
                          0101010101041414030118180101010101010101010108080618181818181818
                          1818181818181818181818181818181818181818181818181818}
                        ParentFont = False
                        OnClick = SpeedButton13Click
                      end
                      object SpeedButton14: TSpeedButton
                        Left = 257
                        Top = 7
                        Width = 110
                        Height = 23
                        Hint = 'Apagar o lan'#231'amento selecionado - [CTP016]'
                        Caption = 'Excluir - [ F4 ]'
                        Flat = True
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Arial'
                        Font.Style = [fsItalic]
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
                        ParentFont = False
                        OnClick = SpeedButton14Click
                      end
                    end
                  end
                end
              end
            end
            object tsLancN_S2: TTabSheet
              Caption = 'tsLancN_S2'
              ImageIndex = 1
              object pnPagLancN_S2: TPanel
                Left = 0
                Top = 3
                Width = 633
                Height = 230
                BevelOuter = bvNone
                TabOrder = 0
                object Panel41: TPanel
                  Left = 0
                  Top = 189
                  Width = 633
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn16: TBitBtn
                    Left = 237
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn16Click
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
                  object BitBtn29: TBitBtn
                    Left = 318
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 633
                  Height = 189
                  Align = alClient
                  TabOrder = 0
                  object Label82: TLabel
                    Left = 65
                    Top = 21
                    Width = 59
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#186' da Conta'
                    FocusControl = DBEdit22
                  end
                  object Label90: TLabel
                    Left = 55
                    Top = 48
                    Width = 69
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#186' Documento'
                    FocusControl = DBEdit53
                  end
                  object Label91: TLabel
                    Left = 83
                    Top = 75
                    Width = 41
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hist'#243'rico'
                    FocusControl = DBEdit54
                  end
                  object Label92: TLabel
                    Left = 100
                    Top = 102
                    Width = 24
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor'
                    FocusControl = DBEdit55
                  end
                  object Label48: TLabel
                    Left = 72
                    Top = 138
                    Width = 52
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'N'#186' Cheque'
                    FocusControl = DBEdit25
                  end
                  object Label53: TLabel
                    Left = 78
                    Top = 165
                    Width = 46
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Nominal a'
                    FocusControl = DBEdit25
                  end
                  object Label58: TLabel
                    Left = 395
                    Top = 138
                    Width = 89
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data Venc Cheque'
                    FocusControl = DBEdit25
                  end
                  object SpeedButton59: TSpeedButton
                    Left = 567
                    Top = 134
                    Width = 22
                    Height = 22
                    Hint = 'Limpar data'
                    Glyph.Data = {
                      36050000424D3605000000000000360400002800000010000000100000000100
                      08000000000000010000420B0000420B00000001000000000000000000000084
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
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00414141414141
                      4141414141414141414141414141414141414141414141414141414100000000
                      0000004141414141414141002E2E2E2E2E2E000041414141414141002E2E2E2E
                      2E2E002D00414141414141002E2E2E2E2E2E002D2D0041414141414100444244
                      424442002D2D0041414141414100444244424442002D2D004141414141410044
                      4244424442002D2D0041414141414100444244424442002D0041414141414141
                      0044424442444200004141414141414141004442444244420041414141414141
                      4141000000000000414141414141414141414141414141414141414141414141
                      4141414141414141414141414141414141414141414141414141}
                    OnClick = SpeedButton59Click
                  end
                  object DBEdit22: TDBEdit
                    Left = 130
                    Top = 18
                    Width = 73
                    Height = 21
                    Hint = 'Numero da conta do Plano de Contas'
                    DataField = 'N_CONTA_PLC'
                    TabOrder = 0
                    OnExit = DBEdit22Exit
                  end
                  object DBLookupComboBox8: TDBLookupComboBox
                    Left = 209
                    Top = 18
                    Width = 380
                    Height = 21
                    Hint = 'Nome da Conta do Plano de Contas'
                    DataField = 'N_CONTA_PLC'
                    KeyField = 'N_CONTA_PLC'
                    ListField = 'DESC_PLC;N_CONTA_PLC'
                    ListSource = dtmContasAPagar.dsPContas
                    TabOrder = 1
                    OnExit = DBLookupComboBox8Exit
                  end
                  object DBEdit53: TDBEdit
                    Left = 130
                    Top = 45
                    Width = 134
                    Height = 21
                    Hint = 'Numero do documento'
                    CharCase = ecUpperCase
                    DataField = 'NDOC_L'
                    MaxLength = 10
                    TabOrder = 2
                  end
                  object DBEdit54: TDBEdit
                    Left = 130
                    Top = 72
                    Width = 459
                    Height = 21
                    Hint = 'Hist'#243'rico do Lan'#231'amento'
                    CharCase = ecUpperCase
                    DataField = 'HISTORICO_L'
                    TabOrder = 3
                  end
                  object DBEdit55: TDBEdit
                    Left = 130
                    Top = 99
                    Width = 134
                    Height = 21
                    Hint = 'Valor do lan'#231'amento'
                    DataField = 'VALOR_L'
                    TabOrder = 4
                  end
                  object DBEdit12: TDBEdit
                    Left = 130
                    Top = 162
                    Width = 459
                    Height = 21
                    Hint = 'Nominal'
                    CharCase = ecUpperCase
                    DataField = 'NOMINAL_L'
                    TabOrder = 7
                  end
                  object DBEdit25: TDBEdit
                    Left = 130
                    Top = 135
                    Width = 134
                    Height = 21
                    Hint = 'Numero do cheque'
                    CharCase = ecUpperCase
                    DataField = 'N_CHEQ_L'
                    MaxLength = 10
                    TabOrder = 5
                  end
                  object DBEdit26: TDBEdit
                    Left = 490
                    Top = 135
                    Width = 71
                    Height = 21
                    Hint = 'Data de vencimento do cheque'
                    CharCase = ecUpperCase
                    Ctl3D = True
                    DataField = 'DATA_VENC_CHEQ_L'
                    MaxLength = 10
                    ParentCtl3D = False
                    TabOrder = 6
                  end
                end
              end
            end
            object tsLancS1: TTabSheet
              Caption = 'tsLancS1'
              ImageIndex = 2
              object pnPagLancS1: TPanel
                Left = 0
                Top = 3
                Width = 817
                Height = 457
                BevelOuter = bvNone
                TabOrder = 0
                object Panel12: TPanel
                  Left = 0
                  Top = 416
                  Width = 817
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn11: TBitBtn
                    Left = 328
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn11Click
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
                  object BitBtn12: TBitBtn
                    Left = 409
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 817
                  Height = 312
                  Align = alClient
                  TabOrder = 0
                  object DBGrid2: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 813
                    Height = 295
                    Align = alClient
                    DataSource = dtmContasAPagar.dsControleCH
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = DBGrid2CellClick
                    OnDrawColumnCell = DBGrid2DrawColumnCell
                    OnKeyDown = DBGrid2KeyDown
                    OnMouseUp = DBGrid2MouseUp
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SEL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMP_MULT'
                        Title.Caption = 'Cod Unificada'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_CORR'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_DESC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_CH'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CH'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CONTA_PLC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RAZAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CLIENTE'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_REC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTORICO_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATQ_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NATL_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CLI'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBS_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TP_DOC_V'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_DOC_V'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENDA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'AGENCIA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CONTA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'BANCO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CLI_TERC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_TERC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIP_CNT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_VEND'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIP_BAIXA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_REM_REC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_TERM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE_QUIT'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE_ENT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CPFCGC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DT_BAIXA_COMISSAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_BAIXA_COMISSAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DTORIGINAL_CH'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ID_BANCO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_EMP'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SELEC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CXL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CXL_RQ'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CX'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CX'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 312
                  Width = 817
                  Height = 104
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label34: TLabel
                    Left = 6
                    Top = 78
                    Width = 180
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Total dos Cheques Selecionados:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbChequesSel: TLabel
                    Left = 192
                    Top = 78
                    Width = 74
                    Height = 13
                    Caption = 'lbChequesSel'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label35: TLabel
                    Left = 6
                    Top = 36
                    Width = 127
                    Height = 13
                    Caption = 'Informe o valor do cheque'
                  end
                  object RadioGroup1: TRadioGroup
                    Left = 6
                    Top = -5
                    Width = 480
                    Height = 35
                    Columns = 2
                    ItemIndex = 0
                    Items.Strings = (
                      'Pesquisar Cheque por valor'
                      'Pesquisar Cheque por Nome do Cliente')
                    TabOrder = 0
                    OnClick = RadioGroup1Click
                  end
                  object Edit2: TEdit
                    Left = 5
                    Top = 50
                    Width = 280
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDIT2'
                    Visible = False
                    OnChange = Edit2Change
                  end
                  object GroupBox5: TGroupBox
                    Left = 492
                    Top = -2
                    Width = 313
                    Height = 100
                    Caption = 'Pesquisar Cheque por per'#237'odo'
                    TabOrder = 2
                    object Label36: TLabel
                      Left = 19
                      Top = 25
                      Width = 43
                      Height = 13
                      Caption = 'Da Data:'
                    end
                    object Label37: TLabel
                      Left = 152
                      Top = 25
                      Width = 6
                      Height = 13
                      Caption = 'a'
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 41
                      Top = 50
                      Width = 110
                      Height = 35
                      Hint = 'Filtrar cheques por per'#237'odo - [CTP017]'
                      Caption = 'Filtrar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      Glyph.Data = {
                        C2030000424DC203000000000000820100002800000018000000180000000100
                        08000000000040020000120B0000120B0000530000005300000000000000FFFF
                        FF00FF00FF00A4262600B02D2D00B12F2F00B6393900B63A3A00B83F3F00BA42
                        4200BC484800BD4B4B00BF4D4D00BF4E4E00C0505000C0515100C1535300C154
                        5400C2565600C4595900C45A5A00C6606000C7636300C9666600CC6F6F00CC70
                        7000CE747400CF777700D17E7E00D3808000D4848400D5888800D78B8B00004B
                        0000035E06000464080007931000089611000896120009971300099714000996
                        12000996130007740E000A9915000B991600097411000C9A18000D9E1B000FA0
                        1D000FA11F000C77170010951F000E7D1A00119620000F811C00118C1F001398
                        23001197220014A727001399250013902400159A2700138F2300169D2900169C
                        2800159127001AAF31001BB033001B9F310021B83D001C9C340020AA3B0023AD
                        410028C1490028C048002FC954002EC1520035CF5E0036D060003BD768003FD9
                        6F0041DC70000202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020221
                        0202020202020202020202020202020202020202020221382102020202020202
                        02020202020202020202020202213F2441210202020202020202020202020202
                        020202022142312D253E21020202020202020202020202020202022137433B32
                        2F263C21020202020202020202020202020221354B46443D2140273921020202
                        02020202020202020221334E4C4A4521022130283A2102020202020202020202
                        022151504F4821030202212E2C36210202020202020202020221475249210A11
                        03020202212D342102020202020202020203214D21100C0A0F03020202212F29
                        210202020202020203091821150D03120A0F0302020221232A21020202020203
                        081C1B19140302030E0A0E0302020202212B2102020202031F1E1D1603020202
                        03070B0D03020202022122210202020313201703020202020202030B0D030202
                        0202022121020202031A030202020202020202030C0A03020202020202210202
                        02030202020202020202020203050A0302020202020202020202020202020202
                        0202020202020306030202020202020202020202020202020202020202020203
                        0403020202020202020202020202020202020202020202020203030202020202
                        0202020202020202020202020202020202020203020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        020202020202}
                      ParentFont = False
                      OnClick = SpeedButton15Click
                    end
                    object SpeedButton16: TSpeedButton
                      Left = 160
                      Top = 49
                      Width = 110
                      Height = 35
                      Hint = 'Retirar Filtro - [CTP018]'
                      Caption = 'Retirar Filtro'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      Glyph.Data = {
                        5E030000424D5E030000000000001E0100002800000018000000180000000100
                        08000000000040020000120B0000120B00003A0000003A00000000000000FFFF
                        FF00FF00FF00D1D1D100CFCFCF00CCCCCC00C7C7C700C6C6C600C1C1C100C0C0
                        C000BFBFBF00BDBDBD00BABABA00B9B9B900B8B8B800B5B5B500B3B3B300B1B1
                        B100B0B0B000AEAEAE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A3A3
                        A300A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A
                        9A00999999009898980097979700969696009595950094949400939393009292
                        920091919100909090008F8F8F008E8E8E008D8D8D008C8C8C008B8B8B008787
                        8700858585008383830082828200818181007A7A7A0076767600727272006565
                        6500020202020202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202023902020202
                        0202020202020202020202020202020202023927390202020202020202020202
                        02020202020202020239252C1D39020202020202020202020202020202020202
                        392220262A1E3902020202020202020202020202020202392D161A1F252A2039
                        020202020202020202020202020239300E111524391C29213902020202020202
                        0202020202393107090D19390239222922390202020202020202020202390405
                        061439360202393427233902020202020202020202391A031339241C36020202
                        3926243902020202020202020236390B391D21241E3602020239252A39020202
                        02020202362812391820361B241E3602020239372A390202020202362B0D0F11
                        193602361F241F360202020239353902020202360A0B0C1736020202362E2220
                        3602020202393839020202361A08153602020202020236222036020202020239
                        3902020236103602020202020202023621243602020202020239020202360202
                        0202020202020202363224360202020202020202020202020202020202020202
                        0202362F36020202020202020202020202020202020202020202023633360202
                        0202020202020202020202020202020202020202023636020202020202020202
                        0202020202020202020202020202023602020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        0202}
                      ParentFont = False
                      OnClick = SpeedButton16Click
                    end
                    object MaskEdit5: TMaskEdit
                      Left = 68
                      Top = 22
                      Width = 68
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 0
                      Text = '  /  /    '
                    end
                    object maskedit6: TMaskEdit
                      Left = 180
                      Top = 22
                      Width = 69
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 1
                      Text = '  /  /    '
                    end
                  end
                  object EditHw1: TEditHw
                    Left = 5
                    Top = 50
                    Width = 121
                    Height = 21
                    TabOrder = 3
                    Text = '                                   0'
                    OnChange = EditHw1Change
                    Formato = fInteger
                    FormatSize = '0.2'
                  end
                end
              end
            end
            object tsLancS2: TTabSheet
              Caption = 'tsLancS2'
              ImageIndex = 3
              object pnPagLancS2: TPanel
                Left = 0
                Top = 3
                Width = 817
                Height = 457
                BevelOuter = bvNone
                TabOrder = 0
                object Panel46: TPanel
                  Left = 0
                  Top = 416
                  Width = 817
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn32: TBitBtn
                    Left = 328
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn32Click
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
                  object BitBtn33: TBitBtn
                    Left = 409
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    ModalResult = 2
                    TabOrder = 1
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
                object GroupBox11: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 817
                  Height = 312
                  Align = alClient
                  TabOrder = 0
                  object DBGrid4: TDBGrid
                    Left = 2
                    Top = 15
                    Width = 813
                    Height = 295
                    Align = alClient
                    DataSource = dtmContasAPagar.dsControleCR
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnCellClick = DBGrid4CellClick
                    OnDrawColumnCell = DBGrid4DrawColumnCell
                    OnKeyDown = DBGrid4KeyDown
                    OnMouseUp = DBGrid4MouseUp
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'SEL'
                        Title.Caption = 'Sel'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_EMP_MULT'
                        Title.Caption = 'Cod Unificada'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENC_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CRED'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_C'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_CONTA_PLC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_CTRL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'RAZAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CLIENTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_REC_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'HISTORICO_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_DOC_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATQ_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NATL_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OBS_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TP_DOC_V'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_DOC_V'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'N_DOC_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_VENDA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_CLI_TERC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_TERC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIP_CNT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_CXL'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_VEND'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIP_BAIXA'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_REM_REC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_TERM'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE_QUIT'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'LOTE_ENT'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CPFCGC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DT_BAIXA_COMISSAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_BAIXA_COMISSAO'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DTORIGINAL_C'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SELEC'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CXL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CXL_RQ'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'STATUS_CX'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'OP_CX'
                        Width = 64
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOSSO_NUMERO_BANCO'
                        Width = 64
                        Visible = True
                      end>
                  end
                end
                object Panel48: TPanel
                  Left = 0
                  Top = 312
                  Width = 817
                  Height = 104
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label22: TLabel
                    Left = 6
                    Top = 78
                    Width = 180
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Total dos Cr'#233'ditos Selecionados:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object lbCreditosSel: TLabel
                    Left = 192
                    Top = 78
                    Width = 74
                    Height = 13
                    Caption = 'lbCreditosSel'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                  end
                  object Label50: TLabel
                    Left = 6
                    Top = 36
                    Width = 125
                    Height = 13
                    Caption = 'Informe o valor do cr'#233'dito'
                  end
                  object RadioGroup2: TRadioGroup
                    Left = 6
                    Top = -5
                    Width = 480
                    Height = 35
                    Columns = 2
                    ItemIndex = 0
                    Items.Strings = (
                      'Pesquisar Cr'#233'dito por valor'
                      'Pesquisar Cr'#233'dito por Nome do Cliente')
                    TabOrder = 0
                    OnClick = RadioGroup2Click
                  end
                  object Edit7: TEdit
                    Left = 5
                    Top = 50
                    Width = 280
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                    Text = 'EDIT2'
                    Visible = False
                    OnChange = Edit7Change
                  end
                  object GroupBox12: TGroupBox
                    Left = 492
                    Top = -2
                    Width = 313
                    Height = 100
                    Caption = 'Pesquisar Cr'#233'dito por per'#237'odo'
                    TabOrder = 2
                    object Label51: TLabel
                      Left = 19
                      Top = 25
                      Width = 43
                      Height = 13
                      Caption = 'Da Data:'
                    end
                    object Label52: TLabel
                      Left = 152
                      Top = 25
                      Width = 6
                      Height = 13
                      Caption = 'a'
                    end
                    object SpeedButton10: TSpeedButton
                      Left = 41
                      Top = 50
                      Width = 110
                      Height = 35
                      Hint = 'Filtrar cheques por per'#237'odo - [CTP028]'
                      Caption = 'Filtrar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      Glyph.Data = {
                        C2030000424DC203000000000000820100002800000018000000180000000100
                        08000000000040020000120B0000120B0000530000005300000000000000FFFF
                        FF00FF00FF00A4262600B02D2D00B12F2F00B6393900B63A3A00B83F3F00BA42
                        4200BC484800BD4B4B00BF4D4D00BF4E4E00C0505000C0515100C1535300C154
                        5400C2565600C4595900C45A5A00C6606000C7636300C9666600CC6F6F00CC70
                        7000CE747400CF777700D17E7E00D3808000D4848400D5888800D78B8B00004B
                        0000035E06000464080007931000089611000896120009971300099714000996
                        12000996130007740E000A9915000B991600097411000C9A18000D9E1B000FA0
                        1D000FA11F000C77170010951F000E7D1A00119620000F811C00118C1F001398
                        23001197220014A727001399250013902400159A2700138F2300169D2900169C
                        2800159127001AAF31001BB033001B9F310021B83D001C9C340020AA3B0023AD
                        410028C1490028C048002FC954002EC1520035CF5E0036D060003BD768003FD9
                        6F0041DC70000202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020221
                        0202020202020202020202020202020202020202020221382102020202020202
                        02020202020202020202020202213F2441210202020202020202020202020202
                        020202022142312D253E21020202020202020202020202020202022137433B32
                        2F263C21020202020202020202020202020221354B46443D2140273921020202
                        02020202020202020221334E4C4A4521022130283A2102020202020202020202
                        022151504F4821030202212E2C36210202020202020202020221475249210A11
                        03020202212D342102020202020202020203214D21100C0A0F03020202212F29
                        210202020202020203091821150D03120A0F0302020221232A21020202020203
                        081C1B19140302030E0A0E0302020202212B2102020202031F1E1D1603020202
                        03070B0D03020202022122210202020313201703020202020202030B0D030202
                        0202022121020202031A030202020202020202030C0A03020202020202210202
                        02030202020202020202020203050A0302020202020202020202020202020202
                        0202020202020306030202020202020202020202020202020202020202020203
                        0403020202020202020202020202020202020202020202020203030202020202
                        0202020202020202020202020202020202020203020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        020202020202}
                      ParentFont = False
                      OnClick = SpeedButton10Click
                    end
                    object SpeedButton17: TSpeedButton
                      Left = 160
                      Top = 49
                      Width = 110
                      Height = 35
                      Hint = 'Retirar Filtro - [CTP029]'
                      Caption = 'Retirar Filtro'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      Glyph.Data = {
                        5E030000424D5E030000000000001E0100002800000018000000180000000100
                        08000000000040020000120B0000120B00003A0000003A00000000000000FFFF
                        FF00FF00FF00D1D1D100CFCFCF00CCCCCC00C7C7C700C6C6C600C1C1C100C0C0
                        C000BFBFBF00BDBDBD00BABABA00B9B9B900B8B8B800B5B5B500B3B3B300B1B1
                        B100B0B0B000AEAEAE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A3A3
                        A300A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A
                        9A00999999009898980097979700969696009595950094949400939393009292
                        920091919100909090008F8F8F008E8E8E008D8D8D008C8C8C008B8B8B008787
                        8700858585008383830082828200818181007A7A7A0076767600727272006565
                        6500020202020202020202020202020202020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202023902020202
                        0202020202020202020202020202020202023927390202020202020202020202
                        02020202020202020239252C1D39020202020202020202020202020202020202
                        392220262A1E3902020202020202020202020202020202392D161A1F252A2039
                        020202020202020202020202020239300E111524391C29213902020202020202
                        0202020202393107090D19390239222922390202020202020202020202390405
                        061439360202393427233902020202020202020202391A031339241C36020202
                        3926243902020202020202020236390B391D21241E3602020239252A39020202
                        02020202362812391820361B241E3602020239372A390202020202362B0D0F11
                        193602361F241F360202020239353902020202360A0B0C1736020202362E2220
                        3602020202393839020202361A08153602020202020236222036020202020239
                        3902020236103602020202020202023621243602020202020239020202360202
                        0202020202020202363224360202020202020202020202020202020202020202
                        0202362F36020202020202020202020202020202020202020202023633360202
                        0202020202020202020202020202020202020202023636020202020202020202
                        0202020202020202020202020202023602020202020202020202020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        0202}
                      ParentFont = False
                      OnClick = SpeedButton17Click
                    end
                    object MaskEdit12: TMaskEdit
                      Left = 68
                      Top = 22
                      Width = 68
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 0
                      Text = '  /  /    '
                    end
                    object MaskEdit13: TMaskEdit
                      Left = 180
                      Top = 22
                      Width = 69
                      Height = 21
                      EditMask = '!99/99/0000;1;_'
                      MaxLength = 10
                      TabOrder = 1
                      Text = '  /  /    '
                    end
                  end
                  object EditHw3: TEditHw
                    Left = 5
                    Top = 50
                    Width = 121
                    Height = 21
                    TabOrder = 3
                    Text = '                                   0'
                    OnChange = EditHw3Change
                    Formato = fInteger
                    FormatSize = '0.2'
                  end
                end
              end
            end
            object tsLancCTP: TTabSheet
              Caption = 'tsLancCTP'
              ImageIndex = 4
              object pnPagLancCTP: TPanel
                Left = 3
                Top = 0
                Width = 812
                Height = 443
                TabOrder = 0
                OnEnter = pnPagLancCTPEnter
                object Panel69: TPanel
                  Left = 1
                  Top = 401
                  Width = 810
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 0
                  object BitBtn43: TBitBtn
                    Left = 328
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&OK'
                    TabOrder = 0
                    OnClick = BitBtn43Click
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
                  object BitBtn46: TBitBtn
                    Left = 409
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Cancelar'
                    TabOrder = 1
                    OnClick = BitBtn46Click
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
                object Panel71: TPanel
                  Left = 1
                  Top = 1
                  Width = 810
                  Height = 400
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                end
              end
            end
          end
        end
        object tsFaturaDesp: TTabSheet
          Caption = 'tsFaturaDesp'
          ImageIndex = 5
          object pnFaturaDesp: TPanel
            Left = 3
            Top = 27
            Width = 596
            Height = 286
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object Panel45: TPanel
              Left = 0
              Top = 247
              Width = 592
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn31: TBitBtn
                Left = 216
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Confirar - [NF0065]'
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn31Click
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
                Left = 297
                Top = 3
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
            object GroupBox40: TGroupBox
              Left = 0
              Top = 81
              Width = 592
              Height = 168
              Align = alTop
              Caption = 'Parcelas'
              TabOrder = 1
              object Panel47: TPanel
                Left = 454
                Top = 48
                Width = 133
                Height = 117
                BevelOuter = bvNone
                TabOrder = 2
                Visible = False
                object edDocFaturaEntrada: TEdit
                  Left = 0
                  Top = 4
                  Width = 119
                  Height = 21
                  TabOrder = 0
                  Text = 'edDocFaturaEntrada'
                end
                object edValorFaturaEntrada: TEditHw
                  Left = 0
                  Top = 31
                  Width = 119
                  Height = 21
                  TabOrder = 1
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edVencimentoFaturaEntrada: TMaskEdit
                  Left = 0
                  Top = 58
                  Width = 65
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 2
                  Text = '  /  /    '
                  OnExit = edVencimentoFaturaEntradaExit
                end
                object btSalvarFaturaEntrada: TBitBtn
                  Left = 0
                  Top = 87
                  Width = 120
                  Height = 25
                  Caption = 'Salvar Parcela'
                  TabOrder = 3
                  OnClick = btSalvarFaturaEntradaClick
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
              object ListBox3: TListBox
                Left = 2
                Top = 15
                Width = 446
                Height = 151
                Align = alLeft
                ItemHeight = 13
                TabOrder = 1
              end
              object btAlterarFaturaEntrada: TBitBtn
                Left = 454
                Top = 12
                Width = 121
                Height = 30
                Hint = 'Alterar Parcela - [NF0063]'
                Caption = 'Alterar Parcela'
                TabOrder = 0
                OnClick = btAlterarFaturaEntradaClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000320B0000320B0000000100000001000000000000CE63
                  00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
                  A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
                  C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
                  1818181818181818181818010101010101010101010101010101180119191716
                  1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
                  17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
                  1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
                  191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
                  19191919091505020C0118011919191919191919190700140001180101010101
                  0101010101041414030118180101010101010101010108080618181818181818
                  1818181818181818181818181818181818181818181818181818}
              end
            end
            object GroupBox26: TGroupBox
              Left = 0
              Top = 0
              Width = 592
              Height = 81
              Align = alTop
              TabOrder = 0
              object Label21: TLabel
                Left = 499
                Top = 20
                Width = 44
                Height = 13
                Caption = 'Parcelas:'
              end
              object Label72: TLabel
                Left = 65
                Top = 19
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'N'#186' Doc:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label73: TLabel
                Left = 332
                Top = 19
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Edit6: TEdit
                Left = 117
                Top = 16
                Width = 121
                Height = 21
                Enabled = False
                TabOrder = 0
                Text = 'Edit6'
              end
              object EditHw2: TEditHw
                Left = 370
                Top = 16
                Width = 120
                Height = 21
                Enabled = False
                TabOrder = 1
                Text = '0,00'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object edcreditoQtdeParcelas: TSpinEdit
                Left = 549
                Top = 14
                Width = 41
                Height = 22
                MaxValue = 99
                MinValue = 0
                TabOrder = 2
                Value = 1
              end
              object Panel42: TPanel
                Left = 2
                Top = 49
                Width = 588
                Height = 30
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 3
                object btGerar: TBitBtn
                  Left = 197
                  Top = 1
                  Width = 92
                  Height = 25
                  Hint = 'Gerar'
                  Caption = '(F6) Gerar'
                  TabOrder = 0
                  OnClick = btGerarClick
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
                object btApagarDesp: TBitBtn
                  Left = 295
                  Top = 1
                  Width = 92
                  Height = 25
                  Hint = 'Apagar'
                  Caption = '(F7) Apagar'
                  TabOrder = 1
                  OnClick = btApagarDespClick
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000430B0000430B00000001000000000000000000000000
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
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFD5D5D5D
                    5D5D5D5D5D5D5D5DFDFDFDFD5EE49B9B9B9B9B9B9B9B9B9B5DFDFDFD5EE4B767
                    67AFF6F6B76767665DFDFDFD5EE467676767A466676767675DFDFDFD5EE40867
                    676767676767679D5DFDFDFD5EE4F666676767676767EF9B5DFDFDFD5EE4F6F6
                    EF67676767EFF69B5DFDFDFD5EE4FFFF1667676767AFFF9B5DFDFDFD66E4FFB7
                    676767676767FF9B5DFDFDFD66E4B767676767676767B7E45DFDFDFD66A66767
                    67671667676767E45DFDFDFDA667676767B701F6676767675DFDFDFDA6A56767
                    16FF01010D1FB7A65DFDFDFDA6E4FFFFFFFFFFFFFFFFFFE45DFDFDFDA6E4E4E4
                    E4E4E4E4E4E4E4E45DFDFDFDFDA6665E5E5E5E5E5E5E5E5EFDFD}
                end
              end
            end
          end
        end
        object tsMultiempresa: TTabSheet
          Caption = 'tsMultiempresa'
          ImageIndex = 6
          object pnMultiempresa: TPanel
            Left = 1
            Top = 3
            Width = 704
            Height = 230
            TabOrder = 0
            OnEnter = pnMultiempresaEnter
            object pnMultiempresaBottom: TPanel
              Left = 1
              Top = 195
              Width = 702
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonMultiempresaSel: TSpeedButton
                Left = 643
                Top = 6
                Width = 23
                Height = 21
                Hint = 'Selecionar todas'
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
                OnClick = SpeedButtonMultiempresaSelClick
              end
              object SpeedButtonMultiempresaDesm: TSpeedButton
                Left = 672
                Top = 6
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
                OnClick = SpeedButtonMultiempresaDesmClick
              end
              object btnMultiempresaOK: TBitBtn
                Left = 271
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnMultiempresaOKClick
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
              object btnMultiempresaCancelar: TBitBtn
                Left = 352
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btnMultiempresaCancelarClick
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
            object DBGridMultiempresa: TDBGrid
              Left = 1
              Top = 1
              Width = 702
              Height = 194
              Align = alClient
              DataSource = dtmContasAPagar.dsEmpresasUnificadas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = DBGridMultiempresaCellClick
              OnDrawColumnCell = DBGridMultiempresaDrawColumnCell
              OnKeyDown = DBGridMultiempresaKeyDown
            end
          end
        end
        object tsFornecedoresConta: TTabSheet
          Caption = 'tsFornecedoresConta'
          ImageIndex = 7
          object pnFornecedoresConta: TPanel
            Left = 1
            Top = 3
            Width = 784
            Height = 182
            TabOrder = 0
            OnEnter = pnFornecedoresContaEnter
            object Panel68: TPanel
              Left = 1
              Top = 147
              Width = 782
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btFornContaOK: TBitBtn
                Left = 311
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btFornContaOKClick
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
              object btFornContaCancel: TBitBtn
                Left = 392
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btFornContaCancelClick
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
            object DBGridFornecedoresConta: TDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 146
              Align = alClient
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGridFornecedoresContaKeyDown
            end
          end
        end
        object tsConta: TTabSheet
          Caption = 'tsConta'
          ImageIndex = 8
          object pnConta: TPanel
            Left = 1
            Top = 3
            Width = 784
            Height = 182
            TabOrder = 0
            OnEnter = pnContaEnter
            object Panel70: TPanel
              Left = 1
              Top = 147
              Width = 782
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object btContaOK: TBitBtn
                Left = 311
                Top = 2
                Width = 75
                Height = 25
                Hint = 'OK'
                Caption = '&OK'
                TabOrder = 0
                OnClick = btContaOKClick
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
              object btContaCancel: TBitBtn
                Left = 392
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = btContaCancelClick
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
            object DBGridContas: TDBGrid
              Left = 1
              Top = 1
              Width = 782
              Height = 146
              Align = alClient
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGridContasKeyDown
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 954
      Width = 1
      Height = 555
      ExplicitLeft = 954
      ExplicitWidth = 1
      ExplicitHeight = 555
      inherited bMarketingHW: TBitBtn
        Top = 533
        Width = 0
        ExplicitTop = 533
        ExplicitWidth = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 555
    Width = 891
    ExplicitTop = 555
    ExplicitWidth = 891
  end
  inherited pnStatusProcessamento: TPanel
    Left = 701
    Top = 544
    ExplicitLeft = 701
    ExplicitTop = 544
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = 154
      ExplicitTop = -4
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 500
    Top = 9
    object DesmarcardocumentocomoRecebendoLinhasselecionadas1: TMenuItem
      Caption = 
        'Desmarcar documento como Pagando - Linhas selecionadas - [CTP023' +
        '/CTP025]'
      Hint = '[CTP023/CTP025]'
      OnClick = DesmarcardocumentocomoRecebendoLinhasselecionadas1Click
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 718
    Top = 91
  end
  inherited Timer1: TTimer
    Left = 606
    Top = 86
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 646
    Top = 83
  end
  object cdsDesp: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 712
    Data = {
      820100009619E0BD01000000180000000E0000000000030000008201084E756D
      436F6E746108000400000000000C446570617274616D656E746F010049000000
      01000557494454480200020020000556616C6F72080004000000010007535542
      545950450200490006004D6F6E6579000E446174615265666572656E63696104
      0006000000000009486973746F7269636F010049000000010005574944544802
      0002003C00064E756D446F630100490000000100055749445448020002001400
      09436F6E74726F6C657304000100000000000C4E6F6D65436F6E74726F6C6501
      004900000001000557494454480200020023000B5469706F4465737065736104
      000100000000000D436F64466F726E656365646F720400010000000000084461
      746156656E630400060000000000044E43687101004900000001000557494454
      48020002000A0009436F6E747242616E63010049000000010005574944544802
      00020001000A4E6F6D696E616C43687101004900000001000557494454480200
      020023000000}
    object cdsDespNumConta: TFloatField
      FieldName = 'NumConta'
    end
    object cdsDespDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 32
    end
    object cdsDespValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = '##0.00'
    end
    object cdsDespDataReferencia: TDateField
      FieldName = 'DataReferencia'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsDespHistorico: TStringField
      FieldName = 'Historico'
      Size = 60
    end
    object cdsDespNumDoc: TStringField
      FieldName = 'NumDoc'
      FixedChar = True
    end
    object cdsDespControles: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'Controles'
    end
    object cdsDespNomeControle: TStringField
      FieldName = 'NomeControle'
      Size = 35
    end
    object cdsDespTipoDespesa: TIntegerField
      FieldName = 'TipoDespesa'
    end
    object cdsDespCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object cdsDespDataVenc: TDateField
      FieldName = 'DataVenc'
    end
    object cdsDespNChq: TStringField
      FieldName = 'NChq'
      Size = 10
    end
    object cdsDespContrBanc: TStringField
      FieldName = 'ContrBanc'
      Size = 1
    end
    object cdsDespNominalChq: TStringField
      FieldName = 'NominalChq'
      Size = 35
    end
  end
  object dsDesp: TDataSource
    DataSet = cdsDesp
    Left = 744
  end
end
