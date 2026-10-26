inherited FrmCadModVeiculos: TFrmCadModVeiculos
  Left = 224
  Top = 28
  Caption = 'Modelos de Ve'#237'culos'
  ClientHeight = 574
  ClientWidth = 788
  ExplicitWidth = 796
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 788
    Height = 555
    ExplicitWidth = 788
    ExplicitHeight = 555
    inherited Splitter2: TSplitter
      Height = 553
      ExplicitHeight = 573
    end
    inherited PanelLeft: TPanel
      Width = 783
      Height = 553
      ExplicitWidth = 783
      ExplicitHeight = 553
      inherited PageControl1: TPageControl
        Width = 781
        Height = 551
        ExplicitWidth = 781
        ExplicitHeight = 551
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 520
          inherited ScrollBox1: TScrollBox
            Width = 773
            Height = 520
            ExplicitWidth = 773
            ExplicitHeight = 520
            inherited PageControl3: TPageControl
              Width = 773
              Height = 472
              OnChange = PageControl3Change
              ExplicitWidth = 773
              ExplicitHeight = 472
              inherited TabSheet3: TTabSheet
                Caption = 'Cadastro'
                OnShow = TabSheet3Show
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 765
                ExplicitHeight = 441
                inherited ScrollBox3: TScrollBox
                  Width = 765
                  Height = 441
                  ExplicitWidth = 765
                  ExplicitHeight = 441
                  inherited GroupBox1: TGroupBox
                    Top = 437
                    Width = 761
                    Height = 0
                    Align = alClient
                    Visible = False
                    ExplicitTop = 437
                    ExplicitWidth = 761
                    ExplicitHeight = 0
                  end
                  object Panel4: TPanel
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 437
                    Align = alTop
                    TabOrder = 1
                    object Label6: TLabel
                      Left = 61
                      Top = 12
                      Width = 44
                      Height = 13
                      Caption = 'Codigo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 43
                      Top = 31
                      Width = 62
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label8: TLabel
                      Left = 42
                      Top = 55
                      Width = 63
                      Height = 13
                      Caption = 'Desc.Fab.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 44
                      Top = 78
                      Width = 61
                      Height = 13
                      Caption = 'Cilindrada:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 259
                      Top = 78
                      Width = 53
                      Height = 13
                      Caption = 'Cilindros:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label11: TLabel
                      Left = 30
                      Top = 101
                      Width = 75
                      Height = 13
                      Caption = 'Combust'#237'vel:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label12: TLabel
                      Left = 543
                      Top = 101
                      Width = 22
                      Height = 13
                      Caption = 'HP:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 471
                      Top = 79
                      Width = 94
                      Height = 13
                      Caption = 'Lota'#231#227'o: (Pass.)'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 302
                      Top = 124
                      Width = 30
                      Height = 13
                      Caption = 'Tipo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 28
                      Top = 239
                      Width = 77
                      Height = 13
                      Caption = 'Valor Tabela:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 490
                      Top = 239
                      Width = 75
                      Height = 13
                      Caption = 'VL ICM SUB:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label17: TLabel
                      Left = 71
                      Top = 284
                      Width = 34
                      Height = 13
                      Caption = 'Ano1:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 71
                      Top = 308
                      Width = 34
                      Height = 13
                      Caption = 'Ano2:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 15
                      Top = 170
                      Width = 90
                      Height = 13
                      Caption = 'Ord. Impress'#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 20
                      Top = 356
                      Width = 85
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Url Fabricante:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label24: TLabel
                      Left = 33
                      Top = 334
                      Width = 72
                      Height = 13
                      Caption = 'Tabela Fipe:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 279
                      Top = 284
                      Width = 53
                      Height = 13
                      Caption = 'Modelo1:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 279
                      Top = 308
                      Width = 53
                      Height = 13
                      Caption = 'Modelo2:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label23: TLabel
                      Left = 474
                      Top = 308
                      Width = 91
                      Height = 13
                      Caption = 'Inicial Chassi 2:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label25: TLabel
                      Left = 474
                      Top = 284
                      Width = 91
                      Height = 13
                      Caption = 'Inicial Chassi 1:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label26: TLabel
                      Left = 500
                      Top = 261
                      Width = 63
                      Height = 13
                      Caption = 'Pis/Cofins:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 231
                      Top = 239
                      Width = 101
                      Height = 13
                      Caption = 'Base C. ICM Sub:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label28: TLabel
                      Left = 47
                      Top = 147
                      Width = 58
                      Height = 13
                      Caption = 'Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label29: TLabel
                      Left = 236
                      Top = 170
                      Width = 96
                      Height = 13
                      Caption = 'Venda/Estoque?'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label61: TLabel
                      Left = 463
                      Top = 170
                      Width = 102
                      Height = 13
                      Caption = 'Valor Unit'#225'rio NF:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label62: TLabel
                      Left = 475
                      Top = 147
                      Width = 90
                      Height = 13
                      Caption = 'Mod. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label63: TLabel
                      Left = 65
                      Top = 192
                      Width = 40
                      Height = 13
                      Caption = 'CMKG:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label64: TLabel
                      Left = 246
                      Top = 193
                      Width = 86
                      Height = 13
                      Caption = 'Dist'#226'ncia Eixo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label65: TLabel
                      Left = 38
                      Top = 215
                      Width = 67
                      Height = 13
                      Caption = 'Peso Bruto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label66: TLabel
                      Left = 274
                      Top = 215
                      Width = 58
                      Height = 13
                      Caption = 'Peso Liq.:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label67: TLabel
                      Left = 245
                      Top = 147
                      Width = 87
                      Height = 13
                      Caption = 'Esp. Renavam:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label30: TLabel
                      Left = 50
                      Top = 124
                      Width = 55
                      Height = 13
                      Caption = 'NCM/SH:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label37: TLabel
                      Left = 18
                      Top = 380
                      Width = 87
                      Height = 13
                      Caption = 'C'#243'd. F'#225'b. NFe:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label35: TLabel
                      Left = 47
                      Top = 261
                      Width = 58
                      Height = 13
                      Caption = 'Valor PIS:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label36: TLabel
                      Left = 248
                      Top = 261
                      Width = 83
                      Height = 13
                      Caption = 'Valor COFINS:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label31: TLabel
                      Left = 527
                      Top = 124
                      Width = 36
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Marca'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label273: TLabel
                      Left = 276
                      Top = 407
                      Width = 285
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Conta Cont'#225'bil Anal'#237'tica de Estoque Ve'#237'culos Novos'
                      FocusControl = DBEdit187
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label274: TLabel
                      Left = 317
                      Top = 434
                      Width = 244
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Conta Cont'#225'bil Anal'#237'tica de Ve'#237'culos Usados'
                      FocusControl = DBEdit188
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit1: TDBEdit
                      Left = 111
                      Top = 4
                      Width = 65
                      Height = 21
                      Hint = 'C'#243'digo sequencial do modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 111
                      Top = 28
                      Width = 392
                      Height = 21
                      Hint = 'Descri'#231#227'o do modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 1
                    end
                    object DBEdit4: TDBEdit
                      Left = 111
                      Top = 52
                      Width = 392
                      Height = 21
                      Hint = 'Descri'#231#227'o da F'#225'brica'
                      CharCase = ecUpperCase
                      DataField = 'DESFAB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 2
                    end
                    object DBEdit5: TDBEdit
                      Left = 111
                      Top = 75
                      Width = 63
                      Height = 21
                      Hint = 'Cilindradas para o modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'CILINDRADA'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 3
                    end
                    object DBEdit6: TDBEdit
                      Left = 313
                      Top = 75
                      Width = 103
                      Height = 21
                      Hint = 'Quantidade de cilindros para o modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'CILINDROS'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 4
                    end
                    object DBEdit7: TDBEdit
                      Left = 111
                      Top = 121
                      Width = 103
                      Height = 21
                      Hint = 'NCM/SH do modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'NCMSH'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 9
                    end
                    object DBEdit8: TDBEdit
                      Left = 567
                      Top = 98
                      Width = 63
                      Height = 21
                      Hint = 'HP padr'#227'o para o modelo'
                      CharCase = ecUpperCase
                      DataField = 'HP'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 8
                    end
                    object DBEdit10: TDBEdit
                      Left = 336
                      Top = 121
                      Width = 103
                      Height = 21
                      Hint = 
                        'Tipo do modelo de ve'#237'culo: MOTONETA, MOTOCICLETA, AUTOM'#211'VEL, etc' +
                        '..'
                      CharCase = ecUpperCase
                      DataField = 'TIPO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 10
                    end
                    object DBEdit12: TDBEdit
                      Left = 111
                      Top = 236
                      Width = 103
                      Height = 21
                      Hint = 'Valor de tabela'
                      CharCase = ecUpperCase
                      DataField = 'VALTAB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 22
                    end
                    object DBEdit14: TDBEdit
                      Left = 567
                      Top = 236
                      Width = 103
                      Height = 21
                      Hint = 'Valor padr'#227'o do icms por substitui'#231#227'o tribut'#225'ria'
                      CharCase = ecUpperCase
                      DataField = 'VLICMSUB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 24
                    end
                    object DBEdit15: TDBEdit
                      Left = 111
                      Top = 281
                      Width = 47
                      Height = 21
                      Hint = 
                        'No processamento do arquivo da montadora '#233' o ano do ve'#237'culo para' +
                        ' o campo INICHASSI1'
                      CharCase = ecUpperCase
                      DataField = 'ANO1'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 28
                    end
                    object DBEdit18: TDBEdit
                      Left = 111
                      Top = 305
                      Width = 47
                      Height = 21
                      Hint = 
                        'No processamento do arquivo da montadora '#233' o ano do ve'#237'culo para' +
                        ' o campo INICHASSI2'
                      CharCase = ecUpperCase
                      DataField = 'ANO2'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 31
                    end
                    object DBEdit21: TDBEdit
                      Left = 111
                      Top = 167
                      Width = 63
                      Height = 21
                      Hint = 'Ordem de impress'#227'o dos modelos'
                      CharCase = ecUpperCase
                      DataField = 'ORDTIPO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 15
                    end
                    object DBEdit3: TDBEdit
                      Left = 111
                      Top = 353
                      Width = 559
                      Height = 21
                      Hint = 'Url do Ve'#237'culo no Fabricante'
                      CharCase = ecUpperCase
                      DataField = 'URL_HONDA'
                      TabOrder = 35
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 111
                      Top = 329
                      Width = 559
                      Height = 21
                      Hint = 'C'#243'digo da tabela fipe'
                      DataField = 'COD_FIPE'
                      DataSource = DtmVeiculos.dsModVeiculos
                      DropDownRows = 8
                      KeyField = 'COD_FIPE'
                      ListField = 'DESC_MOD'
                      ListSource = DtmVeiculos.dsTabelaFipe
                      TabOrder = 34
                    end
                    object DBEdit19: TDBEdit
                      Left = 336
                      Top = 305
                      Width = 47
                      Height = 21
                      Hint = 
                        'No processamento do arquivo da montadora '#233' o ano modelo para o c' +
                        'ampo INICHASSI2'
                      CharCase = ecUpperCase
                      DataField = 'MODELO2'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 32
                    end
                    object DBEdit16: TDBEdit
                      Left = 336
                      Top = 281
                      Width = 47
                      Height = 21
                      Hint = 
                        'No processamento do arquivo da montadora '#233' o ano modelo para o c' +
                        'ampo INICHASSI1'
                      CharCase = ecUpperCase
                      DataField = 'MODELO1'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 29
                    end
                    object DBEdit17: TDBEdit
                      Left = 567
                      Top = 281
                      Width = 103
                      Height = 21
                      Hint = 
                        'Iniciais do chassi do veiculo para identificar o ano de modelo e' +
                        ' de fabrica'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'INICHASSI1'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 30
                    end
                    object DBEdit20: TDBEdit
                      Left = 567
                      Top = 305
                      Width = 103
                      Height = 21
                      Hint = 
                        'Iniciais do chassi do veiculo para identificar o ano de modelo e' +
                        ' de fabrica'#231#227'o'
                      CharCase = ecUpperCase
                      DataField = 'INICHASSI2'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 33
                    end
                    object DBEdit22: TDBEdit
                      Left = 567
                      Top = 258
                      Width = 103
                      Height = 21
                      Hint = 'Pis/Cofins padr'#227'o para este modelo de ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'PISCOFINS'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 27
                    end
                    object DBEdit13: TDBEdit
                      Left = 336
                      Top = 236
                      Width = 103
                      Height = 21
                      Hint = 'Valor da base de c'#225'lculo da Substitui'#231#227'o tribut'#225'ria'
                      CharCase = ecUpperCase
                      DataField = 'VLBICMSUB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 23
                    end
                    object DBEdit11: TDBEdit
                      Left = 111
                      Top = 144
                      Width = 103
                      Height = 21
                      Hint = 'N'#250'mero do renavam para ve'#237'culos novos'
                      CharCase = ecUpperCase
                      DataField = 'RENAVAM'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 12
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 336
                      Top = 167
                      Width = 103
                      Height = 21
                      Hint = 
                        'Indica se os ve'#237'culos cadastrados para este modelo participam da' +
                        ' gera'#231#227'o de Venda/Estoque'
                      CharCase = ecUpperCase
                      DataField = 'VNDESTOQUE'
                      DataSource = DtmVeiculos.dsModVeiculos
                      ItemHeight = 13
                      Items.Strings = (
                        'SIM'
                        'N'#195'O')
                      TabOrder = 16
                    end
                    object DBEdit50: TDBEdit
                      Left = 567
                      Top = 167
                      Width = 103
                      Height = 21
                      Hint = 'Valor unit'#225'rio na NF'
                      DataField = 'VL_UNITARIO_NF'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 17
                    end
                    object DBComboBox5: TDBComboBox
                      Left = 567
                      Top = 144
                      Width = 104
                      Height = 21
                      Hint = 'Mod. Renavam'
                      DataField = 'TIP_VEICULO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      ItemHeight = 13
                      Items.Strings = (
                        '02 - CICLOMOTO'
                        '03 - MOTONETA'
                        '04 - MOTOCICLO'
                        '05 - TRICICLO'
                        '06 - AUTOM'#211'VEL'
                        '07 - MICRO'#212'NIBUS'
                        '08 - '#212'NIBUS'
                        '10 - REBOQUE'
                        '11 - SEMIRREBOQUE'
                        '13 - CAMINHONETA'
                        '14 - CAMINH'#195'O'
                        '17 - CAMINH'#195'O TRATOR'
                        '18 - TR RODAS'
                        '19 - TR ESTEIRAS'
                        '20 - TR MISTO'
                        '21 - QUADRICICLO'
                        '22 - ESPECIAL / '#212'NIBUS'
                        '23 - MISTO / CAMINHONETE'
                        '25 - UTILIT'#193'RIO'
                        '26 - MOTOR CASA ')
                      TabOrder = 14
                      OnKeyPress = DBComboBox5KeyPress
                    end
                    object DBEdit51: TDBEdit
                      Left = 111
                      Top = 189
                      Width = 63
                      Height = 21
                      DataField = 'CMKG'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 18
                    end
                    object DBEdit52: TDBEdit
                      Left = 336
                      Top = 189
                      Width = 103
                      Height = 21
                      Hint = 'Dist'#226'ncia entre eixos'
                      DataField = 'DISTANCIAEIXO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 19
                    end
                    object DBEdit53: TDBEdit
                      Left = 111
                      Top = 212
                      Width = 103
                      Height = 21
                      Hint = 'Peso bruto'
                      DataField = 'PESOB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 20
                    end
                    object DBEdit54: TDBEdit
                      Left = 336
                      Top = 212
                      Width = 103
                      Height = 21
                      Hint = 'Peso l'#237'quido'
                      DataField = 'PESOL'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 21
                    end
                    object DBComboBox6: TDBComboBox
                      Left = 336
                      Top = 144
                      Width = 103
                      Height = 21
                      Hint = 'Esp. Renavam'
                      DataField = 'ESPRENAVAM'
                      DataSource = DtmVeiculos.dsModVeiculos
                      ItemHeight = 13
                      Items.Strings = (
                        '01 - PASSAGEIRO'
                        '02 - CARGA'
                        '03 - MISTO')
                      TabOrder = 13
                      OnKeyPress = DBComboBox6KeyPress
                    end
                    object DBEdit23: TDBEdit
                      Left = 111
                      Top = 98
                      Width = 39
                      Height = 21
                      Hint = 'Tipo de combust'#237'vel. Tabela RENAVAM (v2.0)'
                      DataField = 'TPCOMB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      Enabled = False
                      TabOrder = 6
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 154
                      Top = 98
                      Width = 349
                      Height = 21
                      Hint = 'Tipo de combust'#237'vel. Tabela RENAVAM (v2.0)'
                      DataField = 'TPCOMB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      KeyField = 'CODIGO_TPCOMB'
                      ListField = 'DESCR_COMB;CODIGO_TPCOMB'
                      ListSource = DtmVeiculos.dsLocTPComb
                      TabOrder = 7
                    end
                    object DBEdit30: TDBEdit
                      Left = 111
                      Top = 377
                      Width = 559
                      Height = 21
                      Hint = 'C'#243'digo de f'#225'brica NFe'
                      DataField = 'CODIGOFAB'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 36
                    end
                    object DBEdit28: TDBEdit
                      Left = 111
                      Top = 258
                      Width = 103
                      Height = 21
                      Hint = 
                        'Valor do PIS, ser'#225' importado para nota fiscal quando existir o v' +
                        'alor'
                      DataField = 'VALOR_PIS'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 25
                      OnExit = DBEdit28Exit
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 567
                      Top = 75
                      Width = 63
                      Height = 21
                      Hint = 'Quantidade de pessoas que o ve'#237'culo pode transportar'
                      DataField = 'LOTACAO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      ItemHeight = 13
                      Items.Strings = (
                        '01'
                        '02'
                        '03'
                        '04'
                        '05')
                      TabOrder = 5
                    end
                    object DBEdit29: TDBEdit
                      Left = 336
                      Top = 258
                      Width = 103
                      Height = 21
                      Hint = 
                        'Valor do COFINS, ser'#225' importado para a nota fiscal quando existi' +
                        'r o valor'
                      DataField = 'VALOR_COFINS'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 26
                      OnExit = DBEdit28Exit
                    end
                    object DBEdit9: TDBEdit
                      Left = 567
                      Top = 121
                      Width = 103
                      Height = 21
                      Hint = 
                        'Tipo do modelo de ve'#237'culo: MOTONETA, MOTOCICLETA, AUTOM'#211'VEL, etc' +
                        '..'
                      CharCase = ecUpperCase
                      DataField = 'MARCA_DESC'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 11
                    end
                    object DBEdit187: TDBEdit
                      Left = 567
                      Top = 404
                      Width = 103
                      Height = 21
                      DataField = 'COD_CTA_EST_VEIC'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 37
                      OnKeyDown = DBEdit187KeyDown
                    end
                    object DBEdit188: TDBEdit
                      Left = 567
                      Top = 431
                      Width = 103
                      Height = 21
                      DataField = 'COD_CTA_EST_SEMI'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 38
                      OnKeyDown = DBEdit187KeyDown
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Tabela de Pre'#231'o'
                ImageIndex = 1
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 441
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 33
                    Align = alTop
                    TabOrder = 0
                    object DBText27: TDBText
                      Left = 84
                      Top = 12
                      Width = 668
                      Height = 13
                      DataField = 'DESCRICAO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label32: TLabel
                      Left = 34
                      Top = 12
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Modelo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                  object GroupBox17: TGroupBox
                    Left = 0
                    Top = 105
                    Width = 761
                    Height = 46
                    Align = alTop
                    TabOrder = 2
                    object BitBtn_Novo_Tab: TBitBtn
                      Left = 8
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Novo - [VEI091]'
                      Caption = 'Novo'
                      TabOrder = 0
                      OnClick = BitBtn_Novo_TabClick
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
                    object BitBtn_Alterar_Tab: TBitBtn
                      Left = 89
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Alterar - [VEI090]'
                      Caption = 'Alterar'
                      TabOrder = 1
                      OnClick = BitBtn_Alterar_TabClick
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
                    object BitBtn_Salvar_Tab: TBitBtn
                      Left = 170
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Salvar - [VEI089]'
                      Caption = 'Salvar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnClick = BitBtn_Salvar_TabClick
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
                    object BitBtn_Cancelar_Tab: TBitBtn
                      Left = 251
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Cancelar'
                      Caption = 'Cancelar'
                      TabOrder = 3
                      OnClick = BitBtn_Cancelar_TabClick
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
                    object BitBtn_Excluir_Tab: TBitBtn
                      Left = 332
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Excluir  - [VEI023]'
                      Caption = 'Excluir'
                      TabOrder = 4
                      OnClick = BitBtn_Excluir_TabClick
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
                  end
                  object Panel5: TPanel
                    Left = 0
                    Top = 151
                    Width = 761
                    Height = 154
                    Align = alTop
                    Caption = 'Panel4'
                    TabOrder = 3
                    object DBGrid2: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 759
                      Height = 152
                      Align = alClient
                      DataSource = DtmVeiculos.dsTabPrecoVeic
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
                          FieldName = 'ANO_FAB'
                          Title.Caption = 'Ano Fab'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'ANO_MOD'
                          Title.Caption = 'Ano Mod'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PREC_MIN'
                          Title.Caption = 'Pre'#231'o Min'
                          Width = 120
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'PREC_TAB'
                          Title.Caption = 'Pre'#231'o Tab'
                          Width = 120
                          Visible = True
                        end>
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 33
                    Width = 761
                    Height = 72
                    Align = alTop
                    TabOrder = 1
                    object Label33: TLabel
                      Left = 33
                      Top = 46
                      Width = 58
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Min:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label34: TLabel
                      Left = 43
                      Top = 24
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano Fab:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label38: TLabel
                      Left = 295
                      Top = 19
                      Width = 52
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ano Mod:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label39: TLabel
                      Left = 271
                      Top = 46
                      Width = 76
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Pre'#231'o Tabela:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit24: TDBEdit
                      Left = 97
                      Top = 16
                      Width = 80
                      Height = 21
                      DataField = 'ANO_FAB'
                      DataSource = DtmVeiculos.dsTabPrecoVeic
                      TabOrder = 0
                    end
                    object DBEdit25: TDBEdit
                      Left = 353
                      Top = 16
                      Width = 80
                      Height = 21
                      DataField = 'ANO_MOD'
                      DataSource = DtmVeiculos.dsTabPrecoVeic
                      TabOrder = 1
                    end
                    object DBEdit26: TDBEdit
                      Left = 97
                      Top = 43
                      Width = 120
                      Height = 21
                      DataField = 'PREC_MIN'
                      DataSource = DtmVeiculos.dsTabPrecoVeic
                      TabOrder = 2
                    end
                    object DBEdit27: TDBEdit
                      Left = 353
                      Top = 43
                      Width = 120
                      Height = 21
                      DataField = 'PREC_TAB'
                      DataSource = DtmVeiculos.dsTabPrecoVeic
                      TabOrder = 3
                    end
                  end
                end
              end
              object tsCodigoFab: TTabSheet
                Caption = 'Codigo Fabricante'
                ImageIndex = 3
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 441
                  Align = alClient
                  TabOrder = 0
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 33
                    Align = alTop
                    TabOrder = 0
                    object DBText1: TDBText
                      Left = 85
                      Top = 12
                      Width = 668
                      Height = 13
                      DataField = 'DESCRICAO'
                      DataSource = DtmVeiculos.dsModVeiculos
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlue
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 34
                      Top = 12
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Modelo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                  end
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 33
                    Width = 761
                    Height = 46
                    Align = alTop
                    TabOrder = 1
                    object BitBtn7: TBitBtn
                      Left = 8
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Novo - [VEI093]'
                      Caption = 'Novo'
                      TabOrder = 0
                      OnClick = BitBtn7Click
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
                    object BitBtn11: TBitBtn
                      Left = 89
                      Top = 15
                      Width = 75
                      Height = 25
                      Hint = 'Excluir  - [VEI094]'
                      Caption = 'Excluir'
                      TabOrder = 1
                      OnClick = BitBtn11Click
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
                  end
                  object Panel7: TPanel
                    Left = 0
                    Top = 79
                    Width = 761
                    Height = 154
                    Align = alTop
                    Caption = 'Panel4'
                    TabOrder = 2
                    object DBGrid3: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 759
                      Height = 152
                      Align = alClient
                      DataSource = DtmVeiculos.dsModVCorF
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
                          FieldName = 'CODIGO_FAB'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'DATA_CAD'
                          Visible = True
                        end>
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'CRM'
                ImageIndex = 2
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 441
                  Align = alClient
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 437
                    Align = alTop
                    TabOrder = 0
                    object Label40: TLabel
                      Left = 46
                      Top = 18
                      Width = 125
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'M'#234's Primeira Revis'#227'o:'
                      FocusControl = DBEdit31
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label41: TLabel
                      Left = 416
                      Top = 18
                      Width = 119
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'KM Primeira Revis'#227'o:'
                      FocusControl = DBEdit32
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label42: TLabel
                      Left = 45
                      Top = 42
                      Width = 126
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'M'#234's Segunda Revis'#227'o:'
                      FocusControl = DBEdit33
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 415
                      Top = 42
                      Width = 120
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'KM Segunda Revis'#227'o:'
                      FocusControl = DBEdit34
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label44: TLabel
                      Left = 13
                      Top = 65
                      Width = 158
                      Height = 13
                      Caption = 'Intervalo KM entre Revis'#227'o:'
                      FocusControl = DBEdit35
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit31: TDBEdit
                      Left = 176
                      Top = 15
                      Width = 134
                      Height = 21
                      DataField = 'MES_RET_SERV1'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 0
                    end
                    object DBEdit32: TDBEdit
                      Left = 541
                      Top = 15
                      Width = 134
                      Height = 21
                      DataField = 'KM_RET_SERV1'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 1
                    end
                    object DBEdit33: TDBEdit
                      Left = 176
                      Top = 39
                      Width = 134
                      Height = 21
                      DataField = 'MES_RET_SERV3'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 2
                    end
                    object DBEdit34: TDBEdit
                      Left = 541
                      Top = 39
                      Width = 134
                      Height = 21
                      DataField = 'KM_RET_SERV3'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 3
                    end
                    object DBEdit35: TDBEdit
                      Left = 176
                      Top = 62
                      Width = 134
                      Height = 21
                      DataField = 'INTERV_KM_SERV'
                      DataSource = DtmVeiculos.dsModVeiculos
                      TabOrder = 4
                    end
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Servi'#231'os'
                ImageIndex = 4
                object ScrollBox7: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 441
                  Align = alClient
                  TabOrder = 0
                  object GroupBox8: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 744
                    Height = 477
                    Align = alTop
                    Caption = 'Servi'#231'os'
                    TabOrder = 0
                    object pnServicosSugeridos: TPanel
                      Left = 2
                      Top = 15
                      Width = 740
                      Height = 194
                      Align = alTop
                      TabOrder = 0
                      object Panel8: TPanel
                        Left = 1
                        Top = 160
                        Width = 738
                        Height = 33
                        Align = alBottom
                        BevelKind = bkTile
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label211: TLabel
                          Left = 506
                          Top = 6
                          Width = 93
                          Height = 16
                          Caption = 'F2 - Marca linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                        object Label212: TLabel
                          Left = 618
                          Top = 6
                          Width = 112
                          Height = 16
                          Caption = 'F3 - Demarca Linha'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -13
                          Font.Name = 'Tahoma'
                          Font.Style = []
                          ParentFont = False
                        end
                      end
                      object DBGrid4: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 738
                        Height = 159
                        Align = alClient
                        DataSource = DtmVeiculos.dsServicosSugeridos
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 1
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnCellClick = DBGrid4CellClick
                        OnDrawColumnCell = DBGrid4DrawColumnCell
                        OnDblClick = DBGrid4DblClick
                        OnKeyDown = DBGrid4KeyDown
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 472
              Width = 773
              ExplicitTop = 472
              ExplicitWidth = 773
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [VEI018]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [VEI019]'
              end
              inherited CheckCadSeq: TCheckBox
                Left = 3
                ExplicitLeft = 3
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnShow = TabSheet2Show
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 520
          inherited GroupBox3: TGroupBox
            Width = 773
            ExplicitWidth = 773
            inherited imgInformation: TImage
              Left = 747
              ExplicitLeft = 747
            end
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
            object SpeedButton40: TSpeedButton [8]
              Left = 696
              Top = 14
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
              OnClick = SpeedButton40Click
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [VEI013]'
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
            Width = 773
            Height = 447
            ExplicitWidth = 773
            ExplicitHeight = 447
            inherited Splitter1: TSplitter
              Height = 386
              ExplicitHeight = 409
            end
            inherited DBGrid1: TDBGrid
              Width = 480
              Height = 386
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CILINDRADA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESFAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGOFAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CILINDROS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMBUSTIVEL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTACAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RENAVAM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AFATURAR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VNDESTOQUE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALTAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLBICMSUB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VLICMSUB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANO1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODELO1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INICHASSI1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANO2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MODELO2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INICHASSI2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDTIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PISCOFINS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_FIPE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_PLAN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIP_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CMKG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DISTANCIAEIXO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESOL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PESOB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_UNITARIO_NF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESPRENAVAM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NCMSH'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TPCOMB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_PIS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_COFINS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'URL_HONDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SITE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MES_RET_SERV1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KM_RET_SERV1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MES_RET_SERV3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KM_RET_SERV3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INTERV_KM_SERV'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 769
              ExplicitWidth = 769
              inherited SpeedButton1: TSpeedButton
                Top = 5
                Hint = 'Editar Registro - [VEI014]'
                ExplicitTop = 5
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [VEI015]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [VEI017]'
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
                Hint = 'Ver registros da lixeira - [VEI016]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 386
              ExplicitHeight = 386
              inherited ScrollBox2: TScrollBox
                Height = 369
                ExplicitHeight = 369
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 520
        end
      end
    end
    inherited PanelFlash: TPanel
      Height = 553
      ExplicitHeight = 553
      inherited bMarketingHW: TBitBtn
        Top = 531
        ExplicitTop = 531
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 555
    Width = 788
    ExplicitTop = 555
    ExplicitWidth = 788
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Top = 65
    object MarcarTodosModVeiculosClick: TMenuItem
      Caption = 'Marcar Todos Modelo de Ve'#237'culos'
      OnClick = MarcarTodosModVeiculosClickClick
    end
    object DesmarcarTodosModVeiculosClick: TMenuItem
      Caption = 'Desmarcar Todos Modelo de Ve'#237'culos'
      OnClick = DesmarcarTodosModVeiculosClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 614
    Top = 65531
  end
  inherited Timer1: TTimer
    Left = 582
    Top = 65531
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 502
    Top = 243
  end
end
