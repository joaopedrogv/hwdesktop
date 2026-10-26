inherited frmCadBoletos: TfrmCadBoletos
  Left = 263
  Top = 103
  Caption = 'Boletos'
  ClientHeight = 636
  ClientWidth = 795
  Scaled = False
  ExplicitWidth = 811
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 795
    Height = 612
    ExplicitWidth = 795
    ExplicitHeight = 612
    inherited Splitter2: TSplitter
      Height = 610
      ExplicitHeight = 574
    end
    inherited PanelLeft: TPanel
      Width = 790
      Height = 610
      ExplicitWidth = 790
      ExplicitHeight = 610
      inherited PageControl1: TPageControl
        Width = 788
        Height = 608
        ExplicitWidth = 788
        ExplicitHeight = 608
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 780
          ExplicitHeight = 577
          inherited ScrollBox1: TScrollBox
            Width = 780
            Height = 577
            ExplicitWidth = 780
            ExplicitHeight = 577
            inherited PageControl3: TPageControl
              Width = 780
              Height = 529
              ExplicitWidth = 780
              ExplicitHeight = 529
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro de Boletos'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 772
                ExplicitHeight = 498
                inherited ScrollBox3: TScrollBox
                  Width = 772
                  Height = 498
                  ExplicitWidth = 772
                  ExplicitHeight = 498
                  inherited GroupBox1: TGroupBox
                    Width = 768
                    Height = 494
                    Align = alClient
                    Caption = 'Dados do Boleto '
                    Padding.Left = 6
                    Padding.Right = 6
                    Padding.Bottom = 6
                    OnEnter = GroupBox1Enter
                    OnExit = GroupBox1Exit
                    ExplicitWidth = 768
                    ExplicitHeight = 494
                    object Label6: TLabel
                      Left = 89
                      Top = 39
                      Width = 83
                      Height = 13
                      Caption = 'Data de emiss'#227'o:'
                      FocusControl = DBEdit1
                    end
                    object Label8: TLabel
                      Left = 521
                      Top = 39
                      Width = 85
                      Height = 13
                      Caption = 'Data vencimento:'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 57
                      Top = 66
                      Width = 115
                      Height = 13
                      Caption = 'N'#250'mero do documento: '
                      FocusControl = DBEdit_NumeroDocumento
                    end
                    object Label10: TLabel
                      Left = 304
                      Top = 65
                      Width = 53
                      Height = 13
                      Caption = 'Valor total:'
                      FocusControl = DBEdit_ValorTotal
                    end
                    object Label11: TLabel
                      Left = 55
                      Top = 200
                      Width = 117
                      Height = 13
                      Caption = 'Obs. 1 (Demonstrativo):'
                      FocusControl = DBEdit6
                    end
                    object Label12: TLabel
                      Left = 93
                      Top = 173
                      Width = 79
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Mora di'#225'ria (%):'
                      FocusControl = DBEdit_MoraDiaria
                    end
                    object Label13: TLabel
                      Left = 304
                      Top = 175
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Multa (%):'
                      FocusControl = DBEdit_Multa
                    end
                    object Label14: TLabel
                      Left = 101
                      Top = 96
                      Width = 71
                      Height = 13
                      Caption = 'C'#243'digo cliente:'
                      FocusControl = DBEdit9
                    end
                    object Label15: TLabel
                      Left = 72
                      Top = 149
                      Width = 100
                      Height = 13
                      Caption = 'Local de pagamento:'
                      FocusControl = DBEdit10
                    end
                    object Label16: TLabel
                      Left = 31
                      Top = 227
                      Width = 141
                      Height = 13
                      Caption = 'Obs. 2 (Instru'#231#245'es p/ Caixa):'
                      FocusControl = DBEdit11
                    end
                    object Label_Codigo: TLabel
                      Left = 135
                      Top = 13
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label20: TLabel
                      Left = 109
                      Top = 123
                      Width = 63
                      Height = 13
                      Caption = 'Raz'#227'o social:'
                      FocusControl = DBEdit9
                    end
                    object Label23: TLabel
                      Left = 55
                      Top = 359
                      Width = 117
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Nosso N'#250'mero Banc'#225'rio:'
                      FocusControl = DBEdit2
                      Visible = False
                    end
                    object Label26: TLabel
                      Left = 117
                      Top = 254
                      Width = 55
                      Height = 13
                      Caption = 'Mensagem:'
                      FocusControl = DBEdit_MoraDiaria
                    end
                    object Label27: TLabel
                      Left = 125
                      Top = 385
                      Width = 47
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Remessa:'
                      FocusControl = DBEdit2
                      Visible = False
                    end
                    object Label28: TLabel
                      Left = 423
                      Top = 385
                      Width = 73
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Data Remessa:'
                      FocusControl = DBEdit2
                      Visible = False
                    end
                    object Label32: TLabel
                      Left = 72
                      Top = 288
                      Width = 100
                      Height = 13
                      Caption = 'Mensagem Adicional:'
                      FocusControl = DBEdit_MoraDiaria
                    end
                    object Label33: TLabel
                      Left = 470
                      Top = 175
                      Width = 71
                      Height = 13
                      Caption = 'Dias Protesto: '
                      FocusControl = DBEdit13
                    end
                    object Label17: TLabel
                      Left = 531
                      Top = 66
                      Width = 75
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor desconto:'
                      FocusControl = DBEdit_ValorDesconto
                    end
                    object Label44: TLabel
                      Left = 69
                      Top = 323
                      Width = 103
                      Height = 13
                      Caption = 'Mensagem Desconto:'
                      FocusControl = DBEdit_MoraDiaria
                    end
                    object DBText2: TDBText
                      Left = 448
                      Top = 65
                      Width = 65
                      Height = 17
                      DataField = 'VL_DOC_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 178
                      Top = 36
                      Width = 120
                      Height = 21
                      DataField = 'DATA_EM_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 608
                      Top = 36
                      Width = 80
                      Height = 21
                      DataField = 'DATA_VEN_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 2
                    end
                    object DBEdit_NumeroDocumento: TDBEdit
                      Left = 178
                      Top = 62
                      Width = 120
                      Height = 21
                      DataField = 'N_DOC_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 3
                    end
                    object DBEdit_ValorTotal: TDBEdit
                      Left = 362
                      Top = 62
                      Width = 80
                      Height = 21
                      DataField = 'VL_DOC_BRUTO'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 12
                      TabOrder = 4
                      OnEnter = DBEdit_ValorTotalEnter
                      OnExit = DBEdit_ValorTotalExit
                      OnKeyPress = DBEdit_ValorTotalKeyPress
                    end
                    object DBEdit6: TDBEdit
                      Left = 178
                      Top = 197
                      Width = 445
                      Height = 21
                      DataField = 'OBS_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 13
                    end
                    object DBEdit_MoraDiaria: TDBEdit
                      Left = 178
                      Top = 170
                      Width = 76
                      Height = 21
                      DataField = 'M_DIA_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 12
                      TabOrder = 10
                      OnEnter = DBEdit_MoraDiariaEnter
                      OnKeyPress = DBEdit_MoraDiariaKeyPress
                    end
                    object DBEdit_Multa: TDBEdit
                      Left = 362
                      Top = 172
                      Width = 80
                      Height = 21
                      DataField = 'MULT_ATR_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 12
                      TabOrder = 11
                      OnEnter = DBEdit_MultaEnter
                      OnKeyPress = DBEdit_MultaKeyPress
                    end
                    object DBEdit9: TDBEdit
                      Left = 178
                      Top = 93
                      Width = 120
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 9
                      TabOrder = 6
                      OnExit = DBEdit9Exit
                      OnKeyDown = DBEdit9KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 178
                      Top = 146
                      Width = 445
                      Height = 21
                      DataField = 'LOCALPAG'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 9
                    end
                    object DBEdit11: TDBEdit
                      Left = 178
                      Top = 224
                      Width = 445
                      Height = 21
                      DataField = 'OBS_BOL1'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 14
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 178
                      Top = 10
                      Width = 120
                      Height = 21
                      DataField = 'N_SEQ_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 9
                      TabOrder = 0
                      OnEnter = DBEdit_NomeClienteEnter
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 304
                      Top = 93
                      Width = 319
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmBoletos.dsBoletos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = DtmBoletos.dsClientes
                      TabOrder = 7
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 178
                      Top = 120
                      Width = 445
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = DtmBoletos.dsBoletos
                      KeyField = 'COD_CLIENTE'
                      ListField = 'RAZAO'
                      ListSource = DtmBoletos.dsClientes
                      TabOrder = 8
                    end
                    object DBEdit2: TDBEdit
                      Left = 178
                      Top = 356
                      Width = 264
                      Height = 21
                      DataField = 'NOSSO_NUMERO_BANCO'
                      DataSource = DtmBoletos.dsBoletos
                      TabOrder = 18
                      Visible = False
                    end
                    object GroupBox5: TGroupBox
                      Left = 8
                      Top = 442
                      Width = 752
                      Height = 44
                      Align = alBottom
                      Caption = 'Conv'#234'nio'
                      TabOrder = 22
                      object SpeedButton104: TSpeedButton
                        Left = 521
                        Top = 15
                        Width = 23
                        Height = 22
                        Hint = 'Selecionar configura'#231#227'o - [BOL029]'
                        Glyph.Data = {
                          36050000424D3605000000000000360400002800000010000000100000000100
                          08000000000000010000220B0000220B00000001000000010000181818002118
                          21001821210031313100393939004242420052525200636363006B6B6B007373
                          7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
                          9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
                          A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
                          BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
                          C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
                          DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
                          F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
                          103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
                          2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
                          22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
                          2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
                          343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
                          24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
                          261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
                          261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
                        OnClick = SpeedButton104Click
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 232
                        Top = 16
                        Width = 283
                        Height = 21
                        KeyField = 'COD_COBREBEM'
                        ListField = 'DESCRICAO'
                        ListSource = DtmBoletos.dsCobreBemBol
                        TabOrder = 1
                        OnExit = DBLookupComboBox2Exit
                      end
                      object EditHw1: TEditHw
                        Left = 169
                        Top = 16
                        Width = 60
                        Height = 21
                        TabOrder = 0
                        Text = '               0'
                        OnExit = EditHw1Exit
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                    end
                    object DBMemo1: TDBMemo
                      Left = 178
                      Top = 250
                      Width = 445
                      Height = 31
                      DataField = 'MENSAGEM_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      Enabled = False
                      MaxLength = 128
                      TabOrder = 15
                    end
                    object DBEdit4: TDBEdit
                      Left = 178
                      Top = 382
                      Width = 118
                      Height = 21
                      DataField = 'REMESSA_ENVIADA'
                      DataSource = DtmBoletos.dsBoletos
                      Enabled = False
                      TabOrder = 19
                      Visible = False
                    end
                    object DBEdit5: TDBEdit
                      Left = 502
                      Top = 382
                      Width = 120
                      Height = 21
                      DataField = 'DATA_REMESSA'
                      DataSource = DtmBoletos.dsBoletos
                      Enabled = False
                      MaxLength = 12
                      TabOrder = 20
                      Visible = False
                      OnEnter = DBEdit_MultaEnter
                      OnKeyPress = DBEdit_MultaKeyPress
                    end
                    object GroupBox9: TGroupBox
                      Left = 8
                      Top = 408
                      Width = 752
                      Height = 34
                      Align = alBottom
                      Caption = 'Nota Fiscal:'
                      TabOrder = 21
                      object Label29: TLabel
                        Left = 122
                        Top = 13
                        Width = 41
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Num NF:'
                        FocusControl = DBEdit2
                      end
                      object Label30: TLabel
                        Left = 325
                        Top = 12
                        Width = 28
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'S'#233'rie:'
                        FocusControl = DBEdit2
                      end
                      object Label31: TLabel
                        Left = 532
                        Top = 12
                        Width = 37
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'NF Aut:'
                        FocusControl = DBEdit2
                      end
                      object SpeedButton15: TSpeedButton
                        Left = 631
                        Top = 8
                        Width = 23
                        Height = 22
                        Hint = 'Habilitar Campos Nota Fiscal  - [BOL034]'
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2EB3BA377FF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFC3E6D91B9E6C0D935DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85D2B90B9F6C0C9C680C9762FF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FAF8
                          56C6A40AA8760CA8750DA5710C9B67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFD1F2E927BD9409B0810BB5850CB17F0DAB780B9F6C0C
                          9B670C97620D935D0D8E570E8A520E864D0F844BFFFFFFFFFFFF17C19608BD8F
                          0BC3940CBE8E0CB8870CB17F0DAB780DA5710D9E690E98620E915B0E8B530F85
                          4C0E864DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E864D0F854C0E8B530E915B0E98620D
                          9E690DA5710DAB780CB17F0CB8870CBE8E0BC39408BD8F17C196FFFFFFFFFFFF
                          0F844B0E864D0E8A520D8E570D935D0C97620C9B670B9F6C0DAB780CB17F0BB5
                          8509B08127BD94D1F2E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFF0C9B670DA5710CA8750AA87656C6A4F1FAF8FFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C97620C9C680B9F6C85D2
                          B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFF0D935D1B9E6CC3E6D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3BA377E2F2EBFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                        OnClick = SpeedButton15Click
                      end
                      object DBEdit7: TDBEdit
                        Left = 169
                        Top = 9
                        Width = 74
                        Height = 21
                        DataField = 'NUM_NF_VND'
                        DataSource = DtmBoletos.dsBoletos
                        Enabled = False
                        TabOrder = 0
                        OnKeyDown = DBEdit7KeyDown
                      end
                      object DBEdit8: TDBEdit
                        Left = 359
                        Top = 9
                        Width = 35
                        Height = 21
                        DataField = 'SUB_SERIE'
                        DataSource = DtmBoletos.dsBoletos
                        Enabled = False
                        TabOrder = 1
                      end
                      object DBEdit12: TDBEdit
                        Left = 575
                        Top = 9
                        Width = 37
                        Height = 21
                        DataField = 'NF_AUT'
                        DataSource = DtmBoletos.dsBoletos
                        Enabled = False
                        TabOrder = 2
                      end
                    end
                    object DBMemo2: TDBMemo
                      Left = 178
                      Top = 284
                      Width = 445
                      Height = 31
                      DataField = 'MENSAGEM_ADC'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 128
                      TabOrder = 16
                    end
                    object DBEdit13: TDBEdit
                      Left = 543
                      Top = 172
                      Width = 80
                      Height = 21
                      DataField = 'DIAS_PROTESTO'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 12
                      TabOrder = 12
                      OnEnter = DBEdit_MultaEnter
                      OnKeyPress = DBEdit_MultaKeyPress
                    end
                    object DBEdit_ValorDesconto: TDBEdit
                      Left = 608
                      Top = 62
                      Width = 80
                      Height = 21
                      DataField = 'VL_DESC_BOL'
                      DataSource = DtmBoletos.dsBoletos
                      MaxLength = 12
                      TabOrder = 5
                      OnEnter = DBEdit_ValorTotalEnter
                      OnExit = DBEdit_ValorTotalExit
                      OnKeyPress = DBEdit_ValorTotalKeyPress
                    end
                    object DBMemo4: TDBMemo
                      Left = 178
                      Top = 320
                      Width = 445
                      Height = 31
                      DataField = 'MENSAGEM_DESC'
                      DataSource = DtmBoletos.dsBoletos
                      Enabled = False
                      MaxLength = 128
                      TabOrder = 17
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 529
              Width = 780
              ExplicitTop = 529
              ExplicitWidth = 780
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Boleto - [BOL008]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BOL009]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitWidth = 780
          ExplicitHeight = 577
          inherited GroupBox3: TGroupBox
            Width = 780
            Height = 185
            ExplicitWidth = 780
            ExplicitHeight = 185
            inherited imgInformation: TImage
              Left = 754
              Height = 168
              ExplicitLeft = 754
              ExplicitHeight = 168
            end
            object SpeedButton55: TSpeedButton [6]
              Left = 725
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
              OnClick = SpeedButton55Click
            end
            object btSelectAll: TSpeedButton [7]
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
            object btUnSelectAll: TSpeedButton [8]
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
              Hint = 'Clique para pesquisar - [BOL001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BOL002]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            object groupAdicional: TGroupBox
              Left = 4
              Top = 94
              Width = 782
              Height = 85
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              OnExit = groupAdicionalExit
              object Label109: TLabel
                Left = 6
                Top = 54
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label110: TLabel
                Left = 16
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 143
                Top = 54
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label112: TLabel
                Left = 210
                Top = 27
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 59
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 173
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
                Left = 59
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 264
                Top = 21
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox1Enter
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
            object ckLixeira: TCheckBox
              Left = 485
              Top = 48
              Width = 86
              Height = 17
              Hint = 'Lixeira'
              Caption = 'Lixeira (F6)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              OnClick = ckLixeiraClick
            end
          end
          inherited Panel1: TPanel
            Top = 185
            Width = 780
            Height = 392
            ExplicitTop = 185
            ExplicitWidth = 780
            ExplicitHeight = 392
            inherited Splitter1: TSplitter
              Top = 113
              Height = 275
              ExplicitTop = 113
              ExplicitHeight = 410
            end
            inherited DBGrid1: TDBGrid
              Top = 113
              Width = 487
              Height = 275
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OnCellClick = DBGrid1CellClick
              OnColEnter = DBGrid1ColEnter
              OnColExit = DBGrid1ColExit
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              OnKeyPress = DBGrid1KeyPress
              OnMouseUp = DBGrid1MouseUp
            end
            inherited Panel2: TPanel
              Width = 776
              Height = 113
              ExplicitWidth = 776
              ExplicitHeight = 113
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BOL003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BOL005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [BOL010]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Left = 177
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
              end
              inherited SpeedButton5: TSpeedButton
                Left = 236
                Hint = 'Recuperar registro - [BOL006]'
                OnClick = SpeedButton5Click
                ExplicitLeft = 236
              end
              inherited SpeedButton6: TSpeedButton
                Left = 293
                Hint = 'Enviar boleto por e-mail - [BOL012]'
                Glyph.Data = {
                  A6030000424DA603000000000000660100002800000018000000180000000100
                  08000000000040020000120B0000120B00004C0000004C00000000000000FFFF
                  FF00FF00FF00FFFBFB00FFFEFE008E5D5900C55F1B00C9682500CF753500EDCC
                  B100B1815500B0815500EDE2D800F2EBE500B78C6300F0E7DE00F3EBE300F8F4
                  F000F6F3F000D5812700EDCEAC00EFD8C000EFD9C100E7D7C600EEE3D700EDE3
                  D800F6EEE500FFCF9700FFD19900FFD49F00FFD4A000FFD5A300FBE3C700F0DA
                  C000FFD39900F0E9E000FBF8F400F2E9DC00FCFAF700F8F3EB00FFDD9E00F6EF
                  E100FAF4E700FEFAEF00FAF8F200FCFBF800F7F6F300FFFEF700FFFFFA00056D
                  0000FBFEFB000157030003780400088E0C00047F0A0005730A000E7813001086
                  160006980F000793110011A0220013A12300168B230016AA290023A536001FAF
                  37001FA0350022B63F002FC6550035D15D003CD56A0041E07300B1D7FE001C80
                  FB002D8CFB001579FB0002020202020202020202020202020202020202020202
                  0202020202020202020505050505050505050505050505050505020202020202
                  020522221B1D1F1F1F1F1F1F1F1E1C1B28050202020202333333332116161616
                  161616161616141520050202020233363705181819191919191919191919190C
                  2905020202333A330205252523131313131313131313230F2A05020233343B33
                  02051A1A0D0D0D0D0D0D0D0D0D0D0D102B05020233353C330205272727131313
                  1313131313132E122F053333333D413333332C2C111111111111111111113201
                  010533313F4344463833303024262D2D2D2D2D0109070806010502333945473E
                  330501010404040404040401170B0E0A01050505334042330505010101010101
                  0101010148494A4B010505222233331F1F050101010101010101010101333301
                  0305052121161616160505050505050505050505334240330505051818191919
                  19191919191919190C2905333E47453933020525252313131313131313131323
                  0F2A33384644433F3133051A1A0D0D0D0D0D0D0D0D0D0D0D102B333333413D33
                  3333052727271313131313131313132E122F0502333C35330202052C2C111111
                  111111111111113201010502333B3433020205303024262D2D2D2D2D01090708
                  06010502333A330202020501010404040404040401170B0E0A01053736330202
                  0202050101010101010101010148494A4B333333330202020202050101010101
                  0101010101010101010305020202020202020505050505050505050505050505
                  05050502020202020202}
                OnClick = SpeedButton6Click
                ExplicitLeft = 293
              end
              inherited SpeedButton7: TSpeedButton
                Left = 463
                Hint = 
                  'Limpar dados da impress'#227'o do boleto e dados do cr'#233'dito. - [BOL01' +
                  '4]'
                Glyph.Data = {
                  FE0A0000424DFE0A00000000000036000000280000001E0000001E0000000100
                  180000000000C80A0000B0070000B00700000000000000000000FFFFFFEDEDED
                  E8E8E8FAFAFAFEFEFEFFFFFFFFFFFFFFFFFFFBFBFBF5F5F5FDFDFDFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F8F8F8ADADAD9C9C9CD3
                  D3D3EEEEEEFEFEFEFEFEFEFEFEFEE1E1E1C2C2C2E0E0E0F9F9F9FEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF0000505AC80C28C30416BB5C5E7F5F5F
                  5F6D6D6D6D6D6D6E6E6E0209A80408A557588C6969696D6D6D6D6D6D6D6D6D6D
                  6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D8C8C8C
                  FFFFFFFFFFFFFFFFFFFFFFFF00000213C11C49E4163AB80210B94D4DB58A6859
                  B5A0975450A80E3DF2092BB6010AAAB4A09A826050815E4E815F4E805D4D7F5E
                  4D7F5C4D7E5C4C7E5D4C7D5B4B7C5A4A7C5B4A7B5B4B7B5B4B6F6F6FFFFFFFFF
                  FFFFFFFFFFFFFFFF00000717C42D6AFF265BFF1F4DEA1639B02930BC0311B718
                  48FA164EFF144CFF0D3CE6060AA4D5CDDEEFDDCDEFDDCDEFDDCCEFDDCBEFDCCB
                  EFDBC8EEDAC7EED9C4EED8C1EDD7C0EDD6BCEBCDB06D6D6DFEFEFEFFFFFFFFFF
                  FFFFFFFF00002738D63778FF2D62FF2A5EFF295EFF183CB42257FF1F56FF1B51
                  FF194FFF134AFF1C1EABBBB1CEDFC4B3DFC3B4DFC3B1DFC0AEDFC0ADDEBEABDE
                  BFA9DEBBA5F9EFDEF9EEDEF3E0CBEACDB26D6D6DFEFEFEFFFFFFFFFFFFFFFFFF
                  00005A68E12A5FEF3F83FF2D62FF2B60FF275AFE255AFF2157FF1D54FF1C52FF
                  020FB4D9CCD3DFC6B9DABCACDABAABDAB9A8DAB8A4DAB7A3DAB6A0DAB69FD9B3
                  9BFAF0E1F9EFDFF2E1CDECCEB56D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFF
                  FFE7EAFC5663DE2E64EF3E81FF2C62FF285DFF265BFF1843F0030EB3E9D8D0DB
                  BFB3DBBFB1DBBEAFDABCADDABBAADAB9A8DAB8A6DAB7A2DAB6A2DAB59DFAF2E5
                  FAF1E3F4E3D1EBD0B86D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FEFEFE000DC03871FB2F64FF2A5FFF295EFF0417B73E43C4DBC2B5DBC0B4DBBF
                  B3DBBEB0DBBDAEDABBACDABAA9DAB9A7DAB7A4DAB6A2DAB59FFBF3E6FAF2E5F3
                  E4D3EDD0BB6D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFDFE0ED35
                  68F73B70FF3468FF346FFF2C62FF1F49D8102EB3CAC2D9DBC2B7DBC0B6DBBFB3
                  DBBEB1DBBDAEDBBCABDBBBA9DAB9A6DAB8A4DAB6A0FBF3E7FBF3E7F3E6D6ECD2
                  BE6D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFF3F3F5293ECF447AFF3D71
                  FF3160F90115C43474F82A5FFF2456FB0214BBE5D4CEDBC2B8DBC0B5DBC0B3DB
                  BDB0DBBCACDBBBABDBBAA7DAB8A6DAB7A2FBF4E9FBF4E8F4E6D8ECD3C06D6D6D
                  FEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFBBC2EA011FD94377FF4073FF0F2DD7
                  7C7FD60216C63371FF285DFF1030AFC1BADADFC9C1DBC0B6DBC0B4DBBEB1DBBC
                  ADDBBBABDBBAA8DBB9A7DAB7A3FBF4EAFBF4E9F4E7D8ECD3BF6D6D6DFEFEFEFF
                  FFFFFFFFFFFFFFFF0000FFFFFF2845F2386CF3497DFF3C6AF79DA6EFDBC8C3E9
                  DEDC0720CC377AFE2255FD0519C07D7ECADBC2B7DBC1B6DBBEB2DBBDAEDBBCAD
                  DBBAA9DBB9A8DBB8A3FBF5EBFBF5EAF4E7D9ECD4C06D6D6DFEFEFEFFFFFFFFFF
                  FFFFFFFF0000FFFFFF97A7FD0427E75593FF1F47EBFBFAF9DBC7C4DBC8C44852
                  CE0A28D12764FF0419C45258C7DBC1B8DBC1B6DBBFB3DBBDAFDBBCADDBBAA9DB
                  B9A8DBB8A4FBF5ECFBF5EBF4E8DAECD4C26D6D6DFEFEFEFFFFFFFFFFFFFFFFFF
                  0000FFFFFFFFFFFFFEFEFEC9D0F995A4F5FEFCF9DCC7C2DCC7C3DECBC7D8CFDD
                  B2AFDAE2D0CADCC4BCDBC1B8DBC0B7DBBFB2DBBEB0DBBDADDBBBABDBB9A8DBB8
                  A5FCF6EDFBF5ECF4E8DBECD4C16D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFF
                  FFFFFFFFFEFEFEFFFFFFFEFCFAFEFDFBDCC7C1DCC7C1DCC7C1DCC7C0DCC6BFDC
                  C4BCDCC3BBDBC1B8DBC1B6DBBEB3DBBDAFDBBDAEDBBAAADBBAA9DBB7A4FCF6EE
                  FCF6EDF4E8DCECD5C36D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FEFEFEFFFFFFFEFEFBFEFDFCDCC6C0DCC6C1DCC6C1DCC6C0DCC4BFDCC4BCDCC3
                  BADCC2B8DBC0B6DBBFB3DBBDAFDBBCAEDBBBABDBB9A8DBB7A4FCF7EEFCF6EDF4
                  E9DCECD5C26D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFF
                  FFFFFEFDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFDFCFEFDFCFEFCFA
                  FEFCFAFDFBF8FDFAF6FDFAF5FDF9F4FDF9F3FCF8F1FCF7EFFCF7EEF6E9DDEDD5
                  C46D6D6DFEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFEFF
                  FDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFCFEFDFBFEFCFAFE
                  FCF8FDFBF7FDFAF6FDF9F4FDF9F3FCF8F1FCF7EFFCF7EEF5E9DDEDD5C36D6D6D
                  FEFEFEFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF
                  E2D2D1E2D3D1E2D3D1E2D2D0E2D1CEE1CFCAE1CEC9E1CDC6E1CBC3E1CAC0E0C7
                  BCE0C7BAE0C4B6E0C4B4E0C2AFFCF7F0FCF7EFF5E9DEEDD5C56D6D6DFEFEFEFF
                  FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFDDCBC9DD
                  CBCBDDCBCADDCAC9DDC9C6DDC7C2DDC6C1DCC4BCDCC2BADCC0B5DBBEB1DBBDB0
                  DBBBAADBBAA9DCB8A4FCF9F0FDF8F0F6E9DEEBD3C2717171FFFFFFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFDDCAC8DDCBCADDCB
                  C9DDCAC8DDC9C5DDC7C2DDC6C1DCC4BCDCC2BADCC0B5DBBEB1DBBDB0DBBBAADC
                  BBA9DBB8A5F9F5EEF6F0E9E9D9CEDFC4B4898989FFFFFFFFFFFFFFFFFFFFFFFF
                  0000FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFEFEFDFEFDFCFEFCFAFEFDFADACDC5BEA69BBCA398B79E
                  92B2988FA88D808762518B6857ECECECFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
                  FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFEFEFDFEFDFCFEFCFAFFFFFEC3AEA3CCBBB2C8B3A5C5A88EC19C78
                  CAA2728E6B5DBDB6B2FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
                  FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
                  FEFEFEFDFEFDFCFEFCFAFFFEFBDDD0C8FDF2DEF5E2C3EECE9BCBA06B8E6D61F0
                  F0F0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFF
                  FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFC
                  FEFDFBFEFCF9FFFEFADED2CAF6DCB1EECE98CCA06AC4C0BEF2F2F2FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFEFE
                  FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFDFEFDFCFEFDFBFEFCFAFE
                  FCF8FFFEFADED2CBF4D29BF0C683917469F3F3F3FEFEFEFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFEFEFEFFFFFFFEFDFCFEFEFD
                  FEFEFDFEFEFDFEFEFDFEFEFDFEFDFDFEFDFCFEFDFBFEFCFAFEFCF9FDFBF7FFFD
                  FADBCDC4CCA06893766AF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFBFEFDFCFEFDFCFE
                  FDFCFEFDFCFEFDFCFEFDFCFEFDFBFEFCFAFEFCF9FDFBF8FDFBF7FFFFFBC3ADA0
                  967C70CCCAC9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFFFFFF9B705C9B6F5B9A6F5A996E5A996E5A986D
                  59986D59976C58956B59956C57936B58936956916855926B5AB49E94F9F9F9FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  0000}
                OnClick = SpeedButton7Click
                ExplicitLeft = 463
              end
              inherited SpeedButton8: TSpeedButton
                Left = 350
                Hint = 'Gerar arquivo remessa - [BOL013]'
                Glyph.Data = {
                  FE0A0000424DFE0A00000000000036000000280000001E0000001E0000000100
                  180000000000C80A0000B0070000B00700000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFEFEFEFBFBFBE0E0E0D0D0D0C2C2C2CCCCCCD4D4D4E0E0E0E6E6E6F3
                  F3F3FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
                  ECECECD5D5D5918B878679717C716A6E6C6B6F6F6F868686959595B8B8B8D8D8
                  D8E1E1E1F0F0F0F8F8F8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFDFDFDF3F3F3B1ADACAB571AB5
                  5001CD6700CE6800CE6800CB6500C76100BB5500B65000AC4702A2603594694F
                  716A656B6A6A909090C5C5C5D9D9D9F1F1F1FAFAFAFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFEFEFEF4F4F4AE9D91AA6631CA6502D26C00D16B00D16B
                  00D16B00D06A00CF6900CE6800CC6600CB6500C96300C45E00C25C00BE5800B7
                  5100AB4500A2501B966447696564727272B1B1B1E8E8E8F8F8F8FFFFFFFFFFFF
                  0000FFFFFFF0F0F0C8C5C4B44F06C76204D6750AD47003D46E00D36D00D36D00
                  D26C00D16B00D06A00CE6800CD6700CB6500C66000C45E00BF5900BC5600B751
                  00B04A00AA4400A242099B5D3A686564A1A1A1D0D0D0FEFEFEFFFFFF0000F9F9
                  F9B35B1AC56004DE8522DD831EDC8018DB7C10DA790CD87200D77100D77100D5
                  6F00D46E00D26C00D16B00CE6800CC6600C96300C45E00C15B00BB5500B54F00
                  B24C00AC4600A94300A33D009E47176F6763EAEAEAFFFFFF0000EAE2DBCA6A0A
                  E18E2CE08A28E08925E0861FDF8216DE7F12DA7502DA7400D97300D77100D670
                  00D46E00D36D00D06A00CD6700CC6600C76100C45E00BE5800B85200B44E00AE
                  4800AB4500A53F009F3900956349E3E3E3FFFFFF0000CE844FE69A3FE5983BE6
                  9636E69533E6912BE58D22E48A1DDF7B04DE7800DD7700DB7500DA7400D87200
                  D67000D46E00D06A00CF6900CB6500C86200C25C00BC5600B85200B24C00AF49
                  00A84200A23C009F5730DEDEDEFEFEFE0000C97434EBA54EEBA34AEBA144EBA0
                  41EB9B38EA962DE99328E47F03E27C00E17B00DF7900DE7800DB7500DA7400D7
                  7100D36D00D16B00CE6800CC6600C66000BF5900BC5600B54F00B24C00AB4500
                  A43E00A64E1DDADADAFEFEFE0000C86D26EEA955EDA851EDA64BEDA447EDA03E
                  EC9B32EC982DE68001E57F00E37D00E17B00E07A00DD7700DB7500D87200D56F
                  00D36D00CF6900CD6700C86200C15B00BD5700B65000B34D00AC4600A53F00A8
                  4510D8D8D8FEFEFE0000C45C0CF2B464F1B260F1AF58F1AD53F1A948F1A33CF0
                  A035EA8300E98300E78100E57F00E37D00E07A00DE7800DB7500D77100D56F00
                  D16B00CF6900CB6500C45E00C05A00B95300B54F00AE4800A74100A23D02CFCF
                  CFFBFBFB0000BB5503F4B96CF3B767F3B35EF3B159F3AC4DF3A740F2A53AEC85
                  00EC8600E98300E78100E57F00E17B00E07A00DC7600D87200D67000D26C00D0
                  6A00CD6700C55F00C15B00BA5400B75100AF4900A84200A13C01CACACAF9F9F9
                  0000BF5601F7C279F6BF74F6BB69F6B862F6B355F6AD46F6AB41F18B00F08A00
                  ED8700EA8400E88200E47E00E27C00DE7800DA7400D87200D36D00D16B00CD67
                  00C76100C35D00BC5600B85200B14B00AA4400A23D01BFBFBFF5F5F50000C55B
                  00F8C986F8C57EF8BF70F8BC6AF8B759F9B14BFAAF45F79100F69000F38D00EF
                  8900EB8500E78100E57F00DF7900DB7500D97300D46E00D26C00CE6800CA6400
                  C55F00BD5700B95300B24C00AB4500A33D00B4B4B4F1F1F10000C86000F9CA8A
                  F9C781F8C173F9BD6AF9B95BFCB751FCA627E07800D86F00D56C00D66E00D76F
                  00DC7500DF7800E37D00DD7700DA7400D67000D46E00CE6800C96300C55F00BE
                  5800BA5400B24C00AB4500A43E00AEAEAEEFEFEF0000CF6C08F9CA86F8C680FA
                  C273FBC16BD56E00BA814CA89B8F505357D1D4D7CBCED1C9CCD0C8CCD0C6CCD1
                  C5CAD0C2BEBBBE9B81BA8963B46427B14F0AB24700BC5400BE5700C05900BB55
                  00B44E00AC4600A53F00A4A4A4EBEBEB0000D2720FF8C781F9C67EEFA23FD46A
                  00BF936ABCC0C4B3B4B65E5E5ED5D5D5D5D5D5D3D3D3D2D2D2D0D0D0CFCFCFCC
                  CDCDCACCCEC9CCCFC8CDD1C7CDD2C0AD9FB6794EB05D26AA3E00AD4300AF4800
                  AD4700A53F009E9E9EE9E9E90000D87D19DF8621C55800868583999D9FC9C9C9
                  DCDCDCD1D1D1858585CFCFCFE7E7E7E6E6E6E5E5E5E4E4E4E4E4E4E0E0E0DEDE
                  DEDDDDDDDBDBDBDADADAD8D8D8D6D6D6D5D5D5D4D5D6D3D5D7D5DBDFCA6601A6
                  3F00AAAAAAECECEC0000C05900A08B70C1C4C88E8E8EBEBEBEDADADAFAFAFAF1
                  F1F1B3B3B3B6B6B6EAEAEAEDEDEDECECECEBEBEBEAEAEAE9E9E9E9E9E9E9E9E9
                  E9E9E9EAEAEAE8E8E8E9E9E9E7E7E7E6E6E6E5E5E5EBEBEB926E54B2907BFAFA
                  FAFEFEFE0000C35D00968C82D3D4D5929292CECECEE1E1E1FFFFFFFFFFFFE0E0
                  E0ADADAD949494AAAAAAB9B9B9D4D4D4E3E3E3EEEEEEECECECEBEBEBEAEAEAE9
                  E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EEEEEE797A7BA7A7A7FFFFFFFFFFFF
                  0000FFFFFF98989AF3F3F3989898E2E2E2F8F8F8D4D4D4C6C6C6AAAAAA9E9E9E
                  979797B4B4B4C0C0C0D8D8D8F0F0F0D7D7D7B9B9B9ACACACA2A2A2EDEDEDE9E9
                  E9E9E9E9E9E9E9E9E9E9EAEAEAF0F0F0929292A5A5A5FFFFFFFFFFFF0000FFFF
                  FFA2A2A2FFFFFFB2B2B29898989C9C9CBCBCBCCBCBCBE5E5E5F0F0F0E4E4E4CB
                  CBCBBFBFBF979797D8D8D8F6F6F6EDEDEDEBEBEB999999EDEDEDE9E9E9E9E9E9
                  E9E9E9EAEAEAE2E2E2B2B2B2AFAFAFD0D0D0FFFFFFFFFFFF0000FFFFFFC9C9C9
                  B7B7B7939393FEFEFEF6F6F6F0F0F0EDEDEDC1C1C1BEBEBEF2F2F2EEEEEEECEC
                  ECA5A5A5E3E3E3FFFFFFFFFFFFFFFFFF929292E7E7E7E9E9E9E9E9E9E9E9E9EA
                  EAEAE7E7E7717171FCFCFCFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFA3
                  A3A3FFFFFFFFFFFFFEFEFEFCFCFCAEAEAEDDDDDDFDFDFDFAFAFAF8F8F89E9E9E
                  EEEEEEFFFFFFFFFFFFFFFFFFA2A2A2D7D7D7EEEEEEEDEDEDEDEDEDECECECEEEE
                  EE7C7C7CF9F9F9FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFAEAEAEFFFF
                  FFFFFFFFFFFFFFFEFEFEA1A1A1EBEBEBFFFFFFFFFFFFFEFEFE9A9A9AEBEBEBFF
                  FFFFFFFFFFFFFFFFBEBEBE9595959F9F9FAAAAAAB1B1B1BFBFBFC9C9C9AAAAAA
                  FCFCFCFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFB3B3B3E9E9E9FFFFFF
                  FFFFFFFFFFFF939393A7A7A7BABABACBCBCBD4D4D4EBEBEBF7F7F7A1A1A1DFDF
                  DFD7D7D7C7C7C7BFBFBFF2F2F2FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFF
                  FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFBDBDBDB1B1B1979797A9A9A9B5
                  B5B5CBCBCBA4A4A4C3C3C3C5C5C5BCBCBCB0B0B0A9A9A9E6E6E6FFFFFFFFFFFF
                  FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  0000}
                OnClick = SpeedButton8Click
                ExplicitLeft = 350
              end
              inherited SpeedButton11: TSpeedButton
                Left = 406
                Hint = 'Relat'#243'rio - [BOL011]'
                Glyph.Data = {
                  1E050000424D1E05000000000000DE0200002800000018000000180000000100
                  08000000000040020000120B0000120B0000AA000000AA000000FF00FF00A568
                  6B00FFFEFE008E5D590080504B0090605B0093656000E2D0CE0093655E009566
                  600093655F00986963009F675B009E675B0096655B0095655B009E6E64009866
                  5B00A3726600DDC7C200FBF7F600A775680098685900AC796900DDC4BC00B17E
                  6B00FFFCFB00BB846E00B6816C00DAC0B600CB917300C58C7000C0896F00FCF8
                  F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000E9D3C400FFFC
                  FA00FEF7F200FBF7F400FEF8F300F2E2D300F4EAE100FBF2EA00DAA16B00EED7
                  C000EFDAC500F0DECC00F8EADC00F2E6DA00FAEEE200FBF2E900FBF3EB00EA89
                  2300E2903A00DD984F00EAB27300EFD3B400EED4B800F6DEC400F6DEC500F7E2
                  CC00F6E2CC00F6E3CE00F8E7D400F7E6D300F8EEE300F6A03600EFA75100EFA9
                  5200EDB57200EAB47400EAC18E00F2D4AF00F2D4B000F2D4B100F2D5B100F2D8
                  B800F4DABB00F3DABC00F6E0C500F6E0C600F4DEC500F6E2CB00F6E3CC00FAEA
                  D700F8EAD900F7EADA00F8EBDC00E9BD8100EBC18800E9BF8700EBC18900EDC5
                  8F00EFC79100EDC59000EBC59200EDC79500EDC79600EDC79700EDC99900EECA
                  9C00EECB9C00EECB9D00EFCEA100F0CFA300F2D1A500EFCEA300EFCEA400EFCF
                  A400EFD0A700F0D1A900CEB49100F0D1AA00F3D5AD00F2D5B000F0D4AF00F0D4
                  B100F6DAB600F3D8B600F2D8B600F2D8B700F2D9B800E5CEAF00C4B09600F3DC
                  BD00F3DCBF00A1927F00F7E2C700F4E0C500F4E0C600A4978600F8E6CF00B8AB
                  9A00F8EBDA00FBF2E600F8EFE300EDC18000EABF7F00EBC08000E9BD7F00E7BB
                  7E00E7BC7E00EBC18200E7BC8000EABF8200EEC58900EBC28800EBC48E00EBC5
                  8F00EFCB9700EEC99600F0CE9E00EDCB9C00EFCFA300F0D5B000F6E0C100FAE9
                  D000E0D0BA00FCF6ED00FCF7F000A79C8B00FFFEFB00FFFFFE00FFFFFF000000
                  0000000000030303030303030303030303030303030303040000000000083D7A
                  766E9C9A6296938F8F8F8F8F8F8D8E0400000000000A3E5250759E6B66615E95
                  90909090908E920400000000000A31A07E4F75716B6661600505050505059204
                  00000000000A3284827D4E756F6A6561605D9090908E92040000000000063388
                  55817D50756F6A6605050505050592040000000000092D594356825179756F6B
                  6763605D908E920400000000000B3505055705057D05056F05056105058E9204
                  0000000000102E8B34454286827D7775709D66995E95910400000000001226A3
                  8C5B454256817C9F756F6965989794040000000000152705050505050585817D
                  4F736F9D65615F0400000000001722A72C2F468A454154827D4E756F6A9B4C04
                  00000000001922050505050505050505057C4E736C6A640400000000001C22A8
                  A81A2A38465C455840817B4D736D680400000000001B22050505050505050505
                  053F537C787274040000000000202BA8A8A8A8A62A2F368A45573F817F808304
                  00000000001F2BA805050505050505055A44A1A289A5870400000000001E2B05
                  A8A8A8A8A8A6A43705280D110F0E0E160000000000251405A8A8A8A8A8A829A4
                  051D0C303B3A39010000000000242105A8A8A8A8A8A8A81A05180C4B49470100
                  00000000002421A80505050505050505A8130C3C4801000000000000002402A8
                  A8A8A8A8A8A8A8A8A8070C4A0100000000000000002323232323232323232323
                  23230C0100000000000000000000000000000000000000000000000000000000
                  0000}
                OnClick = SpeedButton11Click
                ExplicitLeft = 406
              end
              inherited SpeedButton12: TSpeedButton
                Top = 55
                Hint = 
                  'Reativar boleto - Retirar boleto do status inativo ou cancelado ' +
                  '- [BOL018]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF0082C10082C10082C10082C1FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF0588C472C7E950C6F62DAFE7169CD70082C100
                  82C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0284C25BB8DD93E2FE52CC
                  FF5AD0FF5CD1FF5CD0FF48C4F71C9FDA0083C20082C10082C10082C10082C1FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1
                  1F9ACEAAE2F653CCFF54CCFE55CCFE55CCFE56CCFF59D0FF5FD4FF5ED3FF58CE
                  FF41BDF21197D30082C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59734241
                  56CEFE56CEFE58CFFE5BD1FF60D5FF5FD4FF5DD1FF5CD1FF0082C1FF00FFFF00
                  FFFF00FFFF00FFFF00FF92625AFEDDBCFFD9B4FFD5ACFFD1A5FFCE9DFECA97FF
                  C7904F802E0D530B045F09066D0F0F7929238E6249BFCC5BD4FE5DD5FF62D8FF
                  4AC5F60082C1FF00FFFF00FFFF00FFFF00FF98665DFFEEDAFEE9D0FFE2C5FEDD
                  BAFFD7AFFFD1A5FFCE9DA4A560424928228C58076D14047E0A05810C046B0B3D
                  AD9F63DCFE63DAFE43C4EF0082C1FF00FFFF00FFFF00FFFF00FFA06C5FFEF3E5
                  FFEEDAFEE9D0FFE2C5FEDDB8FFD7AFFFD3A5FFCC9A73424167E1FE54CBD0046B
                  0B098E130D991C046B0B49BCB46AE2FE43C6ED74E9FF0082C1FF00FFFF00FFFF
                  00FFA77463FEF7EEFEF2E5FEEDDAFEE7CFFEE2C4FFDCB8FFD8AFFED1A4734241
                  6BE7FF6CE7FF4FC5BC046B0B16A929149D27046B0B68E1EE4ACEEF7EF2FF0082
                  C1FF00FFFF00FFFF00FFB17D67FEFBF7FEF7EFFEF2E6FEEEDAFFE7D0FEE2C4FF
                  DDBAFED5AD73424174F0FF6FEFFF6EEDFE1C863E18A42D22BA3E046B0B48BA9E
                  4FD4EF7DF6FF80F8FF0082C1FF00FFFF00FFBB8369FEFEFCFEFBF6FEF7EEFEF2
                  E6FEEEDAFEE9CFFEE2C4FEDAB8734241C9F7FBA6FAFE83F6FF2C9A5F189F2E29
                  C44B20AA3A046B0B56DAEF88FBFF8EFFFF2BB0D90082C1FF00FFC48B6CFEFEFC
                  FEFEFCFEFBF6FFF7EEFFF2E5FFEDDAFEE9CFFEE1C27342410A8ABB70C7DED7EE
                  EA418E4F1DA4352FCA5531C657046B0B88C6BC8CC9C28FCAC096DCDC0082C1FF
                  00FFCC9370FEFEFCFEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1AFA79395734241
                  046B0B046B0B046B0B046B0B28B74835CF5F3BD569046B0B046B0B046B0B046B
                  0BC4D5D598E2F20082C1D59C74FEFEFEFEFEFEFEFBFAFEFAF4FEF6EEA0675BA0
                  675BA0675B9D65594DC4DE046B0B19982E31C75736CE603BD4693FD86E40DA72
                  1E9A37046B0BE3E9D7D8C9C9E2F7FC0082C1DCA175FEFEFEFEFEFEFEFEFEFEFC
                  FBFEFAF6A0675BE5A154DC832A63DDFF63DDFF57CCE2046B0B2AB54B41DE733F
                  D86F42E07627AB45046B0B007FB20082C10082C10082C10082C1E1A577D1926D
                  D1926DD1926DD1926DD1926DA0675BEB9E436AE6FF66E6FF62E6FF63E6FF8A6E
                  51046B0B31C05846E57D29B049046B0BEBD3ABFFD8AFFED1A4734241FF00FFFF
                  00FFFF00FF0082C1B7FFFF68F2FF76F2FF76F2FF76F2FF75F2FF74F0FF89FCFF
                  A4FFFF9AFFFFB17D67BFD7BB046B0B22A13D046B0BE5DABBFEE2C4FFDDBAFED5
                  AD734241FF00FFFF00FFFF00FF0082C18ED7EB89FCFF70FBFF77FBFF77FBFF77
                  FBFF81FCFF6CE1F20082C10082C1BB8369FEFEFCA1C69E046B0BD5DCC1FEEEDA
                  FEE9CFFEE2C4FEDAB8734241FF00FFFF00FFFF00FFFF00FF0082C1E6FFFFAAFF
                  FFAAFFFFAAFFFFAFFFFF86F2FA0082C1FF00FFFF00FFC48B6CFEFEFCFEFEFCFE
                  FBF6FFF7EEFFF2E5FFEDDAFEE9CFFEE1C2734241FF00FFFF00FFFF00FFFF00FF
                  FF00FF0082C10082C10082C10082C10082C10082C1FF00FFFF00FFFF00FFCC93
                  70FEFEFCFEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1AFA79395734241FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFD59C74FEFEFEFEFEFEFEFBFAFEFAF4FEF6EEA0675BA0675BA067
                  5B9D6559FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFDCA175FEFEFEFEFEFEFEFEFEFEFCFBFEFAF6
                  A0675BE5A154DC832AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1A577D1926DD1926DD1
                  926DD1926DD1926DA0675BEB9E43FF00FFFF00FFFF00FFFF00FF}
                Visible = False
                OnClick = SpeedButton12Click
                ExplicitTop = 55
              end
              inherited SpeedButton23: TSpeedButton
                Left = 691
                Hint = 'Parar processamento - [BOL019]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200008200018600058E0005
                  8E000186000082000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200058E010F9F021BAF
                  021DB1021DB1021DB1021DB1021BAF010F9F00058E000082FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000820002880114A502
                  1DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB10114A5
                  000288000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000820006
                  91021BB5021DB5021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB102
                  1DB1021DB1021DB1021BAF000691000082FF00FFFF00FFFF00FFFF00FFFF00FF
                  000082000692021EC2021EC1021DBB021DB6021DB1021DB1021DB1021DB1021D
                  B1021DB1021DB1021DB1021DB1021DB1021DB1021DB1000691000082FF00FFFF
                  00FFFF00FFFF00FF000288011CCB011ECF021EC9021EC2021DBC021DB7021DB2
                  021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021DB1021B
                  AF000288FF00FFFF00FFFF00FF0000820115BD011FDC011ED5011ED0001BC907
                  26C72F4DCF011BB7011CB2021DB1021DB1021CB10018AF2744C20F2DB80018AF
                  021DB1021DB1021DB10114A5000082FF00FFFF00FF000593011FE6011FE3011F
                  DD011ED80723D39FB0EFFEFEFF657DDD0016B7011BB4021CB10014AC4460CBF7
                  F8FCC0CAEF112DB8021DB1021DB1021DB1021DB100058EFF00FF0000820111BC
                  011FF2011FEB011FE5011FDE1131DDEAEEFCFFFFFFFFFFFF647DDE0016B80013
                  B1445FCBF7F8FEFFFFFFFFFFFF2C49C4021DB1021DB1021DB1021DB1010F9F00
                  0082000082011CE2011FF8011FF3011FED011FE60019DE2949E3E5E9FBFFFFFF
                  FFFFFF5670DA3E5AD1F7F8FEFFFFFFFBFBFE4C67CE0018AF021DB1021DB1021D
                  B1021DB1021BAF0000820001870221EF0323FA0121FA011FF4011FEE011FE700
                  16DE2848E3E3E9FCFFFFFFFCFCFFFBFBFFFFFFFFFAFAFE4C67CF0015AC011CB1
                  021DB1021DB1021DB1021DB1021DB10001860005970729FA0F31FA0425FA011F
                  FA011FF6011FEF011FE90015E02243E5E2E7FCFFFFFFFFFFFFF6F7FE4462D500
                  13B5021CB2021DB1021DB1021DB1021DB1021DB1021DB100058E0005981135FA
                  2D4FFB1033FA011FFA011FFA011FF7011EF20016EA3857EDE6EBFCFFFFFFFFFF
                  FFF6F7FE5672DD0017BF011CBB021DB5021DB1021DB1021DB1021DB1021DB100
                  058E0001881638F64C6BFC274AFB0222FA011FFA001FFA0017F84262F7F7F8FF
                  FFFFFFF0F3FEE9EDFCFFFFFFFFFFFF647EE10017C0011CBC021DB6021DB2021D
                  B1021DB1021DB1000186000082102FEF5C79FC506EFC0C2DFA011FFA001CFA42
                  63FCF7F8FFFFFFFFFBFBFF3F5DEF2342E7E5E9FCFFFFFFFFFFFF657EE2021CC4
                  021DBD021DB8021DB2021DB1021BAF000082000082071ACB506EFC8299FC2D50
                  FB0323FA1133FAF8FAFFFFFFFFFBFBFF4968FA0017EE0015E62848E9E5E9FCFF
                  FFFFFFFFFF2C4BD7021EC5021EBF021DBA021DB4010F9F000082FF00FF01079E
                  2D4FFB92A6FE768FFC1A3EFB031FFA7991FCEDF0FF4A69FC0017FA001FF7011F
                  F00016E72849EADEE5FB96A7F20723D4021ECC021EC6021EC1021DBA00058EFF
                  00FFFF00FF0000820D26DD5F7BFCADBDFE6F8AFC173AFB0221FA1438FB001CFA
                  001FFA011FFA011FF8011FF30019EB0F31E90323E0001CD9011ED4011ECE021E
                  C70114AD000082FF00FFFF00FFFF00FF0003911B3CF47992FCBFCBFE7F97FC2D
                  4FFB0A2DFA0221FA011FFA011FFA011FFA011FF8011FF4011FEE011FE7011FE1
                  011FDC011ED5011CC6000288FF00FFFF00FFFF00FFFF00FF000082020AA72346
                  FB7D95FCC1CCFEA3B4FE5F7BFC2D4FFB1538FB0A2DFA0628FA0628FA092BFA0D
                  2FF70C2DF00524EA011FE2011ED5000693000082FF00FFFF00FFFF00FFFF00FF
                  FF00FF000082020AA71C3EF46984FCAFBDFEBFCBFEA5B6FE8198FC647FFC516F
                  FC4A69FC4565FB3658FB1A3EF80626F0011CDE000696000082FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FF0000820003920F28DE3658FB6782FC8AA0FE
                  99ACFE93A7FE8299FC6984FC4767FC2245FB0A2CF70116CE00028B000082FF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008202
                  08A00A1ECF1839F42346FA284BFB2346FB173AF60A29EB0314C5000598000082
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF00008200008200018900059D00059C00018900008200
                  0082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton23Click
                ExplicitLeft = 691
              end
              inherited SpeedButton24: TSpeedButton
                Left = 577
                Hint = 'Emitir Promiss'#243'rias do Boletos Selecionados - [BOL026]'
                Glyph.Data = {
                  A6030000424DA603000000000000660100002800000018000000180000000100
                  08000000000040020000120B0000120B00004C0000004C00000000000000FFFF
                  FF00FF00FF00FEFEFE00FDFDFD00FCFCFC00FAFAFA00F9F9F900F8F8F800F6F6
                  F600F5F5F500F3F3F300F1F1F100F0F0F000EFEFEF00EEEEEE00EDEDED00ECEC
                  EC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500E4E4
                  E400E2E2E200E1E1E100DFDFDF00DEDEDE00DDDDDD00DCDCDC00DBDBDB00DADA
                  DA00D9D9D900D8D8D800D7D7D700D6D6D600D5D5D500D4D4D400D3D3D300D2D2
                  D200D1D1D100D0D0D000CFCFCF00CECECE00CDCDCD00CCCCCC00CBCBCB00CACA
                  CA00C9C9C900C8C8C800C7C7C700C6C6C600C5C5C500C4C4C400C3C3C300C2C2
                  C200C0C0C000BABABA00B9B9B900B8B8B800B7B7B700A4A4A400A3A3A300A2A2
                  A200A1A1A100A0A0A0009F9F9F009B9B9B0094949400939393008F8F8F008C8C
                  8C008A8A8A008686860002020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202024949494949
                  494949494949494949494949020202020202491D1F23272A2C2F3233323D4242
                  3B20242A490202020202471B26292C2F333536373A44413F2C10142349020202
                  0202471D272A2D31343538373A4341402E101523490202020202471E282C2F31
                  33363839373E43433C25281E4902020202024720474747474747474739353734
                  2B29201049020202020247202A2E3134353639393936322E28211B0E49020202
                  02024723474747474747474747474747471E180849020202020247242D303335
                  3638393936332F29231B120849020202020249292A2C30363939393936332E28
                  20180D014946464646020248494A49494747474747474747474747472416110D
                  094602020202024611181A1D1F2224252729292A4B1617120745020202020246
                  0C1416191A1D1E1F212120204B4B120B05450202020202460F16181A1D1F2020
                  2222201A394B4B4B03450202020202460F454545454545454545201D17234B4B
                  014502020202024612191A1B1D1F20222220201D191209040145020202020246
                  13454545454545454545454545454506014502020202024614191B1D1F202222
                  22201D1A16100A040145020202020246171518191A1C1D1D1C1A17130D090301
                  0346020202020202464646464646464646464646464646464602020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202}
                OnClick = SpeedButton24Click
                ExplicitLeft = 577
              end
              inherited SpeedButton25: TSpeedButton
                Left = 177
                Hint = 'Ver registros da lixeira - [BOL007]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 177
              end
              inherited SpeedButton26: TSpeedButton
                Left = 520
                Hint = 
                  'Imprime Fatura de NF - Limitado: Imprime at'#233' os dois primeiros b' +
                  'oletos selecionados - [BOL025]'
                Glyph.Data = {
                  76030000424D7603000000000000360000002800000011000000100000000100
                  18000000000040030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000
                  00000000000000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF
                  BFBFBFBFBFBF000000000000000000000000000000000000000000000000BFBF
                  BF00BFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBFBFBF000000007F7F
                  007F7F007F7F007F7F007F7F00000000000000000000BFBFBF7F00007F00007F
                  00007F00007F00007F0000BFBFBF000000000000000000000000000000000000
                  000000007F7F00000000BFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBF
                  BFBF000000FFFFFFBFBFBFFFFFFFBFBFBFFFFFFFBFBFBF00000000000000BFBF
                  BFBFBFBFBFBFBFBFBFBF7F0000BFBFBFBFBFBFBFBFBF00000000000000000000
                  0000000000000000BFBFBF7F7F7F00000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
                  0000BFBFBF00BFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBF
                  BF000000FFFFFF7F7F7F7F7F7FFFFFFF000000BFBFBFBFBFBF00BFBFBFBFBFBF
                  BFBFBF000000FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF000000FFFFFFFFFF
                  FFFFFFFFFFFFFF000000BFBFBF00BFBFBF000000000000000000000000000000
                  FFFFFF000000BFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBF
                  BF00BFBFBF000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000BFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F
                  7F7FFFFFFF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F7F7FFFFFFF000000000000BF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
                  BF000000FFFFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF0000000000000000000000
                  00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                  BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
                  BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00}
                OnClick = SpeedButton26Click
                ExplicitLeft = 520
              end
              object SpeedButton17: TSpeedButton
                Left = 756
                Top = 0
                Width = 16
                Height = 109
                Margins.Top = 30
                Align = alRight
                Caption = 'v'
                OnClick = SpeedButton17Click
                ExplicitLeft = 816
                ExplicitTop = 1
                ExplicitHeight = 53
              end
              object SpeedButton9: TSpeedButton
                Left = 7
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Cancelar boleto  - [BOL020]'
                Flat = True
                Glyph.Data = {
                  FA020000424DFA02000000000000BA0000002800000018000000180000000100
                  08000000000040020000120B0000120B0000210000002100000000000000FFFF
                  FF00FF00FF000635CE000734C6000736C5000436F1000436EC000536E7000534
                  E2000536E1000534DE000535DD000633D9000635D8000633D3000635D2000633
                  CF000733CA000734C8000337FF000337FE000335FC000335FB000337FB000435
                  F6000437F6000435F1000434EC000534E800AFBEFA00D1D9FA000104A2000202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202202020202020
                  2020202020202020202002020202020202201E141414181A0607080A0C0E1003
                  1313200202020202022001141515181A0607080A0C0E10031305200202020202
                  02200116171717191B1C1D090B0D0F1112042002020202020220010101010101
                  01010101011F1F1E1E1E20020202020202022020202020202020202020202020
                  2020020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  020202020202020202020202020202020202020202020202020202020202}
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SpeedButton9Click
              end
              object SpeedButton10: TSpeedButton
                Left = 63
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Vincular boleto ao cr'#233'dito - [BOL021]'
                Flat = True
                Glyph.Data = {
                  52060000424D5206000000000000120400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F7000000F700000000000000FFFF
                  FF00FF00FF00BDBBBB00BBBABA008E5D5900694542006A4541006E443B006D41
                  3600821F0000811E00008B2500008A240000872200008421000087230100FAF4
                  F200FBF8F70082300E009C310000962F0100A6380000A6390000A4380000A336
                  0000A3370000A1350000A1360000A0350000B46B4700AC3F0000A73A00009F39
                  03009D43120096502800915F4400B6450000B5440000B1420000B0410000B646
                  01009A451200A9704D00B8480000A64D1100AF623000AA500F00B4672C00B8A9
                  9E00D7600000BA5F1700B8641F00CF824500CE814500CC824500CB824500CA82
                  4500BD7B4500D3925D00D1915D00CF915D00FEF3EA00C7814500C6814500CC91
                  5D00CA905D00FFF4EA00FEF3E900C6905D00C5915D00BB916900FFD0A300FFD1
                  A300FED0A300FED1A400FFD7B000FFD8B000FED7B000FFDEBD00FFDEBF00FEDE
                  BF00FEE5CC00FFEDDC00FEEDDC00B6AA9E00FEF4EA00D5812700FFE0BD00FFE6
                  CC00FEE6CC00FFEEDC00FEEEDC00AFA79E00FEF4E900B2A99E00FEFAF400A5A1
                  9500ABA99F00A3A193009EA19300878B810099A09300959F9300445C4A00C6D3
                  CB008EA39C00B6BABA00A4BBBD00DAFBFF00F4FEFF009AF2FF009CF2FF00B7F6
                  FF0090C0C7009AC9D000C4EDF300A7CACF00CEF6FC00D3FAFF00D1F3F800D8FA
                  FF00DEFAFE00E6FCFF00A9B8BA00EEF6F700F7FEFF0081EDFF0083EDFF0083EE
                  FF0084EDFF0086EEFF0087EEFF0088EDFF0088EEFF0089EEFF008AEEFF008BEF
                  FF008CEEFF008CEFFF008FEEFF0090EEFF0091EFFF0092EFFF0093EFFF0095EF
                  FF0095F0FF0096EFFF0096F0FF0097EFFF0097F0FF0098EFFF0098F0FF0099F0
                  FF009AF0FF009CF0FF009DF0FF009EF0FF009EF2FF009FF2FF00A1F2FF00A3F2
                  FF00A4F2FF00A5F2FF00A6F2FF00A7F3FF00A9F2FF00AAF2FF00AAF3FF00ABF3
                  FF009FE2EE00ACF3FF00ADF3FF00A9EAF600B0F3FF00B0F4FF00B1F3FF00B1F4
                  FF00B2F4FF0086B7BF00B4F4FF008CBFC700B5F4FF00B6F4FF00ADE9F300B7F4
                  FF00B8F4FF00B8F4FE00BAF4FE00BCF6FF00B5EAF300BFF6FF00C0F6FF00C1F6
                  FF00C2F6FF00BCEEF700C4F6FF00C4F7FF00BCEBF300C7F7FF00C0EEF600C9F7
                  FF00AAD0D700CBF7FF00CFF8FF00CFF7FE00CBEDF300D7F8FE00DEFAFF00E1FB
                  FF00DCF3F700E2F4F700EBFCFF00ACB8BA00F8FEFF00A0F0FF00A1F0FF008ABF
                  C900BBF4FF00BCF4FF00C5EFF700B1D1D700D7F2F700E5FAFE00EBFBFE00EEFC
                  FF00E9FBFF00E7F4F700F0FBFE00F2FCFF0000BDFF000A597600B2B8BA00F6FC
                  FE000081BD000080BC00007EB800007DB700007DB600017FB800017EB600FCFE
                  FF00FBFCFE00FEFEFF00FEFEFE00F8F8F800F4F4F40002020202020202EAEAEA
                  EAEAEAEAEAEAEAEAEAEAEAEAEA0202020202020202EAA19E6F95908E8B888582
                  807F7F7FEA0202020202020202EAA8A4A09D99948F8C89878482817FEA020202
                  0202020202EAB0ABA6A29F7098928E8C88868381EA0202020202020202EABBB6
                  AEA9A4A19D9B95908D8A8884EA0205050505050505EAC0BDB9B4ACA7A4A09D99
                  938F8C89EA0205494B4A484948EAC9C4BFBCB7B1ABA6A2D79C97918EEA02054C
                  4C4C4C4D4EEACCCBC7C27372B5D9AAA5A19D9A96EA02054F4F584F5150EA7977
                  76232D2F2A65B3ADA8A4D89EEA020559525A575757EAD06D2B28172127156AB8
                  B1ABA5A3EA02055C53545C5B5CEA7BD13A1F2469221667BEBAB6AFA9EA020544
                  5E43563E43EAD4E2401B6CCF471866C6C1DB71B2EA0205606060575757EAE5E1
                  3F1D7C7A461C6474C9C5C0DAEA0205F4F4F4F4F4F4EA7E6E391DD5DF451C63CE
                  CDDCC8C3EB0205F4F4F4F4F4F4EAF1D6381DE8E0421A61DE78DD75CAEC0205F4
                  F4F4F4F4F4EA01F3371D6BE4411A62D2EBEDEEEDEB0205F4F4F4F4F4F4EA0101
                  351D04E93D1A5DD3EAE6E6E6EA0205F4F4F4F4F4F4EA0101361C03F23C1A5FE3
                  EAE6E6EA020205F4F4F4F4F4F4EA01011E1012013B1A557DEAE6EA02020205F4
                  F4F4F4F4F4EAEAEAEFF0EAEA681AE7EDEAEA0502020205F4F4F4F4F4F4F4F4F4
                  F4F5F4112E2031F6F4F405020202050505050505050505060806071326140905
                  0505050202020202020202020202293233303425190B02020202020202020202
                  020202020202022C0F0E0D0C0A020202020202020202}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton10Click
              end
              object SpeedButton21: TSpeedButton
                Left = 120
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Gera'#231#227'o de Carne (Boletas) - [BOL027]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000130B0000130B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FF6C8C9C293643293643293643293643293643293643293643293643293643
                  293643293643293643293643293643FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FF6C8C9C335D71335D71335D71335D71335D71335D71335D7133
                  5D71335D71335D715CCAE177DEEB85E9F098F8F8293643FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C90F2F553A3B753A3B753A3B753A3
                  B753A3B753A3B753A3B753A3B753A3B7335D715CCAE177DEEB85E9F0293643FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C2936436C8C9C98F8F890F2F5
                  88EBF280E5EF78DFEB70D9E868D3E561CEE359C8E053A3B75CCAE1335D715CCA
                  E177DEEB293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C335D71335D716C
                  8C9C98F8F898F8F890F2F588EBF280E5EF78DFEB70D9E868D3E561CEE353A3B7
                  98F8F85CCAE1335D715CCAE1293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C
                  9C90F2F553A3B76C8C9C98F8F898F8F898F8F890F2F588EBF280E5EF78DFEB70
                  D9E868D3E553A3B753A3B753A3B753A3B7335D71293643FF00FFFF00FFFF00FF
                  6C8C9C2936436C8C9C98F8F890F2F56C8C9C98F8F898F8F898F8F898F8F894F5
                  F788EBF280E5EF78DFEB70D9E868D3E561CEE359C8E053A3B7335D71293643FF
                  00FFFF00FF6C8C9C335D71335D716C8C9C98F8F898F8F86C8C9C98F8F898F8F8
                  98F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA68D3E561CEE353A3
                  B7335D71293643FF00FFFF00FF6C8C9C90F2F553A3B76C8C9C98F8F898F8F86C
                  8C9C98F8F898F8F898F8F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED
                  74DCEA6CD6E753A3B7335D71293643FF00FFFF00FF6C8C9C98F8F890F2F56C8C
                  9C98F8F898F8F86C8C9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F894
                  F5F78CEFF484E8F07CE2ED74DCEA53A3B7335D71293643FF00FFFF00FF6C8C9C
                  98F8F898F8F86C8C9C98F8F898F8F86C8C9C98F8F898F8F898F8F898F8F898F8
                  F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA335D716C8C9CFF
                  00FFFF00FF6C8C9C98F8F898F8F86C8C9C98F8F898F8F86C8C9C6C8C9C6C8C9C
                  6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9CFF00FFFF00FFFF00FF6C8C9C98F8F898F8F86C8C9C98F8F898F8F898
                  F8F898F8F898F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA53A3B7
                  335D71293643FF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C98F8F898F8F86C8C
                  9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F898F8F894F5F78CEFF484
                  E8F07CE2ED74DCEA335D716C8C9CFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C
                  98F8F898F8F86C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9CFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898F8F898F8F894F5F7
                  8CEFF484E8F07CE2ED74DCEA53A3B7335D71293643FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF6C8C9C98F8F898F8F898F8F898F8F898F8F898
                  F8F898F8F898F8F894F5F78CEFF484E8F07CE2ED74DCEA335D716C8C9CFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C8C9C6C8C9C6C8C9C6C8C
                  9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C8C9C6C
                  8C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton21Click
              end
              object SpeedButton13: TSpeedButton
                Left = 178
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Emitir Recibos dos Boletos Selecionados - [BOL028]'
                Flat = True
                Glyph.Data = {
                  02050000424D0205000000000000C20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A3000000A3000000BCBADC00BDB2
                  D000BCACC200FF00FF00BBA6B500B0909900FFFEFE008B5B58008E5D5900905E
                  590093655E00AA807A009E6C630095665E00B5918B009A6A600098685F009F67
                  5A00A06F6400A5726500AB796B00C9A19600F6EFED00AC786700A9766600B17B
                  6900E5D0C900FAF2EF00BA7E6500BA826C00B5806A00BD866D00CA9F8C00D5B1
                  A100EDE0DA00F0E5E000CC917300CA8F7200C58C6F00C1896E00E2C5B600CF8B
                  6400C9876400CE8E6900D1906B00D1967400CF957400DCA78A00CF8E6800D093
                  6F00D4987500E0B69C00EFD4C400F3E2D800F8F0EB00E3BFA700E9CEBB00FFFC
                  FA00FFFBF800FEEEE100FFF3E900FCD0A700FED9B800FEDDC000FFE3C900FEE2
                  C900FEE5CE00FEE6D100FEEAD800FFF4EA00FFF6EE00FFC28400FFC58A00FFC6
                  8C00FFC78E00FFCA9500FFCC9800FFD1A300FFD5AA00FFDDBA00FFDEBC00FCDC
                  BD00FBDCBD00FFEBD700F8E5D300FEEBD900FEF0E200FFF2E500FEF4EA00FEF8
                  F200FFFBF700FFC58600FFC48700FFC58900FFC68B00FFC98C00FFC99100FFCA
                  9100FFCB9300FFCC9700FFCF9C00FFCF9D00FFD09E00FFD09F00FFD1A000FFD3
                  A300FFD4A600FFD4A700FFD7AA00FFD8AD00FFD8AF00FFD9B000FFDAB200FFDC
                  B700FFE0BF00FFE1C000FFE2C400FFE3C400FFE3C500FCE1C500FFE5C900FFE7
                  CC00FFE7CE00FFEBD500FFEDDA00FFEFDD00FFEFDE00FA962100FFCF9800FFD1
                  9C00FFD8AA00FFEAD000FFEED900FFF2E200FFF8F000FEF7EF00FFFAF400FAC6
                  8000F8CB9000FFE2BB00FFF2E100FFE0B500FFE7C400FFF6E900FFEFD500FFFA
                  F200FFF3DE00FFFEFC00FFF7E000FFF7D800FFFEED00FFFFDE00FFFFE300FFFF
                  F000FFFFF400FFFFF700FFFFFA00FFFFFB00FFFFFE0000008200BDBDE500FFFF
                  FF00000000000303030303030311110303030303030303030303030303030303
                  03030303111182111111030303030303030303030303030303030303118E118E
                  8E821109030303030303030303030303030303070A1111111111111111111111
                  1111111111030303030303080A8E8B8D82688061484747474747474711030303
                  030303070D8E52053D3D6881805F5B5B5B5B5B5B110303030303100B1095519F
                  3E8D11111111111111111147110303030303100E0F9477043F8B6967644C4B60
                  4A5E5D5C11030303030310200C94429F418E1111111111111111114911030303
                  03141A2012994402439071706E6C6B4D666463621103030303141A20139D3B9F
                  5590111111111111111111651103030303141522189E3C0156927A7875735071
                  706D4E6A110303031C9E201617A1879F58961111111111111111116F11030303
                  1C9E209E19A15A00599A857E7C5383794074724F110303031C2320A11EA1939F
                  3A9C111111111111111111761103032A352821A11DA1A1A006A188864645578C
                  7D847B971103032B362F38A11FA1A19FA1A11111111111111111119711032B33
                  A12F35A127A1A1A0A1A1A1A1A1A19B969A99989711032B34A12F1BA126A1A1A1
                  A1A1A1A139918F8F9797979711032C29342FA1A125A1A1A1A1A1A1A1A139919B
                  11111111110303033137A1A124A1A1A1A1A1A1A1A1A19DA1118989897F030303
                  293038542EA1A1A1A1A1A1A1A1A1A1A111898A7F03030303030330542DA1A1A1
                  A1A1A1A1A1A1A1A111897F030303030303030329323030303030303030303030
                  117F03030303}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton13Click
              end
              object SpeedButton14: TSpeedButton
                Left = 236
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Exibir Somat'#243'rio - [BOL032]'
                Flat = True
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
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton14Click
              end
              object SpeedButton16: TSpeedButton
                Left = 293
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Boletos Protesto'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FF787878787878787878FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777787878787878FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77777778787878
                  7878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF787878787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF777777787878787878FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777787878787878FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78787878787878
                  7878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF777777787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF777777787878787878FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878787878FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77777778787878
                  7878FF00FF97A2D7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF787878787878787878FF00FF334CCC4A60CEA0A9D9FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF777777787878787878FF00FF334CCC324BCB334CCC4F64
                  CEA8B0D9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777787878787878FF00FF334CCC
                  324BCB334CCC324BCB324BCB576BCFB1B8DBFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77777778787878
                  7878FF00FF334CCC324BCB334CCC324BCB324BCB324BCB344DCC5F72D0FF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF787878787878787878FF00FF334CCC334CCC334CCC334CCC334CCC334CCC33
                  4CCC334CCC334CCC687AD2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF777777787878787878FF00FF334CCC324BCB334CCC324B
                  CB324BCB324BCB334CCC324BCB324BCB334CCC3850CB8693D5FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF777777787878787878FF00FF334CCC
                  324BCB334CCC324BCB324BCB324BCB334CCC324BCB324BCB334CCC324BCB324B
                  CB8492D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78787878787878
                  7878FF00FF334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC
                  334CCC3A52CC808ED5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF777777787878787878FF00FF334CCC324BCB334CCC324BCB324BCB324BCB33
                  4CCC324BCB455BCD8693D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FF777777787878787878FF00FF334CCC324BCB334CCC324B
                  CB324BCB334CCB6476D1A8B0D9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878787878787878FF00FF334CCC
                  334CCC334CCC465CCE8693D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77777778787878
                  7878FF00FF364ECC6375D1A9B1DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FF777777787878787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton16Click
              end
              object SpeedButton18: TSpeedButton
                Left = 350
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Marcar Boleto como Devolvido - [BOL036]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FF7979795252524D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D525252757575FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF515151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5252
                  52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF525252FFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFAFAFAFBFBFBFF00FFFF00FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCCFF00
                  FFFF00FF334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D4DFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF
                  00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334C
                  CC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                  FEFEFEFEFEFEFEFEFEFEFEFBFBFB525252FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFBFBFB525252FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D5252
                  52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF
                  00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFDFDFDFFFFFF
                  FFFFFFBABABA616161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334C
                  CC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D
                  4D4DFDFDFDFFFFFFBBBBBB616161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF4D4D4DFDFDFDBFBFBF616161FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525252BDBDBD616161FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8
                  B8B84D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D525252676767FF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton18Click
              end
              object SpeedButton19: TSpeedButton
                Left = 406
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Desmarcar Boleto como Devolvido - [BOL036]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FF7979795252524D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF515151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF00FF334CCC334CCC334CCC334CCC334CCC334CCC334C
                  CC334CCC334CCC334CCCFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF334CCC334CCC334CCC334CCC
                  334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FFFF00FF4D4D4DFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF334CCC33
                  4CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCC334CCCFF00FFFF00FF
                  FF00FF4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4D4D4DFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF525252FFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFAFAFAFBFBFBFF00FFFF00FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCCFF00
                  FFFF00FF334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D4DFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD4D4D
                  4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF
                  00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFDFDFD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334C
                  CC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
                  FEFEFEFEFEFEFEFEFEFEFEFBFBFB525252FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFBFBFB525252FF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D5252
                  52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF
                  00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFDFDFDFFFFFF
                  FFFFFFBABABA616161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF334CCC334C
                  CC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D
                  4D4DFDFDFDFFFFFFBBBBBB616161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFF4D4D4DFDFDFDBFBFBF616161FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF334CCC334CCC334CCC334CCCFF00FFFEFEFEFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525252BDBDBD616161FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8
                  B8B84D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D525252676767FF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton19Click
              end
              object SpeedButton20: TSpeedButton
                Left = 634
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Enviar E-mail - [BOL038]'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E
                  5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59
                  8E5D598E5D598E5D598E5D598E5D59FF00FFFF00FF8E5D59AC7967EBB283FFC4
                  8BFFC48AFEC48AFFC48BFFC48BFFC48AFFC48AFFC48BFFC48AFFC48AFFC48AFF
                  C48AFFC48BFFC48BFFC48BFFC48BFFC58BEBB282AC79678E5D59FF00FF8E5D59
                  D9A784A67567F7C596FFCB98FECB98FFCB99FFCB98FFCB99FECB98FFCA98FECB
                  99FECB99FFCB98FFCB99FFCB98FECB98FFCB99FFCB98F8C596A67567D9A6848E
                  5D59FF00FF8E5D59FED4AAC2937EBA8A78FFD4A9FFD4AAFFD4AAFFD4AAFED4AA
                  FED4AAFFD4A9FFD4AAFED4AAFFD4AAFED4AAFED4AAFFD4AAFFD4AAFFD4AAB88A
                  78C2937EFED4AA8E5D59FF00FF8E5D59FEDEBDFBDABBAC8075D1AA95FEDEBCFF
                  DDBCFFDEBCFEDEBCFEDDBDFFDDBDFFDDBDFFDEBCFEDDBDFEDEBDFEDEBCFFDDBC
                  FFDDBDD1AA95AC8074FCDABAFFDEBC8E5D59FF00FF8E5D59FEE7D0FFE7D0F0D5
                  C2A1756DE9CBB7FFE7D0FFE7D0FEE7D0FFE7D0FEE7D0FFE7D0FEE7D0FEE7D0FE
                  E7D0FEE7D0FEE7D0E7CBB8A1756DEFD5C1FEE7D0FEE7D08E5D59FF00FF8E5D59
                  FEF0E2FEF0E3FEF0E2DDC5BBA37873F6E6DAFFF0E3FEF0E3FEF0E3FEF0E2FEF0
                  E3FEF0E2FEF0E3FEF0E2FEF0E2F7E6DAA37873DEC5BAFEF0E2FEF0E3FEF0E28E
                  5D59FF00FF8E5D59FEF8F2FEF8F3FEF8F2FFF7F3C5A7A3B5918CFEF8F3FEF8F3
                  FEF8F2FEF7F2FEF8F3FEF8F2FEF8F3FEF8F2FFF8F3B5918CC5A9A4FEF7F3FEF8
                  F3FEF8F2FEF8F28E5D59FF00FF8E5D59FEFEFEFEFEFEFEFEFEFEFEFEFCFBFBAD
                  8987CCB5B4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECAB2B0AF8B88
                  FCFBFBFEFEFEFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59FEFEFEFEFEFEFEFE
                  FEFCFBFBC7ADACAC8884986B68986B68986B68986B68986B68986B68986B6898
                  6B68986B68C2A6A4FCFBFBFEFEFEFEFEFEFEFEFEFEFEFE8E5D59FF00FF8E5D59
                  FEFEFEFEFEFEF0EBEAAD8986B4918FF4F0F0FEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEF4F0F0B4918FAD8986F0EBEAFEFEFEFEFEFEFEFEFE8E
                  5D59FF00FF8E5D59FEFEFEDCCCCAA07673CEB6B5FEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECEB6B5A07673DCCC
                  CAFEFEFEFEFEFE8E5D59FF00FF8E5D59C6ACAAA57E7AACACACFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEE9DEDDA57E7AC6ACAAFEFEFE8E5D59FF00FF8E5D59A18687A5E6E6ACAC
                  ACFFFFFFFBFFFFFAFFFFF6FFFFF6FFFFEFFFFFEFFFFFEFFFFFF2FFFFF2FFFFF4
                  FFFFF6FFFFF4FFFFEFFFFFE7F6F6D1E1E1B5B7B7B29D9D8E5D59FF00FF8E5D59
                  A69598A7FEFFACACACFEFFFFFBFFFFFBFFFFFBFFFFFFFFFFFFFFFFFFFFFFFBFF
                  FFEEF7F7D5DEE0C1CCCEB6BDBFADB4B5ACADADAAADAFA1AFB49AACB2A390928E
                  5D59FF00FFFF00FF8E5D59B89696ACACACFFFFFFFFFFFFFFFFFFE9EBEBCED5D7
                  BDC5C6B1BABAAAAFB0AAACADA3ADB097AFB589AFBA7EAFC073B1CC67BAE079AA
                  C7A683898E5D59FF00FFFF00FFFF00FFFF00FF8E5D59C69695ADB4B5ABBABAAC
                  ACACA5B6B89ABABC8FBFC581C9CF76D1DA6DD8E76ED8EB70D4EB72D1ED6FD7F7
                  6DD7FC91ADC28E5D598E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D
                  5997747299B6BB72F0FB6BF6FF70EAFA72EBFB72EEFC74EFFF74F0FF75EDFE76
                  E7FC6FEBFF77DAF49AA9B68E5D59FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF8E5D59B0959686D1D96BFFFF72F6FF74EFFF74EF
                  FF74EFFF70F4FF6DF8FF87CAD9B092968E5D59FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D5998BABF
                  77EBF66DFBFF6DFBFF6EF8FF75EEFB98BABF8E5D598E5D59FF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF8E5D598E5D599DAFB295BBC19EADB08E5D598E5D59FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D59FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SpeedButton20Click
              end
              object SpeedButton22: TSpeedButton
                Left = 463
                Top = 55
                Width = 51
                Height = 45
                Hint = 'Arquivos Remessa/Retorno'
                Flat = True
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF0082C10082C10082C10082C1FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0BFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF0588C472C7E950C6F62DAFE7169CD70082C100
                  82C10082C10082C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF046B0B046B0B
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0284C25BB8DD93E2FE52CC
                  FF5AD0FF5CD1FF5CD0FF48C4F71C9FDA0083C20082C10082C10082C10082C1FF
                  00FF046B0B088111046B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1
                  1F9ACEAAE2F653CCFF54CCFE55CCFE55CCFE56CCFF046B0B046B0B046B0B046B
                  0B046B0B046B0B046B0B046B0B0E971C088211046B0BFF00FFFF00FFFF00FFFF
                  00FFFF00FF0082C10F93CA76C6E57FDCFF54CEFE56CEFE56CEFE56CEFE046B0B
                  3DDA6E37D36431CB592BC24E24BA431FB03818A72E139F250F991E098312046B
                  0BFF00FFFF00FFFF00FFFF00FF0082C11C9DD130A4D4ABE9FA56D3FE5CD4FE5C
                  D4FE5CD4FE046B0B43E1773FDC6F39D46633CC5B2DC45126BB451FB13A19A930
                  14A1280F9A1F098313046B0BFF00FFFF00FFFF00FF0082C138B1E00E91C998D9
                  EF76E1FF62D9FE62DAFE62DAFE046B0B46E57D44E27940DD723AD56834CE5D2D
                  C55227BC4721B43C1BAB3315A328119C21098313046B0BFF00FFFF00FF0082C1
                  45BBEA0F92CC43AFD8ADDCE56BBBCF70BCD06FBCD0046B0B46E57D46E57D44E3
                  7A41DD743CD76A35D05F2FC75528BF4A22B63F1CAD340E8C1D046B0BFF00FFFF
                  00FFFF00FF0082C14AC1F227A4DD1892C6B5E7F097E5E98FE2E78FE2E5046B0B
                  46E57D46E57D46E57D46E57B41DE753DD86C36D16230C9572AC04C159829046B
                  0BFF00FFFF00FFFF00FFFF00FF0082C14EC4F63BB4EF1682B258BCDECAF8F39D
                  F0EA9EF0E9046B0B046B0B046B0B046B0B046B0B046B0B046B0B046B0B38D365
                  1DA336046B0B80F8FF0082C1FF00FFFF00FFFF00FF0082C15CC9FB41B8FA526F
                  811391C7A6DEEEC9F0F6C9F2F6CAF3F6D1F7F6C0F6EEA7F0E59AEEE39CEDE29D
                  EDE2046B0B23AC41046B0B88FBFF8EFFFF2BB0D90082C1FF00FFFF00FF0082C1
                  72D0FF44BFFF9C6B6258ACC70B8AC20B8AC20A8AC2098AC20C8CC578CBE3E5FB
                  F7D0F4EBB5EFE3B1EFE3046B0B046B0B69DCEFA3FCFFA7FFFFA1FBFC0082C1FF
                  00FFFF00FF0082C181D9FF4CC6FFA47264FEEDDAFBE7D5EBE0CEDDD9C7CACFC1
                  8EB8BC138EC134A5D1DDF3F6F2F8F3E5F3E7046B0BB4FAFF84DCEECFFEFFCEFE
                  FFDAFFFF98E2F20082C1FF00FF0082C188E2FF55D1FFAB7867FFF0E5FEEFE0FE
                  EDDAFFE9D4FEE7CFFEE3C7C9CFC12395C0118FC586CCE5EDF6F7E1E2E2E2FCFF
                  C0E9F4F6FFFFF4FFFFFEFFFFE2F7FC0082C1FF00FF0082C191EAFF5BDDFFB27F
                  6AFFF6EEFEF3EAFEF0E5FEEEDEFEEDD8FFE9D4FFE6CCE2D9C775B2C02B98C100
                  82C10082C10082C10082C10082C10082C10082C10082C10082C1FF00FF0082C1
                  96F3FF64E7FFBC876DFEFAF6FFF8F2FEF6EDFEF3E9FFF2E2FFEEDEFEEBD8FFE9
                  D1FEE5CBFEE2C6FFE0C07342417AF4FF0082C1FF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FF0082C1B7FFFF68F2FFC68F6FFEFCFBFEFCF8FEFAF6FEF7F0FEF4ED
                  FFF3E7FEF0E2FEEEDDFEEAD7FEE7D1FFE5CB734241A1FFFF0082C1FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF0082C18ED7EB89FCFFCE9574FEFEFEFEFEFEFE
                  FCFCFEFBF8FEF8F4FEF7F0FEF4EBFEF3E6FEF3E6D5DCD7C2D0CB7342410082C1
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082C1E6FFFFD79C
                  77FEFEFEFEFEFEFEFEFEFEFEFEFEFCFBFEFAF8FEF8F4A0675BA0675BA0675BA0
                  675B926363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FF0082C1DCA378FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFEFCFAA067
                  5BD9995CD18C52DE8B37D9832AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFE2A77AFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFEFEA0675BEEB164E9A758EA9635FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3AA7AFEFEFEFEFEFEFE
                  FEFEFEFEFEFEFEFEFEFEFEFEFEFEA0675BD99F64DC9C5AFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1A5
                  77D1926DD1926DD1926DD1926DD1926DD1926DD1926DA0675BD99F64FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton22Click
              end
            end
            inherited GroupBox2: TGroupBox
              Top = 113
              Height = 275
              ExplicitTop = 113
              ExplicitHeight = 275
              inherited ScrollBox2: TScrollBox
                Height = 258
                ExplicitHeight = 258
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitWidth = 780
          ExplicitHeight = 577
        end
        object ts_outros: TTabSheet
          Caption = 'ts_outros'
          ImageIndex = 12
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 780
            Height = 577
            ActivePage = ts_dados_comuns
            Align = alClient
            TabOrder = 0
            object ts_dados_comuns: TTabSheet
              Caption = 'ts_dados_comuns'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object pn_alt_demaisboletos: TPanel
                Left = 11
                Top = 3
                Width = 708
                Height = 457
                BevelOuter = bvLowered
                BorderWidth = 6
                TabOrder = 0
                OnEnter = pn_alt_demaisboletosEnter
                object Panel10: TPanel
                  Left = 7
                  Top = 7
                  Width = 694
                  Height = 402
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox10: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 694
                    Height = 192
                    Align = alClient
                    Caption = 'Demais boletos de mesmo documento'
                    TabOrder = 0
                    object grid_demaisboletos: TDBGrid
                      Left = 2
                      Top = 15
                      Width = 690
                      Height = 175
                      Align = alClient
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                    end
                  end
                  object Panel12: TPanel
                    Left = 0
                    Top = 192
                    Width = 694
                    Height = 210
                    Align = alBottom
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Panel13: TPanel
                      Left = 0
                      Top = 0
                      Width = 521
                      Height = 210
                      Align = alLeft
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 0
                      object Label35: TLabel
                        Left = 308
                        Top = 9
                        Width = 79
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data de emiss'#227'o'
                        FocusControl = DBEdit14
                      end
                      object Label36: TLabel
                        Left = 107
                        Top = 36
                        Width = 33
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente'
                        FocusControl = DBEdit15
                      end
                      object Label37: TLabel
                        Left = 27
                        Top = 117
                        Width = 113
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Obs. 1 (Demonstrativo)'
                        FocusControl = DBEdit17
                      end
                      object Label38: TLabel
                        Left = 87
                        Top = 90
                        Width = 53
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Mora di'#225'ria'
                        FocusControl = DBEdit18
                      end
                      object Label39: TLabel
                        Left = 228
                        Top = 90
                        Width = 48
                        Height = 13
                        Caption = 'Multa (%)'
                        FocusControl = DBEdit19
                      end
                      object Label40: TLabel
                        Left = 44
                        Top = 63
                        Width = 96
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Local de pagamento'
                        FocusControl = DBEdit20
                      end
                      object Label41: TLabel
                        Left = 3
                        Top = 144
                        Width = 137
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Obs. 2 (Instru'#231#245'es p/ Caixa)'
                        FocusControl = DBEdit21
                      end
                      object Label42: TLabel
                        Left = 44
                        Top = 171
                        Width = 96
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Mensagem Adicional'
                        FocusControl = DBEdit18
                      end
                      object Label43: TLabel
                        Left = 368
                        Top = 90
                        Width = 64
                        Height = 13
                        Caption = 'Dias Protesto'
                        FocusControl = DBEdit22
                      end
                      object DBEdit14: TDBEdit
                        Left = 393
                        Top = 6
                        Width = 120
                        Height = 21
                        DataField = 'DATA_EM_BOL'
                        DataSource = DtmBoletos.dsBoletos
                        TabOrder = 0
                      end
                      object DBEdit15: TDBEdit
                        Left = 146
                        Top = 33
                        Width = 76
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = DtmBoletos.dsBoletos
                        MaxLength = 9
                        TabOrder = 1
                        OnExit = DBEdit9Exit
                        OnKeyDown = DBEdit9KeyDown
                      end
                      object DBEdit16: TDBEdit
                        Left = 228
                        Top = 33
                        Width = 285
                        Height = 21
                        DataField = 'NOME_CLIENTE'
                        DataSource = DtmBoletos.dsClientes
                        MaxLength = 9
                        TabOrder = 2
                        OnExit = DBEdit9Exit
                        OnKeyDown = DBEdit9KeyDown
                      end
                      object DBEdit17: TDBEdit
                        Left = 146
                        Top = 114
                        Width = 367
                        Height = 21
                        DataField = 'OBS_BOL'
                        DataSource = DtmBoletos.dsBoletos
                        TabOrder = 3
                      end
                      object DBEdit18: TDBEdit
                        Left = 146
                        Top = 87
                        Width = 76
                        Height = 21
                        DataField = 'M_DIA_BOL'
                        DataSource = DtmBoletos.dsBoletos
                        MaxLength = 12
                        TabOrder = 4
                        OnEnter = DBEdit_MoraDiariaEnter
                        OnKeyPress = DBEdit_MoraDiariaKeyPress
                      end
                      object DBEdit19: TDBEdit
                        Left = 282
                        Top = 87
                        Width = 76
                        Height = 21
                        DataField = 'MULT_ATR_BOL'
                        DataSource = DtmBoletos.dsBoletos
                        MaxLength = 12
                        TabOrder = 5
                        OnEnter = DBEdit_MultaEnter
                        OnKeyPress = DBEdit_MultaKeyPress
                      end
                      object DBEdit20: TDBEdit
                        Left = 146
                        Top = 60
                        Width = 367
                        Height = 21
                        DataField = 'LOCALPAG'
                        DataSource = DtmBoletos.dsBoletos
                        TabOrder = 6
                      end
                      object DBEdit21: TDBEdit
                        Left = 146
                        Top = 141
                        Width = 367
                        Height = 21
                        DataField = 'OBS_BOL1'
                        DataSource = DtmBoletos.dsBoletos
                        TabOrder = 7
                      end
                      object DBMemo3: TDBMemo
                        Left = 146
                        Top = 168
                        Width = 367
                        Height = 31
                        DataField = 'MENSAGEM_ADC'
                        DataSource = DtmBoletos.dsBoletos
                        MaxLength = 128
                        TabOrder = 8
                      end
                      object DBEdit22: TDBEdit
                        Left = 438
                        Top = 87
                        Width = 75
                        Height = 21
                        DataField = 'DIAS_PROTESTO'
                        DataSource = DtmBoletos.dsBoletos
                        MaxLength = 12
                        TabOrder = 9
                        OnEnter = DBEdit_MultaEnter
                        OnKeyPress = DBEdit_MultaKeyPress
                      end
                    end
                    object Panel14: TPanel
                      Left = 521
                      Top = 0
                      Width = 173
                      Height = 210
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 1
                      OnExit = Panel14Exit
                      object ck_alt_data_emissao: TCheckBox
                        Left = 6
                        Top = 8
                        Width = 163
                        Height = 17
                        Caption = 'Data de emiss'#227'o'
                        TabOrder = 0
                      end
                      object ck_alt_cliente: TCheckBox
                        Left = 6
                        Top = 35
                        Width = 107
                        Height = 17
                        Caption = 'Cliente'
                        TabOrder = 1
                      end
                      object ck_alt_local_pag: TCheckBox
                        Left = 6
                        Top = 62
                        Width = 163
                        Height = 17
                        Caption = 'Local de pagamento'
                        TabOrder = 2
                      end
                      object ck_alt_mora: TCheckBox
                        Left = 6
                        Top = 89
                        Width = 49
                        Height = 17
                        Caption = 'Mora'
                        TabOrder = 3
                      end
                      object ck_alt_obs1: TCheckBox
                        Left = 6
                        Top = 116
                        Width = 163
                        Height = 17
                        Caption = 'Obs. 1 (Demonstrativo)'
                        TabOrder = 4
                      end
                      object ck_alt_obs2: TCheckBox
                        Left = 6
                        Top = 143
                        Width = 163
                        Height = 17
                        Caption = 'Obs. 2 (Instru'#231#245'es p/ Caixa)'
                        TabOrder = 5
                      end
                      object ck_alt_mensagem_ad: TCheckBox
                        Left = 6
                        Top = 166
                        Width = 163
                        Height = 17
                        Caption = 'Mensagem Adicional'
                        TabOrder = 6
                      end
                      object ck_alt_multa: TCheckBox
                        Left = 63
                        Top = 89
                        Width = 49
                        Height = 17
                        Caption = 'Multa'
                        TabOrder = 7
                      end
                      object ck_alt_dias: TCheckBox
                        Left = 118
                        Top = 89
                        Width = 49
                        Height = 17
                        Caption = 'Dias'
                        TabOrder = 8
                      end
                    end
                  end
                end
                object Panel11: TPanel
                  Left = 7
                  Top = 409
                  Width = 694
                  Height = 41
                  Align = alBottom
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 1
                  object bt_alt_aplicar: TBitBtn
                    Left = 275
                    Top = 6
                    Width = 238
                    Height = 25
                    Caption = 'Aplicar altera'#231#245'es nos demais boletos'
                    ModalResult = 1
                    TabOrder = 1
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
                  end
                  object bt_alt_nao_aplicar: TBitBtn
                    Left = 16
                    Top = 6
                    Width = 241
                    Height = 25
                    Caption = 'Continuar sem alterar demais boletos'
                    ModalResult = 5
                    TabOrder = 0
                    Glyph.Data = {
                      92010000424D9201000000000000920000002800000010000000100000000100
                      08000000000000010000120B0000120B0000170000001700000000000000FFFF
                      FF00FF00FF00004B0000098611000C9C19000A8615000C9518000D931A000F9E
                      1C000F991C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1
                      340024BC430029B548002EC6520035CA5E0039D4650002020202020202020202
                      0202020202020202020202020202020202020202020202020202020303020202
                      0202020202020202020203090C03020202020202020202020203100D050E0302
                      02020202020202020314120F03080B030202020202020203151611030203060A
                      0302020202020202031303020202020307030202020202020203020202020202
                      0304030202020202020202020202020202020303020202020202020202020202
                      0202020303020202020202020202020202020202020202020202020202020202
                      0202020202020202020202020202020202020202020202020202020202020202
                      02020202020202020202020202020202020202020202}
                  end
                  object bt_alt_voltar: TBitBtn
                    Left = 605
                    Top = 6
                    Width = 75
                    Height = 25
                    Caption = '&Voltar'
                    ModalResult = 3
                    TabOrder = 2
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
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Pr'#233' Impresso'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnPreImpresso: TPanel
            Left = 0
            Top = 0
            Width = 780
            Height = 81
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 780
              Height = 73
              Align = alTop
              Caption = 'Selecione o Banco '
              TabOrder = 0
              object Label7: TLabel
                Left = 76
                Top = 38
                Width = 29
                Height = 13
                Caption = 'Banco'
                FocusControl = DBEdit_CodigoBAnco
              end
              object DBLookupComboBox_BancoPreImpresso: TDBLookupComboBox
                Left = 198
                Top = 35
                Width = 283
                Height = 21
                DataField = 'COD_BANCO'
                DataSource = DtmBoletos.dsBancos
                KeyField = 'COD_BANCO'
                ListField = 'DESC_BANCO'
                ListSource = DtmBoletos.dsPesqBanco
                TabOrder = 0
                OnDropDown = DBLookupComboBox_BancoPreImpressoDropDown
                OnExit = DBLookupComboBox_BancoPreImpressoExit
              end
              object DBEdit_CodigoBAnco: TDBEdit
                Left = 111
                Top = 35
                Width = 81
                Height = 21
                DataField = 'COD_BANCO'
                DataSource = DtmBoletos.dsBancos
                TabOrder = 1
                OnExit = DBEdit_CodigoBAncoExit
                OnKeyDown = DBEdit_CodigoBAncoKeyDown
              end
              object BitBtn_ImprimirPreImpresso: TBitBtn
                Left = 487
                Top = 33
                Width = 90
                Height = 25
                Hint = 'Imprimir Boleto - [BOL010]'
                Caption = 'Imprimir'
                TabOrder = 2
                OnClick = BitBtn_ImprimirPreImpressoClick
                Glyph.Data = {
                  E6040000424DE604000000000000360000002800000014000000140000000100
                  180000000000B00400009D0400009D0400000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFDFDFDDFDFDF878787ADADADE5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8C8C8C8868686
                  A4A4A49696969393937E7E7E676767979797EDEDEDFEFEFEFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED2D2D2939393999999AAAAAA97979762
                  62628686864D4D4D8C8C8C797979666666969696DBDBDBFEFEFEFFFFFFFFFFFF
                  FFFFFFFFFFFFF8F8F8929292BCBCBCB7B7B7737373DBDBDBD2D2D2AAAAAAACAC
                  AC7676763131313535355252528080807373736F6F6F838383E8E8E8FFFFFFFF
                  FFFFD4D4D4C8C8C87B7B7BD5D5D5DCDCDCD7D7D7D5D5D5AFAFAFAFAFAFAFAFAF
                  6E6E6E4242422D2D2D3131313333337575756C6C6C757575FAFAFAFFFFFF9999
                  99B9B9B9E2E2E2DFDFDFDEDEDEDADADAD8D8D8B5B5B5B4B4B4B3B3B3B3B3B3B4
                  B4B48080805454542A2A2A2E2E2E2F2F2F6D6D6DCDCDCDFFFFFFCCCCCCE8E8E8
                  E6E6E6E4E4E4E2E2E2DEDEDEDBDBDBBDBDBDBCBCBCBBBCBCDB8A29E1983FD477
                  0FC38F5AB5B8BAB4B4B4AEAEAE9999999D9D9DFFFFFFBEBEBEECECECE9E9E9E7
                  E7E7E5E5E5E0E0E0DEDEDEC2C2C2C1C1C1BFC3C8EBB56FE6A756E3A34FE3A24D
                  CF6D04B9B9B9B8B8B88B8B8BB7B7B7FFFFFFADADADF2F2F2EEEEEEEBEBEBE8E8
                  E8E3E3E3CFCFCFC9C9C9C9CBCEDE9233EAAD60E8AA5CE5A654E3A34FD77F1B5F
                  A7DE50ACF8717171E7E7E7FFFFFFEEEEEEF9F9F9F0F0F0EDEDEDEAEAEAE5E5E5
                  D2D2D2D0D0D0D5AC77F1C187EBAF64E9AC5FE6A757E4A453D27E2053BEFF88A6
                  BB8C8C8CFCFCFCFFFFFFFFFFFFB8B8B8F2F2F2EFEFEFEBEBEBDCDCDCDADADAD9
                  D4D0EDB672F2BD7FECB067EAAD62E7A959E6A756CFC0AFC3C1C0D1D1D1D8D8D8
                  FFFFFFFFFFFFFFFFFFFFFFFFBEBEBEB3B4B5C2C2C3D9DBDDE7D1B4F7CC9BF3BE
                  80F0B773EDB26BEBAF65E9AB5ED89B52D9D9DAD6D6D6A7A7A7FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFD4D4D4FFF8E4FFF4E1F6BD7BFCD3A7F7BF82F3BB7CF1B976
                  EEB36CEDB167DB8F2DE7EAECD2D2D2C4C4C4FCFCFCFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF949695FFF5E9FFF4E5FFF2DFFFF1DBFFEFD6FFEED3FFEDD0888A8DF0
                  F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  C7C4C0FFF7ECFFF6E9FFF3E2FFF1DDFFEED5FFECD0FFEACB8C8C8CFEFEFEFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9F3FF
                  F9F1FFF7ECFFF4E4FFF2DFFFEFD7FFEDD2FFEFCEC0C0C0FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5C6C6C6BABA
                  BAA4A5A69899999D9B98A9A59EAAA49CF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF}
              end
              object BitBtn_VoltarPreImpresso: TBitBtn
                Left = 583
                Top = 33
                Width = 75
                Height = 25
                Caption = '&Voltar'
                TabOrder = 3
                OnClick = BitBtn11Click
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
        end
        object TabSheet_Cobrebem: TTabSheet
          Caption = 'Conv'#234'nio'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox6: TGroupBox
            Left = 0
            Top = 314
            Width = 780
            Height = 95
            Align = alTop
            Caption = 'Dados do Boleto'
            TabOrder = 1
            Visible = False
            object Label19: TLabel
              Left = 64
              Top = 24
              Width = 174
              Height = 13
              Caption = 'Nosso N'#250'mero sem d'#237'gito Verificador'
            end
            object Edit1: TEdit
              Left = 244
              Top = 21
              Width = 140
              Height = 21
              TabOrder = 0
            end
            object CheckBox2: TCheckBox
              Left = 64
              Top = 48
              Width = 320
              Height = 17
              Caption = 'N'#227'o mostrar esta tela novamente se j'#225' possuir nosso n'#250'mero.'
              TabOrder = 1
            end
            object BitBtn_DadosBoleto_OK: TBitBtn
              Left = 560
              Top = 30
              Width = 78
              Height = 25
              Hint = 'Inserir Nosso Numero - [BOL015]'
              Caption = 'Ok'
              TabOrder = 2
              OnClick = BitBtn_DadosBoleto_OKClick
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000014000000140000000100
                180000000000B00400009D0400009D0400000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFDFDFDE7E7E7A9A9A98787877A7A7A878787AAAAAAE8E8E8FDFDFD
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
                F68291821472140D73001575001773000E6E00016801616A618C8C8CE1E1E1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB89A289037B00049200
                0094000092000091000A89002E71002F6F002C6D001F6F00166C16A9A9A9FBFB
                FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF699A69019102019A03019A0200990100
                9800009600009400009100008E00346C00316C002C6C00547354AAAAAAFFFFFF
                FFFFFFFFFFFFFFFFFFCAD6CA0DA21507A00F07A00F07A00F24BD4938CD690FA8
                1F029B05009800009500009100068A00366B002D6C00156C15E1E1E1FFFFFFFF
                FFFFFDFDFD017F020AA3170BA4180BA41824BC47F0F0F0F7F7F7B0E9C312AB25
                039C06009902009500009100078900326C001F6F008C8C8CFDFDFDFFFFFFB1CE
                B120AB2C0FA81F0FA82011AA23ECECECF0F0F0F7F7F7FBFBFBB3ECC6069F0D04
                9D09009901009500009100356C002D6E00616B61E7E7E7FFFFFF01850345BE56
                14AD2B0DA418E5E5E5EBEBEBEFEFEFF5F5F5F9F9F9FDFDFDB5ECC714AD2A049D
                0A019A04009700048E00316F00006A00A7A7A7FFFFFF139C1E4FC362039A05E0
                E0E0E4E4E4EAEAEAEEEEEEF4F4F4F8F8F8FBFBFBFFFFFFB6ECC807A010049D09
                019A030094003171000D7100848484FFFFFF30B3435BCA710C930CDEDEDEE2E2
                E2E3E6E30FA8201BB4385CC66EF8F8F8FCFCFCFEFEFEB1EAC314AD2A049D0A00
                98001A8200187600777777FEFEFE30B34460CD7820B84231A031E0E0E007A00F
                22BB461FB8401CB53A5BC56CF9F9F9FBFBFBFDFDFDB1EAC313AC28019A020C8D
                00157800868686FFFFFF1EA62E64D07E27C04F28C1511AAF3527C05026BF4D23
                BC4720B9411CB53AEEF3EFF7F7F7F9F9F9F9F9F9AFE7C0029B060792000C7700
                A9A9A9FFFFFF14921466D3844CCE732EC75D2EC75E2DC65C2BC45827C05024BD
                4A21BA431BB4375CC36AF3F3F3F3F3F3F3F3F352CE770C9202177617E8E8E8FF
                FFFFC9E5C953CB7379DC9832CB6532CB6531CA632FC85F2AC35526BF4E23BC47
                1DB63B18B133E8EDE9EFEFEFEFEFEF29C050148D03879387FDFDFDFFFFFFFFFF
                FF5DB45D72DB957BDE9C35CC6733CC6632CB652DC65B29C25325BE4B1EB73F1A
                B33614AD2A13AB2715AE2B069F0D037E01F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
                43C16073DC967ADD9B33CC6633CC662EC75C29C25425BE4C1FB83F1BB43714AD
                2B10A9230CA51A07910999AC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96D09642
                C05D70DB9478DD9943D0722DC65C29C25425BE4C1FB83F1BB43714AD2B10A922
                0DA51A7FA67FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EBE
                6E54CD7568D88C65D48561D17F5ACD7646C36041C0571EAB2F068306DDE2DDFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF0DE
                2B9F2B1FA52D31B34530B345139C1D018702D1DFD1FEFEFEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 273
            Width = 780
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Informe os Dados dos Boletos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object GroupBox_NossoNumeroRepetido: TGroupBox
            Left = 0
            Top = 409
            Width = 780
            Height = 192
            Align = alTop
            Caption = 'Nosso N'#250'mero repetido'
            TabOrder = 3
            Visible = False
            object Label18: TLabel
              Left = 16
              Top = 20
              Width = 681
              Height = 32
              AutoSize = False
              Caption = 
                'O programa tentou inserir um Nosso N'#250'mero que j'#225' existe no bolet' +
                'o abaixo informe se deseja inativar o boleto abaixo ou dar conti' +
                'nuidade no proximo Nosso N'#250'mero. '
              WordWrap = True
            end
            object DBGrid2: TDBGrid
              Left = 2
              Top = 89
              Width = 776
              Height = 101
              Hint = '[Enter: Entrar no cadastro, Ver detalhes]'
              Align = alBottom
              DataSource = DtmBoletos.dsBoletoNossoNumeroRepetido
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ParentShowHint = False
              PopupMenu = PopupMenu1
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnColumnMoved = DBGrid1ColumnMoved
              OnDblClick = DBGrid1DblClick
              OnKeyDown = DBGrid1KeyDown
              OnTitleClick = DBGrid1TitleClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'N_SEQ_BOL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
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
                  FieldName = 'NUM_NF_VND'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CRED'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_EM_BOL'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_VEN_BOL'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_DOC_BOL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_DOC_BOL'
                  Width = 81
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_BOL'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_BOL1'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_DIA_BOL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MULT_ATR_BOL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCALPAG'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CONTROLE_CX'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_COBREBEM'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOSSO_NUMERO_BANCO'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REMESSA_ENVIADA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_SEQ_REMESSA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_REMESSA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_CUPOM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_PDV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SUB_SERIE'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS'
                  Width = 64
                  Visible = True
                end>
            end
            object BitBtn_InativarBoleto: TBitBtn
              Left = 16
              Top = 58
              Width = 137
              Height = 25
              Hint = 'Inativar Boleto - [Gerar Boleto - Gerar Boleto - [BOL016]'
              Caption = 'INATIVAR BOLETO(S)'
              TabOrder = 1
              Visible = False
              OnClick = BitBtn_InativarBoletoClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF818181818181FF00FF818181818181FF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF818181818181FF00FFFF00FF818181
                818181818181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8181
                81818181FF00FFFF00FFFF00FF818181818181818181818181FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF818181818181FF00FFFF00FFFF00FFFF00FFFF00FF
                888888828282818181818181FF00FFFF00FFFF00FFFF00FF818181818181FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF818181818181818181FF
                00FF818181818181818181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF818181858585858585868686808080FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF83838384
                8484898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF8181818888888686868888888B8B8BFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8B898989878787FF
                00FFFF00FF8B8B8B8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF8E8E8E8989898D8D8DFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8E8E8E8EFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FF8E8E8E
                8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF8E8E8EFF00FFFF00FF8E8E8E8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8E
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object BitBtn_ProximoNumero: TBitBtn
              Left = 543
              Top = 58
              Width = 176
              Height = 25
              Hint = 'Pr'#243'ximo Nosso Numero - [BOL017]'
              Caption = 'PROX'#205'MO NOSSO N'#218'MERO'
              TabOrder = 2
              OnClick = BitBtn_ProximoNumeroClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FF7474747B7B7B8181818181817B7B7B757575FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7C7C7C7C7C7C8E8E8E9A9A9A9B
                9B9B9B9B9B9A9A9A9090907F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF00FF
                8282828989899C9C9C9D9D9D9B9B9B9A9A9A9B9B9B9B9B9B9C9C9C9D9D9D8989
                89757575FF00FFFF00FFFF00FF8282828D8D8DA3A3A39F9F9F9B9B9B9A9A9A9A
                9A9A9A9A9A9A9A9A9A9A9A9B9B9B9D9D9D8989897F7F7FFF00FFFF00FF828282
                A7A7A7A5A5A5A0A0A09B9B9BA9A9A9FDFDFDFFFFFFC4C4C49A9A9A9A9A9A9B9B
                9B9D9D9D7F7F7FFF00FF848484989898ADADADA5A5A59D9D9D9C9C9C9E9E9EDD
                DDDDFFFFFFFFFFFFC0C0C09A9A9A9A9A9A9C9C9C9090907B7B7B848484A8A8A8
                ADADADA7A7A79D9D9D9B9B9B9C9C9C9B9B9BD7D7D7FFFFFFFFFFFFBFBFBF9A9A
                9A9C9C9C9898987B7B7B8C8C8CB0B0B0B1B1B1F6F6F6F3F3F3F2F2F2F3F3F3F1
                F1F1F2F2F2FFFFFFFFFFFFFFFFFFC9C9C99B9B9B9B9B9B7E7E7E919191C0C0C0
                B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDED
                ED9C9C9C9B9B9B818181919191C9C9C9C4C4C4C9C9C9CCCCCCCBCBCBCCCCCCC6
                C6C6DADADAFFFFFFFFFFFFE5E5E5ACACAC9F9F9F9A9A9A7D7D7D919191C4C4C4
                E0E0E0B2B2B2AEAEAEB1B1B1B1B1B1CBCBCBFFFFFFFFFFFFE0E0E0A6A6A6A3A3
                A3A0A0A09595957D7D7DFF00FFA3A3A3EEEEEED3D3D3AAAAAAADADADBEBEBEFF
                FFFFFFFFFFDFDFDFA7A7A7A4A4A4A1A1A1A3A3A38B8B8BFF00FFFF00FFA3A3A3
                CACACAF8F8F8D2D2D2B1B1B1B2B2B2EEEEEEE5E5E5ADADADA8A8A8A7A7A7A8A8
                A89E9E9E8B8B8BFF00FFFF00FFFF00FFA3A3A3D3D3D3FDFDFDE8E8E8C9C9C9BD
                BDBDB7B7B7B9B9B9B9B9B9B4B4B4A4A4A4898989FF00FFFF00FFFF00FFFF00FF
                FF00FFA3A3A3A3A3A3E7E7E7F6F6F6EDEDEDE4E4E4DBDBDBC7C7C7A8A8A8A8A8
                A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAAAAA3A3A3A3
                A3A3A3A3A3A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object BitBtn14: TBitBtn
              Left = 368
              Top = 58
              Width = 153
              Height = 25
              Hint = 'Cancelar Impress'#227'o - [BOL009]'
              Caption = 'CANCELAR IMPRESS'#195'O'
              TabOrder = 3
              OnClick = BitBtn14Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF818181818181FF00FF818181818181FF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF818181818181FF00FFFF00FF818181
                818181818181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8181
                81818181FF00FFFF00FFFF00FF818181818181818181818181FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF818181818181FF00FFFF00FFFF00FFFF00FFFF00FF
                888888828282818181818181FF00FFFF00FFFF00FFFF00FF818181818181FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF818181818181818181FF
                00FF818181818181818181FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF818181858585858585868686808080FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF83838384
                8484898989FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF8181818888888686868888888B8B8BFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8B8B8B898989878787FF
                00FFFF00FF8B8B8B8C8C8CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF8E8E8E8989898D8D8DFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8E8E8E8EFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FF8E8E8E
                8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF8E8E8EFF00FFFF00FF8E8E8E8E8E8E8E8E8EFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E8E8E8E
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
          end
          object pnSelecionarConvenio: TPanel
            Tag = 200
            Left = 0
            Top = 0
            Width = 780
            Height = 273
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnSelecionarConvenioEnter
            object GroupBox_SelecionaContaBoleto: TGroupBox
              Left = 0
              Top = 0
              Width = 780
              Height = 273
              Align = alClient
              Caption = 'Selecione a configura'#231#227'o desejada (Conv'#234'nio):'
              TabOrder = 0
              object Panel6: TPanel
                Left = 2
                Top = 236
                Width = 776
                Height = 35
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn_OKCobrebem: TBitBtn
                  Left = 308
                  Top = 3
                  Width = 75
                  Height = 25
                  Hint = 'Inserir Nosso Numero - [BOL015]'
                  Caption = 'Ok'
                  TabOrder = 0
                  OnClick = BitBtn_OKCobrebemClick
                  Glyph.Data = {
                    E6040000424DE604000000000000360000002800000014000000140000000100
                    180000000000B00400009D0400009D0400000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFDFDFDE7E7E7A9A9A98787877A7A7A878787AAAAAAE8E8E8FDFDFD
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
                    F68291821472140D73001575001773000E6E00016801616A618C8C8CE1E1E1FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB89A289037B00049200
                    0094000092000091000A89002E71002F6F002C6D001F6F00166C16A9A9A9FBFB
                    FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF699A69019102019A03019A0200990100
                    9800009600009400009100008E00346C00316C002C6C00547354AAAAAAFFFFFF
                    FFFFFFFFFFFFFFFFFFCAD6CA0DA21507A00F07A00F07A00F24BD4938CD690FA8
                    1F029B05009800009500009100068A00366B002D6C00156C15E1E1E1FFFFFFFF
                    FFFFFDFDFD017F020AA3170BA4180BA41824BC47F0F0F0F7F7F7B0E9C312AB25
                    039C06009902009500009100078900326C001F6F008C8C8CFDFDFDFFFFFFB1CE
                    B120AB2C0FA81F0FA82011AA23ECECECF0F0F0F7F7F7FBFBFBB3ECC6069F0D04
                    9D09009901009500009100356C002D6E00616B61E7E7E7FFFFFF01850345BE56
                    14AD2B0DA418E5E5E5EBEBEBEFEFEFF5F5F5F9F9F9FDFDFDB5ECC714AD2A049D
                    0A019A04009700048E00316F00006A00A7A7A7FFFFFF139C1E4FC362039A05E0
                    E0E0E4E4E4EAEAEAEEEEEEF4F4F4F8F8F8FBFBFBFFFFFFB6ECC807A010049D09
                    019A030094003171000D7100848484FFFFFF30B3435BCA710C930CDEDEDEE2E2
                    E2E3E6E30FA8201BB4385CC66EF8F8F8FCFCFCFEFEFEB1EAC314AD2A049D0A00
                    98001A8200187600777777FEFEFE30B34460CD7820B84231A031E0E0E007A00F
                    22BB461FB8401CB53A5BC56CF9F9F9FBFBFBFDFDFDB1EAC313AC28019A020C8D
                    00157800868686FFFFFF1EA62E64D07E27C04F28C1511AAF3527C05026BF4D23
                    BC4720B9411CB53AEEF3EFF7F7F7F9F9F9F9F9F9AFE7C0029B060792000C7700
                    A9A9A9FFFFFF14921466D3844CCE732EC75D2EC75E2DC65C2BC45827C05024BD
                    4A21BA431BB4375CC36AF3F3F3F3F3F3F3F3F352CE770C9202177617E8E8E8FF
                    FFFFC9E5C953CB7379DC9832CB6532CB6531CA632FC85F2AC35526BF4E23BC47
                    1DB63B18B133E8EDE9EFEFEFEFEFEF29C050148D03879387FDFDFDFFFFFFFFFF
                    FF5DB45D72DB957BDE9C35CC6733CC6632CB652DC65B29C25325BE4B1EB73F1A
                    B33614AD2A13AB2715AE2B069F0D037E01F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
                    43C16073DC967ADD9B33CC6633CC662EC75C29C25425BE4C1FB83F1BB43714AD
                    2B10A9230CA51A07910999AC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96D09642
                    C05D70DB9478DD9943D0722DC65C29C25425BE4C1FB83F1BB43714AD2B10A922
                    0DA51A7FA67FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EBE
                    6E54CD7568D88C65D48561D17F5ACD7646C36041C0571EAB2F068306DDE2DDFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF0DE
                    2B9F2B1FA52D31B34530B345139C1D018702D1DFD1FEFEFEFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF}
                end
                object BitBtn_VoltarCobrebem: TBitBtn
                  Left = 389
                  Top = 3
                  Width = 75
                  Height = 25
                  Hint = 'Voltar'
                  Caption = '&Voltar'
                  TabOrder = 1
                  OnClick = BitBtn_VoltarCobrebemClick
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
                object ckConfEmailWhatsAppAssunto: TCheckBox
                  Left = 492
                  Top = 6
                  Width = 277
                  Height = 17
                  Caption = 'Confirmar e-mail / whatsapp e assunto a cada boleto'
                  TabOrder = 3
                  Visible = False
                  OnClick = ckConfEmailWhatsAppAssuntoClick
                end
                object ckUnicoEmailWhatsApp: TCheckBox
                  Left = 14
                  Top = 6
                  Width = 277
                  Height = 17
                  Caption = 'Enviar uma '#250'nica mensagem'
                  TabOrder = 2
                  Visible = False
                  OnClick = ckUnicoEmailWhatsAppClick
                end
              end
              object Panel18: TPanel
                Left = 2
                Top = 15
                Width = 776
                Height = 221
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBoxConvenio: TGroupBox
                  Left = 0
                  Top = 180
                  Width = 776
                  Height = 41
                  Align = alBottom
                  Caption = 'Conv'#234'nio'
                  TabOrder = 2
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 2
                    Top = 15
                    Width = 772
                    Height = 21
                    Align = alClient
                    KeyField = 'COD_COBREBEM'
                    ListField = 'DESCRICAO'
                    ListSource = DtmBoletos.dsCobreBemBol
                    TabOrder = 0
                  end
                end
                object GroupBoxAcoes: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 776
                  Height = 51
                  Align = alTop
                  Caption = 'A'#231#245'es'
                  TabOrder = 0
                  object Panel17: TPanel
                    Left = 2
                    Top = 15
                    Width = 772
                    Height = 26
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object ckImprimirBoleto: TCheckBox
                      Left = 14
                      Top = 0
                      Width = 179
                      Height = 26
                      Caption = 'Imprimir   (F2)'
                      Checked = True
                      State = cbChecked
                      TabOrder = 0
                      OnClick = ckImprimirBoletoClick
                    end
                    object ckEnviarBoleto: TCheckBox
                      Left = 340
                      Top = 0
                      Width = 179
                      Height = 26
                      Caption = 'Enviar   (F3)'
                      Checked = True
                      State = cbChecked
                      TabOrder = 1
                      OnClick = ckEnviarBoletoClick
                    end
                  end
                end
                object Panel19: TPanel
                  Left = 0
                  Top = 51
                  Width = 776
                  Height = 129
                  Align = alClient
                  TabOrder = 1
                  inline FrameCheckListaContato: TFrameCheckListaContato
                    Left = 1
                    Top = 1
                    Width = 774
                    Height = 127
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    ExplicitLeft = 1
                    ExplicitTop = 1
                    ExplicitWidth = 774
                    ExplicitHeight = 127
                    inherited GroupBoxContato: TGroupBox
                      Width = 774
                      Height = 127
                      ExplicitWidth = 774
                      ExplicitHeight = 127
                      inherited CheckListBoxContato: TCheckListBox
                        Width = 673
                        Height = 79
                        ExplicitWidth = 673
                        ExplicitHeight = 79
                      end
                      inherited pnContato: TPanel
                        Top = 94
                        Width = 770
                        ExplicitTop = 94
                        ExplicitWidth = 770
                        inherited bt_contatos_pla_add: TSpeedButton
                          Left = 342
                          ExplicitLeft = 342
                        end
                        inherited bt_contatos_pla_edit: TSpeedButton
                          Left = 371
                          ExplicitLeft = 371
                        end
                        inherited bt_contatos_pla_del: TSpeedButton
                          Left = 400
                          ExplicitLeft = 400
                        end
                        inherited bt_contatos_pla_outros_add: TSpeedButton
                          Left = 704
                          ExplicitLeft = 704
                        end
                        inherited bt_contatos_pla_outros_del: TSpeedButton
                          Left = 733
                          ExplicitLeft = 733
                        end
                      end
                      inherited CheckListBoxAplicativo: TCheckListBox
                        Left = 675
                        Height = 79
                        ExplicitLeft = 675
                        ExplicitHeight = 79
                      end
                    end
                  end
                end
              end
            end
          end
        end
        object tabsheet6: TTabSheet
          Caption = 'tabsheet6'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox7: TGroupBox
            Left = 0
            Top = 0
            Width = 780
            Height = 185
            Align = alTop
            Caption = 'Selecione os Dados que deseja remover'
            TabOrder = 0
            object BitBtn10: TBitBtn
              Left = 672
              Top = 28
              Width = 78
              Height = 25
              Caption = 'Ok'
              TabOrder = 0
              OnClick = BitBtn10Click
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000014000000140000000100
                180000000000B00400009D0400009D0400000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFDFDFDE7E7E7A9A9A98787877A7A7A878787AAAAAAE8E8E8FDFDFD
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
                F68291821472140D73001575001773000E6E00016801616A618C8C8CE1E1E1FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB89A289037B00049200
                0094000092000091000A89002E71002F6F002C6D001F6F00166C16A9A9A9FBFB
                FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF699A69019102019A03019A0200990100
                9800009600009400009100008E00346C00316C002C6C00547354AAAAAAFFFFFF
                FFFFFFFFFFFFFFFFFFCAD6CA0DA21507A00F07A00F07A00F24BD4938CD690FA8
                1F029B05009800009500009100068A00366B002D6C00156C15E1E1E1FFFFFFFF
                FFFFFDFDFD017F020AA3170BA4180BA41824BC47F0F0F0F7F7F7B0E9C312AB25
                039C06009902009500009100078900326C001F6F008C8C8CFDFDFDFFFFFFB1CE
                B120AB2C0FA81F0FA82011AA23ECECECF0F0F0F7F7F7FBFBFBB3ECC6069F0D04
                9D09009901009500009100356C002D6E00616B61E7E7E7FFFFFF01850345BE56
                14AD2B0DA418E5E5E5EBEBEBEFEFEFF5F5F5F9F9F9FDFDFDB5ECC714AD2A049D
                0A019A04009700048E00316F00006A00A7A7A7FFFFFF139C1E4FC362039A05E0
                E0E0E4E4E4EAEAEAEEEEEEF4F4F4F8F8F8FBFBFBFFFFFFB6ECC807A010049D09
                019A030094003171000D7100848484FFFFFF30B3435BCA710C930CDEDEDEE2E2
                E2E3E6E30FA8201BB4385CC66EF8F8F8FCFCFCFEFEFEB1EAC314AD2A049D0A00
                98001A8200187600777777FEFEFE30B34460CD7820B84231A031E0E0E007A00F
                22BB461FB8401CB53A5BC56CF9F9F9FBFBFBFDFDFDB1EAC313AC28019A020C8D
                00157800868686FFFFFF1EA62E64D07E27C04F28C1511AAF3527C05026BF4D23
                BC4720B9411CB53AEEF3EFF7F7F7F9F9F9F9F9F9AFE7C0029B060792000C7700
                A9A9A9FFFFFF14921466D3844CCE732EC75D2EC75E2DC65C2BC45827C05024BD
                4A21BA431BB4375CC36AF3F3F3F3F3F3F3F3F352CE770C9202177617E8E8E8FF
                FFFFC9E5C953CB7379DC9832CB6532CB6531CA632FC85F2AC35526BF4E23BC47
                1DB63B18B133E8EDE9EFEFEFEFEFEF29C050148D03879387FDFDFDFFFFFFFFFF
                FF5DB45D72DB957BDE9C35CC6733CC6632CB652DC65B29C25325BE4B1EB73F1A
                B33614AD2A13AB2715AE2B069F0D037E01F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
                43C16073DC967ADD9B33CC6633CC662EC75C29C25425BE4C1FB83F1BB43714AD
                2B10A9230CA51A07910999AC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96D09642
                C05D70DB9478DD9943D0722DC65C29C25425BE4C1FB83F1BB43714AD2B10A922
                0DA51A7FA67FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EBE
                6E54CD7568D88C65D48561D17F5ACD7646C36041C0571EAB2F068306DDE2DDFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF0DE
                2B9F2B1FA52D31B34530B345139C1D018702D1DFD1FEFEFEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
            end
            object CheckBox_NossoNumero: TCheckBox
              Left = 32
              Top = 32
              Width = 561
              Height = 17
              Caption = 
                'Cobrebem e Nosso N'#250'mero (obs:. Para gerar uma boleta com o Nosso' +
                ' N'#250'mero diferente)'
              TabOrder = 1
              OnClick = CheckBox_NossoNumeroClick
            end
            object CheckBox_RemessaEnviada: TCheckBox
              Left = 32
              Top = 87
              Width = 369
              Height = 17
              Caption = 
                'Remessa enviada (obs:. Para enviar a boleta em uma remessa difer' +
                'ente)'
              TabOrder = 2
            end
            object BitBtn11: TBitBtn
              Left = 672
              Top = 136
              Width = 75
              Height = 25
              Caption = '&Voltar'
              TabOrder = 3
              OnClick = BitBtn11Click
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
            object CheckBox_RetirarCredito: TCheckBox
              Left = 32
              Top = 150
              Width = 545
              Height = 17
              Caption = 
                'Retirar Nosso N'#250'mero do cr'#233'dito (Aten'#231#227'o : Ao disvincular o bole' +
                'to do cr'#233'dito afetar'#225' a baixa do financeiro)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = CheckBox_RetirarCreditoClick
            end
            object ckCarne: TCheckBox
              Left = 32
              Top = 110
              Width = 369
              Height = 17
              Caption = 'Carn'#234' (obs: Para gerar novamente outro carn'#234')'
              TabOrder = 5
            end
            object CheckBox_OutrosDados: TCheckBox
              Left = 58
              Top = 55
              Width = 703
              Height = 17
              Caption = 
                'Outros Dados (Taxa Juros, Multa, Local Pag, Obs, Obs1, Mens, Obs' +
                ' Desc, Dias Protesto e Data Limite Desc)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Visible = False
            end
          end
        end
        object TabSheet_Relatorio: TTabSheet
          Caption = 'Relat'#243'rio'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox_Relatorio: TScrollBox
            Left = 0
            Top = 0
            Width = 780
            Height = 577
            Align = alClient
            TabOrder = 0
            object QuickRep_Remessa: TQuickRep
              Left = 5
              Top = 0
              Width = 1123
              Height = 794
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              DataSet = DtmBoletos.cdsBoletos
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
              OnPreview = QuickRep_RemessaPreview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poLandscape
              Page.PaperSize = A4
              Page.Values = (
                100.000000000000000000
                2100.000000000000000000
                100.000000000000000000
                2970.000000000000000000
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
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsMaximized
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object DetailBand1: TQRBand
                Left = 38
                Top = 148
                Width = 1047
                Height = 55
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
                  145.520833333333300000
                  2770.187500000000000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRDBText3: TQRDBText
                  Left = 6
                  Top = 17
                  Width = 64
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    15.875000000000000000
                    44.979166666666670000
                    169.333333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'N_SEQ_BOL'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText6: TQRDBText
                  Left = 574
                  Top = 17
                  Width = 127
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1518.708333333333000000
                    44.979166666666670000
                    336.020833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'NOSSO_NUMERO_BANCO'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText7: TQRDBText
                  Left = 1692
                  Top = 6
                  Width = 100
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    4476.750000000000000000
                    15.875000000000000000
                    264.583333333333400000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'NOME_CLIENTE'
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText8: TQRDBText
                  Left = 701
                  Top = 17
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1854.729166666667000000
                    44.979166666666670000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'NUM_NF_VND'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText9: TQRDBText
                  Left = 777
                  Top = 17
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2055.812500000000000000
                    44.979166666666670000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'VL_DOC_BOL'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  Mask = 'R$ ###,###,##0.00'#39
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText10: TQRDBText
                  Left = 493
                  Top = 17
                  Width = 64
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1304.395833333333000000
                    44.979166666666670000
                    169.333333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'N_DOC_BOL'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText4: TQRDBText
                  Left = 54
                  Top = 17
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    142.875000000000000000
                    44.979166666666670000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'NOME_CLIENTE'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 7
                end
                object QRDBText5: TQRDBText
                  Left = 231
                  Top = 17
                  Width = 26
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    611.187500000000000000
                    44.979166666666670000
                    68.791666666666680000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'RAZAO'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 7
                end
                object QRDBText1: TQRDBText
                  Left = 850
                  Top = 17
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2248.958333333333000000
                    44.979166666666670000
                    280.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'COD_SEQ_REMESSA'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText2: TQRDBText
                  Left = 940
                  Top = 17
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2487.083333333333000000
                    44.979166666666670000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'DATA_REMESSA'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText11: TQRDBText
                  Left = 406
                  Top = 2
                  Width = 78
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1074.208333333333000000
                    5.291666666666667000
                    206.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'DATA_EM_BOL'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRDBText12: TQRDBText
                  Left = 406
                  Top = 30
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1074.208333333333000000
                    79.375000000000000000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = DtmBoletos.cdsBoletos
                  DataField = 'DATA_VEN_BOL'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
              end
              object PageHeaderBand1: TQRBand
                Left = 38
                Top = 38
                Width = 1047
                Height = 110
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
                  291.041666666666700000
                  2770.187500000000000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbPageHeader
                object QRPLabel1: TQRPLabel
                  Left = 5
                  Top = 33
                  Width = 161
                  Height = 18
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    47.625000000000000000
                    13.229166666666670000
                    87.312500000000000000
                    425.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Relat'#243'rio de boletos'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRSysData1: TQRSysData
                  Left = 78
                  Top = 52
                  Width = 78
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    206.375000000000000000
                    137.583333333333300000
                    206.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsDateTime
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel1: TQRLabel
                  Left = 933
                  Top = 52
                  Width = 57
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2468.562500000000000000
                    137.583333333333300000
                    150.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'P'#225'gina :'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel4: TQRLabel
                  Left = 940
                  Top = 85
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2487.083333333333000000
                    224.895833333333300000
                    280.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data da remessa'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRSysData2: TQRSysData
                  Left = 996
                  Top = 52
                  Width = 50
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2635.250000000000000000
                    137.583333333333300000
                    132.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  Color = clWhite
                  Data = qrsPageNumber
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel2: TQRLabel
                  Left = 4
                  Top = 52
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    10.583333333333330000
                    137.583333333333300000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data/Hora:'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRHRule1: TQRHRule
                  Left = 0
                  Top = 64
                  Width = 1045
                  Height = 13
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    34.395833333333330000
                    0.000000000000000000
                    169.333333333333300000
                    2764.895833333333000000)
                  VertAdjust = 0
                  Pen.Width = 2
                end
                object QRHRule2: TQRHRule
                  Left = 0
                  Top = 98
                  Width = 1045
                  Height = 18
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    47.625000000000000000
                    0.000000000000000000
                    259.291666666666700000
                    2764.895833333333000000)
                  VertAdjust = 0
                  Pen.Width = 2
                end
                object lbEmpresa: TQRLabel
                  Left = 4
                  Top = 1
                  Width = 57
                  Height = 32
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    84.666666666666680000
                    10.583333333333330000
                    2.645833333333333000
                    150.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -24
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 18
                end
                object QRLabel5: TQRLabel
                  Left = 6
                  Top = 85
                  Width = 43
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    15.875000000000000000
                    224.895833333333300000
                    113.770833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'C'#243'digo'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel7: TQRLabel
                  Left = 229
                  Top = 85
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    605.895833333333400000
                    224.895833333333300000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Raz'#227'o social'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel8: TQRLabel
                  Left = 578
                  Top = 85
                  Width = 78
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1529.291666666667000000
                    224.895833333333300000
                    206.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'NossoNumero'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel9: TQRLabel
                  Left = 1692
                  Top = 87
                  Width = 107
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    4476.750000000000000000
                    230.187500000000000000
                    283.104166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data da remessa'
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
                object QRLabel10: TQRLabel
                  Left = 698
                  Top = 85
                  Width = 64
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1846.791666666667000000
                    224.895833333333300000
                    169.333333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#250'mero NF'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel11: TQRLabel
                  Left = 776
                  Top = 85
                  Width = 36
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2053.166666666667000000
                    224.895833333333300000
                    95.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Valor'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel12: TQRLabel
                  Left = 493
                  Top = 85
                  Width = 78
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1304.395833333333000000
                    224.895833333333300000
                    206.375000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#250'mero doc.'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel6: TQRLabel
                  Left = 54
                  Top = 85
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    142.875000000000000000
                    224.895833333333300000
                    280.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome do cliente'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel3: TQRLabel
                  Left = 848
                  Top = 85
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2243.666666666667000000
                    224.895833333333300000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'C'#243'd. remessa'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel13: TQRLabel
                  Left = 402
                  Top = 73
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1063.625000000000000000
                    193.145833333333300000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data emiss'#227'o'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel14: TQRLabel
                  Left = 402
                  Top = 89
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1063.625000000000000000
                    235.479166666666700000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Data venc.'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
              end
              object PageFooterBand1: TQRBand
                Left = 38
                Top = 203
                Width = 1047
                Height = 40
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
                LinkBand = DetailBand1
                Size.Values = (
                  105.833333333333300000
                  2770.187500000000000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbSummary
                object QRExpr1: TQRExpr
                  Left = 777
                  Top = 6
                  Width = 157
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    2055.812500000000000000
                    15.875000000000000000
                    415.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  Color = clWhite
                  ParentFont = False
                  ResetAfterPrint = False
                  Transparent = False
                  WordWrap = True
                  Expression = 'SUM(cdsBoletos.VL_DOC_BOL)'
                  Mask = 'R$ ###,###,##0.00'#39
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRHRule3: TQRHRule
                  Left = 0
                  Top = 64
                  Width = 1045
                  Height = 13
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    34.395833333333330000
                    0.000000000000000000
                    169.333333333333300000
                    2764.895833333333000000)
                  VertAdjust = 0
                  Pen.Width = 2
                end
                object QRHRule4: TQRHRule
                  Left = 0
                  Top = -5
                  Width = 1046
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    0.000000000000000000
                    -13.229166666666670000
                    2767.541666666667000000)
                  VertAdjust = 0
                end
                object QRLabel116: TQRLabel
                  Left = 54
                  Top = 85
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    142.875000000000000000
                    224.895833333333300000
                    280.458333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Nome do cliente'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 8
                end
                object QRLabel117: TQRLabel
                  Left = 43
                  Top = 6
                  Width = 81
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    113.770833333333300000
                    15.875000000000000000
                    214.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Total Boletas:'
                  Color = clWhite
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
            end
          end
        end
        object TabSheet_Promissorias: TTabSheet
          Caption = 'TabSheet_Promissorias'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 780
            Height = 577
            HorzScrollBar.Position = 47
            Align = alClient
            TabOrder = 0
            object QuickRep_Promissoria: TQuickRep
              Left = -47
              Top = 0
              Width = 816
              Height = 1056
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              DataSet = DtmBoletos.cdsBoletos
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
              OnPreview = QuickRep_PromissoriaPreview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = Letter
              Page.Values = (
                0.000000000000000000
                2794.000000000000000000
                100.000000000000000000
                2159.000000000000000000
                0.000000000000000000
                0.000000000000000000
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
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object TitleBand1: TQRBand
                Left = 0
                Top = 38
                Width = 816
                Height = 281
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = TitleBand1BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  743.479166666666700000
                  2159.000000000000000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRShape1: TQRShape
                  Left = 21
                  Top = 0
                  Width = 769
                  Height = 275
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    727.604166666667000000
                    55.562500000000000000
                    0.000000000000000000
                    2034.645833333330000000)
                  Brush.Color = clMenu
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape2: TQRShape
                  Left = 25
                  Top = 4
                  Width = 168
                  Height = 267
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    706.437500000000000000
                    66.145833333333300000
                    10.583333333333300000
                    444.500000000000000000)
                  Brush.Color = clBtnHighlight
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape3: TQRShape
                  Left = 197
                  Top = 4
                  Width = 588
                  Height = 268
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    709.083333333333000000
                    521.229166666667000000
                    10.583333333333300000
                    1555.750000000000000000)
                  Brush.Color = clBtnHighlight
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel15: TQRLabel
                  Left = 208
                  Top = 37
                  Width = 26
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666680000
                    550.333333333333400000
                    97.895833333333340000
                    68.791666666666680000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N.'#186
                  Color = clBtnHighlight
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
                object QRShape4: TQRShape
                  Left = 240
                  Top = 37
                  Width = 122
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666700000
                    635.000000000000000000
                    97.895833333333300000
                    322.791666666667000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel16: TQRLabel
                  Left = 360
                  Top = 10
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    952.500000000000000000
                    26.458333333333330000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Vencimento'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel17: TQRLabel
                  Left = 602
                  Top = 37
                  Width = 25
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666680000
                    1592.791666666667000000
                    97.895833333333340000
                    66.145833333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'R$'
                  Color = clBtnHighlight
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
                object QRShape5: TQRShape
                  Left = 634
                  Top = 37
                  Width = 141
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666700000
                    1677.458333333330000000
                    97.895833333333300000
                    373.062500000000000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel18: TQRLabel
                  Left = 208
                  Top = 70
                  Width = 36
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    185.208333333333300000
                    95.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Ao (s)'
                  Color = clBtnHighlight
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
                object QRLabel19: TQRLabel
                  Left = 248
                  Top = 70
                  Width = 525
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    656.166666666666800000
                    185.208333333333300000
                    1389.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '................................................................' +
                    '...'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel20: TQRLabel
                  Left = 208
                  Top = 94
                  Width = 165
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    248.708333333333300000
                    436.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.........................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel21: TQRLabel
                  Left = 379
                  Top = 94
                  Width = 38
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1002.770833333333000000
                    248.708333333333300000
                    100.541666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'pagar'
                  Color = clBtnHighlight
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
                object QRLabel22: TQRLabel
                  Left = 423
                  Top = 94
                  Width = 73
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1119.187500000000000000
                    248.708333333333300000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel23: TQRLabel
                  Left = 501
                  Top = 94
                  Width = 134
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1325.562500000000000000
                    248.708333333333300000
                    354.541666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'por esta '#250'nica via de'
                  Color = clBtnHighlight
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
                object QRLabel24: TQRLabel
                  Left = 640
                  Top = 94
                  Width = 134
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1693.333333333333000000
                    248.708333333333300000
                    354.541666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'NOTA PROMISS'#211'RIA'
                  Color = clBtnHighlight
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
                object QRLabel25: TQRLabel
                  Left = 207
                  Top = 118
                  Width = 9
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    547.687500000000000000
                    312.208333333333400000
                    23.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'a'
                  Color = clBtnHighlight
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
                object QRLabel26: TQRLabel
                  Left = 555
                  Top = 118
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1468.437500000000000000
                    312.208333333333400000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                  Left = 222
                  Top = 118
                  Width = 329
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    587.375000000000000000
                    312.208333333333400000
                    870.479166666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '..................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel28: TQRLabel
                  Left = 614
                  Top = 118
                  Width = 161
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1624.541666666667000000
                    312.208333333333400000
                    425.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '........................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel29: TQRLabel
                  Left = 208
                  Top = 145
                  Width = 188
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    383.645833333333400000
                    497.416666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ou '#224' sua ordem, a quantia de'
                  Color = clBtnHighlight
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
                object QRShape6: TQRShape
                  Left = 400
                  Top = 139
                  Width = 376
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666700000
                    1058.333333333330000000
                    367.770833333333000000
                    994.833333333333000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape7: TQRShape
                  Left = 208
                  Top = 164
                  Width = 568
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    60.854166666666700000
                    550.333333333333000000
                    433.916666666667000000
                    1502.833333333330000000)
                  Brush.Color = clScrollBar
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel30: TQRLabel
                  Left = 208
                  Top = 190
                  Width = 277
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    502.708333333333400000
                    732.895833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'em moeda corrente neste pa'#237's, pag'#225'vel em'
                  Color = clBtnHighlight
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
                object QRLabel31: TQRLabel
                  Left = 489
                  Top = 190
                  Width = 285
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1293.812500000000000000
                    502.708333333333400000
                    754.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '.......'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel32: TQRLabel
                  Left = 208
                  Top = 210
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    555.625000000000000000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'EMITENTE'
                  Color = clBtnHighlight
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
                object QRLabel33: TQRLabel
                  Left = 265
                  Top = 210
                  Width = 285
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    701.145833333333400000
                    555.625000000000000000
                    754.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '.......'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel34: TQRLabel
                  Left = 208
                  Top = 230
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    608.541666666666800000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel35: TQRLabel
                  Left = 265
                  Top = 230
                  Width = 201
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    701.145833333333400000
                    608.541666666666800000
                    531.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..................................................'
                  Color = clInfoBk
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel36: TQRLabel
                  Left = 572
                  Top = 228
                  Width = 201
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1513.416666666667000000
                    603.250000000000000000
                    531.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..................................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel37: TQRLabel
                  Left = 473
                  Top = 230
                  Width = 77
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1251.479166666667000000
                    608.541666666666800000
                    203.729166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '...................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel38: TQRLabel
                  Left = 572
                  Top = 248
                  Width = 201
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1513.416666666667000000
                    656.166666666666800000
                    531.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..................................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel39: TQRLabel
                  Left = 208
                  Top = 252
                  Width = 56
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    550.333333333333400000
                    666.750000000000000000
                    148.166666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel40: TQRLabel
                  Left = 265
                  Top = 230
                  Width = 201
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    701.145833333333400000
                    608.541666666666800000
                    531.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '..................................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel41: TQRLabel
                  Left = 269
                  Top = 252
                  Width = 281
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    711.729166666666800000
                    666.750000000000000000
                    743.479166666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '................................................................' +
                    '......'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel42: TQRLabel
                  Left = 69
                  Top = 16
                  Width = 80
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    182.562500000000000000
                    42.333333333333340000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'AVALISTAS'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 11
                end
                object QRLabel43: TQRLabel
                  Left = 29
                  Top = 56
                  Width = 157
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    148.166666666666700000
                    415.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.......................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel44: TQRLabel
                  Left = 29
                  Top = 106
                  Width = 157
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    280.458333333333400000
                    415.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.......................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel45: TQRLabel
                  Left = 29
                  Top = 162
                  Width = 157
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    428.625000000000000000
                    415.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.......................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel46: TQRLabel
                  Left = 29
                  Top = 218
                  Width = 157
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    576.791666666666800000
                    415.395833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '.......................................'
                  Color = clBtnHighlight
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel47: TQRLabel
                  Left = 29
                  Top = 74
                  Width = 65
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    195.791666666666700000
                    171.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel48: TQRLabel
                  Left = 29
                  Top = 127
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    336.020833333333400000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel49: TQRLabel
                  Left = 29
                  Top = 183
                  Width = 65
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    484.187500000000000000
                    171.979166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CPF/CNPJ'
                  Color = clBtnHighlight
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
                object QRLabel50: TQRLabel
                  Left = 29
                  Top = 237
                  Width = 71
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    76.729166666666680000
                    627.062500000000000000
                    187.854166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O'
                  Color = clBtnHighlight
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
                object QRLabel51: TQRLabel
                  Left = 405
                  Top = 142
                  Width = 369
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1071.562500000000000000
                    375.708333333333400000
                    976.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '**********************************************'
                  Color = clScrollBar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel52: TQRLabel
                  Left = 212
                  Top = 168
                  Width = 561
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    560.916666666666700000
                    444.500000000000000000
                    1484.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '******'
                  Color = clScrollBar
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel53: TQRLabel
                  Left = 247
                  Top = 40
                  Width = 105
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    653.520833333333400000
                    105.833333333333300000
                    277.812500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*************'
                  Color = clMenu
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel54: TQRLabel
                  Left = 639
                  Top = 40
                  Width = 129
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1690.687500000000000000
                    105.833333333333300000
                    341.312500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '****************'
                  Color = clMenu
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel55: TQRLabel
                  Left = 230
                  Top = 112
                  Width = 305
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    608.541666666666800000
                    296.333333333333400000
                    806.979166666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '**************************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel56: TQRLabel
                  Left = 622
                  Top = 112
                  Width = 145
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1645.708333333333000000
                    296.333333333333400000
                    383.645833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '******************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel57: TQRLabel
                  Left = 274
                  Top = 204
                  Width = 265
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    724.958333333333400000
                    539.750000000000000000
                    701.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel58: TQRLabel
                  Left = 274
                  Top = 224
                  Width = 177
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    724.958333333333400000
                    592.666666666666800000
                    468.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '**********************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel59: TQRLabel
                  Left = 274
                  Top = 245
                  Width = 265
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    724.958333333333400000
                    648.229166666666800000
                    701.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel60: TQRLabel
                  Left = 446
                  Top = 10
                  Width = 81
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1180.041666666667000000
                    26.458333333333330000
                    214.312500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Vencimento'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
            end
          end
        end
        object TabSheet_Controles: TTabSheet
          Caption = 'TabSheet_Controles'
          ImageIndex = 8
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object DBGrid3: TDBGrid
            Left = 286
            Top = 0
            Width = 494
            Height = 536
            Align = alClient
            DataSource = DtmBoletos.dsControleCreditosBol
            ParentShowHint = False
            PopupMenu = PopupMenuConfCol
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnColumnMoved = DBGrid3ColumnMoved
            OnDblClick = DBGrid3DblClick
            OnKeyDown = DBGrid3KeyDown
            OnTitleClick = DBGrid3TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_CRED'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CLIENTE'
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
                FieldName = 'RAZAO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_SEQ_BOL'
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
                FieldName = 'N_DUPL_C'
                Width = 64
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
                FieldName = 'TIPO_DOC_C'
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
                FieldName = 'STATUS_C'
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
                FieldName = 'LOTE'
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
                FieldName = 'DATA_RETORNO_QUITACAO'
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
                FieldName = 'DATA_BAIXA'
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
                FieldName = 'VALOR_CORR'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_FUNC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_QUIT'
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
                FieldName = 'LOTE_ENT'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIA_CXL'
                Width = 64
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
                FieldName = 'VL_RQ_PG_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OP_CXL'
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
                FieldName = 'LOTE_CXL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TP_REC_CXL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRCSS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JUROS_COB'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_IT_CARTAS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_REG_CARTAS'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CARTA'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_AUT_CART'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_FATURAMENTO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE_NEG'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_LOTE_NEG'
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
                FieldName = 'COD_EMP_MULT'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_NOTA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NREQ'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'N_OS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NCOMANDO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NGRP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COONAOFISCAL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOSSO_NUMERO_BANCO'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAXA_COBRANCA'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'US_CANCELOU'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DT_US_CANCELOU'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBS_PARACREDITO'
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
                FieldName = 'DATA_PREV_REC'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEPENDENTE'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NSERIEECF'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_TERMINAL'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_COBREBEM'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OCORRENCIABANCARIA'
                Width = 64
                Visible = True
              end>
          end
          object Panel5: TPanel
            Left = 0
            Top = 536
            Width = 780
            Height = 41
            Align = alBottom
            TabOrder = 1
            object BitBtn8: TBitBtn
              Left = 323
              Top = 8
              Width = 75
              Height = 25
              Caption = '&OK'
              TabOrder = 0
              OnClick = BitBtn8Click
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
            object BitBtn7: TBitBtn
              Left = 406
              Top = 8
              Width = 75
              Height = 25
              Caption = '&Cancela'
              TabOrder = 1
              OnClick = BitBtn7Click
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
          object GroupBoxConfCol: TGroupBox
            Left = 0
            Top = 0
            Width = 286
            Height = 536
            Align = alLeft
            Caption = 'Configura'#231#227'o das Colunas'
            TabOrder = 2
            Visible = False
            object ScrollBoxConfCol: TScrollBox
              Left = 2
              Top = 15
              Width = 282
              Height = 519
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              TabOrder = 0
              OnEnter = ScrollBoxConfColEnter
              OnExit = ScrollBoxConfColExit
            end
          end
        end
        object tsRemessa: TTabSheet
          Caption = 'tsRemessa'
          ImageIndex = 9
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnRemessa: TPanel
            Left = 32
            Top = 40
            Width = 457
            Height = 289
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object Panel7: TPanel
              Left = 6
              Top = 6
              Width = 441
              Height = 232
              Align = alClient
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Label21: TLabel
                Left = 16
                Top = 72
                Width = 88
                Height = 13
                Caption = 'Tipo de Impress'#227'o'
              end
              object Label22: TLabel
                Left = 16
                Top = 96
                Width = 401
                Height = 39
                AutoSize = False
                Caption = 
                  'O Tipo de Impress'#227'o serve para enviar ao banco pelo arquivo de r' +
                  'emessa informa'#231#245'es sobre a impress'#227'o dos Boletos. Geralmente usa' +
                  'do para determinar o modelo do boleto quando a emiss'#227'o ser'#225' efet' +
                  'uada pelo banco'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label24: TLabel
                Left = 110
                Top = 184
                Width = 119
                Height = 13
                Alignment = taRightJustify
                Caption = 'Remessa de N'#250'mero:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText1: TDBText
                Left = 235
                Top = 184
                Width = 65
                Height = 17
                DataField = 'SEQUENCIA_REMESSA'
                DataSource = DtmBoletos.dsCobreBemBol
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Left = 16
                Top = 141
                Width = 382
                Height = 13
                AutoSize = False
                Caption = 
                  'Verifique no Layout do Boleto para informar neste campo o tipo d' +
                  'e impress'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Edit2: TEdit
                Left = 110
                Top = 69
                Width = 307
                Height = 21
                TabOrder = 0
              end
              object RadioGroup1: TRadioGroup
                Left = 16
                Top = 10
                Width = 401
                Height = 48
                Caption = 'Emiss'#227'o de Boletos'
                Columns = 3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ItemIndex = 0
                Items.Strings = (
                  'Pr'#233' definido (Boletas)'
                  'Pr'#243'pria Empresa'
                  'Pelo Banco')
                ParentFont = False
                TabOrder = 1
              end
            end
            object Panel8: TPanel
              Left = 6
              Top = 238
              Width = 441
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 1
              object BitBtn9: TBitBtn
                Left = 222
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 0
                OnClick = BitBtn9Click
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
              object BitBtn12: TBitBtn
                Left = 141
                Top = 6
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 1
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
        end
        object TabSheet_Recibos: TTabSheet
          Caption = 'TabSheet_Recibos'
          ImageIndex = 10
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox5: TScrollBox
            Left = 0
            Top = 0
            Width = 780
            Height = 577
            Align = alClient
            TabOrder = 0
            object QuickRep_Recibos: TQuickRep
              Left = -5
              Top = -24
              Width = 1123
              Height = 794
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              DataSet = DtmBoletos.cdsBoletos
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
              OnPreview = QuickRep_RecibosPreview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = A4Trans
              Page.Values = (
                0.000000000000000000
                2100.000000000000000000
                100.000000000000000000
                2970.000000000000000000
                0.000000000000000000
                0.000000000000000000
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
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsNormal
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object TitleBand2: TQRBand
                Left = 0
                Top = 38
                Width = 1123
                Height = 515
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                BeforePrint = TitleBand2BeforePrint
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  1362.604166666667000000
                  2971.270833333333000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbDetail
                object QRShape8: TQRShape
                  Left = 14
                  Top = 0
                  Width = 769
                  Height = 513
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1357.312500000000000000
                    37.041666666666670000
                    0.000000000000000000
                    2034.645833333333000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape26: TQRShape
                  Left = 326
                  Top = 0
                  Width = 1
                  Height = 133
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    351.895833333333300000
                    862.541666666666800000
                    0.000000000000000000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape9: TQRShape
                  Left = 16
                  Top = 133
                  Width = 767
                  Height = 1
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    2.645833333333333000
                    42.333333333333330000
                    351.895833333333300000
                    2029.354166666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel61: TQRLabel
                  Left = 332
                  Top = 10
                  Width = 265
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    26.458333333333330000
                    701.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel62: TQRLabel
                  Left = 332
                  Top = 25
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    66.145833333333340000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel63: TQRLabel
                  Left = 332
                  Top = 42
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    111.125000000000000000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel64: TQRLabel
                  Left = 332
                  Top = 75
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    198.437500000000000000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'INSCR. CNPJ:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel65: TQRLabel
                  Left = 375
                  Top = 58
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    992.187500000000000000
                    153.458333333333300000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel66: TQRLabel
                  Left = 332
                  Top = 94
                  Width = 110
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    248.708333333333300000
                    291.041666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'INSCR. ESTADUAL:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel67: TQRLabel
                  Left = 332
                  Top = 58
                  Width = 37
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    153.458333333333300000
                    97.895833333333340000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'FONE:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Calibri'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel69: TQRLabel
                  Left = 409
                  Top = 75
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1082.145833333333000000
                    198.437500000000000000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel70: TQRLabel
                  Left = 439
                  Top = 95
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1161.520833333333000000
                    251.354166666666700000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel68: TQRLabel
                  Left = 332
                  Top = 115
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    878.416666666666800000
                    304.270833333333400000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRShape10: TQRShape
                  Left = 48
                  Top = 147
                  Width = 535
                  Height = 68
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    179.916666666666700000
                    127.000000000000000000
                    388.937500000000000000
                    1415.520833333333000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape11: TQRShape
                  Left = 48
                  Top = 167
                  Width = 394
                  Height = 1
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    2.645833333333333000
                    127.000000000000000000
                    441.854166666666700000
                    1042.458333333333000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape12: TQRShape
                  Left = 48
                  Top = 187
                  Width = 535
                  Height = 1
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    2.645833333333333000
                    127.000000000000000000
                    494.770833333333300000
                    1415.520833333333000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape13: TQRShape
                  Left = 441
                  Top = 147
                  Width = 1
                  Height = 67
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    177.270833333333300000
                    1166.812500000000000000
                    388.937500000000000000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape14: TQRShape
                  Left = 225
                  Top = 147
                  Width = 1
                  Height = 67
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    177.270833333333300000
                    595.312500000000000000
                    388.937500000000000000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape15: TQRShape
                  Left = 135
                  Top = 168
                  Width = 1
                  Height = 46
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    121.708333333333300000
                    357.187500000000000000
                    444.500000000000000000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape16: TQRShape
                  Left = 335
                  Top = 168
                  Width = 1
                  Height = 46
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    121.708333333333300000
                    886.354166666666800000
                    444.500000000000000000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel71: TQRLabel
                  Left = 107
                  Top = 149
                  Width = 46
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    283.104166666666700000
                    394.229166666666700000
                    121.708333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'FATURA'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel72: TQRLabel
                  Left = 277
                  Top = 149
                  Width = 66
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    732.895833333333400000
                    394.229166666666700000
                    174.625000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'DUPLICATA'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel73: TQRLabel
                  Left = 472
                  Top = 159
                  Width = 84
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1248.833333333333000000
                    420.687500000000000000
                    222.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'VENCIMENTOS'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel74: TQRLabel
                  Left = 67
                  Top = 170
                  Width = 41
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    177.270833333333300000
                    449.791666666666700000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'VALOR'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel75: TQRLabel
                  Left = 260
                  Top = 170
                  Width = 41
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    687.916666666666800000
                    449.791666666666700000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'VALOR'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel76: TQRLabel
                  Left = 154
                  Top = 170
                  Width = 51
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    407.458333333333400000
                    449.791666666666700000
                    134.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#218'MERO'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel77: TQRLabel
                  Left = 347
                  Top = 169
                  Width = 76
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    918.104166666666800000
                    447.145833333333400000
                    201.083333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'N'#186' DE ORDEM'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRShape17: TQRShape
                  Left = 600
                  Top = 145
                  Width = 169
                  Height = 99
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    261.937500000000000000
                    1587.500000000000000000
                    383.645833333333300000
                    447.145833333333300000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel78: TQRLabel
                  Left = 443
                  Top = 221
                  Width = 24
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1172.104166666667000000
                    584.729166666666800000
                    63.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'AT'#201':'
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
                object QRLabel79: TQRLabel
                  Left = 479
                  Top = 221
                  Width = 106
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1267.354166666667000000
                    584.729166666666800000
                    280.458333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '00/00/0000'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel80: TQRLabel
                  Left = 189
                  Top = 221
                  Width = 76
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    500.062500000000000000
                    584.729166666666800000
                    201.083333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'DESCONTO DE:'
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
                object QRLabel81: TQRLabel
                  Left = 189
                  Top = 237
                  Width = 90
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    500.062500000000000000
                    627.062500000000000000
                    238.125000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'COND. ESPECIAIS:'
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
                object QRShape18: TQRShape
                  Left = 185
                  Top = 256
                  Width = 584
                  Height = 150
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    396.875000000000000000
                    489.479166666666700000
                    677.333333333333200000
                    1545.166666666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel82: TQRLabel
                  Left = 196
                  Top = 260
                  Width = 99
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    518.583333333333400000
                    687.916666666666800000
                    261.937500000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'NOME DO SACADO:'
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
                object QRLabel83: TQRLabel
                  Left = 196
                  Top = 276
                  Width = 58
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    518.583333333333400000
                    730.250000000000000000
                    153.458333333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ENDERE'#199'O:'
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
                object QRLabel84: TQRLabel
                  Left = 196
                  Top = 293
                  Width = 53
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    518.583333333333400000
                    775.229166666666800000
                    140.229166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'MUNIC'#205'PIO:'
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
                object QRLabel85: TQRLabel
                  Left = 196
                  Top = 311
                  Width = 95
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    518.583333333333400000
                    822.854166666666600000
                    251.354166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'PRA'#199'A DE PAGTO:'
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
                object QRLabel86: TQRLabel
                  Left = 196
                  Top = 330
                  Width = 65
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    518.583333333333400000
                    873.125000000000000000
                    171.979166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'INSCR. CNPJ:'
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
                object QRLabel87: TQRLabel
                  Left = 470
                  Top = 330
                  Width = 95
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1243.541666666667000000
                    873.125000000000000000
                    251.354166666666700000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'INSCR. ESTADUAL:'
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
                object QRLabel88: TQRLabel
                  Left = 507
                  Top = 294
                  Width = 46
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1341.437500000000000000
                    777.875000000000000000
                    121.708333333333300000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ESTADO:'
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
                object QRLabel89: TQRLabel
                  Left = 657
                  Top = 305
                  Width = 23
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1738.312500000000000000
                    806.979166666666800000
                    60.854166666666680000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'CEP:'
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
                object QRShape20: TQRShape
                  Left = 293
                  Top = 353
                  Width = 1
                  Height = 51
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    134.937500000000000000
                    775.229166666666800000
                    933.979166666666800000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel90: TQRLabel
                  Left = 217
                  Top = 353
                  Width = 41
                  Height = 16
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    42.333333333333340000
                    574.145833333333400000
                    933.979166666666600000
                    108.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'VALOR'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel91: TQRLabel
                  Left = 224
                  Top = 369
                  Width = 26
                  Height = 16
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    42.333333333333340000
                    592.666666666666800000
                    976.312500000000000000
                    68.791666666666680000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'POR'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel92: TQRLabel
                  Left = 210
                  Top = 386
                  Width = 55
                  Height = 16
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    42.333333333333340000
                    555.625000000000000000
                    1021.291666666667000000
                    145.520833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'EXTENSO'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel93: TQRLabel
                  Left = 185
                  Top = 414
                  Width = 563
                  Height = 26
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    68.791666666666680000
                    489.479166666666700000
                    1095.375000000000000000
                    1489.604166666667000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 
                    'RECONHE'#199'O(EMOS) A EXATID'#195'O DESTA DUPLICATA DE VENDA MERCANTIL/PR' +
                    'ESTA'#199#195'O DE SERVI'#199'OS, NA '
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
                object QRLabel94: TQRLabel
                  Left = 185
                  Top = 430
                  Width = 244
                  Height = 26
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    68.791666666666680000
                    489.479166666666700000
                    1137.708333333333000000
                    645.583333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'IMPORT'#194'NCIA ACIMA QUE PAGAREI(EMOS) '#192' '
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
                object QRLabel95: TQRLabel
                  Left = 435
                  Top = 430
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1150.937500000000000000
                    1137.708333333333000000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel96: TQRLabel
                  Left = 185
                  Top = 448
                  Width = 305
                  Height = 26
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    68.791666666666680000
                    489.479166666666700000
                    1185.333333333333000000
                    806.979166666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'OU '#192' SUA ORDEM NA PRA'#199'A E VENCIMENTOS INDICADOS.'
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
                object QRShape21: TQRShape
                  Left = 103
                  Top = 271
                  Width = 1
                  Height = 223
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    590.020833333333200000
                    272.520833333333300000
                    717.020833333333200000
                    2.645833333333333000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel97: TQRLabel
                  Left = 589
                  Top = 488
                  Width = 137
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    1558.395833333333000000
                    1291.166666666667000000
                    362.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'ASSINATURA DO SACADO'
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
                object QRLabel98: TQRLabel
                  Left = 215
                  Top = 488
                  Width = 90
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    568.854166666666700000
                    1291.166666666667000000
                    238.125000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'DATA DO ACEITE'
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
                object QRLabel99: TQRLabel
                  Left = 215
                  Top = 469
                  Width = 163
                  Height = 15
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    39.687500000000000000
                    568.854166666666700000
                    1240.895833333333000000
                    431.270833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '______/______/______________'
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
                object QRLabel100: TQRLabel
                  Left = 648
                  Top = 148
                  Width = 74
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1714.500000000000000000
                    391.583333333333400000
                    195.791666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'PARA USO DA'
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
                object QRLabel101: TQRLabel
                  Left = 620
                  Top = 162
                  Width = 135
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1640.416666666667000000
                    428.625000000000000000
                    357.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'INSTITUI'#199#195'O FINANCEIRA'
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
                object QRLabel102: TQRLabel
                  Left = 303
                  Top = 260
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    801.687500000000000000
                    687.916666666666800000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel103: TQRLabel
                  Left = 260
                  Top = 274
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    687.916666666666800000
                    724.958333333333400000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel104: TQRLabel
                  Left = 260
                  Top = 291
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    687.916666666666800000
                    769.937500000000000000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel105: TQRLabel
                  Left = 297
                  Top = 309
                  Width = 232
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    785.812500000000000000
                    817.562500000000000000
                    613.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel106: TQRLabel
                  Left = 271
                  Top = 328
                  Width = 189
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    717.020833333333200000
                    867.833333333333200000
                    500.062500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel107: TQRLabel
                  Left = 571
                  Top = 328
                  Width = 179
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1510.770833333333000000
                    867.833333333333200000
                    473.604166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel108: TQRLabel
                  Left = 558
                  Top = 292
                  Width = 87
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1476.375000000000000000
                    772.583333333333200000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel109: TQRLabel
                  Left = 685
                  Top = 303
                  Width = 79
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1812.395833333333000000
                    801.687500000000000000
                    209.020833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel110: TQRLabel
                  Left = 305
                  Top = 361
                  Width = 456
                  Height = 16
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    42.333333333333340000
                    806.979166666666800000
                    955.145833333333500000
                    1206.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '*'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel111: TQRLabel
                  Left = 53
                  Top = 190
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    140.229166666666700000
                    502.708333333333300000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel112: TQRLabel
                  Left = 142
                  Top = 190
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    375.708333333333300000
                    502.708333333333300000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel113: TQRLabel
                  Left = 243
                  Top = 190
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    642.937500000000000000
                    502.708333333333300000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel114: TQRLabel
                  Left = 353
                  Top = 190
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    933.979166666666800000
                    502.708333333333300000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRLabel115: TQRLabel
                  Left = 474
                  Top = 190
                  Width = 80
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1254.125000000000000000
                    502.708333333333300000
                    211.666666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = '*********************************'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 9
                end
                object QRImage1: TQRImage
                  Left = 18
                  Top = 4
                  Width = 305
                  Height = 127
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    336.020833333333300000
                    47.625000000000000000
                    10.583333333333330000
                    806.979166666666800000)
                  Stretch = True
                end
                object QRShape23: TQRShape
                  Left = 186
                  Top = 353
                  Width = 580
                  Height = 1
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    2.645833333333333000
                    492.125000000000000000
                    933.979166666666800000
                    1534.583333333333000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape19: TQRShape
                  Left = 526
                  Top = 483
                  Width = 256
                  Height = 1
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    2.645833333333333000
                    1391.708333333333000000
                    1277.937500000000000000
                    677.333333333333200000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRLabel118: TQRLabel
                  Left = 305
                  Top = 383
                  Width = 456
                  Height = 16
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    42.333333333333340000
                    806.979166666666800000
                    1013.354166666667000000
                    1206.500000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 
                    '****************************************************************' +
                    '*'
                  Color = clBtnHighlight
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Courier New'
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
        end
        object TabSheet_EnvBol: TTabSheet
          Caption = 'TabSheet_EnvBol'
          ImageIndex = 11
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEnvEmail: TPanel
            Left = 11
            Top = 10
            Width = 686
            Height = 418
            TabOrder = 0
            object Panel9: TPanel
              Left = 1
              Top = 382
              Width = 684
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object ckConfEmailAssunto: TCheckBox
                Left = 4
                Top = 7
                Width = 271
                Height = 17
                Caption = 'Confirmar e-mail / whatsapp e assunto a cada boleto'
                TabOrder = 2
                OnClick = ckConfEmailAssuntoClick
              end
              object BitBtn15: TBitBtn
                Left = 361
                Top = 3
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn15Click
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
              object BitBtn13: TBitBtn
                Left = 280
                Top = 3
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn13Click
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
            object Panel15: TPanel
              Left = 1
              Top = 1
              Width = 684
              Height = 381
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GroupBoxOpcoes: TGroupBox
                Left = 0
                Top = 0
                Width = 684
                Height = 57
                Align = alTop
                Caption = 'Op'#231#245'es'
                TabOrder = 0
                object ckEnviarEmail: TCheckBox
                  Left = 82
                  Top = 24
                  Width = 97
                  Height = 17
                  Caption = 'Enviar E-mail'
                  TabOrder = 0
                  OnClick = ckEnviarEmailClick
                end
                object ckEnviarWhatsApp: TCheckBox
                  Left = 258
                  Top = 24
                  Width = 109
                  Height = 17
                  Caption = 'Enviar WhatsApp'
                  TabOrder = 1
                  OnClick = ckEnviarWhatsAppClick
                end
              end
              object GroupBoxEmail: TGroupBox
                Left = 0
                Top = 57
                Width = 684
                Height = 143
                Align = alTop
                Caption = 'E-mail'
                TabOrder = 1
                object lbAssuntoEmail: TLabel
                  Left = 43
                  Top = 44
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Assunto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lbMensagemEmail: TLabel
                  Left = 31
                  Top = 79
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Mensagem:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lbContatoEmail: TLabel
                  Left = 54
                  Top = 19
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'E-mail:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object EditAssuntoEmail: TEdit
                  Left = 92
                  Top = 41
                  Width = 510
                  Height = 21
                  TabOrder = 1
                end
                object MemoMensagemEmail: TMemo
                  Left = 92
                  Top = 67
                  Width = 510
                  Height = 63
                  ScrollBars = ssVertical
                  TabOrder = 2
                end
                object EditContatoEmail: TEdit
                  Left = 92
                  Top = 15
                  Width = 510
                  Height = 21
                  CharCase = ecLowerCase
                  TabOrder = 0
                end
              end
              object GroupBoxWhatsApp: TGroupBox
                Left = 0
                Top = 200
                Width = 684
                Height = 197
                Align = alTop
                Caption = 'WhatsApp'
                TabOrder = 2
                object lbContatoWhatsApp: TLabel
                  Left = 10
                  Top = 16
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fone WhatApp:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lbMensagemWhatsApp: TLabel
                  Left = 31
                  Top = 113
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Mensagem:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object SpeedButtonAdcWhatsApp: TSpeedButton
                  Left = 608
                  Top = 16
                  Width = 23
                  Height = 22
                  Hint = 'Adicionar WhatsApp'
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
                  OnClick = SpeedButtonAdcWhatsAppClick
                end
                object SpeedButtonRemWhatsApp: TSpeedButton
                  Left = 608
                  Top = 44
                  Width = 23
                  Height = 22
                  Hint = 'Remover WhatsApp'
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000000000031DE00FF00
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
                    0101010101010101010101010101010101010101010101000001010000010101
                    0101010101010100000101000000000101010101010000010101010100000001
                    0101010100000001010101010101000000010000000101010101010101010100
                    0000000000010101010101010101010100000201010101010101010101010100
                    0000000201010101010101010101020200010102020101010101010101020202
                    0201010202020101010101010202020101010101010202010101010202020201
                    0101010101010101010101020201010101010101010101010101010202010101
                    0101010101010101010101010101010101010101010101010101}
                  OnClick = SpeedButtonRemWhatsAppClick
                end
                object lbAssuntoWhatsApp: TLabel
                  Left = 43
                  Top = 86
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Assunto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object CheckListContatoWhatsApp: TCheckListBox
                  Left = 92
                  Top = 12
                  Width = 510
                  Height = 65
                  ItemHeight = 13
                  TabOrder = 0
                end
                object MemoMensagemWhatsApp: TMemo
                  Left = 92
                  Top = 110
                  Width = 510
                  Height = 63
                  ScrollBars = ssVertical
                  TabOrder = 2
                end
                object EditAssuntoWhatsApp: TEdit
                  Left = 92
                  Top = 83
                  Width = 510
                  Height = 21
                  TabOrder = 1
                end
              end
            end
          end
          object pnTelefoneAvulso: TPanel
            Left = 12
            Top = 456
            Width = 317
            Height = 82
            TabOrder = 1
            object Label34: TLabel
              Left = 30
              Top = 17
              Width = 46
              Height = 13
              Caption = 'Telefone:'
            end
            object MaskEdit4: TMaskEdit
              Left = 82
              Top = 14
              Width = 87
              Height = 21
              EditMask = '!\(99\)00000-0000;1;_'
              MaxLength = 14
              TabOrder = 0
              Text = '(  )     -    '
            end
            object Panel16: TPanel
              Left = 1
              Top = 46
              Width = 315
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn16: TBitBtn
                Left = 78
                Top = 3
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn16Click
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
              object BitBtn17: TBitBtn
                Left = 159
                Top = 3
                Width = 75
                Height = 25
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn17Click
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
    inherited PanelFlash: TPanel
      Left = 960
      Height = 574
      ExplicitLeft = 960
      ExplicitHeight = 574
      inherited bMarketingHW: TBitBtn
        Top = 552
        ExplicitTop = 552
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 612
    Width = 795
    Height = 24
    ExplicitTop = 612
    ExplicitWidth = 795
    ExplicitHeight = 24
  end
  inherited pnStatusProcessamento: TPanel
    Left = 896
    ExplicitLeft = 896
  end
  inherited PopupMenu1: TPopupMenu
    Left = 588
    Top = 17
    object SelecionarTodos: TMenuItem
      Caption = 'Selecionar todos'
      OnClick = SelecionarTodosClick
    end
    object DesmarcaTodos1: TMenuItem
      Caption = 'Desmarca Todos'
      OnClick = DesmarcaTodos1Click
    end
    object Marcarboletoparaserimpressopelobanco1: TMenuItem
      Caption = 'Marcar boleto para ser impresso pelo banco'
      OnClick = Marcarboletoparaserimpressopelobanco1Click
    end
    object Desmarcarboletoparaserimpressopelobanco1: TMenuItem
      Caption = 'Desmarcar boleto para ser impresso pelo banco'
      OnClick = Desmarcarboletoparaserimpressopelobanco1Click
    end
    object MarcarTodosBoletosClick: TMenuItem
      Caption = 'Marcar Todos Boletos'
      OnClick = MarcarTodosBoletosClickClick
    end
    object DesmarcarTodosBoletosClick: TMenuItem
      Caption = 'Desmarcar Todos Boletos'
      OnClick = DesmarcarTodosBoletosClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 646
    Top = 19
  end
  inherited Timer1: TTimer
    Left = 614
    Top = 19
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 558
    Top = 19
  end
  object RDprint1: TRDprint
    ImpressoraPersonalizada.NomeImpressora = 'Modelo Personalizado - (Epson)'
    ImpressoraPersonalizada.AvancaOitavos = '27 48'
    ImpressoraPersonalizada.AvancaSextos = '27 50'
    ImpressoraPersonalizada.SaltoPagina = '12'
    ImpressoraPersonalizada.TamanhoPagina = '27 67 66'
    ImpressoraPersonalizada.Negrito = '27 69'
    ImpressoraPersonalizada.Italico = '27 52'
    ImpressoraPersonalizada.Sublinhado = '27 45 49'
    ImpressoraPersonalizada.Expandido = '27 14'
    ImpressoraPersonalizada.Normal10 = '18 27 80'
    ImpressoraPersonalizada.Comprimir12 = '18 27 77'
    ImpressoraPersonalizada.Comprimir17 = '27 80 27 15'
    ImpressoraPersonalizada.Comprimir20 = '27 77 27 15'
    ImpressoraPersonalizada.Reset = '27 80 18 20 27 53 27 70 27 45 48'
    ImpressoraPersonalizada.Inicializar = '27 64'
    OpcoesPreview.PaginaZebrada = False
    OpcoesPreview.Remalina = False
    OpcoesPreview.CaptionPreview = 'Rdprint Preview'
    OpcoesPreview.PreviewZoom = 100
    OpcoesPreview.CorPapelPreview = clWhite
    OpcoesPreview.CorLetraPreview = clBlack
    OpcoesPreview.Preview = True
    OpcoesPreview.BotaoSetup = Ativo
    OpcoesPreview.BotaoImprimir = Ativo
    OpcoesPreview.BotaoGravar = Ativo
    OpcoesPreview.BotaoLer = Ativo
    OpcoesPreview.BotaoProcurar = Ativo
    OpcoesPreview.BotaoPDF = Ativo
    OpcoesPreview.BotaoEMAIL = Ativo
    Margens.Left = 10
    Margens.Right = 10
    Margens.Top = 10
    Margens.Bottom = 10
    Autor = Deltress
    RegistroUsuario.NomeRegistro = 'LESTE INFORMATICA LTDA - ME'
    RegistroUsuario.SerieProduto = 'SINGLE-0113/01448'
    RegistroUsuario.AutorizacaoKey = 'VUYG-1QQX-P85V-AWCD-RR5K'
    About = 'RDprint 5.0 - Registrado'
    Acentuacao = Transliterate
    CaptionSetup = 'Rdprint Setup'
    TitulodoRelatorio = 'Gerado por RDprint'
    UsaGerenciadorImpr = True
    CorForm = clBtnFace
    CorFonte = clBlack
    Impressora = Epson
    Mapeamento.Strings = (
      '//--- Grafico Compativel com Windows/USB ---//'
      '//'
      'GRAFICO=GRAFICO'
      'HP=GRAFICO'
      'DESKJET=GRAFICO'
      'LASERJET=GRAFICO'
      'INKJET=GRAFICO'
      'STYLUS=GRAFICO'
      'EPL=GRAFICO'
      'USB=GRAFICO'
      '//'
      '//--- Linha Epson Matricial 9 e 24 agulhas ---//'
      '//'
      'EPSON=EPSON'
      'GENERICO=EPSON'
      'LX-300=EPSON'
      'LX-810=EPSON'
      'FX-2170=EPSON'
      'FX-1170=EPSON'
      'LQ-1170=EPSON'
      'LQ-2170=EPSON'
      'OKIDATA=EPSON'
      '//'
      '//--- Rima e Emilia ---//'
      '//'
      'RIMA=RIMA'
      'EMILIA=RIMA'
      '//'
      '//--- Linha HP/Xerox padr'#227'o PCL ---//'
      '//'
      'PCL=HP'
      '//'
      '//--- Impressoras 40 Colunas ---//'
      '//'
      'DARUMA=BOBINA'
      'SIGTRON=BOBINA'
      'SWEDA=BOBINA'
      'BEMATECH=BOBINA')
    MostrarProgresso = True
    TamanhoQteLinhas = 66
    TamanhoQteColunas = 80
    TamanhoQteLPP = Seis
    NumerodeCopias = 1
    FonteTamanhoPadrao = S10cpp
    FonteEstiloPadrao = []
    Orientacao = poPortrait
    Left = 672
    Top = 16
  end
  object PopupMenuConfCol: TPopupMenu
    Left = 707
    Top = 209
    object Configurarcolunas2: TMenuItem
      Caption = ' Configurar colunas'
      OnClick = Configurarcolunas2Click
    end
    object ResetarConfiguraesdecolunas2: TMenuItem
      Caption = 'Resetar Configura'#231#245'es de colunas'
      OnClick = ResetarConfiguraesdecolunas2Click
    end
    object SalvardadosnoExcel2: TMenuItem
      Caption = 'Salvar dados no Excel'
      OnClick = SalvardadosnoExcel2Click
    end
    object ReajustarLarguradascolunas2: TMenuItem
      Caption = 'Reajustar Largura das colunas'
      OnClick = ReajustarLarguradascolunas2Click
    end
    object Copiarparareadetransferncia2: TMenuItem
      Caption = 'Copiar para '#225'rea de transfer'#234'ncia'
      OnClick = Copiarparareadetransferncia2Click
    end
  end
end
