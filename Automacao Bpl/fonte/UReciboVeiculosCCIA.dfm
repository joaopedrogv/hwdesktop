inherited frmReciboVeiculosCCIA: TfrmReciboVeiculosCCIA
  Caption = 'Recibo'
  ClientHeight = 623
  ClientWidth = 792
  ExplicitWidth = 800
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 792
    Height = 611
    ExplicitWidth = 792
    ExplicitHeight = 611
    inherited Splitter2: TSplitter
      Height = 609
      ExplicitHeight = 608
    end
    inherited PanelLeft: TPanel
      Width = 787
      Height = 609
      ExplicitWidth = 787
      ExplicitHeight = 609
      inherited PageControl1: TPageControl
        Width = 785
        Height = 607
        ExplicitWidth = 785
        ExplicitHeight = 607
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 777
          ExplicitHeight = 576
          inherited ScrollBox1: TScrollBox
            Width = 777
            Height = 576
            ExplicitWidth = 777
            ExplicitHeight = 576
            inherited PageControl3: TPageControl
              Width = 777
              Height = 528
              ExplicitWidth = 777
              ExplicitHeight = 528
              inherited TabSheet3: TTabSheet
                Caption = 'Recibo'
                ExplicitLeft = 4
                ExplicitTop = 24
                ExplicitWidth = 781
                ExplicitHeight = 503
                inherited ScrollBox3: TScrollBox
                  Width = 769
                  Height = 497
                  ExplicitWidth = 769
                  ExplicitHeight = 503
                  inherited GroupBox1: TGroupBox
                    Width = 748
                    Height = 497
                    Caption = ''
                    ExplicitWidth = 748
                    ExplicitHeight = 497
                    object GroupBox25: TGroupBox
                      Left = 442
                      Top = 9
                      Width = 332
                      Height = 48
                      TabOrder = 0
                      object Label80: TLabel
                        Left = 28
                        Top = 16
                        Width = 49
                        Height = 13
                        Caption = 'Vendedor:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBLookupComboBox15: TDBLookupComboBox
                        Left = 83
                        Top = 12
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                    end
                    object GroupBox16: TGroupBox
                      Left = 442
                      Top = 57
                      Width = 332
                      Height = 79
                      Caption = 'Imprimir'
                      TabOrder = 1
                      object CheckBox4: TCheckBox
                        Left = 19
                        Top = 17
                        Width = 78
                        Height = 17
                        Caption = 'Contrato'
                        TabOrder = 0
                      end
                      object CheckBox2: TCheckBox
                        Left = 92
                        Top = 17
                        Width = 93
                        Height = 17
                        Caption = 'Recibo Comum'
                        TabOrder = 1
                      end
                      object CheckBox5: TCheckBox
                        Left = 19
                        Top = 39
                        Width = 190
                        Height = 17
                        Caption = 'Controle Interno - Venda de ve'#237'culo'
                        TabOrder = 2
                      end
                      object CheckBox7: TCheckBox
                        Left = 191
                        Top = 16
                        Width = 117
                        Height = 17
                        Caption = 'Recibo Antecipado'
                        TabOrder = 3
                      end
                      object CheckBox8: TCheckBox
                        Left = 18
                        Top = 59
                        Width = 255
                        Height = 17
                        Caption = 'Controle Interno - Reserva de venda de ve'#237'culo'
                        TabOrder = 4
                      end
                    end
                    object GroupBox18: TGroupBox
                      Left = 3
                      Top = 7
                      Width = 433
                      Height = 83
                      TabOrder = 2
                      object Label29: TLabel
                        Left = 68
                        Top = 12
                        Width = 24
                        Height = 13
                        Caption = 'Tipo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label14: TLabel
                        Left = 57
                        Top = 37
                        Width = 35
                        Height = 13
                        Caption = 'Chassi:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label6: TLabel
                        Left = 7
                        Top = 63
                        Width = 85
                        Height = 13
                        Caption = 'Status do Recibo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBLookupComboBox5: TDBLookupComboBox
                        Left = 98
                        Top = 7
                        Width = 199
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 0
                      end
                      object DBEdit3: TDBEdit
                        Left = 98
                        Top = 32
                        Width = 196
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 1
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 98
                        Top = 59
                        Width = 136
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 2
                      end
                      object BitBtn8: TBitBtn
                        Left = 299
                        Top = 33
                        Width = 20
                        Height = 20
                        TabOrder = 3
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                          00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                          FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                          B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                          EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                          FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                          C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                          FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                          E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                          C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                          C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                          DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                          FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                          86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                          00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                      end
                    end
                    object GroupBox4: TGroupBox
                      Left = 3
                      Top = 142
                      Width = 771
                      Height = 170
                      Caption = 'Condi'#231#245'es de Negocio'
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 3
                      object GroupBox13: TGroupBox
                        Left = 40
                        Top = 132
                        Width = 671
                        Height = 32
                        TabOrder = 5
                        object Label20: TLabel
                          Left = 3
                          Top = 11
                          Width = 73
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label21: TLabel
                          Left = 492
                          Top = 11
                          Width = 34
                          Height = 13
                          Caption = 'Valor:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit11: TDBEdit
                          Left = 82
                          Top = 8
                          Width = 399
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 0
                        end
                        object DBEdit12: TDBEdit
                          Left = 532
                          Top = 8
                          Width = 127
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 1
                        end
                      end
                      object GroupBox14: TGroupBox
                        Left = 6
                        Top = 132
                        Width = 32
                        Height = 32
                        TabOrder = 6
                        object Label22: TLabel
                          Left = 5
                          Top = 11
                          Width = 20
                          Height = 13
                          Caption = '5 - '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object GroupBox11: TGroupBox
                        Left = 40
                        Top = 102
                        Width = 671
                        Height = 32
                        TabOrder = 3
                        object Label17: TLabel
                          Left = 3
                          Top = 11
                          Width = 73
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label18: TLabel
                          Left = 492
                          Top = 11
                          Width = 34
                          Height = 13
                          Caption = 'Valor:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit9: TDBEdit
                          Left = 82
                          Top = 8
                          Width = 399
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 0
                        end
                        object DBEdit10: TDBEdit
                          Left = 532
                          Top = 8
                          Width = 127
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 1
                        end
                      end
                      object GroupBox12: TGroupBox
                        Left = 6
                        Top = 102
                        Width = 32
                        Height = 32
                        TabOrder = 4
                        object Label19: TLabel
                          Left = 5
                          Top = 11
                          Width = 20
                          Height = 13
                          Caption = '4 - '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object GroupBox10: TGroupBox
                        Left = 40
                        Top = 72
                        Width = 671
                        Height = 32
                        TabOrder = 2
                        object Label15: TLabel
                          Left = 3
                          Top = 11
                          Width = 73
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label16: TLabel
                          Left = 492
                          Top = 11
                          Width = 34
                          Height = 13
                          Caption = 'Valor:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit7: TDBEdit
                          Left = 82
                          Top = 8
                          Width = 399
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 0
                        end
                        object DBEdit8: TDBEdit
                          Left = 532
                          Top = 8
                          Width = 127
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 1
                        end
                      end
                      object GroupBox8: TGroupBox
                        Left = 6
                        Top = 72
                        Width = 32
                        Height = 32
                        TabOrder = 1
                        object Label13: TLabel
                          Left = 5
                          Top = 11
                          Width = 20
                          Height = 13
                          Caption = '3 - '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object GroupBox6: TGroupBox
                        Left = 40
                        Top = 42
                        Width = 671
                        Height = 32
                        TabOrder = 0
                        object Label10: TLabel
                          Left = 3
                          Top = 12
                          Width = 73
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label11: TLabel
                          Left = 492
                          Top = 11
                          Width = 34
                          Height = 13
                          Caption = 'Valor:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit5: TDBEdit
                          Left = 82
                          Top = 8
                          Width = 399
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 0
                        end
                        object DBEdit6: TDBEdit
                          Left = 531
                          Top = 8
                          Width = 127
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 1
                        end
                      end
                      object GroupBox7: TGroupBox
                        Left = 6
                        Top = 42
                        Width = 32
                        Height = 32
                        TabOrder = 9
                        object Label12: TLabel
                          Left = 5
                          Top = 11
                          Width = 20
                          Height = 13
                          Caption = '2 - '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                      object GroupBox5: TGroupBox
                        Left = 40
                        Top = 12
                        Width = 671
                        Height = 32
                        TabOrder = 8
                        object Label7: TLabel
                          Left = 3
                          Top = 11
                          Width = 73
                          Height = 13
                          Caption = 'Observa'#231#227'o:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label9: TLabel
                          Left = 492
                          Top = 11
                          Width = 34
                          Height = 13
                          Caption = 'Valor:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit2: TDBEdit
                          Left = 82
                          Top = 8
                          Width = 399
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 0
                        end
                        object DBEdit4: TDBEdit
                          Left = 532
                          Top = 8
                          Width = 127
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          TabOrder = 1
                        end
                      end
                      object GroupBox9: TGroupBox
                        Left = 6
                        Top = 12
                        Width = 32
                        Height = 32
                        TabOrder = 7
                        object Label8: TLabel
                          Left = 5
                          Top = 11
                          Width = 20
                          Height = 13
                          Caption = '1 - '
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                      end
                    end
                    object GroupBox15: TGroupBox
                      Left = 3
                      Top = 311
                      Width = 771
                      Height = 32
                      Color = clBtnFace
                      ParentColor = False
                      TabOrder = 4
                      object Label24: TLabel
                        Left = 470
                        Top = 12
                        Width = 97
                        Height = 13
                        Caption = 'Valor a Receber:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object DBEdit14: TDBEdit
                        Left = 573
                        Top = 8
                        Width = 127
                        Height = 21
                        CharCase = ecUpperCase
                        DataField = 'CHASSI'
                        TabOrder = 0
                      end
                      object CheckBox6: TCheckBox
                        Left = 10
                        Top = 11
                        Width = 97
                        Height = 17
                        Caption = 'Ve'#237'culo Rodando'
                        TabOrder = 1
                      end
                    end
                    object GroupBox19: TGroupBox
                      Left = 3
                      Top = 342
                      Width = 771
                      Height = 151
                      TabOrder = 5
                      object Label31: TLabel
                        Left = 3
                        Top = 7
                        Width = 179
                        Height = 13
                        Caption = 'Documento, Manual, Chave Reserva:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label32: TLabel
                        Left = 206
                        Top = 7
                        Width = 34
                        Height = 13
                        Caption = 'Multas:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label33: TLabel
                        Left = 399
                        Top = 7
                        Width = 66
                        Height = 13
                        Caption = 'Observa'#231#245'es:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label38: TLabel
                        Left = 201
                        Top = 63
                        Width = 102
                        Height = 13
                        Caption = 'Promessas de venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label39: TLabel
                        Left = 5
                        Top = 63
                        Width = 78
                        Height = 13
                        Caption = 'Controle Interno:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object GroupBox20: TGroupBox
                        Left = 353
                        Top = 62
                        Width = 365
                        Height = 85
                        Caption = 'Utilizado na troca'
                        TabOrder = 0
                        object Label28: TLabel
                          Left = 19
                          Top = 17
                          Width = 34
                          Height = 13
                          Caption = 'Chassi:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label30: TLabel
                          Left = 3
                          Top = 44
                          Width = 50
                          Height = 13
                          Caption = 'Opcionais:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                        object BitBtn11: TBitBtn
                          Left = 327
                          Top = 15
                          Width = 20
                          Height = 20
                          TabOrder = 0
                          OnClick = BitBtn4Click
                          Glyph.Data = {
                            36030000424D3603000000000000360000002800000010000000100000000100
                            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                            9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                            9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                            CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                            9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                            C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                            D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                            959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                            C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                            E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                            9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                            CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                            E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                            A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                            D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                            F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                            B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                            D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                            FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                            B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                            AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                            FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                            BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                            AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                            B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                        end
                        object BitBtn12: TBitBtn
                          Left = 299
                          Top = 15
                          Width = 20
                          Height = 20
                          TabOrder = 1
                          OnClick = BitBtn4Click
                          Glyph.Data = {
                            6E030000424D6E030000000000006E0200002800000010000000100000000100
                            08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                            FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                            79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                            6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                            A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                            7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                            7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                            C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                            C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                            9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                            E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                            7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                            8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                            EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                            8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                            F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                            BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                            6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                            AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                            020207070707070707070707070707020202076C5453525E5B58666564630702
                            020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                            02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                            020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                            02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                            02023C0101010148476235182406787575023C01010101016F71312B2679767B
                            878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                            858A4138383838383838382A0202028C8B02}
                        end
                        object DBEdit13: TDBEdit
                          Left = 63
                          Top = 14
                          Width = 230
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'CHASSI'
                          Enabled = False
                          TabOrder = 2
                        end
                        object Memo8: TMemo
                          Left = 63
                          Top = 41
                          Width = 284
                          Height = 34
                          Lines.Strings = (
                            'Memo3')
                          TabOrder = 3
                        end
                      end
                      object Memo4: TMemo
                        Left = 201
                        Top = 24
                        Width = 192
                        Height = 34
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 1
                      end
                      object Memo5: TMemo
                        Left = 399
                        Top = 24
                        Width = 301
                        Height = 34
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 2
                      end
                      object Memo6: TMemo
                        Left = 3
                        Top = 82
                        Width = 192
                        Height = 63
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 3
                      end
                      object Memo7: TMemo
                        Left = 199
                        Top = 82
                        Width = 151
                        Height = 63
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 4
                      end
                      object Memo3: TMemo
                        Left = 3
                        Top = 26
                        Width = 192
                        Height = 34
                        Lines.Strings = (
                          'Memo3')
                        TabOrder = 5
                      end
                    end
                    object GroupBox17: TGroupBox
                      Left = 3
                      Top = 89
                      Width = 433
                      Height = 47
                      TabOrder = 6
                      object Label34: TLabel
                        Left = 17
                        Top = 17
                        Width = 75
                        Height = 13
                        Caption = 'Recebemos de:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit19: TDBEdit
                        Left = 98
                        Top = 13
                        Width = 42
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        TabOrder = 0
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 143
                        Top = 13
                        Width = 201
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        TabOrder = 1
                      end
                      object BitBtn7: TBitBtn
                        Left = 348
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 2
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          6E030000424D6E030000000000006E0200002800000010000000100000000100
                          08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                          FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                          79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                          6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                          A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                          7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                          7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                          C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                          C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                          9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                          E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                          7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                          8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                          EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                          8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                          F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                          BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                          6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                          AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                          020207070707070707070707070707020202076C5453525E5B58666564630702
                          020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                          02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                          020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                          02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                          02023C0101010148476235182406787575023C01010101016F71312B2679767B
                          878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                          858A4138383838383838382A0202028C8B02}
                      end
                      object BitBtn9: TBitBtn
                        Left = 374
                        Top = 13
                        Width = 20
                        Height = 20
                        TabOrder = 3
                        OnClick = BitBtn4Click
                        Glyph.Data = {
                          36030000424D3603000000000000360000002800000010000000100000000100
                          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                          9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                          9C9C9C9C9C9C9CFF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                          CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2
                          C2C6C6C69C9C9CFF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                          D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                          959595F5F5F5E9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4
                          C4C5C5C59C9C9CFF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                          E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                          9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCC
                          CCCCCCCC9C9C9CFF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                          E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                          A6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EEEEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6
                          D6D6D6D69C9C9CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                          F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                          B1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5
                          D5B7B7B79C9C9CFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                          FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCD6D6D6999999ACAC
                          AC9B9B9B969696FF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                          FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                          BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6F6F6D7D7D7999999AAAA
                          AAFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                          B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
                      end
                      object TEdit
                        Left = 160
                        Top = -24
                        Width = 121
                        Height = 21
                        TabOrder = 4
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 528
              Width = 777
              ExplicitTop = 531
              ExplicitWidth = 777
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 777
          ExplicitHeight = 576
          inherited GroupBox3: TGroupBox
            Width = 777
            ExplicitWidth = 777
            inherited imgInformation: TImage
              Left = 751
              ExplicitLeft = 751
            end
            object Edit1: TEdit
              Left = 604
              Top = 44
              Width = 121
              Height = 21
              TabOrder = 11
              Text = 'EDIT PARA FUNCIONAR'
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 777
            Height = 503
            ExplicitWidth = 777
            ExplicitHeight = 503
            inherited Splitter1: TSplitter
              Height = 442
              ExplicitHeight = 444
            end
            inherited DBGrid1: TDBGrid
              Width = 484
              Height = 442
            end
            inherited Panel2: TPanel
              Width = 773
              inherited SpeedButton3: TSpeedButton
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Confirmar Recebimento'
                Glyph.Data = {
                  4A050000424D4A050000000000000A0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000B5000000B500000000000000FFFF
                  FF00FF00FF00FFFDFE00D79998007D332F00FDDFDC00FEEBE900F5634D00F062
                  4800F2644A00F76A5200FA968400FAA39300FCB8AC00F7705700F8735900F6BD
                  B100E45D3B00E85F4000EF6E4E00F7785A00F97B5E00EC846A00E05C3800F57A
                  5900FA7E5C00FB836000FA826200D1998A00C64C2700C54B2700D95B3200FD86
                  6000FB866200FC896600FB886600FB896600FD8B6800FC8A6800FB896700FB8A
                  6700FC8B6900FB8C6800D4552900CE552500C8521E00C85B2A0099330000C14F
                  170088452400A9ABAB00167FA400167EA2001888AF001886AC001780A500167C
                  A000167C9F002583AF002C88B30027739600328DB7006DADCB0070AFCC000063
                  9600006395000062940000609200034F7500034E740004547D00044F7600044F
                  7500044D7300096D9F00096A9C0007557B000A6EA10007517700095881001373
                  A2001B79A70016638900166388002281AE002583B0002582AF002985B1002E89
                  B40005537D00076698000A5882000B5881003BA0DE003799DE003AA1E60042AA
                  F20048B1F70046ADF2004CB4FD004BB3FC004AB2F9004FB7FF001D73B100379D
                  E8003694DA003DA4F30044ABFB0047AEFD0046ADFC0046ADFB0048AFFD0047AE
                  FC0047AEFB0049B0FF004AB1FD004AB2FD0049B0FC004DB4FF004DB4FE003EA4
                  FB003FA5FC003FA6FB0041A8FC0041A7FB0041A8FB0043AAFE0042A9FB0043AA
                  FB0045ACFD001E7BD2002C91EC00379CFA00379DFA0039A0FC00399FF9003AA0
                  FB003AA1FB003BA0FB003CA2FB001D83EC003294F7003395F8003396F8003395
                  F7003498F9003497F800399EFD002E8AF0002E8BEF00308EF300308FF3001E7F
                  ED00207AE600217EE900227EE8002B85EB00297FE200A7B1BD00196FDE001F76
                  E3002678E200637EA90090959E000335FB001342FB00224EFB00325BFC005274
                  FC00718DFC008099FC00A0B2FD00AFBFFD00CFD8FD00DFE5FE000C35EB00EEF1
                  FE00FEFEFE00F5F5F500EDEDED00020202020202020202303030303030303030
                  30300202020202020202020202020230B2B2B2B2AFA8B1B2B230020202020202
                  0202020202020230B2B2B2ADA6A5ACB2B2300202020202020202020202020230
                  B2B2AAA5A5A5A7B2B2300202020202323232323232323230B1A8A5A5AAA6A5AD
                  B2300202020232311809080B0F160C30A7A5A6ADB2ABA5A7B23002020202322E
                  120A101C2B1A0E30ACA8AEB2B2B1A6A5AB3002020202322D13152729222F0730
                  B2B2B2B2B2B2ACA5A50502020202322C142628252F0D0330B2B2B2B2B2B2B2A9
                  A5B0020202020220192A241B2F06B230B2B2B2B2B2B2B2B1A8A5A5020202021F
                  1F23212F11B4B330303030303030303005B0A5A502020202021F17049FA4331D
                  2F1E1E02020202020202A5A5A502020202A33738353A39340202020202020202
                  020202A5A5A50202368D999B9C9AA0A136020202020202020202020202020247
                  83979193938E989DA236020202020202020202020202025A84948B8C8C8A8690
                  959E3602020202020202020202024248687A7E80807D79899296360202020202
                  020202020202434A6A827370726E6C7B878F3602020202020202020202024149
                  695F4F617576718179853602020202020202020202024B4E4D4645606465766F
                  7C88360202020202020202020202553B514C4D626778746D7F36020202020202
                  020202020202023E3F57545E636677736B360202020202020202020202020256
                  3F40593D535D5C503602020202020202020202020202020202563C58525B4402
                  0202020202020202020202020202}
                OnClick = SpeedButton6Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 442
              ExplicitHeight = 442
              inherited ScrollBox2: TScrollBox
                Height = 425
                ExplicitHeight = 425
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 777
          ExplicitHeight = 576
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 4
      Height = 609
      ExplicitWidth = 4
      ExplicitHeight = 609
      inherited bMarketingHW: TBitBtn
        Top = 587
        Width = 2
        ExplicitTop = 587
        ExplicitWidth = 2
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 611
    Width = 792
    Height = 12
    ExplicitTop = 611
    ExplicitWidth = 792
    ExplicitHeight = 12
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 228
    Top = 1
  end
  inherited PopupMenu2: TPopupMenu
    Left = 166
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 198
    Top = 3
  end
end
