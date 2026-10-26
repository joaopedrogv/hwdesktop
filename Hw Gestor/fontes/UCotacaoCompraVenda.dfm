inherited FrmSugestCompraVenda: TFrmSugestCompraVenda
  Left = 209
  Top = 71
  Caption = 'Compra/Venda Cota'#231#227'o/Sugest'#227'o'
  ClientHeight = 626
  ClientWidth = 871
  ExplicitWidth = 879
  ExplicitHeight = 660
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 871
    Height = 607
    ExplicitWidth = 871
    ExplicitHeight = 607
    inherited Splitter2: TSplitter
      Height = 605
      ExplicitLeft = 797
      ExplicitTop = 1
      ExplicitHeight = 685
    end
    inherited PanelLeft: TPanel
      Width = 866
      Height = 605
      ExplicitWidth = 866
      ExplicitHeight = 605
      inherited PageControl1: TPageControl
        Width = 864
        Height = 603
        ExplicitWidth = 864
        ExplicitHeight = 603
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 856
          ExplicitHeight = 572
          inherited ScrollBox1: TScrollBox
            Width = 856
            Height = 572
            ExplicitWidth = 856
            ExplicitHeight = 572
            inherited PageControl3: TPageControl
              Width = 856
              Height = 528
              ExplicitWidth = 856
              ExplicitHeight = 528
              inherited TabSheet3: TTabSheet
                Caption = 'Manter Cota'#231#227'o'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 848
                ExplicitHeight = 497
                inherited ScrollBox3: TScrollBox
                  Width = 848
                  Height = 497
                  ExplicitWidth = 848
                  ExplicitHeight = 497
                  object Label55: TLabel [0]
                    Left = 8
                    Top = 483
                    Width = 46
                    Height = 13
                    Caption = 'Pesquisa:'
                    Visible = False
                  end
                  inherited GroupBox1: TGroupBox
                    Width = 844
                    Height = 133
                    Caption = 'Dados da Cota'#231#227'o'
                    ParentFont = False
                    ExplicitWidth = 844
                    ExplicitHeight = 133
                    object Label6: TLabel
                      Left = 33
                      Top = 21
                      Width = 58
                      Height = 13
                      Caption = 'Cota'#231#227'o N.:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 198
                      Top = 21
                      Width = 74
                      Height = 13
                      Caption = 'Tipo Opera'#231#227'o:'
                    end
                    object Label9: TLabel
                      Left = 6
                      Top = 48
                      Width = 85
                      Height = 13
                      Caption = 'Data da Cota'#231#227'o:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 384
                      Top = 21
                      Width = 63
                      Height = 13
                      Caption = 'Colaborador:'
                    end
                    object Label11: TLabel
                      Left = 202
                      Top = 48
                      Width = 70
                      Height = 13
                      Caption = 'Hora Cota'#231#227'o:'
                      FocusControl = DBEdit6
                    end
                    object Label17: TLabel
                      Left = 3
                      Top = 89
                      Width = 24
                      Height = 13
                      Caption = 'Fat.:'
                      FocusControl = DBEdit8
                    end
                    object Label19: TLabel
                      Left = 383
                      Top = 48
                      Width = 66
                      Height = 13
                      Caption = 'M'#234's apurado:'
                      FocusControl = DBEdit9
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 518
                      Top = 48
                      Width = 67
                      Height = 13
                      Caption = 'Ano Apurado:'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 4
                      Top = 67
                      Width = 845
                      Height = 13
                      Caption = 
                        'Dados do Ensaio/Apura'#231#227'o----------------------------------------' +
                        '----------------------------------------------------------------' +
                        '----------------------------------------------------------------' +
                        '-----------'
                    end
                    object Label22: TLabel
                      Left = 129
                      Top = 89
                      Width = 55
                      Height = 13
                      Caption = 'Custo Fixo:'
                      FocusControl = DBEdit11
                    end
                    object Label23: TLabel
                      Left = 280
                      Top = 89
                      Width = 25
                      Height = 13
                      Caption = 'Cmv:'
                      FocusControl = DBEdit12
                    end
                    object Label24: TLabel
                      Left = 362
                      Top = 89
                      Width = 23
                      Height = 13
                      Caption = 'Ocv:'
                      FocusControl = DBEdit13
                    end
                    object Label25: TLabel
                      Left = 443
                      Top = 89
                      Width = 30
                      Height = 13
                      Caption = 'Lucro:'
                      FocusControl = DBEdit14
                    end
                    object Label27: TLabel
                      Left = 559
                      Top = 89
                      Width = 16
                      Height = 13
                      Caption = 'PE:'
                      FocusControl = DBEdit15
                    end
                    object Label13: TLabel
                      Left = 675
                      Top = 20
                      Width = 50
                      Height = 13
                      Caption = 'Tipo Dpto:'
                    end
                    object Label56: TLabel
                      Left = 675
                      Top = 48
                      Width = 73
                      Height = 13
                      Caption = 'Qtde Dias M'#234's:'
                      FocusControl = DBEdit45
                    end
                    object Label62: TLabel
                      Left = 39
                      Top = 110
                      Width = 52
                      Height = 13
                      Caption = 'Cod Lista.:'
                      FocusControl = DBEdit8
                    end
                    object DBEdit1: TDBEdit
                      Left = 98
                      Top = 13
                      Width = 98
                      Height = 21
                      DataField = 'COD_COTACAO'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit4: TDBEdit
                      Left = 98
                      Top = 40
                      Width = 98
                      Height = 21
                      DataField = 'DATA_COTACAO'
                      DataSource = DtmGestorHw.DtCotacao
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 279
                      Top = 40
                      Width = 98
                      Height = 21
                      DataField = 'HORA'
                      DataSource = DtmGestorHw.DtCotacao
                      TabOrder = 5
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 454
                      Top = 13
                      Width = 215
                      Height = 21
                      DataField = 'COD_VENDEDOR'
                      DataSource = DtmGestorHw.DtCotacao
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = DtmGestorHw.Dtcolaborador
                      TabOrder = 2
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 279
                      Top = 13
                      Width = 98
                      Height = 21
                      DataField = 'TIPOOP'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      ItemHeight = 0
                      Items.Strings = (
                        'COMPRA'
                        'VENDA')
                      TabOrder = 1
                      OnExit = DBComboBox1Exit
                    end
                    object DBEdit8: TDBEdit
                      Left = 29
                      Top = 81
                      Width = 95
                      Height = 21
                      DataField = 'FATURAMENTO'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DBEdit9: TDBEdit
                      Left = 453
                      Top = 40
                      Width = 62
                      Height = 21
                      DataField = 'MESAPURACAO'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 7
                    end
                    object DBEdit10: TDBEdit
                      Left = 590
                      Top = 40
                      Width = 79
                      Height = 21
                      DataField = 'ANOAPURACAO'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 8
                    end
                    object DBEdit11: TDBEdit
                      Left = 186
                      Top = 81
                      Width = 89
                      Height = 21
                      DataField = 'CF'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 10
                    end
                    object DBEdit12: TDBEdit
                      Left = 306
                      Top = 81
                      Width = 52
                      Height = 21
                      DataField = 'CMV'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 11
                    end
                    object DBEdit13: TDBEdit
                      Left = 389
                      Top = 81
                      Width = 51
                      Height = 21
                      DataField = 'OCV'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 12
                    end
                    object DBEdit14: TDBEdit
                      Left = 476
                      Top = 81
                      Width = 80
                      Height = 21
                      DataField = 'LUCRO'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 13
                    end
                    object DBEdit15: TDBEdit
                      Left = 579
                      Top = 81
                      Width = 90
                      Height = 21
                      DataField = 'PE'
                      DataSource = DtmGestorHw.DtCotacao
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 14
                    end
                    object BitBtn15: TBitBtn
                      Left = 681
                      Top = 77
                      Width = 89
                      Height = 25
                      Caption = 'Importar Sug.>>'
                      TabOrder = 17
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 726
                      Top = 13
                      Width = 115
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPODEP'
                      DataSource = DtmGestorHw.DtCotacao
                      ItemHeight = 0
                      Items.Strings = (
                        'PRODUTOS'
                        'SERVI'#199'OS'
                        'VEICULOS'
                        'VEICULOS SEMI-NOVOS'
                        'EMPRESA')
                      TabOrder = 3
                      OnExit = DBComboBox2Exit
                    end
                    object DBEdit45: TDBEdit
                      Left = 754
                      Top = 40
                      Width = 88
                      Height = 21
                      DataField = 'QTDE_DIAS_DISP'
                      DataSource = DtmGestorHw.DtCotacao
                      TabOrder = 9
                      OnExit = DBEdit45Exit
                    end
                    object BitBtn12: TBitBtn
                      Left = 776
                      Top = 77
                      Width = 71
                      Height = 25
                      Caption = 'DNA'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clGreen
                      Font.Height = -16
                      Font.Name = 'Arial Narrow'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 18
                      OnClick = BitBtn12Click
                    end
                    object DBEdit46: TDBEdit
                      Left = 97
                      Top = 106
                      Width = 98
                      Height = 21
                      Hint = 'C'#243'digo Lista de Cota'#231#227'o'
                      DataField = 'COD_LISTA'
                      DataSource = DtmGestorHw.DtCotacao
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 15
                      OnExit = DBEdit46Exit
                    end
                    object BitBtn27: TBitBtn
                      Left = 201
                      Top = 105
                      Width = 73
                      Height = 25
                      Hint = 'Montar Lista - [GES067]'
                      Caption = 'Lista'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 16
                      OnClick = BitBtn27Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FF5EAFE9
                        5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAF
                        E95EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95E
                        AFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC314ACCCCCCCCFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC737373CCCCCCFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC314ACCCCCCCCFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC737373CCCCCCFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAF
                        E95EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95E
                        AFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE9FF00FF}
                    end
                  end
                  object Panel13: TPanel
                    Left = 0
                    Top = 405
                    Width = 844
                    Height = 33
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 2
                    object BitBtn8: TBitBtn
                      Left = -1
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Incluir - [GES037]'
                      Caption = 'Incluir'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      OnClick = BitBtn8Click
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
                    object BitBtn9: TBitBtn
                      Left = 89
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Salvar'
                      Caption = 'Salva'
                      Enabled = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      OnClick = BitBtn9Click
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
                    object BitBtn10: TBitBtn
                      Left = 179
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Editar Registro - [GES038]'
                      Caption = 'Alterar'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                      OnClick = BitBtn10Click
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
                    object BitBtn11: TBitBtn
                      Left = 270
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Cancelar Registro - [GES039]'
                      Caption = 'Cancela'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 3
                      OnClick = BitBtn11Click
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
                    object BitBtn7: TBitBtn
                      Left = 451
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Margem - [GES040]'
                      Caption = 'Margem'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 5
                      OnClick = BitBtn7Click
                      Glyph.Data = {
                        3E020000424D3E020000000000003E0100002800000010000000100000000100
                        08000000000000010000120B0000120B0000420000004200000000000000FFFF
                        FF00FF00FF00C9C9C900C7C7C700C6C6C600C5C5C500C4C4C400C3C3C300C2C2
                        C200BFBFBF00BDBDBD00BCBCBC00BABABA00B9B9B900B8B8B800B5B5B500B4B4
                        B400B2B2B200B1B1B100B0B0B000AEAEAE00ADADAD00ACACAC00ABABAB00AAAA
                        AA00A9A9A900A8A8A800A7A7A700A6A6A600A5A5A500A4A4A400A3A3A300A2A2
                        A200A1A1A100A0A0A0009D9D9D009B9B9B009A9A9A0099999900989898009797
                        97009696960095959500949494009393930092929200919191008F8F8F008E8E
                        8E008D8D8D008C8C8C008B8B8B008A8A8A008989890088888800878787008686
                        860085858500848484007F7F7F007E7E7E007D7D7D007B7B7B00787878007676
                        7600020202020202020202020202020202020202020202020202020202020202
                        020202020202020202020202282402020202020202020202020232261E172025
                        02020202020202023B2C211E1F18171B1F020202020238373C261E1A11131515
                        153A02023B31222B3B1F0E070409181C122F3D2C241D1C323720160D040A342D
                        0D2C412F1C20132E333235301D060B1B23363F27160C051C3532313233101337
                        40023E150307080819292E2E3938370202020234140705080306133037020202
                        0202020233240F030C1F370202020202020202020233332A3702020202020202
                        0202020202020202020202020202020202020202020202020202020202020202
                        0202}
                    end
                    object BitBtn100: TBitBtn
                      Left = 541
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Detalhar itens da Cota'#231#227'o'
                      Caption = '&Visualizar'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 6
                      OnClick = BitBtn100Click
                      Glyph.Data = {
                        16060000424D1606000000000000360400002800000018000000140000000100
                        080000000000E0010000120B0000120B00000001000000000000000000000000
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
                        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD9B53
                        E4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD661F5CE4FDFDFDFDFDFD
                        FDFDFDFDFDFDFDFDFDFDFDFDFDFD6F6F1F5CE4FDFDFDFDFDFDFDFDFDFDFDFDFD
                        FDFDFDFDFDFDFD6F6F1F5CE4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
                        6F6F1F5CE4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD6F6F1E53FD9BE4
                        EDE4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD6FB7A4E409FFFFFF09ECFDFDFDFD
                        FDFDFDFDFDFDFDFDFDFDFDEDEC09FFFFFFFFFFF6E3FDFDFDFDFDFDFDFDFDFDFD
                        FDFDFDE4090909FFFFFFFFFFF5FDFDFDFDFDFDFDFDFDFDFDFDFDFDED09F409FF
                        FFFFFFFF09E4FDFDFDFDFDFDFDFDFDFDFDFDFDF509EB09FFFFFFFFFFFFECFDFD
                        FDFDFDFDFDFDFDFDFDFDFDED09EB0909FFFFFFFF09E4FDFDFDFDFDFDFDFDFDFD
                        FDFDFDE4090909090909FFFF09FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF5FFFF09
                        EB090909E4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEDF609090909ECFDFDFDFD
                        FDFDFDFDFDFDFDFDFDFDFDFDFDFDECECEDEDFDFDFDFDFDFDFDFD}
                    end
                    object BitBtn20: TBitBtn
                      Left = 633
                      Top = 1
                      Width = 105
                      Height = 25
                      Hint = 'Montar Pedido - [GES066]'
                      Caption = 'Montar Pedido'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 7
                      OnClick = BitBtn20Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C40E0000C40E00000000000000000000FFFFFFEFF7F5
                        15896905815F05815F05815F05815F05815F05815F05815F05815F05815F0581
                        5F158969EFF7F5FFFFFFFFFFFFC0DFD705815F20D8B405815F05815F20D8B405
                        815F05815F20D8B405815F05815F1ED3AF05815FC0DFD7FFFFFFFFFFFF82C0AF
                        06866501110E0AA78709A38301100C089C7B089978010F0B079270078E6D010E
                        0A05826082C0AFFFFFFFFFFFFF53A991078F6D0AAA8A0AA78709A38309A07F08
                        9C7B089978079574079270078E6D068B6905836153A991FFFFFFFFFFFF249173
                        08977621DDB80AA78709A38320DCB7089C7B08997820DAB6079270078E6D20D9
                        B5068462249173FFFFFFFFFFFF05815F09A28201110E0AA78709A38301100C08
                        9C7B089978010F0B079270078E6D010E0A06866405815FFFFFFF34997D05815F
                        024132023C2F023B2E023A2D023A2D02392C02382B01372A01372A0136290135
                        2801392B05815F34997D05815F12C3A510C3A711C6AB12C9AE12C9AE12C9AE12
                        C9AE12C9AE12C9AE12C9AE12C9AE12C9AE0EB6980CA78605815F05815F14C3A2
                        0BB08F0AAC8B0AA88709A48309A07F6C63632F25252B594C078F6E068B6A0687
                        660583610D997705815F05815F12C9AE10B59D10B59D10B59D10B59D10B59D2F
                        25256C6363483E3E34726810B59D10B59D10B59D12C9AE05815F15896905815F
                        034D39034D39034D39034D39034D39293F37483E3E6C6363483E3E2E443C034D
                        39034D3905815F158969FFFFFFFFFFFF3D6E897DBCDF5D9DBE5D9DBE5D9DBE5D
                        9DBE546673483E3E6C6363453B3B4558643D6E89FFFFFFFFFFFFFFFFFFFFFFFF
                        3D6E897DBCDF7DBCDF7DBCDF7DBCDF7DBCDF7DBCDF5C6D7A453B3B6C63633930
                        3037444EFFFFFFFFFFFFFFFFFFFFFFFF3D6E893D6E893D6E893D6E893D6E893D
                        6E893D6E893D6E893E4B553930306C6363322929FFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF807B7B3229
                        296C6363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    end
                    object BitBtn24: TBitBtn
                      Left = 739
                      Top = 1
                      Width = 106
                      Height = 25
                      Hint = 'Montar Lista - [GES067]'
                      Caption = 'Montar Lista'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 8
                      OnClick = BitBtn24Click
                      Glyph.Data = {
                        36030000424D3603000000000000360000002800000010000000100000000100
                        18000000000000030000C30E0000C30E00000000000000000000FF00FF5EAFE9
                        5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAF
                        E95EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95E
                        AFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC314ACCCCCCCCFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC737373CCCCCCFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC314ACCCCCCCCFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE9FFFFFFFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FF929292FFFFFFBCBCBCBCBCBCFFFFFFCCCCCC73737373
                        7373FFFFFFCCCCCC737373CCCCCCFFFFFF5EAFE95EAFE9FF00FF929292FFFFFF
                        BCBCBCBCBCBCFFFFFFCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCFFFF
                        FF5EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE9FFFFFFFFFFFFFFFFFFFFFFFFFF
                        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EAFE95EAFE9FF00FFFF00FF5EAFE9
                        5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAF
                        E95EAFE95EAFE9FF00FFFF00FF5EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95E
                        AFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE95EAFE9FF00FF}
                    end
                    object BitBtn106: TBitBtn
                      Left = 361
                      Top = 1
                      Width = 90
                      Height = 25
                      Hint = 'Fotos'
                      Caption = 'Fotos'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 4
                      OnClick = BitBtn106Click
                      Glyph.Data = {
                        EA020000424DEA02000000000000EA0100002800000010000000100000000100
                        08000000000000010000120B0000120B00006D0000006D00000000000000FFFF
                        FF008E8CA900FF00FF00A6869C0072535F007E596300C0737C00B15A5B00D961
                        5D00D65F5C00E8880000FF9A0000FF9B0000F79A0800BD7B1000927F350086A1
                        7200759E79002FBF5A002A9653003CAA7E0041C99A0049C9B7004CC8B6003768
                        620039928B005AA5A30000FFFF0002FAFB000AB2BF0008A8B90019DCF70016CE
                        EF0002B8DE00158FA9002A9CB2004BA3B8001EA6CD0026C3EC00197C980042AA
                        C70005789E0016B5E400058AB8000090C800057AA8000C7BA90063CCF6000075
                        A800158FC3001E9ED50023A4DD00259CD2002AABE6002DAEE60034B0E90047A1
                        C8000081C000007DB90000669A00086EA3000A73A8000D81B90027A9EB002291
                        C600288CBD002982AE003EB3ED0040B5EF003588B100157BB1001D82B9001F84
                        BB002086BD00258AC200298DC6002F93CC00369ED6003CAEEA003BABE60043B4
                        F00047BCFA00317FA80049B8F4004DC0FF003F9CCE0054B9F1004EABDE0056B9
                        F00058B7E90046A9E30049B0EC0055C0FF005CBEF90072B9EC005B92BD00769C
                        BC004796E40050AAFF004096FA004296FF001F59BC002154B3002A6AF7008695
                        B7000E3CE0000235FF000023FB00030303030303030303030303030303030303
                        03030303030303030303030303030303030303033E4B4B3E0303030303030303
                        033D43413433322F2E3C0303030303033D0208064636231E1F2C2D3C0303033D
                        5F07090A05261D1C1C22282A3C03475A58610469602720212B120B0F19314D68
                        6A66565552514F40250E0C0D103B4B646B6C675E5D54453837291B1124310349
                        6365621A395C5044353F3C3A3C03034957301513145303420303030303030303
                        3E4C171618595B4E3E0303030303030303033E484D4D4A3E0303030303030303
                        0303030303030303030303030303030303030303030303030303030303030303
                        0303030303030303030303030303}
                    end
                  end
                  object PageControl2: TPageControl
                    Left = 0
                    Top = 133
                    Width = 844
                    Height = 272
                    ActivePage = TabSheet4
                    Align = alTop
                    Enabled = False
                    TabOrder = 1
                    object TabSheet6: TTabSheet
                      Caption = 'Itens Cota'#231#227'o'
                      ImageIndex = 2
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object GroupBox5: TGroupBox
                        Left = 0
                        Top = 0
                        Width = 836
                        Height = 244
                        Align = alClient
                        Caption = 'Itens Cota'#231#227'o'
                        TabOrder = 0
                        object DBGrid2: TDBGrid
                          Left = 2
                          Top = 15
                          Width = 832
                          Height = 227
                          Align = alClient
                          DataSource = DtmGestorHw.DtcotacaoItens
                          ReadOnly = True
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnKeyUp = DBGrid2KeyUp
                        end
                      end
                    end
                    object TabSheet4: TTabSheet
                      Caption = 'Dados do Produto'
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Panel4: TPanel
                        Left = 0
                        Top = 0
                        Width = 836
                        Height = 217
                        Align = alClient
                        BevelOuter = bvNone
                        TabOrder = 0
                        object Label8: TLabel
                          Left = 168
                          Top = 53
                          Width = 52
                          Height = 13
                          Caption = 'Prod/Serv:'
                          FocusControl = DBEdit2
                        end
                        object Label12: TLabel
                          Left = 1
                          Top = 80
                          Width = 50
                          Height = 13
                          Caption = 'Descri'#231#227'o:'
                          FocusControl = DBEdit3
                        end
                        object Label14: TLabel
                          Left = 23
                          Top = 108
                          Width = 31
                          Height = 13
                          Caption = 'Qtde :'
                          FocusControl = DBEdit5
                        end
                        object Label18: TLabel
                          Left = 2
                          Top = 53
                          Width = 49
                          Height = 13
                          Caption = 'Tp Venda:'
                        end
                        object Label34: TLabel
                          Left = 8
                          Top = 163
                          Width = 46
                          Height = 13
                          Caption = 'Desc(%):'
                          FocusControl = DBEdit22
                        end
                        object Label35: TLabel
                          Left = 165
                          Top = 163
                          Width = 55
                          Height = 13
                          Caption = 'Desc.Valor:'
                          FocusControl = DBEdit23
                        end
                        object Label41: TLabel
                          Left = 2
                          Top = 135
                          Width = 52
                          Height = 13
                          Caption = 'Custo Un.:'
                          FocusControl = DBEdit29
                        end
                        object Label42: TLabel
                          Left = 146
                          Top = 135
                          Width = 73
                          Height = 13
                          Caption = 'Vlr. Un. Venda:'
                          FocusControl = DBEdit30
                        end
                        object Label26: TLabel
                          Left = 13
                          Top = 7
                          Width = 41
                          Height = 13
                          Caption = 'Fornec.:'
                        end
                        object Label69: TLabel
                          Left = 0
                          Top = 28
                          Width = 54
                          Height = 13
                          Caption = 'Cond. Pag:'
                        end
                        object DBEdit2: TDBEdit
                          Left = 224
                          Top = 51
                          Width = 137
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'NUM_FAB_PROD'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 5
                          OnExit = DBEdit2Exit
                          OnKeyDown = DBEdit2KeyDown
                        end
                        object DBEdit3: TDBEdit
                          Left = 57
                          Top = 78
                          Width = 304
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'DESCR_PROD'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          Enabled = False
                          TabOrder = 6
                        end
                        object DBEdit5: TDBEdit
                          Left = 57
                          Top = 103
                          Width = 83
                          Height = 21
                          DataField = 'QTDE_SIMULADA'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 7
                        end
                        object DBComboBox3: TDBComboBox
                          Left = 57
                          Top = 51
                          Width = 107
                          Height = 21
                          CharCase = ecUpperCase
                          DataField = 'TIPVENDA'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          ItemHeight = 0
                          Items.Strings = (
                            'V - VAREJO'
                            'A - ATACADO'
                            'C - CONSIGNADO'
                            'T - TELEVENDA'
                            'L - APLICADORES'
                            'O - OUTRAS EMPRESAS')
                          TabOrder = 4
                          OnExit = DBComboBox3Exit
                        end
                        object DBEdit22: TDBEdit
                          Left = 57
                          Top = 158
                          Width = 54
                          Height = 21
                          DataField = 'PERC_DESC'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 10
                          OnExit = DBEdit22Exit
                        end
                        object DBEdit23: TDBEdit
                          Left = 224
                          Top = 158
                          Width = 134
                          Height = 21
                          DataField = 'DESCONTO_VALOR'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 11
                          OnExit = DBEdit23Exit
                        end
                        object DBEdit29: TDBEdit
                          Left = 57
                          Top = 131
                          Width = 83
                          Height = 21
                          DataField = 'CUSTO_UN_SIM'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 8
                          OnEnter = DBEdit29Enter
                        end
                        object DBEdit30: TDBEdit
                          Left = 224
                          Top = 131
                          Width = 134
                          Height = 21
                          DataField = 'VALOR_UN_VENDA_SIM'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 9
                          OnExit = DBEdit30Exit
                        end
                        object DBEdit32: TDBEdit
                          Left = 57
                          Top = 0
                          Width = 55
                          Height = 21
                          DataField = 'COD_FORNECEDOR'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 0
                          OnExit = DBEdit32Exit
                          OnKeyDown = DBEdit32KeyDown
                        end
                        object DBLookupComboBox2: TDBLookupComboBox
                          Left = 114
                          Top = 0
                          Width = 244
                          Height = 21
                          DataField = 'COD_FORNECEDOR'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          KeyField = 'COD_CLIENTE'
                          ListField = 'NOME_CLIENTE'
                          ListSource = DtmGestorHw.DtFornecedor
                          TabOrder = 1
                          OnExit = DBEdit32Exit
                        end
                        object GroupBox4: TGroupBox
                          Left = 364
                          Top = -4
                          Width = 477
                          Height = 217
                          Caption = 'Lucro/Preju'#237'zo'
                          TabOrder = 12
                          object Label33: TLabel
                            Left = 39
                            Top = 39
                            Width = 25
                            Height = 13
                            Caption = 'Cmv:'
                            FocusControl = DBEdit21
                          end
                          object Label16: TLabel
                            Left = 17
                            Top = 14
                            Width = 47
                            Height = 13
                            Caption = 'Vlr. Total:'
                            FocusControl = DBEdit7
                          end
                          object Label37: TLabel
                            Left = 3
                            Top = 64
                            Width = 61
                            Height = 13
                            Caption = 'CF Proporc.:'
                            FocusControl = DBEdit25
                          end
                          object Label38: TLabel
                            Left = 41
                            Top = 89
                            Width = 23
                            Height = 13
                            Caption = 'Ocv:'
                            FocusControl = DBEdit26
                          end
                          object Label15: TLabel
                            Left = 34
                            Top = 114
                            Width = 30
                            Height = 13
                            Caption = 'Lucro:'
                            FocusControl = DBEdit31
                          end
                          object Label36: TLabel
                            Left = 214
                            Top = 17
                            Width = 42
                            Height = 13
                            Caption = 'Mark up:'
                            FocusControl = DBEdit24
                          end
                          object Label28: TLabel
                            Left = 223
                            Top = 39
                            Width = 33
                            Height = 13
                            Caption = 'Curva:'
                            FocusControl = DBEdit16
                          end
                          object Label29: TLabel
                            Left = 190
                            Top = 64
                            Width = 69
                            Height = 13
                            Caption = 'Qtde Vendida:'
                            FocusControl = DBEdit17
                          end
                          object Label30: TLabel
                            Left = 190
                            Top = 89
                            Width = 69
                            Height = 13
                            Caption = 'Total Vendido:'
                            FocusControl = DBEdit18
                          end
                          object Label40: TLabel
                            Left = 200
                            Top = 114
                            Width = 59
                            Height = 13
                            Caption = 'Marg. Prat.:'
                            FocusControl = DBEdit28
                          end
                          object Label39: TLabel
                            Left = 193
                            Top = 139
                            Width = 66
                            Height = 13
                            Caption = 'Markup Prat.:'
                            FocusControl = DBEdit27
                          end
                          object Label31: TLabel
                            Left = 343
                            Top = 17
                            Width = 57
                            Height = 13
                            Caption = 'Qtde Equil.:'
                            FocusControl = DBEdit19
                          end
                          object Label32: TLabel
                            Left = 339
                            Top = 39
                            Width = 61
                            Height = 13
                            Caption = 'Vlr Equil'#237'brio:'
                            FocusControl = DBEdit20
                          end
                          object Label43: TLabel
                            Left = 376
                            Top = 64
                            Width = 24
                            Height = 13
                            Caption = 'Pme:'
                            FocusControl = DBEdit33
                          end
                          object Label44: TLabel
                            Left = 343
                            Top = 139
                            Width = 59
                            Height = 13
                            Caption = 'Freq/Atual.:'
                            FocusControl = DBEdit34
                          end
                          object Label45: TLabel
                            Left = 437
                            Top = 139
                            Width = 4
                            Height = 13
                            Caption = '/'
                          end
                          object Label46: TLabel
                            Left = 336
                            Top = 89
                            Width = 64
                            Height = 13
                            Hint = 'Qtde de Venda de acordo com o Giro de Estoque'
                            Caption = 'Qtde V. PME:'
                            FocusControl = DBEdit36
                            ParentShowHint = False
                            ShowHint = True
                          end
                          object Label47: TLabel
                            Left = 336
                            Top = 114
                            Width = 64
                            Height = 13
                            Hint = 'Valor de Venda de acordo com o Giro de estoque'
                            Caption = 'Valor V. PME:'
                            FocusControl = DBEdit37
                            ParentShowHint = False
                            ShowHint = True
                          end
                          object Label57: TLabel
                            Left = 142
                            Top = 17
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '100%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label58: TLabel
                            Left = 142
                            Top = 39
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label59: TLabel
                            Left = 142
                            Top = 64
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label60: TLabel
                            Left = 142
                            Top = 89
                            Width = 43
                            Height = 14
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label61: TLabel
                            Left = 142
                            Top = 114
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label77: TLabel
                            Left = 32
                            Top = 139
                            Width = 28
                            Height = 13
                            Caption = 'IRRF:'
                            FocusControl = DBEdit50
                          end
                          object Label78: TLabel
                            Left = 9
                            Top = 164
                            Width = 51
                            Height = 13
                            Caption = 'Adic IRRF:'
                            FocusControl = DBEdit51
                          end
                          object Label79: TLabel
                            Left = 191
                            Top = 189
                            Width = 64
                            Height = 13
                            Caption = 'Lucro Retido:'
                            FocusControl = DBEdit52
                          end
                          object Label80: TLabel
                            Left = 142
                            Top = 140
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label81: TLabel
                            Left = 142
                            Top = 166
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label82: TLabel
                            Left = 337
                            Top = 189
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object Label83: TLabel
                            Left = 33
                            Top = 189
                            Width = 27
                            Height = 13
                            Alignment = taRightJustify
                            Caption = 'CSLL:'
                            FocusControl = DBEdit53
                          end
                          object Label84: TLabel
                            Left = 142
                            Top = 191
                            Width = 43
                            Height = 13
                            Alignment = taRightJustify
                            AutoSize = False
                            Caption = '0%'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHighlight
                            Font.Height = -9
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentFont = False
                          end
                          object DBEdit21: TDBEdit
                            Left = 66
                            Top = 37
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'CMV_PRODUTO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 1
                          end
                          object DBEdit7: TDBEdit
                            Left = 66
                            Top = 12
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'VALOR_VENDA_SIM'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentCtl3D = False
                            ParentFont = False
                            TabOrder = 0
                          end
                          object DBEdit25: TDBEdit
                            Left = 66
                            Top = 62
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'CUSTO_FIXO_PROP'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 2
                          end
                          object DBEdit26: TDBEdit
                            Left = 66
                            Top = 87
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'CUSTO_VARIAVEL'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 3
                          end
                          object DBEdit31: TDBEdit
                            Left = 66
                            Top = 112
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'LUCRO_APURADO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHotLight
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentCtl3D = False
                            ParentFont = False
                            TabOrder = 4
                          end
                          object DBEdit24: TDBEdit
                            Left = 262
                            Top = 12
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'MARKUP_SIMULADO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 9
                          end
                          object DBEdit16: TDBEdit
                            Left = 262
                            Top = 37
                            Width = 30
                            Height = 19
                            Ctl3D = False
                            DataField = 'CURVA'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 10
                          end
                          object DBEdit17: TDBEdit
                            Left = 262
                            Top = 62
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'QTDE_VENDIDA'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 11
                          end
                          object DBEdit18: TDBEdit
                            Left = 262
                            Top = 87
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'VALOR_MEDIO_VENDA'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 12
                          end
                          object DBEdit28: TDBEdit
                            Left = 262
                            Top = 112
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'MARGEM_PRATICADA'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 13
                          end
                          object DBEdit27: TDBEdit
                            Left = 262
                            Top = 137
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'MARKUP_PRATICADO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 14
                          end
                          object DBEdit19: TDBEdit
                            Left = 403
                            Top = 12
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'QTDE_EQUILIBRIO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 15
                          end
                          object DBEdit20: TDBEdit
                            Left = 403
                            Top = 37
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'VALOR_EQUILIBRIO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 16
                          end
                          object DBEdit33: TDBEdit
                            Left = 403
                            Top = 62
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'PME'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 17
                          end
                          object DBEdit34: TDBEdit
                            Left = 403
                            Top = 137
                            Width = 30
                            Height = 19
                            Ctl3D = False
                            DataField = 'CLASS_FREQ'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 18
                          end
                          object dbedit35: TDBEdit
                            Left = 445
                            Top = 137
                            Width = 30
                            Height = 19
                            Ctl3D = False
                            DataField = 'CLASS_AT'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 19
                          end
                          object DBEdit36: TDBEdit
                            Left = 403
                            Top = 87
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'QTDE_VENDA_PMEMES'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 20
                          end
                          object DBEdit37: TDBEdit
                            Left = 403
                            Top = 112
                            Width = 71
                            Height = 19
                            Ctl3D = False
                            DataField = 'VALOR_VENDA_PMEMES'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 21
                          end
                          object BitBtn17: TBitBtn
                            Left = 436
                            Top = 181
                            Width = 38
                            Height = 25
                            TabOrder = 22
                            OnClick = BitBtn17Click
                            Glyph.Data = {
                              76010000424D7601000000000000760000002800000020000000100000000100
                              04000000000000010000120B0000120B00001000000000000000000000000000
                              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                              333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
                              03333377777777777F33333003333330033333377FF333377F33333300333333
                              0333333377FF33337F3333333003333303333333377FF3337333333333003333
                              333333333377FF3333333333333003333333333333377FF33333333333330033
                              3333333333337733333333333330033333333333333773333333333333003333
                              33333333337733333F3333333003333303333333377333337F33333300333333
                              03333333773333337F33333003333330033333377FFFFFF77F33330000000000
                              0333337777777777733333333333333333333333333333333333}
                            NumGlyphs = 2
                          end
                          object DBEdit50: TDBEdit
                            Left = 66
                            Top = 137
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'IRRF'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 5
                          end
                          object DBEdit51: TDBEdit
                            Left = 66
                            Top = 162
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'ADIRRF'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 6
                          end
                          object DBEdit52: TDBEdit
                            Left = 261
                            Top = 187
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'LUCRORETIDO'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clHotLight
                            Font.Height = -11
                            Font.Name = 'Tahoma'
                            Font.Style = [fsBold]
                            ParentCtl3D = False
                            ParentFont = False
                            TabOrder = 8
                          end
                          object DBEdit53: TDBEdit
                            Left = 66
                            Top = 187
                            Width = 70
                            Height = 19
                            Ctl3D = False
                            DataField = 'CSLL'
                            DataSource = DtmGestorHw.DtcotacaoItens
                            ParentCtl3D = False
                            TabOrder = 7
                          end
                        end
                        object DBEdit49: TDBEdit
                          Left = 57
                          Top = 26
                          Width = 55
                          Height = 21
                          DataField = 'COD_COND_PAG'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          TabOrder = 2
                          OnExit = DBEdit49Exit
                          OnKeyDown = DBEdit49KeyDown
                        end
                        object DBLookupComboBox4: TDBLookupComboBox
                          Left = 114
                          Top = 26
                          Width = 244
                          Height = 21
                          DataField = 'COD_COND_PAG'
                          DataSource = DtmGestorHw.DtcotacaoItens
                          KeyField = 'COD_COND_PAG'
                          ListField = 'DESC_COND_PAG'
                          ListSource = DtmGestorHw.DtCondPag
                          TabOrder = 3
                        end
                      end
                      object Panel5: TPanel
                        Left = 0
                        Top = 217
                        Width = 836
                        Height = 27
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 1
                        object SpeedButton13: TSpeedButton
                          Left = 721
                          Top = 2
                          Width = 23
                          Height = 22
                          Hint = 'Sair do Detalhamento'
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
                          OnClick = SpeedButton13Click
                        end
                        object SpeedButton9: TSpeedButton
                          Left = 789
                          Top = 2
                          Width = 23
                          Height = 22
                          Hint = 'Item anterior'
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
                          OnClick = SpeedButton9Click
                        end
                        object SpeedButton10: TSpeedButton
                          Left = 818
                          Top = 2
                          Width = 23
                          Height = 22
                          Hint = 'Pr'#243'ximo Item'
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
                          OnClick = SpeedButton10Click
                        end
                      end
                    end
                    object TabSheet5: TTabSheet
                      Caption = 'Dados Fornecedor'
                      ImageIndex = 1
                      ExplicitLeft = 0
                      ExplicitTop = 0
                      ExplicitWidth = 0
                      ExplicitHeight = 0
                      object Label48: TLabel
                        Left = 37
                        Top = 31
                        Width = 49
                        Height = 13
                        Caption = 'Frete(%):'
                        FocusControl = DBEdit38
                      end
                      object Label49: TLabel
                        Left = 49
                        Top = 55
                        Width = 37
                        Height = 13
                        Caption = 'IPI(%):'
                        FocusControl = DBEdit39
                      end
                      object Label50: TLabel
                        Left = 20
                        Top = 102
                        Width = 66
                        Height = 13
                        Caption = 'MVA Produto:'
                        FocusControl = DBEdit40
                      end
                      object Label51: TLabel
                        Left = 19
                        Top = 126
                        Width = 67
                        Height = 13
                        Caption = 'Icms Entrada:'
                        FocusControl = DBEdit41
                      end
                      object Label52: TLabel
                        Left = 230
                        Top = 6
                        Width = 55
                        Height = 13
                        Caption = 'Icms Sa'#237'da:'
                        FocusControl = DBEdit42
                      end
                      object Label53: TLabel
                        Left = 0
                        Top = 78
                        Width = 86
                        Height = 13
                        Caption = 'Outras Despesas:'
                        FocusControl = DBEdit43
                      end
                      object Label54: TLabel
                        Left = 0
                        Top = 8
                        Width = 86
                        Height = 13
                        Caption = 'Valor Fornecedor:'
                        FocusControl = DBEdit44
                      end
                      object Label67: TLabel
                        Left = 232
                        Top = 31
                        Width = 58
                        Height = 13
                        Caption = 'Prazo Entr.:'
                        FocusControl = DBEdit47
                      end
                      object Label68: TLabel
                        Left = 230
                        Top = 51
                        Width = 56
                        Height = 13
                        Caption = 'Prazo Pag.:'
                        FocusControl = DBEdit48
                      end
                      object DBEdit38: TDBEdit
                        Left = 90
                        Top = 23
                        Width = 134
                        Height = 21
                        DataField = 'FRETE_SIM'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 1
                        OnExit = DBEdit38Exit
                      end
                      object DBEdit39: TDBEdit
                        Left = 90
                        Top = 47
                        Width = 134
                        Height = 21
                        DataField = 'IPI_SIM'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 2
                        OnExit = DBEdit39Exit
                      end
                      object DBEdit40: TDBEdit
                        Left = 90
                        Top = 94
                        Width = 134
                        Height = 21
                        DataField = 'MVA_SIM'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 4
                      end
                      object DBEdit41: TDBEdit
                        Left = 90
                        Top = 118
                        Width = 134
                        Height = 21
                        DataField = 'ICM_ENTRADA'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 5
                        OnExit = DBEdit41Exit
                      end
                      object DBEdit42: TDBEdit
                        Left = 291
                        Top = 0
                        Width = 134
                        Height = 21
                        DataField = 'ICM_SAIDA'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 6
                        OnExit = DBEdit42Exit
                      end
                      object DBEdit43: TDBEdit
                        Left = 90
                        Top = 70
                        Width = 134
                        Height = 21
                        DataField = 'OUTRAS_DESP_SIM'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 3
                        OnExit = DBEdit43Exit
                      end
                      object DBEdit44: TDBEdit
                        Left = 90
                        Top = 0
                        Width = 134
                        Height = 21
                        DataField = 'VALOR_SIM_FORN'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 0
                        OnExit = DBEdit44Exit
                      end
                      object BitBtn16: TBitBtn
                        Left = 349
                        Top = 114
                        Width = 75
                        Height = 25
                        Caption = '<< Confirmar '
                        TabOrder = 9
                        OnClick = BitBtn16Click
                      end
                      object DBEdit47: TDBEdit
                        Left = 291
                        Top = 23
                        Width = 134
                        Height = 21
                        Hint = 'Prazo m'#233'dio entrega'
                        DataField = 'PRAZO_MEDIO_ENT'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 7
                        OnExit = DBEdit38Exit
                      end
                      object DBEdit48: TDBEdit
                        Left = 291
                        Top = 47
                        Width = 134
                        Height = 21
                        Hint = 'Prazo m'#233'dio de pagamento'
                        DataField = 'PRAZO_MEDIO_PAG'
                        DataSource = DtmGestorHw.DtcotacaoItens
                        TabOrder = 8
                        OnExit = DBEdit38Exit
                      end
                    end
                  end
                  object Edit6: TEdit
                    Left = 159
                    Top = 475
                    Width = 256
                    Height = 21
                    TabOrder = 3
                    Visible = False
                  end
                  object ComboBox4: TComboBox
                    Left = 56
                    Top = 476
                    Width = 101
                    Height = 21
                    ItemHeight = 0
                    TabOrder = 4
                    Visible = False
                    Items.Strings = (
                      'c'#243'digo'
                      'descri'#231#227'o')
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 528
              Width = 856
              Height = 44
              ExplicitTop = 528
              ExplicitWidth = 856
              ExplicitHeight = 44
              inherited LabelSeq: TLabel
                Top = 16
                ExplicitTop = 16
              end
              inherited BitBtn4: TBitBtn
                Top = 4
                Hint = 'Salvar Registro - [GES041]'
                ExplicitTop = 4
              end
              inherited BitBtn5: TBitBtn
                Top = 4
                Hint = 'Cancelar Registro'
                ExplicitTop = 4
              end
              inherited BitBtn6: TBitBtn
                Top = 4
                ExplicitTop = 4
              end
              inherited CheckCadSeq: TCheckBox
                Top = 16
                ExplicitTop = 16
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 856
          ExplicitHeight = 572
          inherited GroupBox3: TGroupBox
            Width = 856
            ExplicitWidth = 856
            inherited imgInformation: TImage
              Left = 830
              ExplicitLeft = 838
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [GES029]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [GES030]'
            end
          end
          inherited Panel1: TPanel
            Width = 856
            Height = 499
            ExplicitWidth = 856
            ExplicitHeight = 499
            inherited Splitter1: TSplitter
              Height = 438
              ExplicitTop = 68
              ExplicitHeight = 441
            end
            inherited DBGrid1: TDBGrid
              Width = 563
              Height = 438
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 852
              ExplicitWidth = 852
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [GES031]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [GES032]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [GES077]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [GES034]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Verificar Melhor Proposta Fornecedor - [GES031]'
                Glyph.Data = {
                  3A060000424D3A06000000000000FA0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000F1000000F10000007A6EA600230F
                  530066537900FF00FF009E999C009A909500F0EAED009C939700F3EEF0009C91
                  95009D9799009C8E9200EFE7E900EBE3E500FAF6F700F6F2F300937078006F36
                  4200926D750091697000926D74008B696F008E5C640090656C0091696F00E2D5
                  D7006A3A41008C585F0090626800866A6E00E5D9DA00E7DCDD00EAE0E1006736
                  3900A17D7F00A7878900B4979900B1959700B59A9C00CAB0B200AA8B8C00B295
                  9600C2A6A700BAA0A100C6ABAC00D0BCBD0058292A00906A6B0095727300A481
                  8200A3808100A5838400A68687006D414100A4828200B69D9D00B89F9F00FBFA
                  FA005E201C00825350007F443900AA8B8400B2968F007A3721007D3C24008B57
                  4200997567009C310000972D000083422500966C5A00C4ACA1008E3205008434
                  0D00A73A00009D3903009C3C0500983905008E441B00A0542800A9410200A442
                  05009E3E0500923E0A00974E2000BFA59500B54A0200A7460500986B4C00996F
                  5200CA550000C6520000965A2C009668450097694800B8998200D9620000BD57
                  0500975823009E6A3F00A1704900E76D00009C653500AB5C0D00AF733800B177
                  4000AB7E5100BA8E6200C19E7A00C7AD9300AD621400AF671B00B0681C00B26E
                  2500B4732A00B4742C00BA885100BD956900C2A38100B67A3500B77B3700BA81
                  4000BA834200D17D1100D4821800D4841B00D88C2400D88E2600DA963000DC96
                  3100DE9F3E00E2AA4D00E5B25900E6B45C00E9BB6700E9BB6800EABF6E00EDC6
                  7800EEC97E00EBC57600EFCF8700F2D49000F3D99700F4DEA000F6E2A600FAEB
                  B600524F38003C3D2200414228002C351500243D130025401500345629002557
                  1F0017561400004B0000004D010007650C0008670E00096A10000C7015000E75
                  180013741C000D7518000F781B00117F1F0014832300178A2800168928001C93
                  3000188F2D001E993500209E3900219F3A0023A43F0024A44400177A3C001873
                  4C000F315D00DDE5FF007E9AFF0087A1FF008CA5FF0099B0FF00B0C1FF00B5C5
                  FF00BCCBFF00D5DEFF003E64FF00496CFC005173FF005477FF005B7BFF006584
                  FF006B8AFF007690FF00889FFF00ADBDFF00C1CEFF00C5D0FF00EAEEFF00143B
                  FF00183EFF002249FF00274DFF002A51FF003658FF00375BFF00EDF0FF00072B
                  FF00072CFF00082BFF00092EFF000B30FF000D32FF000F35FF001037FF00163C
                  FF00001EFF00001FFF000121FF000324FF000325FF000528FF000628FF000019
                  EE000016E6000720DE000F22C9001C2CBC001E30C400010FA1000310B400000C
                  BF00020FBC00282DA400000397000D0D7F001D1F9300FFFFFF00000000000303
                  030303ECECEC03030303030303030303030303030303030303E8E8DADADAECEC
                  9C9C9C9C9C9B03030303030303030303E8DADADAC5DADADAE9B0A4A4A4A19C9C
                  9C9C0303030303E8DBDACEBBEFC5E0DADAE7AFAEAEADABA9A7A09C9C030303E8
                  DDD3C8C4C6C5C4DADAE2B1ACADABA9AAA8A6A59F9C03E8D5D1D6C0E0C5C3C5DA
                  DADAB29892352E9499A2A3A09E9CE8CCD8D4D7B6EFEFCEDADADAED312A22111C
                  3B21939A9D9CE8BFCDD7B9BBC7D9DCDBDADA01332C3211171C161B979D9C03EC
                  C2D9EFBDB9BECADEDCE13A342C361113171C16969D0303ECB7C1BAD0D0EFCFD2
                  DFEA4B232733111213171C9503030303ECB8B6B5B3BECBC9E31A4F2927341110
                  121817110303030303ECB4B7B5C2BCE4002D2D28282F11151014181103030303
                  0303EEE5E6EB026A775C627D7B671150493F3C11030303030303118E8C5D8784
                  8378737F7D6E115B4C48441103030303030311908E588986847977807F701160
                  574D4A11030303030303119190598C8B86747982817111655651561103030303
                  03031147473D3E2B2B3726242530111D3B414111030303030303115F6C46756B
                  74646469685C115445403F11030303030303118F8D5E88858378727E7C6E115A
                  5248431103030303030311918F598A88857A77807E6F1160574C4A1103030303
                  030311556D42766C756366777262116153534E11030303030303110E0F08060C
                  0D201F1E1938110A07090B1103030303030311390E0F08060C0D201F1E2B1104
                  0A0705110303030303031111111111111111111111111111111111110303}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Lista de Cota'#231#227'o - [GES051]'
                Glyph.Data = {
                  56060000424D5606000000000000160400002800000018000000180000000100
                  08000000000040020000120B0000120B0000F8000000F80000000A098700FF00
                  FF00598752001C62190003500100034B0100014F0000014C0000024D01000248
                  0100034D02000352030004560400075507000C590C0016631500004501000154
                  020002530300034C040004580500065D0700076309000E7511000F5E11001668
                  18000049030003590600096B0E0009660C000C6C110007620C000A6C11000045
                  07000D7616000F741700168F21000F7D1C000D6E170011821E0013821F001480
                  200018932600158221001A7A240021762B002D82370002530D00035B10000C74
                  1A0013822100168B270018932900189128001B972C001E9E2E001D832B00055F
                  13001A952D001F9F340023A9390023A93A0025833300066316001283280021AA
                  39001FA1360023AD3C0025B43E0024AB3E003589450008691C0028B744002ABD
                  4A0028B646002AB848002DC04D00398B4A005DA56C0031C7530035D35B004699
                  5A003F6B4900489A5E001078490097A09D001F8C7B0065FCFF000970750052F6
                  FF0047F2FF0039EAFF0036D9F00040E9FF0056E3F7002CE2FF0038C7E100056F
                  84001BDAFF001FDAFF001FD5FA0024DCFF0027DCFF002CCEEE0031C6E50034BF
                  DA004BDDFA0005CEFF000DD1FF000FD0FF0012D1FF0012D0FE0016D5FF0018BF
                  E90027CFF80028B7D9003DD8FE0033B5D30000C6FF0000C9FF0000C4FC0001C6
                  FF0002C7FF0003C6FE0005C5FB000AC6F80016CCFF0021B7DE0000C4FF0000BF
                  FB0000BAF60003C5FF0007B6EF00239CC4002BA0C40000B6F30000B2F20000AA
                  E50000A6E200009DD80003A1D9000DA7DC000FA5D8000F91C000129ECF001597
                  C6001799C7000B4358001D93BD002296BF000099D5000092CE000197D100078F
                  C5000E91C400188CBB000091CF000183C000097EB4000F84B7001388BA000082
                  C000007EBA000078B5000076B1000075B0000074AF000072AC00006DA6000575
                  AC000A6999000C6C9D000D6E9F000D6F9F00006DA900006EA900006BA6000069
                  A5000069A4000067A1000068A1000067A00000659F0000669F0000649D000063
                  9C0000629A0000629900016BA40001629900026AA1000369A300036298000970
                  A7000A6798001177AF0000639D0000609A00005E9900005F9800005E9700005B
                  9500005B9300005A9200015C9500025D930003568B00065F9300005A95000059
                  9300005892000058910000568F0000548C0000558C0000528B0000538A000051
                  8900005088000051880001578F0003558B00004D8800004B8200014C83000048
                  800003559500011F570002205900021F580003205B0003216500031C5200011C
                  5E000119530004216900001EFF00001BF8000017EF000012E500010ED900090F
                  70000109CE000106C400090C7F000103BA000202B50000000000010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101D9D9D9DA01010101010101010101DBD5D4E1010101D2C9C6B3B7C5C7D3C9
                  C5010101010101BAB1D3D2C9E101CCBCC6C4B2B0B4B8CAD7CBD80101010101C2
                  8196B0D4C4DFCD9F9B928E84888A97A2B1D90101010101C2787687A1C4B9DD85
                  69737F717D7B777782C2010101010101C26B837A98B5BECF75606867646F7CC2
                  C201010101011010617E706D6D99BDBFCEADACABAAC2C20101010100E8050607
                  2158725F66659ABBDCE0D0D1B3C90101010100F6EA0512110821C2745A5A5CC1
                  B6A8A5A3CADA0101010100F6EA05141B041AC2C3865E5794DEC5B3A7A8B70101
                  010100F5E305161F0B2FC2E2C0A0959EC4AFB6B6C8D60101010100F3E5051C20
                  0C30C2C18FA9B29DA7A4A6AFAECA0101010100F2E5052225153FC2A091908D8C
                  8B969CA1A3BA0101010100F0E40528331D47C26A5D5F636E6B79808089C90101
                  010100EFE605343B1E2556C2595A5B66626C83C2C2010101010100EEE7053C48
                  23364054C2C2C2C2C2C2C20101010101010100EDEB0544502945372425313909
                  0101010101010101010100ECE9053842494F4B3D372A17090101010101010101
                  010100EC93054E4D2C27414C4A3D3205010101010101010101010000550E192E
                  534D3E2B35433A1301010101010101010101010100F152030A182D5146382601
                  01010101010101010101010101010000F4020F0D262601010101010101010101
                  0101010101010101010000010101010101010101010101010101}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'OLAP da Cota'#231#227'o/Sugest'#227'o selecionada - [GES036]'
                Glyph.Data = {
                  5E050000424D5E050000000000001E0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000BA000000BA000000161097002E26
                  A500F1F0FF0049399800C0BADD003A247F004832810059388500794E8200FF00
                  FF0097656C0083616600D37E8400FC8D9300DE6C6E00E2787A00EF858700C56E
                  6F00BB686900CE77790080515200986464009A666600B4666400DF8A87009B67
                  650096636200D1817D00F6938C00FFA09900E38B7F00B6746A00B36F64009F6B
                  6100B2570400CB660000FFFFF200FDFFEC005C994F0068B65B00A1D199006DB8
                  66002B9D3F001590340038D663008BAA94001C8443002BA15600297D4900515E
                  580033BA8B003B93740053A09D0000A09B0044C7CB004BF4FF004EECFF002EE5
                  FF0005D9FF0018DFFF0025DDFC0046DDF50058DEF30063E9FF00285860005C99
                  A3000ECDF5002AD5F6002CB6D3003282910002C6F40006CAF60011C9F4003097
                  AE0000C8FF0002B7E60003ABD80047BBD900019ED0000A9FCF001BB5E4000092
                  C600008FC3000087B900059ACE000E8CBB001299C6000083B700007EB200007E
                  B1000182B5000281B4000383B6000582B50005618500087DAE000B87B7000C83
                  B2000F84B3001385B3001584B1001A759800AFC5CE00007BB400007BAF000074
                  A9000071A500017CB0000179AD000173A7000379AC000572A4000672A3000971
                  A2000A6995000D7EAE000D76A700137BA700006FA400006EA300006DA1000069
                  9F00006B9F0000689C00016BA00002699B00036DA100036A9D00046FA2000666
                  9500178ECB0000669F000163970026729C00146899002B74A400618DB4001F62
                  A30083A6D3003E75D20026417100114FDA004F77D800557BDF0004268F006B8C
                  ED00A6BBFF00B0C3FE00E9EEFD006689FF007998FF008CA6FF000032FF000332
                  F3000D3AFA000E3BF5001442FC004467F6007B96FE003E445B00002BE7000020
                  B9000E33E7003053F200304EDE003D60FF00C5CFFB00041DA6002242FF003A59
                  FD000023FF00001DD6001A34D7008994E500D4D8F5000019F8002F42D3004856
                  CE00000BC100141EA8006971F9005E63C7001010A100393AB400FFFFFF000000
                  0000090909090909090909090909090909090909090909090909090909090909
                  090909090909090909806D78786A09090909090909090909090909090909097D
                  785F5C59586A7B090909090909090909090909097C777C754D3D4342464B5884
                  84090909090909090909097163555B734D3E3D43484C687B7C78090909090909
                  0909097A7A7A7A6977717463707879574B4E0909090909090909097673605D5A
                  576879097E6D52473A530909091414141414097A7A7A7A7A7A7A7A7F6F563C39
                  54090906211A15161619146561616E6C6B586D7B643D3750090909051F1B1311
                  12170A86797A77797B7B815E443E49312222B6B7081C1D100F0E0B7F62564F54
                  5167652D342DB8B8B8220093B107181D0D2030493F38393B3A4A8204282EB8B8
                  B822009497A4030C1E262C32363644504C3583A2892E2E2E2E2200AEA696A301
                  9F2E2F2A2B2B338D872729419A88B8B8B8220900A692959CABA1A790908C66A8
                  8A24B8B88FB4B8B8B822090900AD9E9D9C9899A0B2B502A39125B8B88E9DB8B8
                  B8220909090000B0ACABABB3402E2E459B8B8BA99B452E2E2E22090909090900
                  00000022B8B8B82E8599AFAA862EB8B8B82209090909090909090922B8B8B82E
                  B8B89EA5722EB8B8B82209090909090909090922B8B8B82EB8B8B8B8B82EB8B8
                  B822090909090909090909222323232323232323232323232322090909090909
                  0909090922222222222222222222222222090909090909090909090909090909
                  0909090909090909090909090909090909090909090909090909090909090909
                  0909}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Tipo de Atributos - [GES068]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000C30E0000C30E00000000000000000000B1B1B1A0A0A0
                  A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B1B1B1FFFFFFFFFF
                  FFA07955B76311B76311B76311B76311B76311B76311B76311B76311B76311A2
                  7C589D9D9DD6D6D6EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFD6D6D6
                  A2A2A2FFFFFFFFFFFFB76311B76311B76311B76311B76311B76311B76311B763
                  11B76311B76311B763119D9D9DEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFEFEFEFA2A2A2FFFFFFFFFFFFB76311B76311FFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFB76311B763119D9D9DEEEEEEFEFEFEFFFFFFFEFE
                  FEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2A2A2FFFFFFFFFFFFB76311B76311FF
                  FFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311B763119D9D9DEEEEEE
                  FEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2A2A2FFFFFFFFFF
                  FFB76311B76311FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311B7
                  63119D9D9DEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF
                  A2A2A2FFFFFFFFFFFFB76311B76311FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFF
                  DCFFFFFFB76311B763119D9D9DEEEEEEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFE
                  FEFEFFFFFFEFEFEFA2A2A2FFFFFFFFFFFFB76311B76311FFFFFFFFFFDCFFFFDC
                  FFFFDCFFFFDCFFFFDCFFFFFFB76311B763119D9D9DEEEEEEFEFEFEFFFFFFFEFE
                  FEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2A2A2FFFFFFFFFFFFB76311B76311FF
                  FFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311B763119D9D9DEFEFEF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFA2A2A2FFFFFFFFFF
                  FFB76311B76311FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB76311B7
                  63119E9E9ED6D6D6EEEEEEEFEFEFEEEEEEEEEEEEEFEFEFEEEEEEEFEFEFD6D6D6
                  A0A0A0FFFFFFFFFFFFB76311B76311B76311B76311B76311B76311B76311B763
                  11B76311B76311B76311B1B1B19C9C9C9C9C9C9D9D9D9C9C9C9C9C9C9D9D9D9C
                  9C9C9C9C9C9C9C9CB1B1B1FFFFFFFFFFFFA7825EB76311B76311B76311B76311
                  B76311B76311B76311B76311B76311A27C58FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFA27C58B76311B76311B76311B76311B76311B76311B76311B76311B76311
                  A7825EFFFFFFFFFFFFB1B1B1A0A0A0A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3
                  A3A3A3A3A3A3A3B1B1B1B76311B76311B76311B76311B76311B76311B76311B7
                  6311B76311B76311B76311FFFFFFFFFFFF9D9D9DD6D6D6EFEFEFEFEFEFEFEFEF
                  EFEFEFEFEFEFEFEFEFEFEFEFD6D6D6A2A2A2B76311B76311FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFB76311B76311FFFFFFFFFFFF9D9D9DEFEFEFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFA2A2A2B76311B76311
                  FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311B76311FFFFFFFFFF
                  FF9D9D9DEEEEEEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2
                  A2A2B76311B76311FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311
                  B76311FFFFFFFFFFFF9D9D9DEEEEEEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFE
                  FEFFFFFFEFEFEFA2A2A2B76311B76311FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFF
                  FFDCFFFFFFB76311B76311FFFFFFFFFFFF9D9D9DEFEFEFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFEFEFEFA2A2A2B76311B76311FFFFFFFFFFDCFFFF
                  DCFFFFDCFFFFDCFFFFDCFFFFFFB76311B76311FFFFFFFFFFFF9D9D9DEEEEEEFE
                  FEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2A2A2B76311B76311
                  FFFFFFFFFFDCFFFFDCFFFFDCFFFFDCFFFFDCFFFFFFB76311B76311FFFFFFFFFF
                  FF9D9D9DEEEEEEFEFEFEFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFEFEFEFA2
                  A2A2B76311B76311FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB76311
                  B76311FFFFFFFFFFFF9D9D9DEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFEFEFEFA2A2A2B76311B76311B76311B76311B76311B76311B76311B7
                  6311B76311B76311B76311FFFFFFFFFFFF9E9E9ED6D6D6EEEEEEEFEFEFEEEEEE
                  EEEEEEEFEFEFEEEEEEEFEFEFD6D6D6A0A0A0B38F69B76311B76311B76311B763
                  11B76311B76311B76311B76311B76311A7825EFFFFFFFFFFFFB1B1B19C9C9C9C
                  9C9C9D9D9D9C9C9C9C9C9C9D9D9D9C9C9C9C9C9C9C9C9CB1B1B1}
                OnClick = SpeedButton11Click
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
                Hint = 'Ver registros da lixeira - [GES033]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 438
              ExplicitHeight = 438
              inherited ScrollBox2: TScrollBox
                Height = 421
                ExplicitHeight = 421
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 856
          ExplicitHeight = 572
        end
        object TabSheet7: TTabSheet
          Caption = 'Lista de Cota'#231#227'o'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnListaCotacao: TPanel
            Left = 0
            Top = 0
            Width = 856
            Height = 425
            Align = alTop
            TabOrder = 0
            object GroupBox12: TGroupBox
              Left = 1
              Top = 161
              Width = 854
              Height = 65
              Align = alTop
              TabOrder = 2
              object btSelectAll: TSpeedButton
                Left = 676
                Top = 38
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
              object btUnSelectAll: TSpeedButton
                Left = 705
                Top = 38
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
              object Label65: TLabel
                Left = 3
                Top = 13
                Width = 41
                Height = 13
                Caption = 'Fornec.:'
              end
              object Label66: TLabel
                Left = 70
                Top = 40
                Width = 49
                Height = 13
                Caption = 'Tp Venda:'
              end
              object Label70: TLabel
                Left = 434
                Top = 13
                Width = 54
                Height = 13
                Caption = 'Cond. Pag:'
              end
              object Label71: TLabel
                Left = 290
                Top = 40
                Width = 58
                Height = 13
                Caption = 'Prazo Entr.:'
              end
              object Label72: TLabel
                Left = 432
                Top = 40
                Width = 56
                Height = 13
                Caption = 'Prazo Pag.:'
                FocusControl = DBEdit48
              end
              object DBLookupComboBox3: TDBLookupComboBox
                Left = 122
                Top = 10
                Width = 295
                Height = 21
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE'
                ListSource = DtmGestorHw.DtFornecedor
                TabOrder = 1
                OnExit = DBLookupComboBox3Exit
              end
              object EditHw1: TEditHw
                Left = 50
                Top = 10
                Width = 66
                Height = 21
                TabOrder = 0
                Text = '                 0'
                OnExit = EditHw1Exit
                OnKeyDown = EditHw1KeyDown
                Formato = fInteger
                FormatSize = '0.2'
              end
              object DBComboBox4: TDBComboBox
                Left = 125
                Top = 37
                Width = 107
                Height = 21
                DataField = 'TIPVENDA'
                DataSource = DtmGestorHw.DtcotacaoItens
                ItemHeight = 0
                Items.Strings = (
                  'V - Varejo'
                  'A - Atacado'
                  'C - Consignado'
                  'T - Televenda'
                  'L - Aplicadores'
                  'O - Outras Empresas')
                TabOrder = 4
                OnExit = DBComboBox4Exit
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 563
                Top = 10
                Width = 296
                Height = 21
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG'
                ListSource = DtmGestorHw.DtCondPag
                TabOrder = 3
                OnExit = DBLookupComboBox5Exit
              end
              object EditHw2: TEditHw
                Left = 494
                Top = 10
                Width = 66
                Height = 21
                TabOrder = 2
                Text = '                 0'
                OnExit = EditHw2Exit
                Formato = fInteger
                FormatSize = '0.2'
              end
              object EditHw3: TEditHw
                Left = 354
                Top = 38
                Width = 66
                Height = 21
                Hint = 'Prazo m'#233'dio entrega'
                TabOrder = 5
                Text = '                 0'
                Formato = fNumber
                FormatSize = '0.2'
              end
              object EditHw4: TEditHw
                Left = 494
                Top = 37
                Width = 66
                Height = 21
                Hint = 'Prazo m'#233'dio de pamento'
                TabOrder = 6
                Text = '                 0'
                Formato = fNumber
                FormatSize = '0.2'
              end
            end
            object GroupBox10: TGroupBox
              Left = 1
              Top = 41
              Width = 854
              Height = 120
              Align = alTop
              Caption = 'Lista de Cota'#231#227'o'
              TabOrder = 1
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 103
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid3KeyDown
                OnTitleClick = DBGrid3TitleClick
              end
            end
            object GroupBox13: TGroupBox
              Left = 1
              Top = 383
              Width = 854
              Height = 41
              Align = alBottom
              TabOrder = 4
              object BitBtn18: TBitBtn
                Left = 332
                Top = 8
                Width = 75
                Height = 27
                Hint = 'Gravar a Lista de Cota'#231#227'o'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn18Click
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
              object BitBtn13: TBitBtn
                Left = 413
                Top = 8
                Width = 75
                Height = 27
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn13Click
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
              Left = 1
              Top = 226
              Width = 854
              Height = 157
              Align = alClient
              Caption = 'Itens Lista Cota'#231#227'o'
              TabOrder = 3
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 140
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGrid4CellClick
                OnDrawColumnCell = DBGrid4DrawColumnCell
                OnDblClick = DBGrid4DblClick
                OnKeyDown = DBGrid4KeyDown
                OnTitleClick = DBGrid4TitleClick
              end
            end
            object GroupBox7: TGroupBox
              Left = 1
              Top = 1
              Width = 854
              Height = 40
              Align = alTop
              Caption = 'Pesquisa'
              TabOrder = 0
              object Label590: TLabel
                Left = 552
                Top = 15
                Width = 27
                Height = 13
                Caption = 'Data:'
              end
              object Label63: TLabel
                Left = 654
                Top = 15
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label127: TLabel
                Left = 236
                Top = 13
                Width = 75
                Height = 13
                Caption = 'Descri'#231#227'o Lista:'
              end
              object Label64: TLabel
                Left = 44
                Top = 13
                Width = 48
                Height = 13
                Caption = 'Cod Lista:'
              end
              object MaskEditDataEntIni: TMaskEdit
                Left = 583
                Top = 12
                Width = 65
                Height = 21
                Hint = 'Data Inicial e Final para pesquisa'
                CharCase = ecUpperCase
                EditMask = '99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                OnEnter = MaskEditDataEntIniEnter
                OnKeyDown = MaskEditDataEntIniKeyDown
              end
              object MaskEditDataEntFim: TMaskEdit
                Left = 676
                Top = 12
                Width = 66
                Height = 21
                Hint = 'Data Inicial e Final para pesquisa'
                EditMask = '99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                OnEnter = MaskEditDataEntFimEnter
                OnKeyDown = MaskEditDataEntIniKeyDown
              end
              object BitBtn23: TBitBtn
                Left = 748
                Top = 10
                Width = 75
                Height = 25
                Hint = 'Clique para pesquisar '
                Caption = '&Procurar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = BitBtn23Click
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
              end
              object EditDesricao: TEdit
                Left = 317
                Top = 12
                Width = 161
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object EditCodLista: TEditHw
                Left = 98
                Top = 12
                Width = 71
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
                Text = '                                   0'
                Formato = fInteger
                FormatSize = '0.2'
              end
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Cota'#231#227'o por Fornecedor'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnCotacao: TPanel
            Left = 0
            Top = 0
            Width = 856
            Height = 425
            Align = alTop
            TabOrder = 0
            object GroupBox9: TGroupBox
              Left = 1
              Top = 1
              Width = 854
              Height = 120
              Align = alTop
              Caption = 'Fornecedores'
              TabOrder = 0
              object DBGrid5: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 103
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnKeyDown = DBGrid5KeyDown
                OnTitleClick = DBGrid5TitleClick
              end
            end
            object GroupBox11: TGroupBox
              Left = 1
              Top = 383
              Width = 854
              Height = 41
              Align = alBottom
              TabOrder = 3
              object BitBtn14: TBitBtn
                Left = 332
                Top = 8
                Width = 75
                Height = 27
                Hint = 'Gravar a Lista de Cota'#231#227'o'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn14Click
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
              object BitBtn19: TBitBtn
                Left = 413
                Top = 8
                Width = 75
                Height = 27
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn19Click
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
            object GroupBox14: TGroupBox
              Left = 1
              Top = 153
              Width = 854
              Height = 230
              Align = alClient
              Caption = 'Itens Cota'#231#227'o'
              TabOrder = 2
              object DBGrid6: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 213
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGrid6CellClick
                OnDrawColumnCell = DBGrid6DrawColumnCell
                OnDblClick = DBGrid6DblClick
                OnKeyDown = DBGrid6KeyDown
                OnTitleClick = DBGrid6TitleClick
              end
            end
            object GroupBox8: TGroupBox
              Left = 1
              Top = 121
              Width = 854
              Height = 32
              Align = alTop
              TabOrder = 1
              object btSelectAllCot: TSpeedButton
                Left = 676
                Top = 8
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
                OnClick = btSelectAllCotClick
              end
              object btUnSelectAllCot: TSpeedButton
                Left = 705
                Top = 8
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
                OnClick = btUnSelectAllCotClick
              end
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Lista de Cota'#231#227'o'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnListaCotacaoC: TPanel
            Left = 0
            Top = 0
            Width = 856
            Height = 377
            Align = alTop
            TabOrder = 0
            object GroupBox15: TGroupBox
              Left = 1
              Top = 76
              Width = 854
              Height = 265
              Align = alClient
              TabOrder = 1
              object DBGrid7: TDBGrid
                Left = 2
                Top = 15
                Width = 850
                Height = 248
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DBGrid7CellClick
                OnDrawColumnCell = DBGrid7DrawColumnCell
                OnDblClick = DBGrid7DblClick
                OnKeyDown = DBGrid4KeyDown
                OnTitleClick = DBGrid7TitleClick
              end
            end
            object GroupBox16: TGroupBox
              Left = 1
              Top = 1
              Width = 854
              Height = 75
              Align = alTop
              TabOrder = 0
              object Label73: TLabel
                Left = 94
                Top = 14
                Width = 50
                Height = 13
                Caption = 'Descri'#231#227'o:'
              end
              object Label74: TLabel
                Left = 82
                Top = 38
                Width = 62
                Height = 13
                Caption = 'Observa'#231#227'o:'
              end
              object SpeedButton14: TSpeedButton
                Left = 671
                Top = 27
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
              object SpeedButton15: TSpeedButton
                Left = 700
                Top = 27
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
              object Edit1: TEdit
                Left = 150
                Top = 11
                Width = 506
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object Memo1: TMemo
                Left = 150
                Top = 38
                Width = 506
                Height = 33
                TabOrder = 1
              end
            end
            object GroupBox17: TGroupBox
              Left = 1
              Top = 341
              Width = 854
              Height = 35
              Align = alBottom
              TabOrder = 2
              object BitBtn21: TBitBtn
                Left = 332
                Top = 7
                Width = 75
                Height = 25
                Hint = 'Gravar a Lista de Cota'#231#227'o'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn21Click
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
              object BitBtn22: TBitBtn
                Left = 413
                Top = 7
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn22Click
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
        object tsOrdenarRel: TTabSheet
          Caption = 'Relat'#243'rio'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnOrdenarRel: TPanel
            Left = 0
            Top = 0
            Width = 489
            Height = 329
            TabOrder = 0
            object GroupBox18: TGroupBox
              Left = 1
              Top = 1
              Width = 487
              Height = 136
              Align = alTop
              Caption = 'Op'#231#245'es'
              TabOrder = 0
              object Label75: TLabel
                Left = 17
                Top = 22
                Width = 36
                Height = 13
                Caption = 'Ordem:'
              end
              object Label247: TLabel
                Left = 21
                Top = 90
                Width = 300
                Height = 13
                Caption = 'Atributos Ex.: (15,67,89,18) ou Duplo Click na Atributo Abaixo'
              end
              object SpeedButton16: TSpeedButton
                Left = 399
                Top = 89
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
                OnClick = SpeedButton16Click
              end
              object SpeedButton17: TSpeedButton
                Left = 428
                Top = 89
                Width = 23
                Height = 21
                Hint = ' Desfazer sele'#231#227'o'
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
                OnClick = SpeedButton17Click
              end
              object Label76: TLabel
                Left = 42
                Top = 61
                Width = 300
                Height = 13
                Caption = 'Atributos Ex.: (15,67,89,18) ou Duplo Click na Atributo Abaixo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object cbOrdem: TComboBox
                Left = 59
                Top = 19
                Width = 312
                Height = 19
                Style = csOwnerDrawFixed
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = 'ATRIBUTOS'
                OnExit = cbOrdemExit
                Items.Strings = (
                  'ATRIBUTOS'
                  'MEDIA DOS ATRIBUTOS'
                  'NOME/RAZAO'
                  'PRECO CUSTO'
                  'PRAZO ENT'
                  'PRAZO PAG')
              end
              object CheckBox2: TCheckBox
                Left = 21
                Top = 41
                Width = 200
                Height = 17
                Caption = 'Exibir raz'#227'o social dos fornecedores'
                TabOrder = 3
              end
              object BitBtn25: TBitBtn
                Left = 378
                Top = 7
                Width = 100
                Height = 25
                Caption = '&Imprimir'
                TabOrder = 1
                OnClick = BitBtn25Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000030F0000030F00000001000000010000421821004221
                  21004A2121004A292900523131005A313100393939004A4A4A007B4A5200844A
                  52004A525200525252005A525200524A5A008C4A5A0052525A00636363007363
                  63007B6363006B6B6300736B63007B6B63006B5A6B00845A6B007B636B008463
                  6B006B6B6B00846B6B008C6B6B008C637300846B73008C6B73009C6B73007373
                  73007B737300847373007B947300A56B7B00A5737B00737B7B007B7B7B00847B
                  7B009C7B7B00A57B7B00AD7B7B007B847B00A5847B008CFF7B00847B84008C7B
                  8400947B8400BD7B84007384840084848400A5848400AD848400B58484009C84
                  8C00848C8C008C8C8C00948C8C009C8C8C00BD8C8C00C68C8C0084948C00BD8C
                  9400C68C9400849494008C949400949494009C9494008C9C9400AD7B9C008C84
                  9C008C949C0094949C00AD949C008C9C9C00949C9C009C9C9C00A59C9C00B5A5
                  9C00A57BA500A5A5A500ADA5A500B5A5A500AD9CAD009CA5AD00BDA5AD00A5AD
                  AD00ADADAD00ADB5B500B5B5B500BDB5BD00B5BDBD00BDBDBD00BDD6BD00C6C6
                  C600CEC6C600C6C6CE00C6CECE00CECECE00D6CECE00CED6CE00D6CED600CED6
                  D600D6D6D600DED6D600D6DEDE00DEDEDE00DEE7DE00E7D6E700DEE7E700E7E7
                  E700EFE7E700E7EFE700E7EFEF00EFEFEF00F7EFEF00EFF7F700F7F7F700FF00
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00797979797979
                  797979797979797979797979797979533B3B3B3B3B5379797979797979790075
                  785E615C7B61001A79797979790B0075786266617B63000B7979791A07070770
                  693A3B5C75640707001328070C0B074F5A5B5C5C534B070F0A000B304E4D474E
                  453B2D40444E495C2F000B4F5F5A3C1E1B1917181C1D520E5C00105A6C1F202B
                  3E4241413F26250E600B3B5C65080907000000000007090E630B3B5C65000753
                  6D6D6D6D6D530602651079535B46235F7B7B78787878183D5B7979797979795F
                  7B7B785353537979797979797979795F7A7B78536D537979797979797979795F
                  7878785353797979797979797979795F53535353797979797979}
              end
              object BitBtn26: TBitBtn
                Left = 378
                Top = 38
                Width = 100
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 2
                OnClick = BitBtn26Click
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
              object mkTipo: TMaskEdit
                Left = 17
                Top = 109
                Width = 354
                Height = 21
                CharCase = ecUpperCase
                Enabled = False
                TabOrder = 4
                OnChange = mkTipoChange
              end
            end
            object Panel6: TPanel
              Left = 1
              Top = 296
              Width = 487
              Height = 32
              Align = alBottom
              TabOrder = 1
              object Label199: TLabel
                Left = 42
                Top = 10
                Width = 39
                Height = 13
                Caption = 'Atributo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object EditFiscal1: TEditFiscal
                Left = 87
                Top = 6
                Width = 327
                Height = 21
                Hint = 'Informe a descri'#231#227'o do atributo para localizar.'
                CharCase = ecUpperCase
                TabOrder = 0
                OnChange = EditFiscal1Change
                OnKeyDown = EditFiscal1KeyDown
              end
            end
            object Panel7: TPanel
              Left = 1
              Top = 137
              Width = 487
              Height = 159
              Align = alClient
              Caption = 'Panel7'
              TabOrder = 2
              object DBGrid8: TDBGrid
                Left = 1
                Top = 1
                Width = 485
                Height = 157
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid8DrawColumnCell
                OnDblClick = DBGrid8DblClick
                OnKeyDown = DBGrid8KeyDown
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 878
      Width = 487
      Height = 605
      ExplicitLeft = 878
      ExplicitWidth = 487
      ExplicitHeight = 605
      inherited bMarketingHW: TBitBtn
        Top = 583
        Width = 485
        ExplicitTop = 583
        ExplicitWidth = 485
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 607
    Width = 871
    ExplicitTop = 607
    ExplicitWidth = 871
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 622
    Top = 139
  end
  inherited Timer1: TTimer
    Left = 662
    Top = 67
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 822
    Top = 187
  end
end
