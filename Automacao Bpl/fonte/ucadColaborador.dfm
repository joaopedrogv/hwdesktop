inherited frmCadcolaborador: TfrmCadcolaborador
  Left = 253
  Top = 49
  Caption = 'Colaboradores'
  ClientHeight = 590
  ClientWidth = 788
  Scaled = False
  ExplicitWidth = 804
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 788
    Height = 571
    ExplicitWidth = 788
    ExplicitHeight = 571
    inherited Splitter2: TSplitter
      Height = 569
      ExplicitHeight = 569
    end
    inherited PanelLeft: TPanel
      Width = 783
      Height = 569
      ExplicitWidth = 783
      ExplicitHeight = 569
      inherited PageControl1: TPageControl
        Width = 781
        Height = 567
        ExplicitWidth = 781
        ExplicitHeight = 567
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 536
          inherited ScrollBox1: TScrollBox
            Width = 773
            Height = 536
            ExplicitWidth = 773
            ExplicitHeight = 536
            inherited PageControl3: TPageControl
              Width = 773
              Height = 488
              OnChange = PageControl3Change
              ExplicitWidth = 773
              ExplicitHeight = 488
              inherited TabSheet3: TTabSheet
                Caption = 'Dados Pessoais'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 765
                ExplicitHeight = 457
                inherited ScrollBox3: TScrollBox
                  Width = 765
                  Height = 457
                  ExplicitWidth = 765
                  ExplicitHeight = 457
                  inherited GroupBox1: TGroupBox
                    Width = 761
                    Height = 445
                    Caption = 'Dados do colaborador'
                    Font.Style = [fsBold]
                    ParentFont = False
                    ExplicitWidth = 761
                    ExplicitHeight = 445
                    object Label6: TLabel
                      Left = 90
                      Top = 16
                      Width = 41
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 246
                      Top = 16
                      Width = 35
                      Height = 13
                      Caption = 'Nome:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 394
                      Top = 40
                      Width = 55
                      Height = 13
                      Caption = 'Endere'#231'o:'
                      FocusControl = DBEdit3
                    end
                    object Label10: TLabel
                      Left = 89
                      Top = 96
                      Width = 41
                      Height = 13
                      Caption = 'Cidade:'
                    end
                    object Label11: TLabel
                      Left = 610
                      Top = 94
                      Width = 41
                      Height = 13
                      Caption = 'Estado:'
                    end
                    object Label12: TLabel
                      Left = 495
                      Top = 227
                      Width = 94
                      Height = 13
                      Caption = 'Fone de contato:'
                      FocusControl = DBEdit7
                    end
                    object Label13: TLabel
                      Left = 108
                      Top = 149
                      Width = 23
                      Height = 13
                      Caption = 'CPF:'
                      FocusControl = DBEdit8
                    end
                    object Label14: TLabel
                      Left = 30
                      Top = 300
                      Width = 101
                      Height = 13
                      Caption = 'Porc. Venda Serv.:'
                      FocusControl = DBEdit9
                    end
                    object Label15: TLabel
                      Left = 256
                      Top = 299
                      Width = 101
                      Height = 13
                      Caption = 'Porc. Venda Prod.:'
                      FocusControl = DBEdit10
                    end
                    object Label16: TLabel
                      Left = 66
                      Top = 200
                      Width = 65
                      Height = 13
                      Caption = 'Qtde. Sal. F:'
                      FocusControl = DBEdit11
                    end
                    object Label17: TLabel
                      Left = 261
                      Top = 200
                      Width = 98
                      Height = 13
                      Caption = 'Valor Sal. Fam'#237'lia:'
                      FocusControl = DBEdit12
                    end
                    object Label18: TLabel
                      Left = 497
                      Top = 200
                      Width = 92
                      Height = 13
                      Caption = 'Porc. Peso Com.:'
                      FocusControl = DBEdit13
                    end
                    object Label19: TLabel
                      Left = 93
                      Top = 227
                      Width = 38
                      Height = 13
                      Caption = 'E-mail:'
                      FocusControl = DBEdit14
                    end
                    object Label20: TLabel
                      Left = 101
                      Top = 123
                      Width = 30
                      Height = 13
                      Caption = 'Fone:'
                      FocusControl = DBEdit15
                    end
                    object Label21: TLabel
                      Left = 61
                      Top = 327
                      Width = 70
                      Height = 13
                      Caption = 'Observa'#231#227'o:'
                      FocusControl = DBMemo1
                    end
                    object Label44: TLabel
                      Left = 93
                      Top = 69
                      Width = 37
                      Height = 13
                      Caption = 'Bairro:'
                    end
                    object Label9: TLabel
                      Left = 314
                      Top = 123
                      Width = 43
                      Height = 13
                      Caption = 'Fun'#231#227'o:'
                    end
                    object Label43: TLabel
                      Left = 108
                      Top = 42
                      Width = 23
                      Height = 13
                      Caption = 'CEP:'
                    end
                    object Label45: TLabel
                      Left = 69
                      Top = 175
                      Width = 62
                      Height = 13
                      Caption = 'Data Nasc.:'
                    end
                    object Label46: TLabel
                      Left = 266
                      Top = 175
                      Width = 91
                      Height = 13
                      Caption = 'Sal'#225'rio Carteira:'
                    end
                    object Label48: TLabel
                      Left = 521
                      Top = 175
                      Width = 68
                      Height = 13
                      Caption = 'Sal'#225'rio Fixo:'
                      FocusControl = DBEdit37
                    end
                    object SpeedButton15: TSpeedButton
                      Left = 232
                      Top = 37
                      Width = 156
                      Height = 22
                      Caption = 'Consultar na &Internet'
                      Glyph.Data = {
                        1A030000424D1A030000000000001A0200002800000010000000100000000100
                        08000000000000010000120B0000120B0000790000007900000000000000FFFF
                        FF00FF00FF007A5A5A00F6F2F200F4F0F000FCFBFB00FBFAFA00B49796008E5D
                        59008C5C5800895A56008A5B5700A3807D00D3C5C4009F7A7600A07F7B00997D
                        7A008A676200A9786F008B645D0090696300A77F780097726C0087554A009765
                        5A008C675E0091675B00936B6000A5766800AF867900AC847800A9837500BF9F
                        93009F776700AB877900EBE1DC00AF8B7800A4592D00B0886F00A5877500EDE0
                        D800A0674200C59D8200C1997F00BA763F00D3AD8A00F7E0CB00FEF0E300FCD0
                        A400FBCFA400FFF2E500D5812700F3B67200EFBC8300FBD4AB00FED9B200F0BB
                        7B00EFC59200F0D1AB00D0B69600F3C07E00F7C58300EFC18700E9C49500FCD9
                        AB00E2C49900FFE7C400E7D8C200FAEEDD00F3D09600EACF9E00FFE5A500EEE2
                        C000FFF8E500FFEAAB00F7E6B200FFEDAB00FFFCF000FAF2C200FFF7C100FAF7
                        D500FEFBCB00FFFCCF00FFFED500FFFEE900FFFFC900FFFFCE00FFFFD100FFFF
                        D400FFFFD500FFFFDA00FFFFDC00FFFFDE00FCFCE000F4FBFB00DAF8FF00F0F8
                        FB00869AA500CCEBFE00D8EFFE004A93C700C0E0F70036A3FB0038A5FF003AA7
                        FF003F7FBB005EA7E9003996EF003A96ED003F93E50062686E000F6CD3001177
                        E3001174E1004883C5004B66870048638700445C7B005D677E00FEFEFE000202
                        020202020202020202020202766F020202020202020202020202027571650202
                        020202020202020202027472696D02020202020202020202027770686C020909
                        0909090A131E1F19036A6773020209413231271644545C49250D620B02020943
                        38371C245D565850481D28090202094A3A34205E57575A4C3E2E1A0C0202094E
                        3330235B5759533F3542120C020209013B342251524F46364B2B110902020901
                        0101103C4D393D5529140E09020209017878050F2C40472118262F0902020901
                        787878040817151B2A2D45090202090178787878787801666B6E600902020906
                        070707070707076164635F09020209090909090909090909090909090202}
                      OnClick = SpeedButton15Click
                    end
                    object Label40: TLabel
                      Left = 283
                      Top = 251
                      Width = 72
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Seu gerente:'
                      FocusControl = DBEdit39
                    end
                    object Label47: TLabel
                      Left = 10
                      Top = 276
                      Width = 121
                      Height = 13
                      Caption = 'Data Aus'#234'ncia Inicial:'
                    end
                    object Label49: TLabel
                      Left = 328
                      Top = 276
                      Width = 29
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Final:'
                      FocusControl = DBEdit39
                    end
                    object Label50: TLabel
                      Left = 6
                      Top = 251
                      Width = 125
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Vendedor Televendas:'
                    end
                    object Label52: TLabel
                      Left = 338
                      Top = 149
                      Width = 19
                      Height = 13
                      Caption = 'RG:'
                      FocusControl = DBEdit42
                    end
                    object SpeedButtonContatoPlataforma: TSpeedButton
                      Left = 720
                      Top = 224
                      Width = 23
                      Height = 22
                      Hint = 'Mais dados - Contato / Telefones'
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        080000000000000100003A0B00003A0B00000001000000000000000000000000
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
                        FDFDFDFDFDFDFDFDFDFDFDFDA3A3A3A3A3A3A3A3A3A3A3A3FDFDFDA308A4A4A4
                        A4A4A4A4A4A4A4A3A3FDFDA3FF07070707F7A4F7F7F7F7A4A3FDFDA3FF070707
                        08FFFFF7F7F7F7A4A3FDFDA3FF07070708FFFFF7F7F7F7A4A3FDFDA3FF0707F7
                        07FFFF07F7F7F7A4A3FDFDA3FF07FFFFFFFFFFFFFFFFA4A4A3FDFDA3FF07FFFF
                        FFFFFFFFFFFFF7A4A3FDFDA3FF070808F6FFFF07080807A4A3FDFDA3FF070707
                        08FFFFF7070707A4A3FDFDA3FF07070708FFFF07070707A4A3FDFDA3FF070707
                        07070707070707A4A3FDFDA3FFFFFFFFFFFFFFFFFFFFFFA3A3FDFDFDA3A3A3A3
                        A3A3A3A3A3A3A3A3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                      OnClick = SpeedButtonContatoPlataformaClick
                    end
                    object Label53: TLabel
                      Left = 12
                      Top = 394
                      Width = 119
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Jornada de Trabalho:'
                      FocusControl = DBMemo1
                    end
                    object Label54: TLabel
                      Left = 41
                      Top = 420
                      Width = 90
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Escala Semanal:'
                      FocusControl = DBMemo1
                    end
                    object DBEdit1: TDBEdit
                      Left = 137
                      Top = 11
                      Width = 89
                      Height = 21
                      Hint = 'C'#243'digo do Colaborador'
                      DataField = 'COD_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 282
                      Top = 11
                      Width = 432
                      Height = 21
                      Hint = 'Nome do Colaborador'
                      CharCase = ecUpperCase
                      DataField = 'NOME_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 455
                      Top = 36
                      Width = 259
                      Height = 21
                      Hint = 'Endere'#231'o resid'#234'ncial'
                      CharCase = ecUpperCase
                      DataField = 'END_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBEdit7: TDBEdit
                      Left = 593
                      Top = 224
                      Width = 121
                      Height = 21
                      Hint = 'Telefone de Contato'
                      DataField = 'FONE_CONTATO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 20
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 361
                      Top = 118
                      Width = 235
                      Height = 21
                      Hint = 'Fun'#231#227'o exercida'
                      DataField = 'COD_FUNCAO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_FUNCAO'
                      ListField = 'DESC_FUNCAO'
                      ListSource = dtmColaborador.dsF
                      ParentFont = False
                      TabOrder = 10
                      OnDropDown = DBLookupComboBox1DropDown
                      OnKeyDown = DBLookupComboBox1KeyDown
                    end
                    object DBEdit8: TDBEdit
                      Left = 137
                      Top = 144
                      Width = 110
                      Height = 21
                      Hint = 'CPF: numero do documento de Cadastro de Pessoa f'#237'sica'
                      DataField = 'CPF_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                      OnExit = DBEdit8Exit
                    end
                    object DBEdit9: TDBEdit
                      Left = 137
                      Top = 297
                      Width = 110
                      Height = 21
                      Hint = 'Porcentagem no Valor do Servi'#231'o'
                      DataField = 'PC_VEND_SERV'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 24
                    end
                    object DBEdit10: TDBEdit
                      Left = 361
                      Top = 297
                      Width = 110
                      Height = 21
                      Hint = 'Porcentagem no valor de venda de Pe'#231'as'
                      DataField = 'PC_VEND_PROD'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 25
                    end
                    object DBEdit11: TDBEdit
                      Left = 137
                      Top = 197
                      Width = 110
                      Height = 21
                      Hint = 
                        'Quantidade de pessoas na fam'#237'lia para o c'#225'lculo do sal'#225'rio fam'#237'l' +
                        'ia.'
                      DataField = 'QUANT_SAL_FAMILIA'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 16
                    end
                    object DBEdit12: TDBEdit
                      Left = 361
                      Top = 197
                      Width = 121
                      Height = 21
                      Hint = 'Valor do Sal'#225'rio Fam'#237'lia'
                      DataField = 'VALOR_SALARIO_FAMILIA'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 17
                    end
                    object DBEdit13: TDBEdit
                      Left = 593
                      Top = 197
                      Width = 121
                      Height = 21
                      Hint = 
                        'Peso em percentual para comiss'#227'o dada ao colaborador quando a co' +
                        'mmiss'#227'o for dividida por equipe.'
                      DataField = 'PERC_PESO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 18
                    end
                    object DBEdit14: TDBEdit
                      Left = 137
                      Top = 224
                      Width = 345
                      Height = 21
                      Hint = 'E-mail.'
                      DataField = 'EMAIL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 19
                    end
                    object DBEdit15: TDBEdit
                      Left = 137
                      Top = 118
                      Width = 110
                      Height = 21
                      Hint = 'Telefone '
                      DataField = 'FONE_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBMemo1: TDBMemo
                      Left = 137
                      Top = 322
                      Width = 577
                      Height = 64
                      Hint = 'Observa'#231#245'es do Colaborador'
                      DataField = 'OBS_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 26
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 659
                      Top = 91
                      Width = 55
                      Height = 21
                      Hint = 'Estado'
                      DataField = 'CODIGO_UF'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'CODIGO_UF'
                      ListField = 'SIGLA_UF'
                      ListSource = dtmColaborador.dsUF
                      ParentFont = False
                      TabOrder = 8
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 187
                      Top = 90
                      Width = 409
                      Height = 21
                      Hint = 'Cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_CIDADE'
                      ListField = 'NOME_CIDADE'
                      ListSource = dtmColaborador.dsCidades
                      ParentFont = False
                      TabOrder = 7
                      OnDropDown = DBLookupComboBox3DropDown
                      OnKeyDown = DBEdit38KeyDown
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 187
                      Top = 63
                      Width = 409
                      Height = 21
                      Hint = 'Bairro'
                      DataField = 'COD_BAIRRO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_BAIRRO'
                      ListField = 'NOME_BAIRRO'
                      ListSource = dtmColaborador.dsBairro
                      ParentFont = False
                      TabOrder = 5
                      OnDropDown = DBLookupComboBox4DropDown
                      OnKeyDown = DBEdit34KeyDown
                    end
                    object DBEdit4: TDBEdit
                      Left = 137
                      Top = 37
                      Width = 89
                      Height = 21
                      Hint = 
                        '[F3: Consultar] [F4: Novo]  - CEP: C'#243'digo de endere'#231'amento Posta' +
                        'l'
                      DataField = 'CEP_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnExit = DBEdit4Exit
                      OnKeyDown = DBEdit4KeyDown
                    end
                    object DBEdit5: TDBEdit
                      Left = 137
                      Top = 171
                      Width = 110
                      Height = 21
                      Hint = 'Data de dascimento'
                      DataField = 'DAT_NASC_COL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                    end
                    object DBEdit6: TDBEdit
                      Left = 361
                      Top = 170
                      Width = 121
                      Height = 21
                      Hint = 'Sal'#225'rio registrado em Carteira'
                      DataField = 'SALARIO_REGISTRO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                    end
                    object DBEdit37: TDBEdit
                      Left = 593
                      Top = 171
                      Width = 121
                      Height = 21
                      Hint = 'Sal'#225'rio Fixo'
                      DataField = 'VL_SAL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                    end
                    object DBEdit34: TDBEdit
                      Left = 136
                      Top = 64
                      Width = 49
                      Height = 21
                      DataField = 'COD_BAIRRO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      OnExit = DBEdit34Exit
                      OnKeyDown = DBEdit34KeyDown
                    end
                    object DBEdit38: TDBEdit
                      Left = 136
                      Top = 90
                      Width = 48
                      Height = 21
                      DataField = 'COD_CIDADE'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                      OnExit = DBEdit38Exit
                      OnKeyDown = DBEdit38KeyDown
                    end
                    object DBEdit39: TDBEdit
                      Left = 361
                      Top = 248
                      Width = 54
                      Height = 21
                      Hint = 'Telefone de Contato'
                      DataField = 'COD_GERENTE'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 27
                      OnExit = DBEdit39Exit
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 421
                      Top = 248
                      Width = 293
                      Height = 21
                      DataField = 'COD_GERENTE'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmColaborador.dsGerente
                      ParentFont = False
                      TabOrder = 28
                    end
                    object DBEdit40: TDBEdit
                      Left = 137
                      Top = 272
                      Width = 110
                      Height = 21
                      Hint = 'Telefone de Contato'
                      DataField = 'DATA_INI_AUSENCIA'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 22
                    end
                    object DBEdit41: TDBEdit
                      Left = 361
                      Top = 272
                      Width = 110
                      Height = 21
                      Hint = 'Telefone de Contato'
                      DataField = 'DATA_FIM_AUSENCIA'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 23
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 137
                      Top = 248
                      Width = 55
                      Height = 21
                      DataField = 'VENDEDOR_TLV'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ItemHeight = 0
                      Items.Strings = (
                        'SIM'
                        'NAO')
                      ParentFont = False
                      TabOrder = 21
                    end
                    object DBEdit42: TDBEdit
                      Left = 361
                      Top = 143
                      Width = 121
                      Height = 21
                      Hint = 'CPF: numero do documento de Cadastro de Pessoa f'#237'sica'
                      CharCase = ecUpperCase
                      DataField = 'RG_VENDEDOR'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                      OnExit = DBEdit42Exit
                    end
                    object DBEdit43: TDBEdit
                      Left = 137
                      Top = 391
                      Width = 49
                      Height = 21
                      DataField = 'COD_JORNADA_TRABALHO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 29
                      OnExit = DBEdit43Exit
                      OnKeyDown = DBEdit43KeyDown
                    end
                    object DBEdit44: TDBEdit
                      Left = 137
                      Top = 417
                      Width = 49
                      Height = 21
                      DataField = 'COD_ESCALA_SEMANAL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 31
                      OnExit = DBEdit44Exit
                      OnKeyDown = DBEdit44KeyDown
                    end
                    object DBLookupComboBox6: TDBLookupComboBox
                      Left = 187
                      Top = 391
                      Width = 409
                      Height = 21
                      DataField = 'COD_JORNADA_TRABALHO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'CODIGO'
                      ListField = 'DESCRICAO'
                      ListSource = dtmColaborador.dsJornadaTrabalhoCol
                      ParentFont = False
                      TabOrder = 30
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 187
                      Top = 417
                      Width = 409
                      Height = 21
                      DataField = 'COD_ESCALA_SEMANAL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      KeyField = 'CODIGO'
                      ListField = 'DESCRICAO'
                      ListSource = dtmColaborador.dsEscalaSemanalCol
                      ParentFont = False
                      TabOrder = 32
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Dados outros trabalhos'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 457
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 453
                    Align = alClient
                    Caption = 'Dados 2 '#218'ltimos Empregos'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentBackground = False
                    ParentFont = False
                    TabOrder = 0
                    object Label22: TLabel
                      Left = 27
                      Top = 20
                      Width = 105
                      Height = 13
                      Caption = 'Nome ult. Empresa'
                      FocusControl = DBEdit16
                    end
                    object Label23: TLabel
                      Left = 80
                      Top = 43
                      Width = 52
                      Height = 13
                      Caption = 'Endere'#231'o'
                      FocusControl = DBEdit17
                    end
                    object Label24: TLabel
                      Left = 83
                      Top = 66
                      Width = 49
                      Height = 13
                      Caption = 'Telefone'
                      FocusControl = DBEdit18
                    end
                    object Label25: TLabel
                      Left = 87
                      Top = 88
                      Width = 45
                      Height = 13
                      Caption = 'Contato'
                      FocusControl = DBEdit19
                    end
                    object Label26: TLabel
                      Left = 39
                      Top = 111
                      Width = 93
                      Height = 13
                      Caption = 'Valor Ult. Sal'#225'rio'
                      FocusControl = DBEdit20
                    end
                    object Label27: TLabel
                      Left = 57
                      Top = 135
                      Width = 75
                      Height = 13
                      Caption = 'Data entrada'
                      FocusControl = DBEdit21
                    end
                    object Label28: TLabel
                      Left = 71
                      Top = 160
                      Width = 61
                      Height = 13
                      Caption = 'Data Sa'#237'da'
                      FocusControl = DBEdit22
                    end
                    object Label29: TLabel
                      Left = 27
                      Top = 182
                      Width = 105
                      Height = 13
                      Caption = 'Nome Plt. Empresa'
                      FocusControl = DBEdit23
                    end
                    object Label30: TLabel
                      Left = 80
                      Top = 205
                      Width = 52
                      Height = 13
                      Caption = 'Endere'#231'o'
                      FocusControl = DBEdit24
                    end
                    object Label31: TLabel
                      Left = 83
                      Top = 228
                      Width = 49
                      Height = 13
                      Caption = 'Telefone'
                      FocusControl = DBEdit25
                    end
                    object Label32: TLabel
                      Left = 87
                      Top = 252
                      Width = 45
                      Height = 13
                      Caption = 'Contato'
                      FocusControl = DBEdit26
                    end
                    object Label33: TLabel
                      Left = 58
                      Top = 276
                      Width = 74
                      Height = 13
                      Caption = 'Data Entrada'
                      FocusControl = DBEdit27
                    end
                    object Label34: TLabel
                      Left = 72
                      Top = 299
                      Width = 60
                      Height = 13
                      Caption = 'Data sa'#237'da'
                      FocusControl = DBEdit28
                    end
                    object Label36: TLabel
                      Left = 75
                      Top = 322
                      Width = 57
                      Height = 13
                      Caption = 'Plt Sal'#225'rio'
                      FocusControl = DBEdit30
                    end
                    object Label35: TLabel
                      Left = 68
                      Top = 345
                      Width = 64
                      Height = 13
                      Caption = 'Data F'#233'rias'
                      FocusControl = DBEdit29
                    end
                    object Label37: TLabel
                      Left = 68
                      Top = 368
                      Width = 64
                      Height = 13
                      Caption = 'Valor f'#233'rias'
                      FocusControl = DBEdit31
                    end
                    object Label38: TLabel
                      Left = 40
                      Top = 392
                      Width = 92
                      Height = 13
                      Caption = 'Data 13'#186' Sal'#225'rio'
                      FocusControl = DBEdit32
                    end
                    object Label39: TLabel
                      Left = 38
                      Top = 415
                      Width = 94
                      Height = 13
                      Caption = 'Valor 13'#186' Sal'#225'rio'
                      FocusControl = DBEdit33
                    end
                    object Label41: TLabel
                      Left = 407
                      Top = 392
                      Width = 109
                      Height = 13
                      Caption = 'Data vendeu F'#233'rias'
                      FocusControl = DBEdit35
                    end
                    object Label42: TLabel
                      Left = 445
                      Top = 415
                      Width = 71
                      Height = 13
                      Caption = 'Valor Sal'#225'rio'
                      FocusControl = DBEdit36
                    end
                    object DBEdit16: TDBEdit
                      Left = 135
                      Top = 17
                      Width = 369
                      Height = 21
                      Hint = 'Nome da '#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'NOME_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                    end
                    object DBEdit17: TDBEdit
                      Left = 135
                      Top = 40
                      Width = 369
                      Height = 21
                      Hint = 'Endere'#231'o da '#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'ENDERECO_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object DBEdit18: TDBEdit
                      Left = 135
                      Top = 63
                      Width = 186
                      Height = 21
                      Hint = 'Telefone da '#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'FONE_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                    object DBEdit19: TDBEdit
                      Left = 135
                      Top = 85
                      Width = 264
                      Height = 21
                      Hint = 'Contato da '#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'CONT_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                    end
                    object DBEdit20: TDBEdit
                      Left = 135
                      Top = 108
                      Width = 130
                      Height = 21
                      Hint = 'Valor do '#250'ltimo sal'#225'rio.'
                      DataField = 'ULT_SAL_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                    end
                    object DBEdit21: TDBEdit
                      Left = 135
                      Top = 132
                      Width = 130
                      Height = 21
                      Hint = 'Data de entrada na '#250'ltima empresa que trabalhou'
                      DataField = 'DTENT_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                    end
                    object DBEdit22: TDBEdit
                      Left = 135
                      Top = 157
                      Width = 131
                      Height = 21
                      Hint = 'Data de sa'#237'da da '#250'ltima empresa que trabalhou'
                      DataField = 'DTSAI_ULT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 6
                    end
                    object DBEdit23: TDBEdit
                      Left = 135
                      Top = 179
                      Width = 394
                      Height = 21
                      Hint = 'Nome da pen'#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'NOME_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 7
                    end
                    object DBEdit24: TDBEdit
                      Left = 135
                      Top = 202
                      Width = 371
                      Height = 21
                      Hint = 'Endere'#231'o da pen'#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'ENDERECO_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 8
                    end
                    object DBEdit25: TDBEdit
                      Left = 135
                      Top = 225
                      Width = 186
                      Height = 21
                      Hint = 'Telefone da pen'#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'FONE_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 9
                    end
                    object DBEdit26: TDBEdit
                      Left = 135
                      Top = 249
                      Width = 264
                      Height = 21
                      Hint = 'Contato  da pen'#250'ltima empresa que o colaborador trabalhou.'
                      DataField = 'CONT_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 10
                    end
                    object DBEdit27: TDBEdit
                      Left = 135
                      Top = 273
                      Width = 238
                      Height = 21
                      Hint = 'Data da entrada do colaborador na empresa.'
                      DataField = 'DTENT_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 11
                    end
                    object DBEdit28: TDBEdit
                      Left = 135
                      Top = 296
                      Width = 238
                      Height = 21
                      Hint = 'Data da sa'#237'da do colaborador na empresa.'
                      DataField = 'DTSAI_PLT_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 12
                    end
                    object DBEdit30: TDBEdit
                      Left = 135
                      Top = 319
                      Width = 134
                      Height = 21
                      Hint = #250'ltimo sal'#225'rio do penultimo Emprego'
                      DataField = 'PLT_SAL_EMP'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 13
                    end
                    object DBEdit29: TDBEdit
                      Left = 135
                      Top = 342
                      Width = 238
                      Height = 21
                      Hint = 'Data da F'#233'rias'
                      DataField = 'DT_ULT_FERIAS'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 14
                    end
                    object DBEdit31: TDBEdit
                      Left = 135
                      Top = 365
                      Width = 134
                      Height = 21
                      Hint = 'Valor das F'#233'rias'
                      DataField = 'VL_ULT_FERIAS'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 15
                    end
                    object DBEdit32: TDBEdit
                      Left = 135
                      Top = 389
                      Width = 238
                      Height = 21
                      Hint = 'Data do 13'#186' Sal'#225'rio'
                      DataField = 'DT_13_SAL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 16
                    end
                    object DBEdit33: TDBEdit
                      Left = 135
                      Top = 412
                      Width = 134
                      Height = 21
                      Hint = 'Valor do 13'#186' Sal'#225'rio'
                      DataField = 'VL_13_SAL'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 17
                    end
                    object DBEdit35: TDBEdit
                      Left = 519
                      Top = 389
                      Width = 134
                      Height = 21
                      Hint = 'Data que venceu as f'#233'rias'
                      DataField = 'DTVND_ULT_FERIAS'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 18
                    end
                    object DBEdit36: TDBEdit
                      Left = 519
                      Top = 412
                      Width = 134
                      Height = 21
                      Hint = 'Valor do Sal'#225'rio'
                      DataField = 'VALOR_SALARIO'
                      DataSource = dtmColaborador.dsCola
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 19
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'Perfil de Comiss'#245'es'
                ImageIndex = 2
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 457
                  Align = alClient
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 0
                    Top = 420
                    Width = 761
                    Height = 30
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object BitBtn8: TBitBtn
                      Left = 320
                      Top = 0
                      Width = 137
                      Height = 25
                      Caption = '&Remover Perfil'
                      TabOrder = 0
                      OnClick = BitBtn8Click
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
                  end
                  object DBGrid3: TDBGrid
                    Left = 0
                    Top = 225
                    Width = 761
                    Height = 195
                    Hint = '[Duplo Clique ou Del: Remover Perfil]'
                    Align = alTop
                    DataSource = dtmColaborador.dsPercolab
                    ReadOnly = True
                    TabOrder = 2
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = DBGrid3DblClick
                    OnKeyDown = DBGrid3KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'COD_VENDEDOR'
                        Width = 102
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODIGO_PERFIL'
                        Width = 111
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_PERFIL'
                        Visible = True
                      end>
                  end
                  object Panel5: TPanel
                    Left = 0
                    Top = 195
                    Width = 761
                    Height = 30
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn7: TBitBtn
                      Left = 320
                      Top = 1
                      Width = 137
                      Height = 25
                      Caption = 'Incluir Perfil'
                      TabOrder = 0
                      OnClick = BitBtn7Click
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
                  end
                  object DBGrid2: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 195
                    Hint = '[Duplo Clique ou Ins: Incluir Perfil]'
                    Align = alTop
                    DataSource = dtmColaborador.dsPerfilComissao
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = DBGrid2DblClick
                    OnKeyDown = DBGrid2KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'CODIGO_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NOME_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ABRANG_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'EM_CIMA_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TIPO_SERV_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'FLAG_SERV_PROD'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CONTEUDO_FLAG'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'TABELAS_PERFIL'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA_CADASTRO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERC_PESO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'ATIVO'
                        Visible = True
                      end>
                  end
                end
              end
              object TabSheet6: TTabSheet
                Caption = 'Incid'#234'ncias'
                ImageIndex = 3
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox6: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 765
                  Height = 457
                  Align = alClient
                  TabOrder = 0
                  object DBGrid4: TDBGrid
                    Left = 0
                    Top = 0
                    Width = 761
                    Height = 195
                    Hint = '[Duplo Clique ou Ins: Incluir Incid'#234'ncia]'
                    Align = alTop
                    DataSource = dtmColaborador.dsIncidencia
                    ReadOnly = True
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnDblClick = DBGrid4DblClick
                    OnKeyDown = DBGrid4KeyDown
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
                        FieldName = 'TIPO'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CODFUNC'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'NATUREZA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_FUNCAO'
                        Visible = True
                      end>
                  end
                  object DBGrid5: TDBGrid
                    Left = 0
                    Top = 225
                    Width = 761
                    Height = 195
                    Hint = '[Duplo Clique ou Del: Remover Incid'#234'ncial]'
                    Align = alTop
                    DataSource = dtmColaborador.dsIncidenciaColab
                    ReadOnly = True
                    TabOrder = 2
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
                        FieldName = 'COD_INCIDENCIA'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COD_COLABORADOR'
                        Width = 117
                        Visible = True
                      end>
                  end
                  object Panel7: TPanel
                    Left = 0
                    Top = 195
                    Width = 761
                    Height = 30
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object BitBtn9: TBitBtn
                      Left = 312
                      Top = 0
                      Width = 153
                      Height = 25
                      Caption = '&Incluir incid'#234'ncia'
                      TabOrder = 0
                      OnClick = BitBtn9Click
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
                  end
                  object Panel8: TPanel
                    Left = 0
                    Top = 420
                    Width = 761
                    Height = 30
                    Align = alTop
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object BitBtn10: TBitBtn
                      Left = 312
                      Top = 0
                      Width = 153
                      Height = 25
                      Caption = 'Remover Incid'#234'ncia'
                      TabOrder = 0
                      OnClick = BitBtn10Click
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
                  end
                end
              end
              object TabSheet7: TTabSheet
                Caption = 'Relat'#243'rio'
                ImageIndex = 4
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object QuickRep1: TQuickRep
                  Left = 1
                  Top = 0
                  Width = 794
                  Height = 1123
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  BeforePrint = QuickRep1BeforePrint
                  DataSet = dtmColaborador.cdsColab
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
                  OnPreview = QuickRep1Preview
                  Options = [FirstPageHeader, LastPageFooter]
                  Page.Columns = 1
                  Page.Orientation = poPortrait
                  Page.PaperSize = A4
                  Page.Values = (
                    100.000000000000000000
                    2970.000000000000000000
                    100.000000000000000000
                    2100.000000000000000000
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
                  ReportTitle = 'Relat'#243'rio de Colaboradores'
                  SnapToGrid = True
                  Units = MM
                  Zoom = 100
                  PrevFormStyle = fsNormal
                  PreviewInitialState = wsMaximized
                  PrevInitialZoom = qrZoomToFit
                  PreviewDefaultSaveType = stQRP
                  object DetailBand1: TQRBand
                    Left = 38
                    Top = 113
                    Width = 718
                    Height = 27
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
                      71.437500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbDetail
                    object QRDBText1: TQRDBText
                      Left = -17
                      Top = 0
                      Width = 80
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        -44.979166666666670000
                        0.000000000000000000
                        211.666666666666700000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'COD_VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText2: TQRDBText
                      Left = 69
                      Top = 0
                      Width = 86
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        182.562500000000000000
                        0.000000000000000000
                        227.541666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'NOME_VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText3: TQRDBText
                      Left = 178
                      Top = 1
                      Width = 79
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        470.958333333333400000
                        2.645833333333333000
                        209.020833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'END_VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText4: TQRDBText
                      Left = 313
                      Top = 1
                      Width = 95
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        828.145833333333200000
                        2.645833333333333000
                        251.354166666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'CIDADE_VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText5: TQRDBText
                      Left = 442
                      Top = 0
                      Width = 34
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1169.458333333333000000
                        0.000000000000000000
                        89.958333333333340000)
                      Alignment = taCenter
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'SiglaUF'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText6: TQRDBText
                      Left = 488
                      Top = 0
                      Width = 78
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1291.166666666667000000
                        0.000000000000000000
                        206.375000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsColab
                      DataField = 'CPF_VENDEDOR'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText7: TQRDBText
                      Left = 562
                      Top = -1
                      Width = 26
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1486.958333333333000000
                        -2.645833333333333000
                        68.791666666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsF
                      DataField = 'DPTO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                    object QRDBText8: TQRDBText
                      Left = 623
                      Top = 0
                      Width = 72
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1648.354166666667000000
                        0.000000000000000000
                        190.500000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Color = clWhite
                      DataSet = dtmColaborador.cdsF
                      DataField = 'DESC_FUNCAO'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'Arial'
                      Font.Style = []
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 7
                    end
                  end
                  object PageHeaderBand1: TQRBand
                    Left = 38
                    Top = 38
                    Width = 718
                    Height = 75
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
                      198.437500000000000000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageHeader
                    object QRLabel1: TQRLabel
                      Left = 168
                      Top = 6
                      Width = 361
                      Height = 28
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        74.083333333333340000
                        444.500000000000000000
                        15.875000000000000000
                        955.145833333333500000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'RELAT'#211'RIO DE COLABORADORES'
                      Color = clWhite
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -19
                      Font.Name = 'Arial Black'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Transparent = False
                      WordWrap = True
                      ExportAs = exptText
                      FontSize = 14
                    end
                    object QRLabel2: TQRLabel
                      Left = 0
                      Top = 59
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        156.104166666666700000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'C'#243'digo'
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
                    object QRLabel3: TQRLabel
                      Left = 69
                      Top = 58
                      Width = 34
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        182.562500000000000000
                        153.458333333333300000
                        89.958333333333340000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Nome'
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
                    object QRLabel4: TQRLabel
                      Left = 178
                      Top = 59
                      Width = 55
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        470.958333333333400000
                        156.104166666666700000
                        145.520833333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Endere'#231'o'
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
                    object QRLabel5: TQRLabel
                      Left = 313
                      Top = 59
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        828.145833333333200000
                        156.104166666666700000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Cidade'
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
                    object QRLabel6: TQRLabel
                      Left = 442
                      Top = 58
                      Width = 40
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1169.458333333333000000
                        153.458333333333300000
                        105.833333333333300000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Estado'
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
                    object QRLabel7: TQRLabel
                      Left = 489
                      Top = 58
                      Width = 23
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1293.812500000000000000
                        153.458333333333300000
                        60.854166666666680000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'CPF'
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
                    object QRLabel8: TQRLabel
                      Left = 562
                      Top = 58
                      Width = 27
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1486.958333333333000000
                        153.458333333333300000
                        71.437500000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Dpto'
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
                    object QRLabel9: TQRLabel
                      Left = 623
                      Top = 58
                      Width = 42
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1648.354166666667000000
                        153.458333333333300000
                        111.125000000000000000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      AutoStretch = False
                      Caption = 'Fun'#231#227'o'
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
                    object QRSysData2: TQRSysData
                      Left = 0
                      Top = 40
                      Width = 68
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        0.000000000000000000
                        105.833333333333300000
                        179.916666666666700000)
                      Alignment = taLeftJustify
                      AlignToBand = False
                      AutoSize = True
                      Color = clWhite
                      Data = qrsDateTime
                      Transparent = False
                      ExportAs = exptText
                      FontSize = 10
                    end
                  end
                  object SummaryBand1: TQRBand
                    Left = 38
                    Top = 140
                    Width = 718
                    Height = 29
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
                      76.729166666666670000
                      1899.708333333333000000)
                    PreCaluculateBandHeight = False
                    KeepOnOnePage = False
                    BandType = rbPageFooter
                    object QRSysData1: TQRSysData
                      Left = 625
                      Top = 6
                      Width = 46
                      Height = 17
                      Frame.Color = clBlack
                      Frame.DrawTop = False
                      Frame.DrawBottom = False
                      Frame.DrawLeft = False
                      Frame.DrawRight = False
                      Size.Values = (
                        44.979166666666670000
                        1653.645833333333000000
                        15.875000000000000000
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
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 488
              Width = 773
              ExplicitTop = 488
              ExplicitWidth = 773
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [COL008]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [COL013]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 536
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [COL001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [COL002]'
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
            Height = 463
            ExplicitWidth = 773
            ExplicitHeight = 463
            inherited Splitter1: TSplitter
              Height = 402
              ExplicitHeight = 405
            end
            inherited DBGrid1: TDBGrid
              Width = 480
              Height = 402
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_FUNCAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'END_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAIRRO_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIDADE_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEP_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CPF_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PC_VEND_SERV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PC_VEND_PROD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_VENDEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOD_COL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_CAD_COL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DAT_NASC_COL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONT_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULT_SAL_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTENT_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTSAI_ULT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONT_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PLT_SAL_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTENT_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTSAI_PLT_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_ULT_FERIAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TMP_ULT_FERIAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_ULT_FERIAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTVND_ULT_FERIAS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DT_13_SAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_13_SAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_SAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SALARIO_REGISTRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_SALARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'QUANT_SAL_FAMILIA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_SALARIO_FAMILIA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_PESO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SITE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_CONTATO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SiglaUF'
                  Visible = False
                end>
            end
            inherited Panel2: TPanel
              Width = 769
              ExplicitWidth = 769
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [COL003]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [COL004]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [COL005]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro  - [COL007]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Lan'#231'ar d'#233'bito ou cr'#233'dito [COL030]'
                Glyph.Data = {
                  FA050000424DFA05000000000000BA0300002800000018000000180000000100
                  08000000000040020000120B0000120B0000E1000000E1000000FF00FF00036C
                  00000064000009760C000572090008750D0009790F000E7B1200036B09000772
                  0D00046D0D0011A61F0012A7210014A8230024982E0006781300066F120018AB
                  2A001BAD2C001B9027001DAF320021B2350004701500056F170022B4390027B7
                  3E002CA53E0029B843002DBA460004691A0031BD4D0033BF510035C0520037C2
                  54000B7B250038C357003AC55A003DC65E003FC8610040C9630042CB650042CB
                  670043CC680045CE6B0045CD6A0047CE6D0049D070004AD1710049CF6F004AD1
                  72004CD2740000662600016E3200036C3700016E4000169C6D00148D72000168
                  5400078B72000063540004726800149186001E9694001BBABB006FFDFF008AFF
                  FF003FDFE800037C870059F2FF006DECF50060F1FF0063E4F200026A770033E5
                  FF003FE8FF0044EAFF004AE9FF0057E6FB005CD7E70000D8FF0000DBFF000061
                  720003778A0005798E000C81950024E0FF0028DFFF002FDFFF0039E3FF004AE4
                  FD0000D4FF0001D6FF0003748C0006D6FF0005829D0009D3FF000BD6FF0015D8
                  FF0017D6FF001ADBFF001BD4FB0023DBFF0028D7FD002ED8F90033D6F50041D3
                  F00041D0EC0000D1FF0000C7F90000BDED0001C8F70001C6F60003CCFA000673
                  8C000BCFFA000C829C0014CEFA001FB3D80030B6D7003FBCD90000B8E90001BF
                  F30001B4E50001ACDD0004BAE9000575950019A6CC0041ADCB0000A4D6000096
                  C3000499C6000891BA000CA4D5001CACD9001E99BF0024A2C7002D9CC00033A2
                  C4000092C6000090C3000086B8000198CC000291C400039BD2000392C5000792
                  C400098CBD000F92C100118DBB001397C500158DBA001996C2001A94BE00198A
                  B4002393BA000087BB000084B7000082B500007EB200007DB100007CAF000077
                  A800018CC1000185B8000180B3000290C9000286BA000385B9000484B6000683
                  B5000992C900098FC6000979A8000D83B3001087B5001082B0001184B100138A
                  B7001383B1001681AD001886B1001C84AF000085BF000077AB000075A900017B
                  AF000175AB000172A6000175A6000283BC000270A0000475A6000579AA000577
                  A8000889C300077BAC000883BA000871A2000976A6000B7CAD000B75A6000E7E
                  AF00117BAA001279A7001684B300167FAC00006B9F00006C9F0000689D00016E
                  A700016EA300016CA100016599000275B00002669A0003699C00047CB700046A
                  9D000572AB000D88C4000078B7000063980003679C000A78B300000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000005050505040000000000000000000000
                  00000000000000000005050B0B050200D1CFCFCFCFCFCE000000000000000000
                  000000050B0B1A055EAB90A49BA4A0CF000000000000000000000000050B0B0E
                  34C4A7A49D9EA09EB8000000000000000000000033130D0C093F61706F6D7A8D
                  BB00000000000000DDDDDDDD430312110E374963605B4F5AA2D0B79F000000DD
                  9885C28F820A1815142242586574798A9EB9A3D2D300D986C973717D5C101C1B
                  1906383E3D54BAA0A2A0A38F788CD4C5DA0508171605211F1E0507010551A59C
                  A08B6E5A509BD687977E052B2A2826252423200548C2A8B7845F6B5AB500D999
                  C6D5BE052F302D2C29270539DB93AC755562606FB500DDAFAE7EAA8305323231
                  2E053BDF96C7764A575664B50000D7879694C1D8531D3232053AD5CCCA88444C
                  4B68B5000000D7C8D7BFBBBCDC520F0536B6BA9ACD4740466AB500000000DDB0
                  C995C0A9A3BD3C3581D1DDDE894145B5B20000000000DDC9C99392918EA2A6A1
                  9BDD0000B5B5B500000000000000CB776968676472706C797BDD000000000000
                  000000000000B34140444C4965615D5B50DD000000000000000000000000B37F
                  4E474D595866747C80DD0000000000000000000000000000CDCAB499B1ADC3D2
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000000000000}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Left = 463
                Hint = 'Exce'#231#245'es Calend'#225'rio - [COL045]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9B350E29B
                  19E19918E09716DF9515DF9314DE9212DD9011DD8E10DC8C0EDB8A0DDA890CDA
                  870AD98509D88308D78106D78005E09D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE39E1BE29C1AE19A19E19817E09716DF9515DF9313DE9112DD8F11DC8D
                  0FDC8C0EDB8A0DDA880BD9860AD98409D88307D78106D67F05FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFE39F1CE39D1BFEFCF8FEFCF8E19817E09616FEFCF8
                  FEFCF8DE9112DD8F10FEFBF7FEFBF7DB890CDA880BD9860AD88408D88207D780
                  06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4A01DE39F1CFEFCF8FEFCF8E1
                  9918E09717FEFCF8FEFCF8DE9213DD9011FEFBF7FEFBF7DB8B0DDA890CDA870B
                  D98509D88308D78207FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5A21EE4A0
                  1DE39E1CE29C1AE29A19E19918E09716DF9515DF9314DE9112DD9011DC8E10DC
                  8C0EDB8A0DDA880CDA870AD98509D88308FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB
                  3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFF4CB3CF4CB3CFFFDF9FFFDF9F4CB3CF4CB3CFFFDF9
                  FFFDF9F4CB3CF4CB3C3625E03625E0F4CB3CF4CB3CFFFDF9FFFDF9F4CB3CF4CB
                  3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CB3CF4CB3CFFFDF9FFFDF9F4
                  CB3CF4CB3CFFFDF9FFFDF9F4CB3CF4CB3C3625E03625E0F4CB3CF4CB3CFFFDF9
                  FFFDF9F4CB3CF4CB3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CB3CF4CB
                  3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4
                  CB3CF4CB3CF4CB3CF4CB3CF4CB3CF4CB3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE7A823E7A722E6A520E5A31FE4A11EE49F1CE39D1BE29C1AE19A18E198
                  17E09616DF9414DE9313DE9112DD8F10DC8D0FDB8B0EDB8A0DFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFE8AA24E7A823E6A621E6A420E5A21FE4A11DFEFCF8
                  FEFCF8E29B19E19918FEFCF8FEFCF8DF9414DE9213FEFCF8FEFBF7DC8D0FDB8B
                  0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8AB25E8A924E7A722E6A621E5
                  A420E5A21EFEFCF8FEFCF8E29C1AE29B19FEFCF8FEFCF8DF9515DF9314FEFCF8
                  FEFCF8DD8E10DC8C0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9AC26E8AA
                  25E7A923E7A722E6A521E5A31FE4A11EE4A01DE39E1BE29C1AE29A19E19817E0
                  9716DF9515DF9313DE9112DD8F11DC8E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE9AE27E9AC26E8AA24E7A823E6A622E6A520E5A31FE4A11EE49F1CE39D
                  1BE29C1AE19A18E19817E09616DF9414DE9213DE9112DD8F10FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFD07501CD7401C97202C66F02C56F03C26D04C06C04
                  BD6A05BA6805B86706B56507B26307B06208AD6008A95D09A75D0AA55B0AA259
                  0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD07600CC7401C27409C98715BE
                  6B03C36D03C06C04BD6A05BB6905B86706B66507B36407B06208A95D08B87D1A
                  A66310A55B0AA35A0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD17600CC73
                  01D4981EF3CA3BBB6803C36E03C16C04BE6B05BB6905B96706B66606B36407B1
                  6208A45C08F3CA3BC58E21A45B0AA45A0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFDB943ACC7401D59A1EF4CB3CBB6903C46E03C16D04BF6B04BC6905B968
                  06B76606B46407B16307A55C08F4CB3CC69022A55B0AB98144FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEDBBF6D35EFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D45EFBEDBCFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton7Click
                ExplicitLeft = 463
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Saldo/Extrato da conta do vendedor [COL034]'
                Glyph.Data = {
                  8E040000424D8E040000000000004E0200002800000018000000180000000100
                  08000000000040020000120B0000120B00008600000086000000FF00FF00846D
                  7600A3737600BD4B4C00BA4B4C00BD4E4F00AF4B4C00C5555600AA4B4C00D15E
                  5F00A64B4C00A34B4C00F77A7B00FF818200FF828300F77E7F00FF838400EE7A
                  7B00E6767700FF848600EE7B7D00DE737400D56F7000FF868700CE6C6D00FF87
                  8800FF888900FF898A00B6626300AF5E5F00FF8A8B00FF8B8C00FF8C8E00CE72
                  7300FF8E8F00FF8F9000BF6C6D00FF919200FF929300FF939500D57B7D00FF95
                  9600B66B6C00FF979800FF989900FF999A00FF9C9D00FF9D9E00F7989900FF9E
                  9F00FF9FA000EE979800BF7B7D00FFA7A900FFA9AA00FFAAAB00FFB2B400FFB4
                  B5009C4B4B009A4B4B00964B4B00FF828100F77F7E00EE7B7B00DE747300D570
                  70008F4B4B00C6696900CE6E6E00BF666600FF898900BF686800A75B5B00FF8C
                  8C00F7888800A75D5D00FF8F8F00AF626200FF919100824B4B00FF959500FF97
                  9700D57E7E00EE8E8E00BF727200FF9A9A00FF9C9C00FF9D9D009F626200975D
                  5D00FF9F9F00E6909000FFA1A100CE828200FFA3A300FFA5A500FFA6A600A56B
                  6B00FFA7A700EE9D9D00B1767600FFACAC00BF818100FFADAD00CE8C8C00C687
                  8700F7A9A900FFB0B000F7AAAA00FFB1B100FFB2B200CE909000D8989800FFB5
                  B500FFB6B600FFB7B700DE9F9F00FFB8B800E6A6A600FFBABA00FFBBBB00FFBC
                  BC00F7B6B600FFBDBD0000B1F20000A3E200009AD9000093D1000088C5000081
                  BD00057BB2004597BD00818190000000000000000000000000000000004F4F4F
                  0000000000000000000000000000000000000000004F0D4F0000000000000000
                  0000000000000000000000004F0D0D4F0000003A4F0000000000000000004F4F
                  4F00004F0F0D0D4F00004203060000000000000000004F0D4F004F120D0D0D4F
                  004F0A040600000000000000004F0F0D4F4F430D0D0D1848451845451D4F4F00
                  00000000004F0D0F4F160D0D0D111D0D0D0D0D0D0D0D0F4F3B0000004F160F4F
                  140D0D0D0D45110D0D0D0D0D0D0D0D07083C00004F0F4F4A1B17100D0D1C0D0D
                  0D0D0D0D0D0D0D05080B004F161628254C1F4617101C0D0D0D0D0D0D0D0D0D0C
                  093C004F19475551504E221F1A450D0D0D1143150D0D0D0D4F00004F25245A57
                  2D51274E4944413F0E4F4F0F0D0D0D114F00004F2E545C5C5A562B264F454821
                  1E1B1A171310104F0000004F625D5B5E5E3231574F53454B2927264E2322204F
                  0000004F6E6C6A67653736624F6911122A302F56552C524F0000004F79787775
                  7372396E344F0D0D4D6335605F334B3E4F00004F767B7B7B7B7B7B7978664F4F
                  6871386D6B58403D4F0000004F7B7B7B7B7B7B7B7B7B7B7B7B7B7979694F4F4F
                  4F0000004F767B7B7B7B7B7B7B7B7B7B7B7B7B6F4F00000000000000004F7A7B
                  7B7B7B7B70646461597A4F4F000000000000000000004F747B7B7B0201838282
                  4F4F00000000000000000000004F4F4F4F4F84807D7C82820000000000000000
                  00000000004F4F4F000000817E7F82820000000000000000000000000000004F
                  000000008282820000000000000000000000}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Left = 520
                Hint = 'Escala Semanal Calend'#225'rio - [COL051]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFEFFFDF5
                  FFFDF4FFFDF5FFFDF5FFFDF6FFFDF6FFFEF6FFFEF7FFFEF7FFFEF7FFFEF7FFFE
                  F7FFFEF7FFFEF7FFFEF7FFFEF6FFFDF6FFFDF6FFFDF5FFFDF5FFFDF5FFFFFDFF
                  FFFFFFF8E0FFF8D8FFF9DAFFF9DBFFF9DDFFFADFFFFAE0FFFAE1FFFAE0FFFADF
                  FFF9DEFFF9DEFFF9DEFFF9DEFFFADFFFFAE0FFFAE1FFFAE0FFFADFFFF9DDFFF9
                  DBFFF9DAFFF9DCFFFEFCFFF8DAFFF9DAFFF9DCFFF9DEFFFADFFFFAE1FFFADFFF
                  F9DEFFF9DDFFF9DCFFF9DBFFF9DBFFF9DBFFF9DBFFF9DCFFF9DDFFF9DEFFFADF
                  FFFAE1FFFADFFFF9DEFFF9DCFFF9DAFFFEF8FFFDF4FFFBE5FFFAE3FBF8E18FD4
                  F767C6FF66C6FF66C6FF66C6FF66C6FF66C6FF66C6FF66C6FF66C6FF66C6FF66
                  C6FF66C6FF66C6FF67C6FF90D5F6FBF9E1FFFAE3FFFCEEFFFFFFFFFFFFFFFFFF
                  FFFEFCDDEEE769C6FF69C6FF69C6FF69C6FF69C6FF69C6FF69C6FF69C6FF69C6
                  FF69C6FF69C6FF69C6FF69C6FF69C6FF69C6FF69C6FFDDEEE7FFFEFCFFFFFFFF
                  FFFFFFFFFFFFFDF3FFFBE4DAEDE66CC6FF6CC6FF75CBFF84D4FF75CBFF75CBFF
                  84D4FF75CBFF66B5FF5B9AFF66B5FF66B5FF5B9AFF66B5FF6CC6FF6CC6FFDAED
                  E6FFFBE4FFFBE8FFFDF2FFFFFFFFFBE6FFFADFDBEDE66FC6FF6FC6FF94DCFFAB
                  EAFF94DCFF94DCFFABEAFF94DCFF5582FF4558FF5582FF5582FF4558FF5582FF
                  6FC6FF6FC6FFDBEDE6FFFADFFFFAE0FFF8E0FFFFFFFFFEF9FFFCF0DCEEF272C5
                  FF72C5FF98DDFFAFEBFF98DDFF98DDFFAFEBFF98DDFF5A80FE4C57FE5A80FE5A
                  80FE4C57FE5A80FE72C5FF72C5FFDCEBE7FFFAE2FFFBE4FFFCEFFFFFFFFFFFFF
                  FFFFFFDDF0FF76C5FF76C5FF9CDDFFB3ECFF9CDDFF9CDDFFB3ECFF9CDDFF6080
                  FE5356FE6080FE6080FE5356FE6080FE76C5FF76C5FFDDF0FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFDDF0FF79C5FF79C5FFA0DEFFB7EDFFA0DEFFA0DEFF
                  B7EDFFA0DEFF6680FE5A56FD6680FE6680FE5A56FD6680FE79C5FF79C5FFDDEE
                  F7FFFDF6FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFDEF0FF7CC5FF7CC5FFA4DEFFBB
                  EEFFA4DEFFA4DEFFBBEEFFA4DEFF6B7FFE6155FD6B7FFE6B7FFE6155FD6B7FFE
                  7CC5FF7CC5FFDEEBE2FFF9DBFFFBE6FFFFFFFFFFFFFFFDF6FFFDF1DFEEF37FC5
                  FF7FC5FFA7DFFFBFEFFFA7DFFFA7DFFFBFEFFFA7DFFF717FFD6855FC717FFD71
                  7FFD6855FC717FFD7FC5FF7FC5FFDFEBE2FFF8DAFFFBECFFFFFFFFFDF2FFF9DE
                  FFF9DBE0EBE282C5FF82C5FFABE0FFC3F0FFABE0FFABE0FFC3F0FFABE0FF767E
                  FD6F54FC767EFD767EFD6F54FC767EFD82C5FF82C5FFE0F0FFFFFFFFFFFFFFFF
                  FFFFFFFCEFFFF9DEFFF9DBE0EBE285C5FF85C5FFA3D9FFBEEBFFA3D9FFA3D9FF
                  BEEBFFA3D9FF7E91FD7863FC7E91FD7E91FD7863FC7E91FD85C5FF85C5FFE0F0
                  FFFFFFFFFFFFFFFFFFFFFFFFFDFFFCEEFFFBE9E0EDEB87C5FF87C5FF91CCFFA2
                  D7FF91CCFF91CCFFA2D7FF91CCFF86B4FE8397FD86B4FE86B4FE8397FD86B4FE
                  87C5FF87C5FFE1ECE9FFFBE5FFFBE7FFFDF6FFFFFFFFFFFFFFFFFFE1F0FF89C5
                  FF89C5FFB4E2FFCFF4FFB4E2FFB4E2FFCFF4FFB4E2FF857EFD8353FB867FFD85
                  7EFD8353FB867FFD89C5FF89C5FFE1ECE3FFF9DCFFFADFFFF9E2FFFFFFFFFFFF
                  FFFFFFE2F0FF8CC4FF8CC4FFACDAFFCAEEFFACDAFFACDAFFCAEEFFACDAFF8B90
                  FD8B61FB8B90FD8B90FD8B61FB8B90FD8CC4FF8CC4FFE2ECE4FFF9DDFFFAE0FF
                  FBE8FFFFFFFFFDF1FFFBE8E2ECE88EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF
                  8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FF8EC4FFE3EC
                  E5FFFDF2FFFEF8FFFFFEFFFEF9FFFADFFFFAE0F1F3E292C5FE90C4FF90C4FF90
                  C4FF90C4FF90C4FF90C4FF90C4FF90C4FF90C4FF90C4FF90C4FF90C4FF90C4FF
                  90C4FF92C5FEF2F3E2FFFDF2FFFFFDFFFFFFFFFFFDFFFAE0FFFAE0FFFAE0E3EC
                  E6CBE0ECCBE0EBCBDFEACBDFE9CBDFE9CBDFE8CBDFE8CBDFE8CBDFE8CBDFE9CB
                  DFE9CBDFEACBE0EBCBE0ECE3EBE5FFFAE0FFFAE0FFFAE6FFFFFFFFFFFFFFFFFD
                  FFFDF7FFFEF7FFFEF6FFFDF6FFFDF6FFFCECFFF8D9FFF8D8FFF8D8FFF8D7FFF8
                  D7FFF8D8FFF8D8FFF8D9FFFAE2FFFBEAFFFBEBFFFCECFFFCEDFFFBEBFFFDF3FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAFFFDF6FFFCEEFFF9DCFFF9DB
                  FFF9DAFFF9DAFFF9DAFFF9DAFFF9DBFFF9DCFFFCF0FFFDF6FFFEFBFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFF9E1FFFAE1FF
                  FAE0FFFADFFFF9DEFFF9DDFFF9DDFFF9DDFFF9DDFFF9DEFFFADFFFFAE0FFFAE1
                  FFF9E0FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFCF0FFFCECFFFCECFFFCEDFFFCEDFFFCECFFFCECFFFCECFFFCECFFFCEDFF
                  FCEDFFFCECFFFCECFFFCEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                Visible = False
                OnClick = SpeedButton11Click
                ExplicitLeft = 520
              end
              inherited SpeedButton12: TSpeedButton
                Left = 577
                Enabled = False
                Visible = False
                ExplicitLeft = 577
              end
              inherited SpeedButton23: TSpeedButton
                Left = 406
                Hint = 'Jornada de Trabalho - [COL057]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFAFAA9FACA79CACA79CACA79CACA79CACA79CACA79C
                  ACA79CACA79CACA79CACA79CAFAA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF776D5C645A45645A45645A4564
                  5A45746E85746E85645A45645A45645A45645A45776E5CFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA19B8F645A
                  45645A45645A45645A45706FCB706ECB645A45645A45645A45645A45A49173BE
                  B1B48187B78187B7BEB1B4FADAB1FADAB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFECEAE86E6351645A45645A45776E5C7878E27878E2786F5D645A45645A
                  4571634CE9C08B807FA80C36BF0C36BF807FA8F7CC93F7CC93FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDDD97B7461645A45BAB5AC9797E99090E8
                  B9B5AB645A457D6748C98F51F9CA908280A80C36BF0C36BF8280A8F9CA90F9CA
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDCBC8C163
                  AFDF20A5FF20A5FF64AEDEA66122BF6515C06515F9CA908280A80C36BF0C36BF
                  8280A8F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFF2FAFF2FABFF45B4FF45B4FF2EABFFB86A25C06515C06515F9CA9082
                  80A80C36BF0C36BF8280A8F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFCFEFF73C5FF4DB7FF4DB7FF4DB7FF4DB7FF6FBBE9F6CA
                  92F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9E9FF4DB7FF4DB7FF4DB7FF4DB7FF
                  4DB7FF4DB7FFB1A187DC9853F9CA90EBB071DC9853DC9853EBB071F9CA90F9CA
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4DA9E64DB7FF3A
                  8FCE4DB7FF4DB7FF3A8FCE4DB7FF489BD2C06515F9CA90DC9853C06515C06515
                  DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF4A54594DB7FF3A8ECE4DB7FF4DB7FF3A8ECE4DB7FF484D50C06515F9CA90DC
                  9853C06515C06515DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF464849498FBF4CB1F64DB7FF4DB7FF4DB7FF4CA9E94748
                  48F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66676A42424243464945667D498DBB
                  4CA6E445545E5E574EDC9853F9CA90EBB071DC9853DC9853EBB071F9CA90F9CA
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF42424242
                  4242424242424242424242424242955924C06515F9CA90DC9853C06515C06515
                  DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFF96969643434342424242424261594F955924C06515C06515F9CA90DC
                  9853C06515C06515DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDAA9B8CA48B6CDCB483F9CA90F9CA
                  90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE4C7F9CA90
                  F9CA90DC9853DC9853DC9853F9CA90EBB071DC9853DC9853EBB071F9CA90F9CA
                  90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFCE4C7F9CA90F9CA90C06515C06515C06515F9CA90DC9853C06515C06515
                  DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFCE4C7F9CA90F9CA90C06515C06515C06515F9CA90DC
                  9853C06515C06515DC9853F9CA90F9CA90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE6CAF9CA90F9CA90F9CA90F9CA
                  90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F8CA93FFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF5EAF8CA91
                  F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90F9CA90FBDB
                  B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFEF5E9FCE7CDFCE6CBFCE6CBFCE6CBFCE6CBFCE6CBFCE6CBFCE6CB
                  FCE6CBFDEAD4FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton23Click
                ExplicitLeft = 406
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 179
                Hint = 'Ver registros da lixeira - [COL006]'
                OnClick = SpeedButton25Click
                ExplicitLeft = 179
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 402
              ExplicitHeight = 402
              inherited ScrollBox2: TScrollBox
                Height = 385
                ExplicitHeight = 385
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 773
          ExplicitHeight = 536
        end
        object tsOutros: TTabSheet
          Caption = 'tsOutros'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnSaldoExtrato: TPanel
            Left = 3
            Top = 0
            Width = 318
            Height = 150
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object pnOKCancelar: TPanel
              Left = 6
              Top = 99
              Width = 302
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOKCancelar: TBitBtn
                Left = 112
                Top = 6
                Width = 75
                Height = 25
                Caption = '&OK'
                TabOrder = 0
                OnClick = btnOKCancelarClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271
                  AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271
                  AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  71AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA2271AA22FF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FF71
                  AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  71AA2271AA2271AA22FF00FFFF00FFFF00FF71AA2271AA2271AA2271AA2271AA
                  22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA22FF00FFFF00FFFF00FFFF
                  00FFFF00FF71AA2271AA2271AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA2271AA2271AA
                  2271AA2271AA22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FF71AA2271AA2271AA22FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF71AA
                  22FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
            object gbSaldoExtrato: TGroupBox
              Left = 6
              Top = -1
              Width = 302
              Height = 94
              Caption = 'Selecione entre saldo ou extrato por per'#237'odo'
              TabOrder = 0
              object Label203: TLabel
                Left = 39
                Top = 63
                Width = 55
                Height = 13
                Caption = 'Per'#237'odo de:'
              end
              object Label51: TLabel
                Left = 177
                Top = 61
                Width = 6
                Height = 13
                Caption = 'a'
              end
              object MaskEdit4: TMaskEdit
                Left = 100
                Top = 58
                Width = 70
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object MaskEdit5: TMaskEdit
                Left = 189
                Top = 58
                Width = 70
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object RadioGroup1: TRadioGroup
                Left = 39
                Top = 14
                Width = 220
                Height = 38
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Saldo'
                  'Extrato')
                TabOrder = 2
              end
            end
          end
        end
        object tsContatoPlataforma: TTabSheet
          Caption = 'tsContatoPlataforma'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnContatoPlataforma: TPanel
            Left = 1
            Top = 24
            Width = 760
            Height = 353
            TabOrder = 0
            OnEnter = pnContatoPlataformaEnter
            object GroupBoxContatoPlataforma: TGroupBox
              Left = 1
              Top = 1
              Width = 758
              Height = 351
              Align = alClient
              Caption = 'Dados Pessoais - Contatos por Aplicativo'
              TabOrder = 0
              object pn_contatos_pla_cad: TPanel
                Left = 2
                Top = 240
                Width = 754
                Height = 68
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pn_contatos_pla_cadEnter
                object lb_contato_pla_contato: TLabel
                  Left = 160
                  Top = 0
                  Width = 39
                  Height = 13
                  Caption = 'Contato'
                end
                object lb_contato_pla_aplicativo: TLabel
                  Left = 9
                  Top = 0
                  Width = 46
                  Height = 13
                  Caption = 'Aplicativo'
                end
                object lb_contato_pla_identificacao: TLabel
                  Left = 304
                  Top = 0
                  Width = 62
                  Height = 13
                  Caption = 'Identifica'#231#227'o'
                end
                object lb_contrato_pla_tipos_contato: TLabel
                  Left = 494
                  Top = 0
                  Width = 77
                  Height = 13
                  Caption = 'Tipo de Contato'
                end
                object bt_contato_pla_tipo: TSpeedButton
                  Left = 579
                  Top = 0
                  Width = 18
                  Height = 12
                  Caption = '...'
                  Flat = True
                  OnClick = bt_contato_pla_tipoClick
                end
                object Panel95: TPanel
                  Left = 715
                  Top = 0
                  Width = 39
                  Height = 68
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 0
                  object bt_contatos_pla_save: TSpeedButton
                    Left = 3
                    Top = 19
                    Width = 23
                    Height = 22
                    Hint = 'Salvar contato por plataforma - [COL044]'
                    Flat = True
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
                    OnClick = bt_contatos_pla_saveClick
                  end
                  object bt_contatos_pla_cancel: TSpeedButton
                    Left = 3
                    Top = 44
                    Width = 23
                    Height = 22
                    Hint = 'Cancelar plataforma'
                    Flat = True
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
                    OnClick = bt_contatos_pla_cancelClick
                  end
                end
                object ed_contato_pla_contato: TDBEdit
                  Left = 160
                  Top = 19
                  Width = 137
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CONTATO'
                  TabOrder = 2
                end
                object ed_contato_pla_aplicativo: TDBLookupComboBox
                  Left = 9
                  Top = 19
                  Width = 145
                  Height = 21
                  DataField = 'ID_MSG_APLICATIVO'
                  DropDownWidth = 300
                  TabOrder = 1
                  OnExit = ed_contato_pla_aplicativoExit
                end
                object ed_contato_pla_identificacao: TDBEdit
                  Left = 301
                  Top = 19
                  Width = 187
                  Height = 21
                  CharCase = ecLowerCase
                  DataField = 'IDENTIFICADOR'
                  TabOrder = 3
                end
                object ck_contrato_pla_tipos_contato: TCheckListBox
                  Left = 494
                  Top = 19
                  Width = 218
                  Height = 44
                  ItemHeight = 13
                  TabOrder = 4
                end
              end
              object Panel96: TPanel
                Left = 714
                Top = 15
                Width = 42
                Height = 225
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object bt_contatos_pla_add: TSpeedButton
                  Left = 6
                  Top = 1
                  Width = 23
                  Height = 22
                  Hint = 'Incluir contato por aplicativo - [COL041]'
                  Flat = True
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
                  OnClick = bt_contatos_pla_addClick
                end
                object bt_contatos_pla_del: TSpeedButton
                  Left = 6
                  Top = 57
                  Width = 23
                  Height = 22
                  Hint = 'Excluir contato por aplicativo - [COL043]'
                  Flat = True
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
                  OnClick = bt_contatos_pla_delClick
                end
                object bt_contatos_pla_edit: TSpeedButton
                  Left = 6
                  Top = 29
                  Width = 23
                  Height = 22
                  Hint = 'Alterar contato por aplicativo - [COL042]'
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
                  OnClick = bt_contatos_pla_editClick
                end
              end
              object pn_contatos_pla_view: TPanel
                Left = 2
                Top = 15
                Width = 712
                Height = 225
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 2
                OnEnter = pn_contatos_pla_viewEnter
                object grid_contatos_pla: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 712
                  Height = 225
                  Align = alClient
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
                      FieldName = 'ID_MSG_APLICATIVO'
                      Title.Caption = 'Aplicativo'
                      Width = 180
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CONTATO'
                      Title.Caption = 'Contato'
                      Width = 220
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'IDENTIFICADOR'
                      Title.Caption = 'Identificador'
                      Width = 300
                      Visible = True
                    end>
                end
              end
              object Panel97: TPanel
                Left = 2
                Top = 308
                Width = 754
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 3
                object BitBtn11: TBitBtn
                  Left = 665
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  ModalResult = 1
                  TabOrder = 0
                  Glyph.Data = {
                    42020000424D4202000000000000420000002800000010000000100000000100
                    10000300000000020000120B0000120B00000000000000000000007C0000E003
                    00001F0000007467813A813A813661366136613241324132422E422E222E222A
                    222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232412E212E
                    212A222A0226A13EE146C142C142A23EA23EA23A823A61366236212EAC4AF056
                    8842012A222AA13EE146C146C142C142A23EA23E613641328236212EFF7FFF7F
                    776B212E222AC142E14AE146C146C142C142413644364132823A212EFF7FFF7F
                    776B212E222AC142014BE14AE146C1464136AC4A776B4136823A212EFF7FFF7F
                    776B212E222EC142014B014BE1464132CE52FF7F776B41326136012EFF7FFF7F
                    776B212E422EC146014FE14A2132345FFF7FFF7FDD7BF056F0565667FF7FFF7F
                    345F4132422EE146E14A43365667FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                    884261364232E146A242CE52FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FF056
                    413282364132E14A4657833E8842996FFF7FFF7FDD7BAA468842884244364236
                    A33E823A6132E14A675B465BE54E4236CE52DD7B776B823AE44AE346C342C342
                    A33EA23A6132014B675F665B465B4657A3422336CE52823EE44AE346C346C342
                    A33EA23E6136014F675F665B665B465745572553623A823E044BE34AE346C346
                    C242A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                    C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                    813A813A7467}
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Width = 116
      Height = 569
      ExplicitWidth = 116
      ExplicitHeight = 569
      inherited bMarketingHW: TBitBtn
        Top = 547
        Width = 114
        ExplicitTop = 547
        ExplicitWidth = 114
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 571
    Width = 788
    ExplicitTop = 571
    ExplicitWidth = 788
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 652
    Top = 89
    object MarcarTodosColaboradoresClick: TMenuItem
      Caption = 'Marcar Todos Colaboradores'
      OnClick = MarcarTodosColaboradoresClickClick
    end
    object DesmarcarTodosColaboradoresClick: TMenuItem
      Caption = 'Desmarcar Todos Colaboradores'
      OnClick = DesmarcarTodosColaboradoresClickClick
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 622
    Top = 91
  end
  inherited Timer1: TTimer
    Left = 574
    Top = 91
  end
end
