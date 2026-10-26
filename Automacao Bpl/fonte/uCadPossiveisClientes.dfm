inherited FrmCadPossiveisCliente: TFrmCadPossiveisCliente
  Left = 203
  Top = 0
  Caption = 'Poss'#237'veis Clientes'
  ClientHeight = 615
  ClientWidth = 862
  ShowHint = True
  ExplicitWidth = 870
  ExplicitHeight = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 862
    Height = 596
    ExplicitWidth = 862
    ExplicitHeight = 596
    inherited Splitter2: TSplitter
      Height = 594
      ExplicitLeft = 851
      ExplicitHeight = 641
    end
    inherited PanelLeft: TPanel
      Width = 857
      Height = 594
      ExplicitWidth = 857
      ExplicitHeight = 594
      inherited PageControl1: TPageControl
        Width = 855
        Height = 592
        ExplicitWidth = 855
        ExplicitHeight = 592
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 847
          ExplicitHeight = 561
          inherited ScrollBox1: TScrollBox
            Width = 847
            Height = 561
            ExplicitWidth = 847
            ExplicitHeight = 561
            inherited PageControl3: TPageControl
              Width = 847
              Height = 513
              ExplicitWidth = 847
              ExplicitHeight = 513
              inherited TabSheet3: TTabSheet
                Caption = 'Dados Pessoais'
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 839
                ExplicitHeight = 482
                inherited ScrollBox3: TScrollBox
                  Width = 839
                  Height = 482
                  ExplicitWidth = 839
                  ExplicitHeight = 482
                  inherited GroupBox1: TGroupBox
                    Left = -1
                    Top = 176
                    Width = 852
                    Height = 33
                    Align = alNone
                    Caption = 'Cliente'
                    ParentBackground = False
                    Visible = False
                    ExplicitLeft = -1
                    ExplicitTop = 176
                    ExplicitWidth = 852
                    ExplicitHeight = 33
                  end
                  object Panel6: TPanel
                    Left = 0
                    Top = 0
                    Width = 835
                    Height = 478
                    Align = alClient
                    TabOrder = 1
                    object GroupBox11: TGroupBox
                      AlignWithMargins = True
                      Left = 4
                      Top = 4
                      Width = 827
                      Height = 506
                      Align = alTop
                      Caption = 'Clientes'
                      TabOrder = 0
                      object Label10: TLabel
                        Left = 91
                        Top = 131
                        Width = 38
                        Height = 13
                        Caption = 'Bairro:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label11: TLabel
                        Left = 526
                        Top = 158
                        Width = 21
                        Height = 13
                        Caption = 'UF:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label13: TLabel
                        Left = 85
                        Top = 158
                        Width = 44
                        Height = 13
                        Caption = 'Cidade:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label14: TLabel
                        Left = 102
                        Top = 84
                        Width = 27
                        Height = 13
                        Caption = 'Cep:'
                        FocusControl = DBEdit12
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label15: TLabel
                        Left = 56
                        Top = 275
                        Width = 73
                        Height = 13
                        Caption = 'Tipo Cliente:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label16: TLabel
                        Left = 49
                        Top = 61
                        Width = 80
                        Height = 13
                        Caption = 'Raz'#227'o Social:'
                        FocusControl = DBEdit8
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label17: TLabel
                        Left = 366
                        Top = 299
                        Width = 82
                        Height = 13
                        Caption = 'Insc.Estadual:'
                        FocusControl = DBEdit13
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label18: TLabel
                        Left = 447
                        Top = 320
                        Width = 25
                        Height = 13
                        Caption = 'Fax:'
                        FocusControl = DBEdit14
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label20: TLabel
                        Left = 27
                        Top = 181
                        Width = 102
                        Height = 13
                        Caption = 'Data Nascimento:'
                        FocusControl = DBEdit20
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label21: TLabel
                        Left = 630
                        Top = 40
                        Width = 86
                        Height = 13
                        Caption = 'Data Cadastro:'
                        FocusControl = DBEdit21
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label23: TLabel
                        Left = 80
                        Top = 320
                        Width = 49
                        Height = 13
                        Caption = 'Contato:'
                        FocusControl = DBEdit23
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label25: TLabel
                        Left = 106
                        Top = 229
                        Width = 23
                        Height = 13
                        Caption = 'Pai:'
                        FocusControl = DBEdit25
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label26: TLabel
                        Left = 100
                        Top = 253
                        Width = 29
                        Height = 13
                        Caption = 'M'#227'e:'
                        FocusControl = DBEdit26
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label27: TLabel
                        Left = 78
                        Top = 203
                        Width = 51
                        Height = 13
                        Caption = 'Conjuge:'
                        FocusControl = DBEdit27
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label32: TLabel
                        Left = 106
                        Top = 299
                        Width = 23
                        Height = 13
                        Caption = 'RG:'
                        FocusControl = DBEdit32
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label6: TLabel
                        Left = 85
                        Top = 16
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
                      object Label60: TLabel
                        Left = 257
                        Top = 320
                        Width = 33
                        Height = 13
                        Caption = 'Fone:'
                        FocusControl = DBEdit2
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label68: TLabel
                        Left = 657
                        Top = 15
                        Width = 59
                        Height = 13
                        Caption = 'Categoria:'
                        FocusControl = DBEdit6
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label69: TLabel
                        Left = 253
                        Top = 182
                        Width = 33
                        Height = 13
                        Caption = 'Sexo:'
                        FocusControl = DBEdit20
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label7: TLabel
                        Left = 353
                        Top = 16
                        Width = 65
                        Height = 13
                        Caption = 'CPF/CNPJ:'
                        FocusControl = DBEdit6
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label71: TLabel
                        Left = 376
                        Top = 181
                        Width = 72
                        Height = 13
                        Caption = 'Estado Civil:'
                        FocusControl = DBEdit20
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label72: TLabel
                        Left = 17
                        Top = 366
                        Width = 113
                        Height = 13
                        Caption = 'Tipo Cliente Venda:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label8: TLabel
                        Left = 49
                        Top = 40
                        Width = 80
                        Height = 13
                        Caption = 'Nome Cliente:'
                        FocusControl = DBEdit7
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label9: TLabel
                        Left = 60
                        Top = 107
                        Width = 69
                        Height = 13
                        Caption = 'Logradouro:'
                        FocusControl = DBEdit9
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label101: TLabel
                        Left = 668
                        Top = 107
                        Width = 48
                        Height = 13
                        Caption = 'N'#250'mero:'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label102: TLabel
                        Left = 88
                        Top = 343
                        Width = 39
                        Height = 13
                        Caption = 'E-mail:'
                        FocusControl = DBEdit69
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label114: TLabel
                        Left = 347
                        Top = 366
                        Width = 125
                        Height = 13
                        Caption = 'Carteira de Vendedor:'
                        FocusControl = DBEdit84
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label12: TLabel
                        Left = 40
                        Top = 389
                        Width = 88
                        Height = 13
                        Caption = 'ID Mobile INS.:'
                        FocusControl = DBEdit4
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label19: TLabel
                        Left = 390
                        Top = 389
                        Width = 82
                        Height = 13
                        Caption = 'ID Mobile Alt.:'
                        FocusControl = DBEdit15
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label22: TLabel
                        Left = 4
                        Top = 406
                        Width = 132
                        Height = 13
                        Caption = 'Observa'#231#245'es Diversas:'
                        FocusControl = DBEdit84
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label28: TLabel
                        Left = 478
                        Top = 61
                        Width = 47
                        Height = 13
                        Caption = 'Apelido:'
                        FocusControl = DBEdit16
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label338: TLabel
                        Left = 666
                        Top = 183
                        Width = 90
                        Height = 13
                        Caption = 'C'#243'digo do SW.:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label339: TLabel
                        Left = 662
                        Top = 210
                        Width = 94
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia Vencimento:'
                        FocusControl = DBEdit6
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object SpeedButton15: TSpeedButton
                        Left = 235
                        Top = 81
                        Width = 137
                        Height = 22
                        Hint = 'Consultar na Internet'
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
                      object DBComboBox3: TDBComboBox
                        Left = 718
                        Top = 12
                        Width = 100
                        Height = 21
                        Hint = 
                          'Cliente Conferido Pessoa Jur'#237'dica; Cliente Conferido Pessoa F'#237'si' +
                          'ca; Cliente n'#227'o conferido Pessoa Jur'#237'dica; Cliente n'#227'o conferido' +
                          ' Pessoa F'#237'sica.'
                        CharCase = ecUpperCase
                        DataField = 'CATEGORIA'
                        DataSource = DtmClientes.dsPossivelCli
                        ItemHeight = 13
                        Items.Strings = (
                          'CCJ'
                          'CCF'
                          'CNJ'
                          'CNF')
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 2
                        OnExit = DBComboBox3Exit
                      end
                      object DBComboBox4: TDBComboBox
                        Left = 286
                        Top = 178
                        Width = 58
                        Height = 19
                        Hint = 'Sexo do cliente'
                        Style = csOwnerDrawFixed
                        DataField = 'SEXO'
                        DataSource = DtmClientes.dsPossivelCli
                        ItemHeight = 13
                        Items.Strings = (
                          'M'
                          'F')
                        TabOrder = 17
                        OnExit = DBComboBox4Exit
                      end
                      object DBComboBox5: TDBComboBox
                        Left = 449
                        Top = 175
                        Width = 150
                        Height = 19
                        Hint = 'Estado civil do cliente'
                        Style = csOwnerDrawFixed
                        DataField = 'ESTADO_CIVIL'
                        DataSource = DtmClientes.dsPossivelCli
                        ItemHeight = 13
                        Items.Strings = (
                          'SOLTEIRO(A)'
                          'CASADO(A)'
                          'DIVORCIADO(A)'
                          'DESQUITADO(A)'
                          'VI'#218'VO(A)')
                        TabOrder = 18
                      end
                      object DBComboBox6: TDBComboBox
                        Left = 130
                        Top = 363
                        Width = 203
                        Height = 21
                        Hint = 'Tipo de venda permitido ao cliente'
                        CharCase = ecUpperCase
                        DataField = 'TIPVCLIENTE'
                        DataSource = DtmClientes.dsPossivelCli
                        ItemHeight = 13
                        Items.Strings = (
                          'V - VAREJO'
                          'A - ATACADO'
                          'C - CONSIGNADO'
                          'T - TELEVENDA'
                          'L - APLICADORES'
                          'O - OUTRAS EMPRESAS'
                          'P - PRODU'#199#195'O')
                        TabOrder = 31
                        OnExit = DBComboBox6Exit
                      end
                      object DBEdit1: TDBEdit
                        Left = 130
                        Top = 12
                        Width = 75
                        Height = 21
                        DataField = 'COD_CLIENTE'
                        DataSource = DtmClientes.dsPossivelCli
                        Enabled = False
                        TabOrder = 0
                      end
                      object DBEdit10: TDBEdit
                        Left = 130
                        Top = 128
                        Width = 42
                        Height = 21
                        Hint = '[F3: Consultar] [F4: Novo]  - Bairro do cliente'
                        DataField = 'COD_BAIRRO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 10
                        OnExit = DBEdit10Exit
                        OnKeyDown = DBEdit10KeyDown
                      end
                      object DBEdit11: TDBEdit
                        Left = 130
                        Top = 152
                        Width = 42
                        Height = 21
                        Hint = '[F3: Consultar] [F4: Novo]  - Cidade do cliente'
                        DataField = 'COD_CIDADE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 12
                        OnExit = DBEdit11Exit
                        OnKeyDown = DBEdit11KeyDown
                      end
                      object DBEdit12: TDBEdit
                        Left = 130
                        Top = 81
                        Width = 100
                        Height = 21
                        Hint = 'CEP do cliente'
                        DataField = 'CEP'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 7
                        OnExit = DBEdit12Exit
                      end
                      object DBEdit13: TDBEdit
                        Left = 448
                        Top = 294
                        Width = 161
                        Height = 21
                        Hint = 'Inscri'#231#227'o estadual do cliente'
                        CharCase = ecUpperCase
                        DataField = 'INSC_EST'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 26
                        OnExit = DBEdit13Exit
                      end
                      object DBEdit14: TDBEdit
                        Left = 473
                        Top = 317
                        Width = 136
                        Height = 21
                        Hint = 'N'#250'mero Fax do cliente'
                        DataField = 'FAX'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 29
                      end
                      object DBEdit2: TDBEdit
                        Left = 294
                        Top = 317
                        Width = 141
                        Height = 21
                        Hint = 'N'#250'mero de telefone do cliente'
                        DataField = 'FONE_CLIENTE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 28
                      end
                      object DBEdit20: TDBEdit
                        Left = 130
                        Top = 176
                        Width = 100
                        Height = 21
                        Hint = 'Data de nascimento do cliente'
                        DataField = 'DATA_NASC'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 16
                        OnExit = DBEdit20Exit
                      end
                      object DBEdit21: TDBEdit
                        Left = 718
                        Top = 35
                        Width = 100
                        Height = 21
                        Hint = 'Data de cadastro do cliente '
                        DataField = 'DATA_CADASTRO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 4
                      end
                      object DBEdit23: TDBEdit
                        Left = 130
                        Top = 317
                        Width = 117
                        Height = 21
                        Hint = 'Contato do cliente'
                        CharCase = ecUpperCase
                        DataField = 'CONTATO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 27
                      end
                      object DBEdit25: TDBEdit
                        Left = 130
                        Top = 224
                        Width = 479
                        Height = 21
                        Hint = 'Nome do pai'
                        CharCase = ecUpperCase
                        DataField = 'PAI'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 20
                        OnExit = DBEdit25Exit
                      end
                      object DBEdit26: TDBEdit
                        Left = 130
                        Top = 248
                        Width = 479
                        Height = 21
                        Hint = 'Nome da m'#227'e'
                        CharCase = ecUpperCase
                        DataField = 'MAE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 21
                        OnExit = DBEdit26Exit
                      end
                      object DBEdit27: TDBEdit
                        Left = 130
                        Top = 200
                        Width = 479
                        Height = 21
                        Hint = 'C'#244'njuge'
                        CharCase = ecUpperCase
                        DataField = 'CONJUGE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 19
                      end
                      object DBEdit32: TDBEdit
                        Left = 130
                        Top = 294
                        Width = 117
                        Height = 21
                        Hint = 'RG do cliente'
                        CharCase = ecUpperCase
                        DataField = 'RG'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 25
                        OnExit = DBEdit32Exit
                      end
                      object DBEdit5: TDBEdit
                        Left = 591
                        Top = 153
                        Width = 227
                        Height = 21
                        DataSource = DtmClientes.dsAbreEstados1
                        Enabled = False
                        TabOrder = 15
                      end
                      object DBEdit6: TDBEdit
                        Left = 423
                        Top = 12
                        Width = 186
                        Height = 21
                        Hint = 'CPF / CNPJ do Cliente'
                        DataField = 'CPFCGC'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 1
                        OnEnter = DBEdit6Enter
                        OnExit = DBEdit6Exit
                      end
                      object DBEdit7: TDBEdit
                        Left = 130
                        Top = 34
                        Width = 342
                        Height = 21
                        Hint = 'Nome do cliente'
                        CharCase = ecUpperCase
                        DataField = 'NOME_CLIENTE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 3
                        OnExit = DBEdit7Exit
                      end
                      object DBEdit8: TDBEdit
                        Left = 130
                        Top = 58
                        Width = 342
                        Height = 21
                        Hint = 'Raz'#227'o social do cliente'
                        CharCase = ecUpperCase
                        DataField = 'RAZAO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 5
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit9: TDBEdit
                        Left = 130
                        Top = 104
                        Width = 479
                        Height = 21
                        Hint = 'Endere'#231'o do cliente'
                        CharCase = ecUpperCase
                        DataField = 'ENDERECO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 8
                        OnExit = DBEdit9Exit
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 548
                        Top = 153
                        Width = 42
                        Height = 21
                        Hint = '[F3: Consultar] [F4: Novo]  - Estado do cliente'
                        DataField = 'CODIGO_UF'
                        DataSource = DtmClientes.dsPossivelCli
                        ListSource = DtmClientes.dsAbreEstados1
                        TabOrder = 14
                        OnExit = DBLookupComboBox1Exit
                        OnKeyDown = DBLookupComboBox1KeyDown
                      end
                      object DBLookupComboBox2: TDBLookupComboBox
                        Left = 130
                        Top = 271
                        Width = 203
                        Height = 21
                        Hint = 'Tipo de cliente'
                        DataField = 'CODIGO_TIPO'
                        DataSource = DtmClientes.dsPossivelCli
                        KeyField = 'CODIGO_TIPO'
                        ListField = 'DESCRICAO_TIPO'
                        ListSource = DtmClientes.dsTipoCliente
                        TabOrder = 24
                        OnExit = DBLookupComboBox2Exit
                      end
                      object DBLookupComboBox7: TDBLookupComboBox
                        Left = 179
                        Top = 128
                        Width = 340
                        Height = 21
                        Hint = '[F3: Consultar] [F4: Novo]  - Bairro do cliente'
                        DataField = 'COD_BAIRRO'
                        DataSource = DtmClientes.dsPossivelCli
                        ListSource = DtmClientes.dsAbreBairros1
                        TabOrder = 11
                        OnExit = DBLookupComboBox7Exit
                        OnKeyDown = DBEdit10KeyDown
                      end
                      object DBLookupComboBox6: TDBLookupComboBox
                        Left = 179
                        Top = 152
                        Width = 340
                        Height = 21
                        Hint = '[F3: Consultar] [F4: Novo]  - Cidade do cliente'
                        DataField = 'COD_CIDADE'
                        DataSource = DtmClientes.dsPossivelCli
                        ListSource = DtmClientes.dsAbreCidades1
                        TabOrder = 13
                        OnExit = DBLookupComboBox6Exit
                        OnKeyDown = DBEdit11KeyDown
                      end
                      object DBEdit3: TDBEdit
                        Left = 718
                        Top = 104
                        Width = 100
                        Height = 21
                        DataField = 'NUM_END_CLIENTE'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 9
                      end
                      object DBEdit69: TDBEdit
                        Left = 130
                        Top = 340
                        Width = 479
                        Height = 21
                        Hint = 'E-mail do cliente'
                        DataField = 'EMAIL'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 30
                      end
                      object DBEdit84: TDBEdit
                        Left = 472
                        Top = 363
                        Width = 50
                        Height = 21
                        Hint = '[F3: Consultar] - Vendedor dono da carteira'
                        DataField = 'COD_VENDEDOR'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 32
                        OnExit = DBEdit84Exit
                        OnKeyDown = DBEdit84KeyDown
                      end
                      object DBLookupComboBox5: TDBLookupComboBox
                        Left = 526
                        Top = 363
                        Width = 292
                        Height = 21
                        Hint = 'Vendedor dono da carteira'
                        DataField = 'COD_VENDEDOR'
                        DataSource = DtmClientes.dsPossivelCli
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        TabOrder = 33
                      end
                      object DBEdit4: TDBEdit
                        Left = 130
                        Top = 386
                        Width = 134
                        Height = 21
                        DataField = 'IDMOBILE_INS'
                        DataSource = DtmClientes.dsPossivelCli
                        Enabled = False
                        TabOrder = 34
                      end
                      object DBEdit15: TDBEdit
                        Left = 473
                        Top = 386
                        Width = 134
                        Height = 21
                        DataField = 'IDMOBILE_ALT'
                        DataSource = DtmClientes.dsPossivelCli
                        Enabled = False
                        TabOrder = 35
                      end
                      object DBMemo1: TDBMemo
                        Left = 2
                        Top = 420
                        Width = 823
                        Height = 84
                        Hint = 'Observa'#231#245'es diversas a cerca do cliente'
                        Align = alBottom
                        DataField = 'OBS_DIV'
                        DataSource = DtmClientes.dsPossivelCli
                        ScrollBars = ssVertical
                        TabOrder = 37
                      end
                      object CheckBoxObservacao: TCheckBox
                        Left = 630
                        Top = 390
                        Width = 179
                        Height = 17
                        Caption = 'Exibir observa'#231#227'o em outra aba'
                        TabOrder = 36
                        OnClick = CheckBoxObservacaoClick
                      end
                      object DBEdit16: TDBEdit
                        Left = 531
                        Top = 58
                        Width = 287
                        Height = 21
                        Hint = 'Apelido do cliente'
                        CharCase = ecUpperCase
                        DataField = 'APELIDO'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 6
                        OnExit = DBEdit8Exit
                      end
                      object DBEdit199: TDBEdit
                        Left = 762
                        Top = 180
                        Width = 56
                        Height = 21
                        Hint = 'C'#243'digo utilizado na ades'#227'o do sistema'
                        DataField = 'CODIGO_SWHW'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 22
                      end
                      object DBEdit200: TDBEdit
                        Left = 762
                        Top = 207
                        Width = 56
                        Height = 21
                        Hint = 
                          'Dia base para vencimento do conv'#234'nio em caso de empresa que seja' +
                          ' conveniada'
                        DataField = 'DIA_VENC'
                        DataSource = DtmClientes.dsPossivelCli
                        TabOrder = 23
                      end
                    end
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = 'Mais Informa'#231#245'es'
                ImageIndex = 1
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 839
                  Height = 482
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 835
                    Height = 478
                    Align = alClient
                    Caption = 'Mais Informa'#231#245'es'
                    TabOrder = 0
                    object Panel5: TPanel
                      Left = 2
                      Top = 15
                      Width = 831
                      Height = 28
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label24: TLabel
                        Left = 4
                        Top = 6
                        Width = 132
                        Height = 13
                        Caption = 'Observa'#231#245'es Diversas:'
                        FocusControl = DBEdit84
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                    end
                    object DBMemo2: TDBMemo
                      Left = 2
                      Top = 43
                      Width = 831
                      Height = 433
                      Hint = 'Observa'#231#245'es diversas a cerca do cliente'
                      Align = alClient
                      DataField = 'OBS_DIV'
                      DataSource = DtmClientes.dsPossivelCli
                      ScrollBars = ssVertical
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 513
              Width = 847
              ExplicitTop = 513
              ExplicitWidth = 847
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [CLI024]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [CLI025]'
              end
              inherited BitBtn6: TBitBtn
                OnExit = BitBtn6Exit
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          OnShow = TabSheet2Show
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 847
          ExplicitHeight = 561
          object Panel7: TPanel [0]
            AlignWithMargins = True
            Left = 21
            Top = 203
            Width = 680
            Height = 171
            Caption = 'Panel7'
            Color = clMoneyGreen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
            Visible = False
            object ProgressBar1: TProgressBar
              Left = 25
              Top = 108
              Width = 630
              Height = 17
              TabOrder = 0
            end
            object BitBtn8: TBitBtn
              Left = 302
              Top = 131
              Width = 75
              Height = 25
              Caption = '&Cancelar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
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
          inherited GroupBox3: TGroupBox
            Width = 847
            Height = 201
            ExplicitWidth = 847
            ExplicitHeight = 201
            inherited imgInformation: TImage
              Left = 821
              Height = 184
              ExplicitLeft = 814
              ExplicitHeight = 184
            end
            object btSelectAll: TSpeedButton [6]
              Left = 604
              Top = 46
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
              Top = 46
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
            inherited ComboBox1: TComboBox
              Hint = 
                'Campo filtro. Informe o campo desejado. [Seta para Baixo ou Cima' +
                ']'
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CLI039]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CLI034]'
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
            Top = 201
            Width = 847
            Height = 360
            ExplicitTop = 201
            ExplicitWidth = 847
            ExplicitHeight = 360
            inherited Splitter1: TSplitter
              Height = 299
              ExplicitTop = 57
              ExplicitHeight = 434
            end
            inherited DBGrid1: TDBGrid
              Width = 554
              Height = 299
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CLIENTE'
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
                  FieldName = 'CODIGO_TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_FATURAMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EST_CODIGO_UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CPFCGC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAZAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INSC_EST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FAX'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIDA_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CEP_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_CADASTRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIMITE_CREDITO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONTATO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NATURALID'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONJUGE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOC_TRAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'END_TRAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_TRAB'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CARGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXPEDIC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORG_EXPEDIC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CTPS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REF_BANC1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_BANC1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REF_BANC2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_BANC2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REF_COM1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'END_COM1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_COM1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INFORM'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRI_COMPR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULT_COMPR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONCEITO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REF_COM2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'END_COM2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_COM2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INFORM2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRI_COMPR2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULT_COMPR2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONCEITO2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SPCL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SPCEST'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REGSPC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REGSPCCH'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'US_CAD_CLI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FONE_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'END_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAIRRO_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_DIV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAI'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MAE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_NASC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CONVENIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONVENIADO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIA_VENC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_MOD_CAD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_EMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CATEGORIA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLQTDCOMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLSOMACOMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLULTIMACOMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLATRASOCOMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLLUCROCLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LUCROCLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPOCLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLQTDVEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLSOMAVEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLULTIMOVEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLLUCROVEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LUCROCLIENTE_V'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_Q_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_Q_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_T_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_T_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_L_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_L_VEICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ULT_VENDA_V'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIA_FREQUENCIA_V'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIAFREQUENCIA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_Q_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_Q_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_T_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_T_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_L_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_L_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'V_A_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'M_A_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_ULT_COMPRA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NEC_ACOMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIAS_ACOMP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SEXO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAMO_ATIVIDADE'
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
                  FieldName = 'COD_CIDADE_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BAIRRO_COBRANCA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTADO_CIVIL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPVCLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMP_PR_VENDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PERC_DESC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CONTADOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_END_CLIENTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INSC_SUB_F'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CDMICROEPP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TEL_RES_CF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAMAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMPLEMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_VENDEDOR'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 843
              ExplicitWidth = 843
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CLI035]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CLI036]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Etiqueta de poss'#237'veis clientes - [CLI037]'
                Glyph.Data = {
                  3E030000424D3E03000000000000FE0000002800000018000000180000000100
                  08000000000040020000120B0000120B0000320000003200000000000000FFFF
                  FF00FF00FF007A2D0600CA4A0000BC480000FF8C3E00C7580700D15E0C00F6D0
                  B400D3691600D76E1B00DA762600E37E2B00FF9D5000E6B78B00C2782D00FFB8
                  6F00F0C7A000FCFAF800EDC59A00AD732B00B58F500095842D00847A44007096
                  390086AC530097AA8100E7F0E3006EAA5C0079C482000D98210021BF460028C0
                  4F0077BDAD0082CEC20047BFC5003FC2CC003FC9D9001DE3FF001FE2FF0022E5
                  FF001FE0FF0020DDFF0031C9E5001EDAFF0023DCFF0026D9FF002ED4F40026D7
                  FF00020202020202020202020202020202020202020202020202020200000000
                  0000000000020200000000000000000002020202020202020202020202020202
                  0202020202020202020202020303030303030303030202030303030303030303
                  0202020203292F2E2B2A283103020203292F2E2B2A2831030202020203272D30
                  2624252C03020203272D302624252C03020202020323221B1610151803020203
                  23221B16101518030202020203110E060D0B080403020203110E060D0B080403
                  02020202031A19170C0A0705030202031A19170C0A0705030202020203201F1D
                  0912140F03020203201F1D0912140F030202020203211E1C0101011303020203
                  211E1C0101011303020202020303030303030303030202030303030303030303
                  0202020202020202020202020202020202020202020202020202020200000000
                  0000000000020200000000000000000002020202020202020202020202020202
                  0202020202020202020202020303030303030303030202030303030303030303
                  0202020203292F2E2B2A283103020203292F2E2B2A2831030202020203272D30
                  2624252C03020203272D302624252C03020202020323221B1610151803020203
                  23221B16101518030202020203110E060D0B080403020203110E060D0B080403
                  02020202031A19170C0A0705030202031A19170C0A0705030202020203201F1D
                  0912140F03020203201F1D0912140F030202020203211E1C0101011303020203
                  211E1C0101011303020202020303030303030303030202030303030303030303
                  0202}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Situa'#231#227'o Caixa'
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Adicionar aos Clientes - [CLI038]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000E30E0000E30E00000001000000010000107B10001084
                  1000217318002184210021A521004A422900298C290031942900299C290029AD
                  2900398C3100319C310031A5310031AD31004A6B390039943900399C390039AD
                  390039B539005A52420052634200527342004A8C42004A9C42004AA5420042BD
                  420042CE4200636B4A0018734A0052A54A004ABD4A00296B520052B5520052C6
                  5200736B5A005AC65A007B736300428463006B84630063A5630063BD630063CE
                  6300315A6B0073B56B006BCE6B0073AD730073CE730094B57B0084BD7B008CBD
                  7B007BCE7B007BD67B00316B8400948C840084B5840039738C009CB58C008CBD
                  8C0094DE8C009CDE8C0039739400106B9C00216B9C005A849C0063849C00216B
                  A5002173A500B5E7A500297BAD003984AD00428CAD004A8CAD00107BB500217B
                  B500428CB5004A94B500217BBD004294BD005294BD00529CBD006BA5BD00D6E7
                  BD00187BC6002184C6002984C600298CC600318CC600428CC6003994C6004294
                  C6004A94C60063A5C6006BA5C600BDC6C600298CCE00398CCE002994CE00E7DE
                  CE00D6E7CE006BADD6003194DE005AADDE00218CE700298CE7004A9CE70073BD
                  E7008CBDE7009CCEE7002994EF0042A5EF004AB5EF007BBDEF00F7FFEF002994
                  F700319CF700399CF70042A5F70063ADF70052B5F700FF00FF003194FF00399C
                  FF0042A5FF004AADFF004AB5FF0052B5FF006BBDFF006BC6FF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  7777777777777777777777777777777777777777777777777777777777777777
                  7777777777777777777777777726150B0B0B0B0B0B141B243577777777777777
                  777777772D011A0411111111000B0702031322777777777777777777061A0D19
                  1E213B1031103B190D02057777777777777777770F09121E233B202B51184321
                  19080377777777777777777739081E232C43277070304329210C0E7777777777
                  77777777770A1E29431D628080363B2E230B0F77777777777777777777770A20
                  17385D5D612F3233200F77777777777777777777777777161C454C4C46252810
                  0F77777777777777777777777777773F5266676766481F77777777770F0F7777
                  777777777777774C6C717878726C3E777777770F3A230F77777777777777446C
                  797979797979673D7777770F3A230F7777777777777753797A7A7A7A7A7A732A
                  770F0F0F3A230F0F0F7777777740737A7B7B7E7E7B7B74340F23232323232323
                  230F7777775C747B7C7E7D7E7D7E7B3C0F3A3A3A3A233A3A3A0F7777774E6D7D
                  7F7F7F766E767637770F0F0F3A230F0F0F777777775B495E646453555654603D
                  7777770F3A230F7777777777774042575A636F75685F41777777770F3A230F77
                  7777777777774256636A6A6965583D77777777770F0F7777777777777777774A
                  59636B6A4D3D777777777777777777777777777777777777504B4F4740777777
                  7777777777777777777777777777777777777777777777777777777777777777
                  7777777777777777777777777777777777777777777777777777}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Endere'#231'os Adicionais'
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'CST para o Cliente'
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 179
                Enabled = False
                Visible = False
                ExplicitLeft = 179
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 299
              ExplicitHeight = 299
              inherited ScrollBox2: TScrollBox
                Height = 282
                ExplicitHeight = 282
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 847
          ExplicitHeight = 561
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 854
      Width = 7
      Height = 594
      ExplicitLeft = 854
      ExplicitWidth = 7
      ExplicitHeight = 594
      inherited bMarketingHW: TBitBtn
        Top = 572
        Width = 5
        ExplicitTop = 572
        ExplicitWidth = 5
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 596
    Width = 862
    ExplicitTop = 596
    ExplicitWidth = 862
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 532
    Top = 9
  end
  inherited PopupMenu2: TPopupMenu
    Left = 470
    Top = 3
  end
  inherited Timer1: TTimer
    Left = 590
    Top = 3
  end
end
