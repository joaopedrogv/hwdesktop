inherited frmCadContratosClientes: TfrmCadContratosClientes
  Caption = 'Contratos Clientes'
  ClientHeight = 620
  ClientWidth = 914
  Scaled = False
  ExplicitWidth = 922
  ExplicitHeight = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 914
    Height = 601
    ExplicitWidth = 914
    ExplicitHeight = 601
    inherited Splitter2: TSplitter
      Height = 599
      ExplicitHeight = 599
    end
    inherited PanelLeft: TPanel
      Width = 909
      Height = 599
      ExplicitWidth = 909
      ExplicitHeight = 599
      inherited PageControl1: TPageControl
        Width = 907
        Height = 597
        ExplicitWidth = 907
        ExplicitHeight = 597
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 899
          ExplicitHeight = 566
          inherited ScrollBox1: TScrollBox
            Width = 899
            Height = 566
            ExplicitWidth = 899
            ExplicitHeight = 566
            inherited PageControl3: TPageControl
              Width = 899
              Height = 530
              ActivePage = tsCadastro
              ExplicitWidth = 899
              ExplicitHeight = 530
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 891
                ExplicitHeight = 499
                inherited ScrollBox3: TScrollBox
                  Width = 891
                  Height = 499
                  ExplicitWidth = 891
                  ExplicitHeight = 499
                  inherited GroupBox1: TGroupBox
                    Width = 887
                    ExplicitWidth = 887
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object ScrollBox4: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 891
                  Height = 499
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 870
                    Height = 298
                    Align = alTop
                    Caption = 'Contrato'
                    TabOrder = 0
                    OnEnter = GroupBox4Enter
                    object Panel8: TPanel
                      Left = 2
                      Top = 15
                      Width = 866
                      Height = 281
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      object Label135: TLabel
                        Left = 40
                        Top = 186
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Inicial:'
                      end
                      object Bevel2: TBevel
                        Left = 122
                        Top = 210
                        Width = 452
                        Height = 2
                        Shape = bsTopLine
                      end
                      object Label137: TLabel
                        Left = 1
                        Top = 168
                        Width = 117
                        Height = 13
                        Caption = 'Vig'#234'ncia do Contrato'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label157: TLabel
                        Left = 18
                        Top = 204
                        Width = 100
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Impress'#227'o Boleta'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object LabelObsCtr: TLabel
                        Left = 583
                        Top = 189
                        Width = 108
                        Height = 13
                        Caption = 'Observa'#231#227'o Contrato:'
                      end
                      object Bevel1: TBevel
                        Left = 122
                        Top = 175
                        Width = 452
                        Height = 2
                        Shape = bsTopLine
                      end
                      object Label132: TLabel
                        Left = 52
                        Top = 50
                        Width = 45
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Controle:'
                      end
                      object Label133: TLabel
                        Left = 5
                        Top = 100
                        Width = 92
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia de Vencimento:'
                      end
                      object Label141: TLabel
                        Left = 41
                        Top = 125
                        Width = 56
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Tipo de OS:'
                      end
                      object Label158: TLabel
                        Left = 47
                        Top = 75
                        Width = 50
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Vendedor:'
                      end
                      object Label340: TLabel
                        Left = 367
                        Top = 125
                        Width = 141
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Gerar Contratos a Cada M'#234's:'
                      end
                      object Label6: TLabel
                        Left = 60
                        Top = 26
                        Width = 37
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Cliente:'
                      end
                      object Label134: TLabel
                        Left = 420
                        Top = 256
                        Width = 74
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor Contrato:'
                      end
                      object Label27: TLabel
                        Left = 26
                        Top = 256
                        Width = 71
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor Servi'#231'os:'
                      end
                      object Label28: TLabel
                        Left = 221
                        Top = 256
                        Width = 74
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Valor Produtos:'
                      end
                      object Label29: TLabel
                        Left = 583
                        Top = 138
                        Width = 174
                        Height = 13
                        Caption = 'Observa'#231#227'o REQ/OS/ORC (Cliente):'
                      end
                      object Label30: TLabel
                        Left = 406
                        Top = 99
                        Width = 99
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dia do Faturamento:'
                      end
                      object Label31: TLabel
                        Left = 44
                        Top = 239
                        Width = 35
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Totais'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'Tahoma'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label138: TLabel
                        Left = 1
                        Top = 152
                        Width = 96
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Status do Contrato:'
                      end
                      object Bevel3: TBevel
                        Left = 83
                        Top = 246
                        Width = 491
                        Height = 2
                        Shape = bsTopLine
                      end
                      object Label156: TLabel
                        Left = 40
                        Top = 221
                        Width = 57
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Inicial:'
                      end
                      object Label7: TLabel
                        Left = 47
                        Top = 3
                        Width = 50
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Descri'#231#227'o:'
                      end
                      object Label136: TLabel
                        Left = 456
                        Top = 186
                        Width = 52
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Final:'
                      end
                      object Label32: TLabel
                        Left = 410
                        Top = 152
                        Width = 98
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Data Cancelamento:'
                      end
                      object Label42: TLabel
                        Left = 170
                        Top = 100
                        Width = 157
                        Height = 13
                        Alignment = taRightJustify
                        Caption = 'Dias de Venc Ap'#243's Faturamento:'
                        WordWrap = True
                      end
                      object MaskEdit10: TMaskEdit
                        Tag = 1
                        Left = 100
                        Top = 183
                        Width = 63
                        Height = 21
                        EditMask = '!99/99/0000;1;_'
                        MaxLength = 10
                        TabOrder = 15
                        Text = '  /  /    '
                        OnExit = MaskEdit10Exit
                      end
                      object MaskEdit11: TMaskEdit
                        Tag = 1
                        Left = 511
                        Top = 183
                        Width = 63
                        Height = 21
                        EditMask = '!99/99/0000;1;_'
                        MaxLength = 10
                        TabOrder = 16
                        Text = '  /  /    '
                        OnExit = MaskEdit11Exit
                      end
                      object CheckBox5: TCheckBox
                        Left = 168
                        Top = 220
                        Width = 10
                        Height = 17
                        Hint = 'Adicionar Data Inicial da Impress'#227'o da Boleta'
                        Caption = 'CheckBox5'
                        Enabled = False
                        TabOrder = 18
                      end
                      object MaskEdit16: TMaskEdit
                        Tag = 1
                        Left = 100
                        Top = 218
                        Width = 63
                        Height = 21
                        EditMask = '!99/99/0000;1;_'
                        MaxLength = 10
                        TabOrder = 17
                        Text = '  /  /    '
                        OnExit = MaskEdit16Exit
                      end
                      object MemoObsCtr: TMemo
                        Left = 583
                        Top = 205
                        Width = 282
                        Height = 63
                        Lines.Strings = (
                          'MemoObsCtr')
                        ScrollBars = ssVertical
                        TabOrder = 19
                      end
                      object EditHw2: TEditHw
                        Left = 100
                        Top = 47
                        Width = 63
                        Height = 21
                        TabOrder = 3
                        Text = '                 0'
                        OnExit = EditHw2Exit
                        OnKeyDown = EditHw2KeyDown
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object DBLookupComboBox16: TDBLookupComboBox
                        Left = 172
                        Top = 47
                        Width = 402
                        Height = 21
                        KeyField = 'CODIGO_CTRL'
                        ListField = 'NOME_CTRL'
                        ListSource = DtmClientes.dsCtrl
                        TabOrder = 4
                        OnExit = DBLookupComboBox16Exit
                      end
                      object EditHw3: TEditHw
                        Left = 100
                        Top = 97
                        Width = 63
                        Height = 21
                        TabOrder = 7
                        Text = '                 0'
                        OnExit = EditHw3Exit
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object ComboBox13: TComboBox
                        Left = 100
                        Top = 122
                        Width = 212
                        Height = 21
                        Style = csDropDownList
                        CharCase = ecUpperCase
                        ItemHeight = 0
                        TabOrder = 11
                      end
                      object EditHw5: TEditHw
                        Left = 100
                        Top = 72
                        Width = 63
                        Height = 21
                        TabOrder = 5
                        Text = '                 0'
                        OnExit = EditHw5Exit
                        OnKeyDown = EditHw5KeyDown
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object DBLookupComboBox19: TDBLookupComboBox
                        Left = 172
                        Top = 72
                        Width = 402
                        Height = 21
                        KeyField = 'COD_VENDEDOR'
                        ListField = 'NOME_VENDEDOR'
                        ListSource = DtmClientes.dsColaborador
                        TabOrder = 6
                        OnExit = DBLookupComboBox19Exit
                      end
                      object EditHw6: TEditHw
                        Left = 511
                        Top = 122
                        Width = 63
                        Height = 21
                        TabOrder = 12
                        Text = '                 0'
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object EditHw7: TEditHw
                        Left = 100
                        Top = 24
                        Width = 63
                        Height = 21
                        TabOrder = 1
                        Text = '                 0'
                        OnExit = EditHw7Exit
                        OnKeyDown = EditHw7KeyDown
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object DBLookupComboBox1: TDBLookupComboBox
                        Left = 172
                        Top = 24
                        Width = 402
                        Height = 21
                        KeyField = 'COD_CLIENTE'
                        ListField = 'NOME_CLIENTE'
                        ListSource = DtmClientes.dsConsCliente
                        TabOrder = 2
                        OnExit = DBLookupComboBox1Exit
                      end
                      object EditHw4: TEditHw
                        Left = 496
                        Top = 253
                        Width = 78
                        Height = 21
                        Color = cl3DLight
                        Enabled = False
                        TabOrder = 10
                        Text = '0,00'
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                      object Edit1: TEdit
                        Left = 100
                        Top = 0
                        Width = 474
                        Height = 21
                        CharCase = ecUpperCase
                        TabOrder = 0
                        Text = 'EDIT1'
                      end
                      object EditHw1: TEditHw
                        Left = 100
                        Top = 253
                        Width = 78
                        Height = 21
                        Color = cl3DLight
                        Enabled = False
                        TabOrder = 20
                        Text = '0,00'
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                      object EditHw8: TEditHw
                        Left = 298
                        Top = 253
                        Width = 78
                        Height = 21
                        Color = cl3DLight
                        Enabled = False
                        TabOrder = 21
                        Text = '0,00'
                        Formato = fNumber
                        FormatSize = '0.2'
                      end
                      object MemoObsReqOs: TMemo
                        Left = 583
                        Top = 153
                        Width = 282
                        Height = 30
                        Color = cl3DLight
                        Enabled = False
                        ScrollBars = ssVertical
                        TabOrder = 22
                      end
                      object EditHw10: TEditHw
                        Left = 511
                        Top = 97
                        Width = 63
                        Height = 21
                        TabOrder = 9
                        Text = '                 0'
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      object ComboBox9: TComboBox
                        Left = 100
                        Top = 149
                        Width = 212
                        Height = 21
                        Style = csDropDownList
                        ItemHeight = 0
                        TabOrder = 13
                        OnExit = ComboBox9Exit
                        Items.Strings = (
                          'Ativo'
                          'Inativo'
                          'Pausado'
                          'Prescrito'
                          'Rescindido'
                          'Em Debito'
                          'Expirado'
                          'Cancelado'
                          'Cobran'#231'a Suspensa')
                      end
                      object MaskEdit4: TMaskEdit
                        Tag = 1
                        Left = 511
                        Top = 149
                        Width = 63
                        Height = 21
                        EditMask = '!99/99/0000;1;_'
                        MaxLength = 10
                        TabOrder = 14
                        Text = '  /  /    '
                        OnExit = MaskEdit4Exit
                      end
                      object EditHw11: TEditHw
                        Left = 330
                        Top = 97
                        Width = 63
                        Height = 21
                        TabOrder = 8
                        Text = '                 0'
                        OnExit = EditHw11Exit
                        Formato = fInteger
                        FormatSize = '0.2'
                      end
                      inline FrameCheckListaContato: TFrameCheckListaContato
                        Left = 583
                        Top = -3
                        Width = 279
                        Height = 139
                        TabOrder = 23
                        TabStop = True
                        ExplicitLeft = 583
                        ExplicitTop = -3
                        ExplicitWidth = 279
                        ExplicitHeight = 139
                        inherited GroupBoxContato: TGroupBox
                          Width = 279
                          Height = 139
                          ExplicitWidth = 279
                          ExplicitHeight = 139
                          inherited CheckListBoxContato: TCheckListBox
                            Width = 178
                            Height = 91
                            ExplicitWidth = 178
                            ExplicitHeight = 91
                    end
                          inherited pnContato: TPanel
                            Top = 106
                            Width = 275
                            ExplicitTop = 106
                            ExplicitWidth = 275
                            inherited bt_contatos_pla_add: TSpeedButton
                              Left = 182
                              ExplicitLeft = 182
                  end
                            inherited bt_contatos_pla_edit: TSpeedButton
                              Left = 211
                              ExplicitLeft = 211
                            end
                            inherited bt_contatos_pla_del: TSpeedButton
                              Left = 240
                              ExplicitLeft = 240
                            end
                            inherited bt_contatos_pla_outros_add: TSpeedButton
                              Left = 271
                              ExplicitLeft = 271
                            end
                            inherited bt_contatos_pla_outros_del: TSpeedButton
                              Left = 300
                              ExplicitLeft = 300
                            end
                          end
                          inherited CheckListBoxAplicativo: TCheckListBox
                            Left = 180
                            Height = 91
                            ExplicitLeft = 180
                            ExplicitHeight = 91
                          end
                        end
                      end
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 337
                    Width = 870
                    Height = 168
                    Align = alTop
                    TabOrder = 1
                    object PageControl2: TPageControl
                      Left = 2
                      Top = 15
                      Width = 866
                      Height = 151
                      ActivePage = tsProdutosCtrCad
                      Align = alClient
                      Style = tsFlatButtons
                      TabOrder = 0
                      object tsServicosCtrCons: TTabSheet
                        Caption = 'Servi'#231'os'
                        ImageIndex = 3
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object DBGridServCtr: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 858
                          Height = 87
                          Align = alClient
                          DataSource = DtmClientes.dsContratoClServ
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnKeyDown = DBGridServCtrKeyDown
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'COD_SERVICO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESC_SERVICO'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QTDE'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR_UN'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR_TOT'
                              Visible = True
                            end>
                        end
                        object Panel12: TPanel
                          Left = 0
                          Top = 87
                          Width = 858
                          Height = 33
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 1
                          object BitBtnServIncluir: TBitBtn
                            Left = 313
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Incluir - [CLI282]'
                            Caption = 'Incluir'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            OnClick = BitBtnServIncluirClick
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
                          object BitBtnServAlterar: TBitBtn
                            Left = 394
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Alterar - [CLI283]'
                            Caption = 'Alterar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            OnClick = BitBtnServAlterarClick
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
                          object BitBtnServExcluir: TBitBtn
                            Left = 475
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Apagar - [CLI284]'
                            Caption = 'Apagar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            OnClick = BitBtnServExcluirClick
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
                      object tsProdutosCtrCons: TTabSheet
                        Caption = 'Produtos'
                        ImageIndex = 3
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object DBGridProdCtr: TDBGrid
                          Left = 0
                          Top = 0
                          Width = 858
                          Height = 87
                          Align = alClient
                          DataSource = DtmClientes.dsContratoClProd
                          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -11
                          TitleFont.Name = 'Tahoma'
                          TitleFont.Style = []
                          OnKeyDown = DBGridProdCtrKeyDown
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'GRUPO_PROD'
                              Width = 60
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_PROD'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'COD_GRADE'
                              Width = 55
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'NUM_FAB_PROD'
                              Width = 64
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'DESCR_PROD'
                              Width = 369
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'QTDE'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR_UN'
                              Visible = True
                            end
                            item
                              Expanded = False
                              FieldName = 'VALOR_TOT'
                              Visible = True
                            end>
                        end
                        object Panel11: TPanel
                          Left = 0
                          Top = 87
                          Width = 858
                          Height = 33
                          Align = alBottom
                          BevelKind = bkTile
                          BevelOuter = bvNone
                          TabOrder = 1
                          object BitBtnProdIncluir: TBitBtn
                            Left = 314
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Incluir - [CLI286]'
                            Caption = 'Incluir'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 0
                            OnClick = BitBtnProdIncluirClick
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
                          object BitBtnProdAlterar: TBitBtn
                            Left = 395
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Alterar - [CLI287]'
                            Caption = 'Alterar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 1
                            OnClick = BitBtnProdAlterarClick
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
                          object BitBtnProdExcluir: TBitBtn
                            Left = 476
                            Top = 2
                            Width = 75
                            Height = 25
                            Hint = 'Apagar - [CLI288]'
                            Caption = 'Apagar'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = [fsBold]
                            ParentFont = False
                            TabOrder = 2
                            OnClick = BitBtnProdExcluirClick
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
                            Left = 10
                            Top = 2
                            Width = 97
                            Height = 25
                            Hint = 'Pedidos NFe'
                            Caption = 'Pedidos NFe'
                            Font.Charset = ANSI_CHARSET
                            Font.Color = clWindowText
                            Font.Height = -11
                            Font.Name = 'MS Sans Serif'
                            Font.Style = []
                            ParentFont = False
                            TabOrder = 3
                            OnClick = BitBtn12Click
                            Glyph.Data = {
                              36050000424D3605000000000000360400002800000010000000100000000100
                              08000000000000010000320B0000320B00000001000000010000EFA54A00C684
                              6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00B5848400B58C
                              8400CE9C8400B5948C00C6A59400EFCE9400C6A59C00EFCE9C00F7D69C00C6AD
                              A500F7D6A500CEB5AD00D6B5AD00C6BDAD00F7D6AD00D6BDB500DEBDB500DEC6
                              B500E7C6B500EFCEB500F7D6B500F7DEB500EFCEBD00F7DEBD00E7DEC600F7DE
                              C600F7E7C600E7CECE00E7D6CE00F7E7CE00F7E7D600FFEFD600FFEFDE00FFEF
                              E700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002E2E08080808
                              0808080808080808082E2E2E0E27221F1D16120F0D0D0D10082E2E2E0E270E0E
                              0E0E0E0E0E0E0E0F082E2E2E11292625211F1C160F0F0D0F082E2E2E112A2625
                              22211D1C160F0F0D082E2E2E132D0E0E0E0E0E0E0E0E0E0F082E2E2E142F2B29
                              262522211F161212082E2E2E172F2C2B28262522211F1C16082E2E2E172F0E0E
                              0E0E0E0E0E0E0E1D082E2E2E182F2F2F2C2928262521211C082E2E2E192F2F2F
                              2F2C292828272015082E2E2E1A2F0E0E0E0E0E2B260C0B09082E2E2E1A2F2F2F
                              2F2F2F2D23020400012E2E2E1E2F2F2F2F2F2F2F240705032E2E2E2E1A2C2B2B
                              2B2B2B2B23070A2E2E2E2E2E1A1B1B1B1B1A1A1B17062E2E2E2E}
                          end
                        end
                      end
                      object tsServicosCtrCad: TTabSheet
                        Caption = 'Servi'#231'os Cad'
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object pnCadServicosCtr: TPanel
                          Left = 0
                          Top = 0
                          Width = 858
                          Height = 120
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = pnCadServicosCtrEnter
                          object Panel25: TPanel
                            Left = 0
                            Top = 0
                            Width = 858
                            Height = 87
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label15: TLabel
                              Left = 32
                              Top = 8
                              Width = 61
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Cod Servi'#231'o:'
                            end
                            object Label16: TLabel
                              Left = 33
                              Top = 36
                              Width = 60
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Quantidade:'
                            end
                            object Label17: TLabel
                              Left = 215
                              Top = 36
                              Width = 68
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Unit'#225'rio:'
                            end
                            object Label26: TLabel
                              Left = 462
                              Top = 36
                              Width = 55
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Total:'
                            end
                            object EditHwCodServ: TEditHw
                              Left = 96
                              Top = 5
                              Width = 63
                              Height = 21
                              TabOrder = 0
                              Text = '                 0'
                              OnExit = EditHwCodServExit
                              OnKeyDown = EditHwCodServKeyDown
                              Formato = fInteger
                              FormatSize = '0.2'
                            end
                            object DBLookupComboBoxCodServ: TDBLookupComboBox
                              Left = 167
                              Top = 5
                              Width = 433
                              Height = 21
                              KeyField = 'COD_SERVICO'
                              ListField = 'DESC_SERVICO'
                              ListSource = DtmClientes.dsTipServ
                              TabOrder = 1
                              OnExit = DBLookupComboBoxCodServExit
                            end
                            object EditHwQtdeServ: TEditHw
                              Left = 96
                              Top = 33
                              Width = 80
                              Height = 21
                              TabOrder = 2
                              Text = '0,00'
                              OnExit = EditHwQtdeServExit
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                            object EditHwValorUnServ: TEditHw
                              Left = 287
                              Top = 33
                              Width = 78
                              Height = 21
                              TabOrder = 3
                              Text = '0,00'
                              OnExit = EditHwValorUnServExit
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                            object EditHwValorTotServ: TEditHw
                              Left = 522
                              Top = 33
                              Width = 78
                              Height = 21
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 4
                              Text = '0,00'
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                          end
                          object Panel17: TPanel
                            Left = 0
                            Top = 87
                            Width = 858
                            Height = 33
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            object BitBtnServOK: TBitBtn
                              Left = 355
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'OK - [CLI285]'
                              Caption = 'OK'
                              TabOrder = 0
                              OnClick = BitBtnServOKClick
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
                            object BitBtnServCancel: TBitBtn
                              Left = 436
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Cancelar'
                              Caption = 'Cancela'
                              TabOrder = 1
                              OnClick = BitBtnServCancelClick
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
                      object tsProdutosCtrCad: TTabSheet
                        Caption = 'Produtos Cad'
                        ImageIndex = 1
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object pnCadProdutosCtr: TPanel
                          Left = 0
                          Top = 0
                          Width = 858
                          Height = 120
                          Align = alClient
                          BevelOuter = bvNone
                          TabOrder = 0
                          OnEnter = pnCadProdutosCtrEnter
                          object Panel26: TPanel
                            Left = 0
                            Top = 0
                            Width = 858
                            Height = 87
                            Align = alClient
                            BevelOuter = bvNone
                            TabOrder = 0
                            object Label18: TLabel
                              Left = 22
                              Top = 8
                              Width = 71
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Num Fab Prod:'
                            end
                            object Label19: TLabel
                              Left = 222
                              Top = 8
                              Width = 55
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Cod Grade:'
                            end
                            object Label20: TLabel
                              Left = 48
                              Top = 36
                              Width = 45
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Decri'#231#227'o:'
                            end
                            object Label21: TLabel
                              Left = 33
                              Top = 62
                              Width = 60
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Quantidade:'
                            end
                            object Label22: TLabel
                              Left = 209
                              Top = 62
                              Width = 68
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Unit'#225'rio:'
                            end
                            object Label23: TLabel
                              Left = 375
                              Top = 8
                              Width = 33
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Grupo:'
                            end
                            object Label24: TLabel
                              Left = 465
                              Top = 8
                              Width = 48
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Cod Prod:'
                            end
                            object Label25: TLabel
                              Left = 458
                              Top = 62
                              Width = 55
                              Height = 13
                              Alignment = taRightJustify
                              Caption = 'Valor Total:'
                            end
                            object EditNumFabProd: TEdit
                              Left = 96
                              Top = 5
                              Width = 111
                              Height = 21
                              CharCase = ecUpperCase
                              ParentShowHint = False
                              ShowHint = False
                              TabOrder = 0
                              Text = 'EDITNUMFABPROD'
                              OnExit = EditNumFabProdExit
                              OnKeyDown = EditNumFabProdKeyDown
                            end
                            object EditCodGradeProd: TEdit
                              Left = 281
                              Top = 5
                              Width = 74
                              Height = 21
                              CharCase = ecUpperCase
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 1
                              Text = 'EDITCODGRADEPROD'
                            end
                            object EditDescricaoProd: TEdit
                              Left = 96
                              Top = 33
                              Width = 499
                              Height = 21
                              CharCase = ecUpperCase
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 2
                              Text = 'EDITDESCRICAOPROD'
                            end
                            object EditHwQtdeProd: TEditHw
                              Left = 96
                              Top = 60
                              Width = 78
                              Height = 21
                              TabOrder = 3
                              Text = '0,00'
                              OnExit = EditHwQtdeProdExit
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                            object EditHwValorUnProd: TEditHw
                              Left = 281
                              Top = 60
                              Width = 78
                              Height = 21
                              TabOrder = 4
                              Text = '0,00'
                              OnExit = EditHwValorUnProdExit
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                            object EditGrupoProd: TEdit
                              Left = 412
                              Top = 5
                              Width = 47
                              Height = 21
                              CharCase = ecUpperCase
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 5
                              Text = 'EDITCODGRADEPROD'
                            end
                            object EditCodProd: TEdit
                              Left = 517
                              Top = 5
                              Width = 78
                              Height = 21
                              CharCase = ecUpperCase
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 6
                              Text = 'EDITCODGRADEPROD'
                            end
                            object EditHwValorTotProd: TEditHw
                              Left = 517
                              Top = 60
                              Width = 78
                              Height = 21
                              Color = cl3DLight
                              Enabled = False
                              TabOrder = 7
                              Text = '0,00'
                              Formato = fNumber
                              FormatSize = '0.2'
                            end
                          end
                          object Panel18: TPanel
                            Left = 0
                            Top = 87
                            Width = 858
                            Height = 33
                            Align = alBottom
                            BevelKind = bkTile
                            BevelOuter = bvNone
                            TabOrder = 1
                            object BitBtnProdOK: TBitBtn
                              Left = 355
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'OK - [CLI289]'
                              Caption = 'OK'
                              TabOrder = 0
                              OnClick = BitBtnProdOKClick
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
                            object BitBtnProdCancel: TBitBtn
                              Left = 436
                              Top = 2
                              Width = 75
                              Height = 25
                              Hint = 'Cancelar'
                              Caption = 'Cancela'
                              TabOrder = 1
                              OnClick = BitBtnProdCancelClick
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
                      object tabPedidoCompra: TTabSheet
                        Caption = 'tabPedidoCompra'
                        ImageIndex = 4
                        ExplicitLeft = 0
                        ExplicitTop = 0
                        ExplicitWidth = 0
                        ExplicitHeight = 0
                        object lbNotasPedido: TLabel
                          Left = 18
                          Top = 4
                          Width = 259
                          Height = 13
                          Caption = 'Ultimos Pedidos de Compra NFe registrados do Cliente'
                        end
                        object SpeedButton10: TSpeedButton
                          Left = 494
                          Top = 23
                          Width = 23
                          Height = 22
                          Cursor = crHandPoint
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
                          OnClick = SpeedButton10Click
                        end
                        object SpeedButton13: TSpeedButton
                          Left = 494
                          Top = 51
                          Width = 23
                          Height = 22
                          Cursor = crHandPoint
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
                          OnClick = SpeedButton13Click
                        end
                        object lbxPedidos: TListBox
                          Left = 18
                          Top = 23
                          Width = 470
                          Height = 96
                          Style = lbOwnerDrawFixed
                          Color = clBtnFace
                          Ctl3D = False
                          ItemHeight = 16
                          ParentCtl3D = False
                          TabOrder = 0
                        end
                      end
                    end
                  end
                  object GroupBoxOpcao: TGroupBox
                    Left = 0
                    Top = 298
                    Width = 870
                    Height = 39
                    Align = alTop
                    Caption = 'Gerar'
                    TabOrder = 2
                    object ckNFS: TCheckBox
                      Left = 52
                      Top = 15
                      Width = 91
                      Height = 17
                      Caption = 'NFS'
                      TabOrder = 0
                    end
                    object ckNF: TCheckBox
                      Left = 148
                      Top = 15
                      Width = 97
                      Height = 17
                      Caption = 'NF'
                      TabOrder = 1
                    end
                    object ckRecibo: TCheckBox
                      Left = 251
                      Top = 15
                      Width = 113
                      Height = 17
                      Caption = 'Recibo Loca'#231#227'o'
                      TabOrder = 2
                    end
                    object ckBoleto: TCheckBox
                      Left = 368
                      Top = 15
                      Width = 108
                      Height = 17
                      Caption = 'Boleto'
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 530
              Width = 899
              Height = 36
              ExplicitTop = 530
              ExplicitWidth = 899
              ExplicitHeight = 36
              inherited LabelSeq: TLabel
                Top = 11
                ExplicitTop = 11
              end
              inherited BitBtn4: TBitBtn
                Left = 367
                Top = 4
                Hint = 'OK - [CLI183]'
                ExplicitLeft = 367
                ExplicitTop = 4
              end
              inherited BitBtn5: TBitBtn
                Left = 448
                Top = 4
                ExplicitLeft = 448
                ExplicitTop = 4
              end
              inherited BitBtn6: TBitBtn
                Top = 4
                ExplicitTop = 4
              end
              inherited CheckCadSeq: TCheckBox
                Top = 10
                ExplicitTop = 10
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 899
          ExplicitHeight = 566
          inherited GroupBox3: TGroupBox
            Width = 899
            Height = 195
            ExplicitWidth = 899
            ExplicitHeight = 195
            inherited imgInformation: TImage
              Left = 873
              Height = 178
              ExplicitLeft = 868
              ExplicitHeight = 168
            end
            object btSelectAll: TSpeedButton [6]
              Left = 631
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
              Left = 660
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
            object SpeedButton55: TSpeedButton [8]
              Left = 707
              Top = 46
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CLI206]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CLI174]'
            end
            inherited CheckBox3: TCheckBox
              Width = 89
              ExplicitWidth = 89
            end
            inherited CheckBox1: TCheckBox
              Left = 359
              Width = 86
              ExplicitLeft = 359
              ExplicitWidth = 86
            end
            object groupAdicional: TGroupBox
              Left = 251
              Top = 70
              Width = 611
              Height = 124
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              OnExit = groupAdicionalExit
              object Label109: TLabel
                Left = 6
                Top = 52
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label110: TLabel
                Left = 16
                Top = 26
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 143
                Top = 52
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label112: TLabel
                Left = 210
                Top = 25
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 18
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
                Top = 44
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 173
                Top = 44
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
                Top = 44
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
                Top = 19
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
            object GroupBox5: TGroupBox
              Left = 1
              Top = 70
              Width = 250
              Height = 124
              Caption = 'Op'#231#245'es Avan'#231'adas'
              TabOrder = 12
              Visible = False
              object GroupBox9: TGroupBox
                Left = 2
                Top = 15
                Width = 246
                Height = 107
                Align = alClient
                Caption = 'Status'
                TabOrder = 0
                object CheckListBox1: TCheckListBox
                  Left = 2
                  Top = 15
                  Width = 242
                  Height = 90
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  Columns = 2
                  Ctl3D = False
                  ItemHeight = 13
                  Items.Strings = (
                    'Ativo'
                    'Inativo'
                    'Pausado'
                    'Prescrito'
                    'Rescindido'
                    'Em Debito'
                    'Expirado'
                    'Cancelado'
                    'Cobran'#231'a Suspensa')
                  ParentCtl3D = False
                  TabOrder = 0
                end
              end
            end
            object pnCadIncompleto: TPanel
              Left = 744
              Top = 52
              Width = 99
              Height = 13
              BevelOuter = bvNone
              Caption = 'Cad Incompleto'
              Color = 12315647
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 13
            end
            object ckERP: TCheckBox
              Left = 456
              Top = 48
              Width = 67
              Height = 17
              Hint = 'ERP'
              Caption = 'ERP (F5)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
            end
            object ckVindi: TCheckBox
              Left = 530
              Top = 48
              Width = 92
              Height = 19
              Hint = 'Pagamento Online'
              Caption = 'Pag Online (F6)'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 15
            end
            object pnVindi: TPanel
              Left = 744
              Top = 32
              Width = 99
              Height = 13
              BevelOuter = bvNone
              Caption = 'Pag Online'
              Color = 12910532
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 16
            end
          end
          inherited Panel1: TPanel
            Top = 195
            Width = 899
            Height = 371
            ExplicitTop = 195
            ExplicitWidth = 899
            ExplicitHeight = 371
            inherited Splitter1: TSplitter
              Height = 310
              ExplicitHeight = 264
            end
            inherited DBGrid1: TDBGrid
              Width = 606
              Height = 310
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 895
              ExplicitWidth = 895
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CLI175]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CLI176]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 636
                Enabled = False
                Visible = False
                ExplicitLeft = 636
              end
              inherited SpeedButton4: TSpeedButton
                Left = 522
                Enabled = False
                Visible = False
                ExplicitLeft = 522
              end
              inherited SpeedButton5: TSpeedButton
                Left = 750
                Enabled = False
                Visible = False
                ExplicitLeft = 750
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Faturamento Contratos Gerados - [CLI211]'
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
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Atualizar informa'#231#245'es dos contratos - [CLI262]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000392918003131
                  3100EFA5390021214A007B5A4A0073635200EFA55200FFB5520018425A00846B
                  5A000842630021526B0052636B00E7AD6B00F7BD6B00AD7B7300AD847300B584
                  730029637B00AD7B7B0084847B008C847B00AD738400AD7B8400B57B8400B584
                  8400BD848400E7B58400BD848C00C68C8C009C948C00CE948C00DEA58C00EFC6
                  8C00D69C9400DEA59400EFCE94004A6B9C009C9C9C00EFCE9C00CEADA500EFCE
                  A500F7D6A500CEBDAD00F7D6AD00E7CEB500F7D6B500F7DEB5003139BD00DEC6
                  BD00E7CEBD00EFD6BD00F7DEBD008CB5C600E7CEC600EFCEC600EFDEC600F7DE
                  C600F7E7C600E7D6CE00E7DECE00F7DECE00F7E7CE0010A5D600D6D6D600E7D6
                  D600EFDED600F7E7D60042A5DE00DEDEDE00F7E7DE00F7EFDE000010E700F7EF
                  E700299CEF00F7EFEF00FFF7EF002973F70042E7F700FFF7F700FFFFF700FF00
                  FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151131919
                  191919191919191919191919191919195151515151093838382F2E2C2A272724
                  24242424242424195151515151093838434343434343434343434343423E4219
                  5151515151094238212121212121212121212121424242195151515151094242
                  4239343434343434343434344242421951515151510942424343434343434343
                  4343434342424219515151515109423C2121212121010C26262621213E424219
                  51515151510F313E3E3E3E3E400400120C2C3E3E3E423419515151515109261E
                  1E262626264035534D0B26262626241951510404040404040404040404265253
                  4D4D0B040404040404040451510F413B3B494947433E3E3F4E4D4D082C292719
                  51040451510F313102020202020202263F4E4D4D0B2629195104045151092626
                  2727272727272727273F4E4D4D0A291951040404040404040404040404040404
                  04043F4E4D30010404045151510F545454545454545454545454263F44151401
                  5151515151115054545454545454545454543E3E095449050351515151115454
                  21212121212121212121213C2B1E2D124D305151511154545454545454545454
                  54545454540F254A4D305151511F5454545454545454504F5454545454540F48
                  48515151511F545443434343434343434343434349490F5151515151511F5454
                  2121212121212121212121214B490F5151515151511F54545454545454545454
                  504F4F4C4C4B0F5151515151511F545454545454545454545454504F4F4C0F51
                  51515151511F1111111111111111111111111111111109515151}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Hint = 'Reajustar valor do servi'#231'os dos contratos - [CLI213] '
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C0060000110B0000110B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFCFCBC6B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3
                  A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8C4BFB8F9F9F7FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF837A6C7A6E538F7F588F7F588F7F588F7F588F7F58
                  8F7F588F7F588F7F588F7F588F7F588F7F588F7F588F7F588475526E644CF9F9
                  F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D634DFFEEC9FFE19EFFE19EFF
                  E19EFFE19EFFE19EFFE19EFFE19EFFE19EFFE19EFFE19EFFE19EFFE19EFFE19E
                  FFDC90847353C6C2B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644FA599
                  826B614B6B614BA79572695E49645B46645A45BBA67B6C614B6E64506C614BD8
                  C08F6A5E496E64507E7357897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF6E644F8A7F6AB3AEA2B3AEA28A7C61655A46F1EFEC6C63509587646D63
                  4EF1EFEC6D634EBBA87D877F6DF1EFEC6E624D897A57BBB7ADFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6E644FA599826B614B6B614BA59471695E49645B46
                  655A45BBA67B6B624B6E64506C614BD8C08F695F4A6E64507E7357897A57BBB7
                  ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644FF7E9CEBBA87DBCA87DF7
                  DEA5E8D19AB8A47AC6B185FFE4A9D6C08FB8A47AD8C08FFFE4A9C6B183B8A47A
                  EACE93897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644F9388
                  717B725E7B725E9384667267508D84726E6450C7B2856A5E498D84726A5E49C7
                  B2856E64508D847272674F897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF6E644F8A7F6AB3AEA2B3AEA28A7C616E624DF1EFEC877F6DBBA87D6D63
                  4EF1EFEC6D634EBBA87D877F6DF1EFEC6E624D897A57BBB7ADFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6E644FC1B39C70644F70644FC1AE829A8B6B6E644E
                  736851E8D19A7E73586E644E7F7359E8D19A7267506E644E9D8C68897A57BBB7
                  ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644FDFD2B7897B5F897B5FDF
                  C895C1AE8285785D908363F7DEA5A4937085785DA4946FF7DEA590836385785D
                  C2AD7D897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644F8D82
                  6C8E87778E87778D7F626F634EB1AA9E786D5ABFAA7F695F4AB1AA9E695F4ABF
                  AA7F786D5AB1AA9E6F634D897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF6E644F8D826C8E87778E87778D7F626F634EB1AA9E786D5ABFAA7F695F
                  4AB1AA9E695F4ABFAA7F786D5AB1AA9E6F634D897A57BBB7ADFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6E644FDDD1B6908364908364DDC694C1AC82908263
                  958767F7DEA5A69673908263A69672F7DEA5968666908263C1AB7C897A57BBB7
                  ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644FFFF1D4FFE4A9FFE4A9FF
                  E4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9FFE4A9
                  FFE19F897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8376A599
                  7F6A61476C644A6C644A6C644A6C644A6C644A6C644A6C644A6C644A6C644A6C
                  644A6C644A6C644A7D7352897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFB1ACA0897F669FAF57CDF065CDF065CDF065CDF065CDF065CDF065CDF0
                  65CDF065CDF065CDF065A6B958B5CE5D6D624A897A57BBB7ADFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6E644F897F669FAF57CDF065CDF065CDF065CDF065
                  CDF065CDF065CDF065CDF065CDF065CDF065BCD760C3E4636D624A897A57BBB7
                  ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644F897F669FAF57CDF065CD
                  F065CDF065CDF065CDF065CDF065CDF065CDF065CDF065CDF065CDF065CDF065
                  6D624A897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E644F897F
                  669FAF57CDF065CDF065CDF065CDF065CDF065CDF065CDF065CDF065CDF065CD
                  F065CDF065CDF0656D624A897A57BBB7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF6E644F8980679FAF57CDF065CDF065CDF065CDF065CDF065CDF065CDF0
                  65CDF065CDF065CDF065CDF065CDF0656D624A897A57BBB7ADFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF6D634DC0BBB06F654C6D644C6D644C6D644C6D644C
                  6D644C6D644C6D644C6D644C6D644C6D644C6D644C6D644C9B8F6A817456C6C2
                  B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF817B6978705D837D6B837D6B83
                  7D6B837D6B837D6B837D6B837D6B837D6B837D6B837D6B837D6B837D6B837D6B
                  807769706550F9F9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECC
                  C5B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8B3A8B8
                  B3A8B8B3A8B8B3A8C4BFB8F9F9F7FFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton8Click
              end
              inherited SpeedButton11: TSpeedButton
                Left = 522
                Enabled = False
                Visible = False
                ExplicitLeft = 522
              end
              inherited SpeedButton23: TSpeedButton [9]
                Left = 121
                Hint = 'Relat'#243'rio de Contratos - [CLI177]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000630F0000630F000000010000000100002C6930003283
                  3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                  ED00A7C8E900B7D2ED00C7DCF100E7F0F900F7FFFF0000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000060606060606
                  0606060606060606060606060606060606060606060606060606060606060606
                  0606060606060606060606060705050505050505050505050505050505050505
                  06060606070D0D0D0D0D0C0C0C0C0B0B0B0B0B0A0A0A0A0506060606070E0000
                  00000000000000000000000000000A0506060606070E000E0E080E0E080E0E0E
                  0E0E080E0E000A0506060606070E000404080404080404040404080404000B05
                  06060606090E000E0E080E0E080E0E0E0E0E080E0E000B0506060606090E0004
                  04080404080404040404080404000B0506060606090E000E0E080E0E080E0E0E
                  0E0E080E0E000C0506060606090E000404080404080404040404080404000C05
                  06060606090E000E0E080E0E080E0E0E0E0E080E0E000C0506060606090E0004
                  04080404080404040404080404000C0506060606090E000E0E080E0E080E0E0E
                  0E0E080E0E000C0506060606090E000000000000000000000000000000000D05
                  06060606090E0E0E0E0E0E0E0E0E0E0E0E0E0E0D0D0D0D0506060606090E0E0E
                  0E000000000000000000000E0D0D0D0506060606090E0E0E0E0E0E0E0E0E0E0E
                  0E0E0E0E0E0D0D0506060606090E0E00000000000000000000000000000D0D05
                  06060606090E0E04040404040403030303020202010E0D0506060606090E0E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0D0506060606090909090909090909090909
                  0909090907070707060606060606060606060606060606060606060606060606
                  0606060606060606060606060606060606060606060606060606}
                OnClick = SpeedButton23Click
                ExplicitLeft = 121
              end
              inherited SpeedButton24: TSpeedButton [10]
                Left = 178
                Hint = 'Hist'#243'rico do Contrato - [CLI178]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000D30E0000D30E00000001000000010000CE392900216B
                  290021842900D64A31002973310039393900396B3900299439007B394200F794
                  420039424A00394A4A00424A4A009C4A4A004A6B4A004A734A00183952002142
                  5200525A52004A635200527B520039845200D69452005A5A5A005A6B5A005A7B
                  5A0039A55A0063316300294A6300945A63009463630008396B00314A6B003152
                  6B00EFAD6B00104273007B427300104A7300734A73004ABD7300EFBD73007B29
                  7B0029527B00295A7B0042637B004A637B006B737B007B847B00AD947B0052AD
                  7B008429840021528400426384006B738400847B840084848400848C84006BB5
                  840021528C00215A8C0042638C008C638C00426B8C004A6B8C00947B8C008C84
                  8C008C8C8C00942994002963940039639400316B94004A6B9400738494009484
                  94007B8C9400848C9400948C9400949494007B9C940073BD94006BC694009C31
                  9C0073849C00848C9C007B949C0094949C009C949C009C9C9C0073CE9C00396B
                  A500427BA500A57BA500A58CA5008494A500949CA500A59CA50084A5A5009CA5
                  A500A5A5A500AD39AD00AD42AD00AD6BAD004A84AD00949CAD00ADA5AD00ADAD
                  AD004A7BB5004A84B500528CB5006B9CB500A5ADB500B5ADB500B5B5B5004A84
                  BD00528CBD005A8CBD005A94BD00B5B5BD00BDB5BD00BDBDBD00C66BC6005A8C
                  C6005A94C600C694C60094ADC600A5B5C600ADBDC600B5BDC600C6BDC600C6C6
                  C600CE73CE00CE8CCE005A94CE006394CE006B9CCE00B5BDCE005AC6CE00CEC6
                  CE00CECECE00DECECE00639CD6006B9CD6009CB5D6009CBDD600D6CED600D6D6
                  D600CEDED600BDEFD6006BA5DE00DED6DE00DEDEDE007BADE7007BB5E7006BC6
                  E700E7DEE70073E7E700E7E7E70084BDEF008CBDEF00EFE7EF00E7EFEF00EFEF
                  EF005ADEF700F7EFF700F7FFF700FF00FF0042F7FF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5A5A5A5A5
                  A5A5A5170537A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A52E346B2B0C37A5
                  A5A5A5A5A5A5A5A5A5A5A5A5A5A5A52E3C7A8572462B0C37A5A5A5A5A5A5A5A5
                  A5A5A5A5A52E3E7A858D857246462B0C37A5A5A5A5A5A5A5A5A5A5353F79858C
                  867A8C724646462B0C37A5A5A5A5A5A5A5A5A51C85857972466C8D7246464646
                  2B0B37A5A5A5A5A5A5A5A51C853346461F5985725A864646462B0B37A5A5A5A5
                  A5A5A51C8523253B6B8C979D7C48744646462B0B37A5A5A5A5A5A51C85336B8C
                  979E8E758A367D664646462B0B37A5A5A5A5A51C858C979E8E758990914C7067
                  6C4646462B0B37A5A5A5A521979E8F7F8A969595954D76694A734646462B0B2F
                  A5A5A52C6A5E9A9C9C9AA195686F776F417E664646462B0CA5A5A5554555A4A1
                  A092694276956F764D805D6C46464611A5A5A5A56E57A49358155F9580577095
                  4D815F5373464611A5A5A5A5A514501A04188349689090766F81683787664611
                  A5A5A5A5A5060112657851408B76567695776F4D8A206611A5A5A5A5A5A54D43
                  51243028165F95896268954D90103B2CA5A5A5A5A5A5A526082209031E9B605F
                  89958062902D3F4BA5A5A5A5A5A5A5A50D001D88A6A25491804D69958937A5A5
                  A5A5A5A5A5A5A5A5A54D99A26D4E4F314C95906969A5A5A5A5A5A5A5A5A5A5A5
                  A5A548133927070F7B5C68A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A519020E5B82
                  643DA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A54D32642949A5A5A5A5A5A5A5
                  A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5}
                OnClick = SpeedButton24Click
                ExplicitLeft = 178
              end
              inherited SpeedButton25: TSpeedButton [11]
                Left = 693
                Enabled = False
                Visible = False
                ExplicitLeft = 693
              end
              inherited SpeedButton26: TSpeedButton [12]
                Left = 235
                Hint = 'Equipamentos com Contrato - [CLI179]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000CE630000D66B
                  0000D6730000DE7B0000D6731000D67B2100CE636300E7A563009C9C9C00FF9C
                  9C00FFEFD600FFF7EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000000000000000000
                  0C0C0C0C000D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000C0C0C0C000D0B0B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B060B0B06060B06060B
                  06060B06060B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B06
                  0B0B09090B09090B09090B09090B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C000D0B060B0B09090B09090B09090B09090B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B06
                  0B0B09090B09090B09090B09090B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C000D0B08080808080808080808080808080B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B0B
                  0B0B09090B09090B09090B09090B0A000C0C0C0C010D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C010D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0A00
                  0C0C0C0C02030303030303030303030303030303030303000C0C0C0C00000000
                  000000000000000000000000000000070C0C0C0C0C0404040404040404040404
                  040404040404050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
                OnClick = SpeedButton26Click
                ExplicitLeft = 235
              end
              inherited SpeedButton12: TSpeedButton [13]
                Left = 579
                Height = 44
                Enabled = False
                Visible = False
                ExplicitLeft = 579
                ExplicitHeight = 44
              end
              object SpeedButton9: TSpeedButton
                Left = 463
                Top = 4
                Width = 51
                Height = 45
                Hint = 'Pedido de Compra Cliente (NFe) - [BAS541]'
                Flat = True
                Glyph.Data = {
                  66060000424D6606000000000000260400002800000018000000180000000100
                  08000000000040020000120B0000120B0000FC000000FC00000000000000FFFF
                  FF00746FB700746EB500FF00FF00FFFCFC00FEFCFC00FFFEFE00936560009566
                  600093655F00986963009E6E6400A3726600A77568009F6F6000AC796900B17E
                  6B00FEFBFA00BB846E00B6816C00CB917300C58C7000C0896F00CF8E6800D498
                  7500CF967400FEF8F400FFFCFA00FEF7F200FEFAF700FEF8F300FCF4ED00FEFA
                  F600FCF8F400FEFBF800FEFCFA00D5812700FCF3E900FCF4EB00FEF7EF00F8E6
                  CF00F8E7D000FAEBD800FAEDDC00FAEEDE00FBF0E200FAEFE100FBF2E600FBF3
                  E900FCF6EE00FEFBF700EDC28700EBC28700EDC58A00EDC68C00EEC68E00EEC7
                  8F00EDC68E00EDC78F00EEC79100EDC79000EEC99300EECA9500EFCB9700EECA
                  9600EECB9700EFCC9900EECB9800EFCC9A00EECC9900EFCE9D00F0CF9F00EFCF
                  A000F0D1A300F2D3A500F0D1A400F2D3A600F2D4A700F0D1A500F2D4AA00F2D5
                  AB00F2D5AC00F3D7AF00F3D8B000F3D8B100F3D9B200F2D8B100F3D9B400F4DA
                  B600F3DAB500F3DAB600F3DAB700F4DCB800F4DCBA00F6DEBD00F4DEBD00F6E0
                  C100F4DEBF00F6E1C200F6E2C400F6E3C700F7E5CA00F8E7CF00F7E6CE00F8E9
                  D300F8EAD500FAEDDA00F8EBD900FAEEDC00FAEEDD00FAF0E100FBF2E500FBF3
                  E700FBF4EA00FCF6ED00FCF7F000FCF8F200EBC28400EBC48900EBC58B00EEC9
                  9100EDC99100EDC99200EECA9300EECB9500EECB9600EFCE9A00EECE9A00EFCE
                  9C00EECE9C00F0D09F00EFCF9E00EFD09F00F0D1A100EFD0A000EFD0A100F0D3
                  A500F2D5A900F0D3A700F2D7AB00F0D4A900F0D5A900F2D7AC00F3D8AF00F2D8
                  AF00F2D8B000F3DAB400F3DCB700F4DDBA00F3DDBA00F4DEBB00F3DDBB00F6E1
                  C100F4E0C000F4E1C200F6E3C500F6E3C600F7E6CB00F7E6CC00F8E9D100F8EA
                  D400F8EBD700FBF4E900FCF7EF00F7E5C700F8EDD900FEFBF600FEFCF800F0FF
                  FE0067A3A1009DB2B10081FFFE0082FFFE0083FFFE0086FFFE0087FFFE0088FF
                  FE008AFFFE008CFFFE0080E7E6008EFFFE0090FFFE0092FFFE0083E2E10095FF
                  FE0097FFFE008BE9E7009DFFFE009EFFFE009FFFFE00A0FFFE00A4FFFE00A6FF
                  FE0097E2E100ACFFFE009FE9E700B2FFFE00B5FFFE0078A6A500BBFFFE00BFFF
                  FE00C1FFFE00C5FFFE00CFFFFE00D8FFFE0081FEFE0099FFFF00A5FFFF00ADFF
                  FF00BCFFFF00A5DADA00BBEEEE00CCFFFF0092B7B700040505006E878700D4FF
                  FF00DDFFFF0090A1A100E6FFFF0092A1A100EAFFFF00EEFFFF00F4FFFF00F6FF
                  FF00FAFFFF0081FBFF0081FAFE0081FBFE0081FCFE0081F8FF0081F7FE0081F8
                  FE0081F7FF0081F4FE0081F6FE0081F2FF0081F3FF0081F4FF0081F2FE0081F3
                  FE0081F0FF0081EEFE0081EFFE0081F0FE0081EDFF000081BD005176C500315E
                  FF00000082000F0F8E0004040404040404040404040404040404040404040404
                  04040F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F04040404040A9357528A4D
                  4A838143413E3C38787735760F04040404040A5D5A5590508B4A494746423F7A
                  3B3777340F04040404040A5F965B5691514E4F888480443F793937360F040404
                  0404089962975956928C8D89884882447D7B3D3A0F0404040404099D639A9894
                  58548F8E4B4A8547437E7C3C0F04040404040B9E652525252525252525252525
                  2525427C0F04040404040C2A9FA56461605E5B5653514E4C878445400F040404
                  04040DA12A68669C9B5F955C5890524E4F88847F0F04040404040E6CA1252525
                  2525252525252525252586480F0404040404106EA66AA0299EF7F7F7F7F7F7F7
                  F7F7F7F7F7F7F7F7F7F7116F6E6BA26967F7CAC5C0BAB3AEACCEE3E9ECEEF5F4
                  F6F714702E25252525F7D5C8C3BDB7B1ACCEE6E4E8EFEDF2F3F713A3302E2D2C
                  6CF7D9CBC6C1BBB4AFACCEE5E4EAF1F0F3F7177372712E2F6EF7DACCC9C4AAB8
                  B2ADACE6E4E7EFEEF4F716A47325252525F7DCCDD4C7C2BCB6B0ACCEE6E9E8EB
                  F5F7151F7432277170F7DFABD8D3C5D0BAB3AECEE6E5E7ECF1F71A1E2274A427
                  31F7E0DDD7D6D2D1BEB7B1ACCEE6E4EAEBF7191C1E211DA420F7E2A9DBFAFAFA
                  C1CFB5AFCECEE5E9E8F71905A833217528F701E1DEF9FAFAF8BFB9B2ADCEE6E5
                  E8F71907052423211FF7F7F7F7FAF9FA00F7F7F7F7F7F7F7F7F71807070612A8
                  A71B7432272602FB036D2BA10F04040404041818181818181818181818181818
                  18181818180404040404}
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = SpeedButton9Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 310
              ExplicitHeight = 310
              inherited ScrollBox2: TScrollBox
                Height = 293
                ExplicitHeight = 293
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 899
          ExplicitHeight = 566
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnContratoRelatorios: TPanel
            Left = 3
            Top = 3
            Width = 382
            Height = 350
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            OnEnter = pnContratoRelatoriosEnter
            object PageControl6: TPageControl
              Left = 0
              Top = 129
              Width = 378
              Height = 217
              ActivePage = TabSheet9
              Align = alClient
              TabOrder = 0
              object TabSheet9: TTabSheet
                Caption = 'Relat'#243'rio Contratos'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object BitBtn29: TBitBtn
                  Left = 22
                  Top = 22
                  Width = 333
                  Height = 25
                  Hint = 'Posi'#231#227'o de Contratos'
                  Caption = 'Posi'#231#227'o de Contratos'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnClick = BitBtn29Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn26: TBitBtn
                  Left = 22
                  Top = 50
                  Width = 333
                  Height = 25
                  Hint = 'Contratos Vencidos'
                  Caption = 'Contratos Vencidos'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = BitBtn26Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn27: TBitBtn
                  Left = 22
                  Top = 77
                  Width = 333
                  Height = 25
                  Hint = 'Vencendo no pr'#243'ximo m'#234's'
                  Caption = 'Vencendo no pr'#243'ximo m'#234's'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = BitBtn27Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn28: TBitBtn
                  Left = 22
                  Top = 161
                  Width = 333
                  Height = 25
                  Hint = 'Voltar'
                  Caption = 'Voltar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = BitBtn28Click
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
              object TabSheet10: TTabSheet
                Caption = 'Relat'#243'rio Gerador OS'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label159: TLabel
                  Left = 20
                  Top = 4
                  Width = 111
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data Base Doc. Venda:'
                end
                object MaskEdit17: TMaskEdit
                  Tag = 1
                  Left = 139
                  Top = 1
                  Width = 79
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 0
                  Text = '  /  /    '
                end
                object BitBtn38: TBitBtn
                  Left = 20
                  Top = 44
                  Width = 333
                  Height = 25
                  Hint = 'Apenas Contratos Ativos'
                  Caption = 'Contratos a serem gerados '
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = BitBtn38Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn39: TBitBtn
                  Left = 20
                  Top = 73
                  Width = 333
                  Height = 25
                  Hint = 'Contratos fora da data estabelecida ou status diferente de ativo'
                  Caption = 'Contratos n'#227'o gerados '
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = BitBtn39Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn40: TBitBtn
                  Left = 20
                  Top = 161
                  Width = 333
                  Height = 25
                  Hint = 'Voltar'
                  Caption = 'Voltar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  OnClick = BitBtn40Click
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
                object CheckBox6: TCheckBox
                  Left = 122
                  Top = 25
                  Width = 231
                  Height = 17
                  BiDiMode = bdRightToLeft
                  Caption = 'Desconsidera Regra Ctrl'
                  ParentBiDiMode = False
                  TabOrder = 1
                end
                object BitBtn41: TBitBtn
                  Left = 20
                  Top = 102
                  Width = 333
                  Height = 25
                  Hint = 'Contratos entrando em vig'#234'ncia no m'#234's da data base'
                  Caption = 'Contratos entrando em vig'#234'ncia no m'#234's da data base'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  OnClick = BitBtn41Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
                object BitBtn10: TBitBtn
                  Left = 20
                  Top = 131
                  Width = 333
                  Height = 25
                  Hint = 'Contratos entrando em vig'#234'ncia a partir da data base'
                  Caption = 'Contratos entrando em vig'#234'ncia a partir da data base'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  OnClick = BitBtn10Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000630F0000630F000000010000000100002C6930003283
                    3C00349F3F0041B258004EBF6C00346BAC00FF00FF00589DD70079A9D7004EA5
                    ED00F7FFFF000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000000000000000
                    0000000000000000000000000000000000000000000000000000060606060606
                    060606060606060606060607050505050505050505050505050606070A0A0A0A
                    0A0A0A0A0A0A0A0A050606070A000000000000000000000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000408040804040804000A050606090A000A08
                    0A080A0A080A000A050606090A000000000000000000000A050606090A0A0A0A
                    0A0A0A0A0A0A0A0A050606090A0A00000000000000000A0A050606090A0A0404
                    0303020202010A0A050606090A0A0A0A0A0A0A0A0A0A0A0A0506060909090909
                    0909090909070707070606060606060606060606060606060606}
                end
              end
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 378
              Height = 129
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object RadioGroup2: TRadioGroup
                Left = 0
                Top = 90
                Width = 378
                Height = 33
                Align = alTop
                Caption = 'Ordernar por'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Raz'#227'o Social'
                  'Nome Fantasia')
                TabOrder = 2
                OnClick = RadioGroup2Click
              end
              object RadioGroup1: TRadioGroup
                Left = 0
                Top = 57
                Width = 378
                Height = 33
                Align = alTop
                Caption = 'Agrupar por'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Descri'#231#227'o'
                  'Produto / Tipo de Servi'#231'o')
                TabOrder = 1
                OnClick = RadioGroup1Click
              end
              object Panel24: TPanel
                Left = 0
                Top = 0
                Width = 378
                Height = 57
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label139: TLabel
                  Left = 32
                  Top = 17
                  Width = 92
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Status do Contrato'
                end
                object ComboBox10: TComboBox
                  Left = 130
                  Top = 13
                  Width = 199
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  ItemIndex = 0
                  TabOrder = 0
                  Text = 'Todos'
                  Items.Strings = (
                    'Todos'
                    'Ativo'
                    'Inativo'
                    'Pausado'
                    'Prescrito'
                    'Rescindido'
                    'Em Debito'
                    'Expirado'
                    'Cancelado'
                    'Cobran'#231'a Suspensa')
                end
                object CheckBox4: TCheckBox
                  Left = 72
                  Top = 40
                  Width = 253
                  Height = 17
                  BiDiMode = bdRightToLeft
                  Caption = 'Apresentar Status e Datas de Vig'#234'ncia'
                  ParentBiDiMode = False
                  TabOrder = 1
                  OnClick = CheckBox4Click
                end
              end
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'TabSheet5'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnContratoHistorico: TPanel
            Left = 1
            Top = 3
            Width = 872
            Height = 390
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox42: TGroupBox
              Left = 0
              Top = 0
              Width = 868
              Height = 386
              Align = alClient
              Caption = 'Hist'#243'rico'
              TabOrder = 0
              object DBGrid10: TDBGrid
                Left = 2
                Top = 15
                Width = 864
                Height = 328
                Align = alClient
                DataSource = DtmClientes.dsContratosOS
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnTitleClick = DBGrid10TitleClick
              end
              object Panel13: TPanel
                Left = 2
                Top = 343
                Width = 864
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn25: TBitBtn
                  Left = 373
                  Top = 6
                  Width = 113
                  Height = 25
                  Hint = 'Faturamento'
                  Caption = 'Faturamento'
                  TabOrder = 0
                  OnClick = BitBtn25Click
                  Glyph.Data = {
                    CA020000424DCA02000000000000CA0100002800000010000000100000000100
                    08000000000000010000120B0000120B00006500000065000000D1D0E900FF00
                    FF00E7DCDE0072414100734241006D3F3E00673C3B00845351008E5D59009866
                    5D0092625A00A0675B009E665A009D6559009F675A009E6659009A645700A06C
                    5F00A66F5B00C1836C00AA746200A7726000A7746300FEFBFA00BB836900B17D
                    6700FEFCFB00CB865E00CE8A6300C48B6C00EDD1C100F6E6DD00C5876300D192
                    6D00CC937000E5C5B100D59C7400FEF8F400E1A57700DCA17500F7EFE900FEFA
                    F700E1A67700FEF8F300FFCC9D00FEF0E300FFC48B00FFC79000FFC79200FEC9
                    9300FECA9700FFCE9D00FECE9F00FECFA000FFD1A500FFD4AA00FFD5AC00FED4
                    AB00FED8B200FFD9B400FED9B500FFDCB800F6D5B400FEDDBC00FEE1C500FEE3
                    C900FEE7D000FEE7D100FEE9D400FEEBD900FEEDDC00FEEFE000FEF2E600FFF7
                    EF00FEF6EE00FEFAF600FBF7F300FEFBF800FFE0C000FEE0C000FEE1C200E2C9
                    AD00C7B19900FEE2C500FEE5CB00BBA99600FEE9D300FEEAD500FEF3E700FEF6
                    ED00FEEDD900FEF3E600FEF7EE00FEFAF400FFDD9A00FFF7D100FEFEFC000000
                    8200FFFFFF00FEFEFE0000000000010101010808010101010101010101010101
                    0101082E07070101010101010101010101010808080808080808080808040101
                    010A0A4F3F3C372C302E2E2E2E040101010A0A403F3B383633322F2E2E040101
                    010A0954614E0E0E0E0E0E0E2E040101125F114356565656533A353131040101
                    1202164561570E0E0E0E0E0E34040101120019475B5B5B5B5A413D3938040120
                    2362185861490E0E0C0F100E3E0301201F621D5C29294D2B2D42505051050126
                    17632225604D2B594846445552060126626224176363175D4A4B0B0B0B0D2A26
                    1E28276363636363634B155E5E1301011B1C27636363631A4B4C145E13010101
                    0101262121212121212114130101}
                end
                object BitBtn24: TBitBtn
                  Left = 777
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Voltar'
                  Caption = 'Voltar'
                  TabOrder = 1
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
                object BitBtn7: TBitBtn
                  Left = 8
                  Top = 6
                  Width = 75
                  Height = 25
                  Hint = 'Exportar'
                  Caption = 'Exportar'
                  TabOrder = 2
                  OnClick = BitBtn7Click
                  Glyph.Data = {
                    8E020000424D8E020000000000008E0100002800000010000000100000000100
                    08000000000000010000120B0000120B0000560000005600000000000000FFFF
                    FF00FF00FF00B8838400AA7F7A00AD827B00B1857C00B6897E00BA8D8000BF91
                    8300CA978400C4968500FFFCFB00C99B8700CD9E8A00CA8A6A00D1A38B00DDAC
                    9100D9AA8F00D6A78D00F7F0EC00D0987700DBA68500DFAF9200FDF7F200FBF1
                    E800FEF7F100FAF1E800FDF7F100FFFDFB00F8E8D600F9ECDE00FBF1E600EBB8
                    7A00F5DFC500F8E8D500F7E8D600FAEDDE00F9EDDF00FBF2E700F3AE5200E9B6
                    7600F4DBBB00F7DFBF00F4DCBC00F5E0C400F5E0C500F7E5CE00F6E4CD00FAEE
                    DF00F3D6AB00F4DAB300F2D7B200FDEDD500EADDCA00FDF0DD00FBF3E700FDF8
                    F000FCEBCE00FEF2DE00C7BFB000FFF7E800FEFDFB00FFFCF200FFFFFC00FFFF
                    FD00008400000385030004860400178F17001C911C00309B30003AA03A0061B3
                    610065B5650069B7690068B668007ABF7A007BBF7B0084C4840091CA9100C4E3
                    C400CAE5CA00F2F9F200FBFDFB00FAFAFE000202020202424242424242424242
                    424204030303034201010101010101010142053A2B3332420101010101010101
                    01420635222A344201504247544F424C0142073B2F2E2C420101514446424F01
                    0142083D1E302D420101014B424554010142093F2624304201014D424A444853
                    01420B401B1F23420149424E0152434801420D01181931420101010101010101
                    01420E010C1A2742010101010101010101421001011D1C424242424242424242
                    4242130101011D1C202537363C030202020212010101013E3938030303030202
                    020211010101010141140329280F020202021701010101010155032115020202
                    02021616161616161616030A020202020202}
                end
              end
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'TabSheet6'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnEquip: TPanel
            Left = 3
            Top = 7
            Width = 828
            Height = 461
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox43: TGroupBox
              Left = 6
              Top = 6
              Width = 812
              Height = 445
              Align = alClient
              Caption = 'Equipamentos'
              TabOrder = 0
              object DBGrid11: TDBGrid
                Left = 2
                Top = 15
                Width = 808
                Height = 387
                Align = alClient
                DataSource = DtmClientes.dsTemp
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnTitleClick = DBGrid11TitleClick
              end
              object Panel15: TPanel
                Left = 2
                Top = 402
                Width = 808
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object Label143: TLabel
                  Left = 4
                  Top = 12
                  Width = 30
                  Height = 13
                  Caption = 'Soma:'
                end
                object Label144: TLabel
                  Left = 40
                  Top = 12
                  Width = 24
                  Height = 13
                  Caption = '0,00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object BitBtn19: TBitBtn
                  Left = 719
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = 'Voltar'
                  TabOrder = 0
                  OnClick = BitBtn19Click
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
                object BitBtn30: TBitBtn
                  Left = 333
                  Top = 6
                  Width = 138
                  Height = 25
                  Caption = 'Somar selecionados'
                  TabOrder = 1
                  OnClick = BitBtn30Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000130B0000130B00000001000000010000000000008484
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
                    0202020202020202020202020202020202020202020202020202020202000000
                    0000000000000202020202020201000001020202020002020202020202020100
                    0001020202020202020202020202020100000102020202020202020202020202
                    0100000202020202020202020202020100000102020202020202020202020100
                    0001020202020202020202020201000001020202020002020202020202000000
                    0000000000000202020202020202020202020202020202020202020202020202
                    0202020202020202020202020202020202020202020202020202}
                end
              end
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'TabSheet7'
          ImageIndex = 6
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 899
            Height = 566
            Align = alClient
            Caption = 'Panel14'
            TabOrder = 0
            object ScrollBox7: TScrollBox
              Left = 1
              Top = 1
              Width = 897
              Height = 564
              Align = alClient
              TabOrder = 0
              object QuickRep1: TQuickRep
                Left = 5
                Top = 5
                Width = 794
                Height = 1123
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                DataSet = DtmClientes.qrContratosRel
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
                SnapToGrid = True
                Units = MM
                Zoom = 100
                PrevFormStyle = fsNormal
                PreviewInitialState = wsMaximized
                PrevInitialZoom = qrZoomToFit
                PreviewDefaultSaveType = stQRP
                object PageHeaderBand1: TQRBand
                  Left = 38
                  Top = 38
                  Width = 718
                  Height = 106
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  AlignToBottom = False
                  BeforePrint = PageHeaderBand1BeforePrint
                  Color = clWhite
                  TransparentBand = False
                  ForceNewColumn = False
                  ForceNewPage = False
                  Size.Values = (
                    280.458333333333400000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbColumnHeader
                  object QRSysData4: TQRSysData
                    Left = 74
                    Top = 42
                    Width = 68
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      195.791666666666700000
                      111.125000000000000000
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
                  object QRLabel17: TQRLabel
                    Left = 3
                    Top = 42
                    Width = 65
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      7.937500000000000000
                      111.125000000000000000
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
                  object QRLabel18: TQRLabel
                    Left = 589
                    Top = 42
                    Width = 47
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1558.395833333333000000
                      111.125000000000000000
                      124.354166666666700000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Pagina:'
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
                  object QRSysData5: TQRSysData
                    Left = 642
                    Top = 42
                    Width = 46
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1698.625000000000000000
                      111.125000000000000000
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
                  object QRShape4: TQRShape
                    Left = 0
                    Top = 61
                    Width = 715
                    Height = 2
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      5.291666666666667000
                      0.000000000000000000
                      161.395833333333300000
                      1891.770833333333000000)
                    Brush.Color = clBlack
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRLabel19: TQRLabel
                    Left = 4
                    Top = 64
                    Width = 97
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      10.583333333333330000
                      169.333333333333300000
                      256.645833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Contrato / Cliente'
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
                  object QRLabel21: TQRLabel
                    Left = 334
                    Top = 64
                    Width = 44
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      883.708333333333400000
                      169.333333333333300000
                      116.416666666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Contato'
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
                  object QRLabel22: TQRLabel
                    Left = 69
                    Top = 82
                    Width = 36
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      182.562500000000000000
                      216.958333333333400000
                      95.250000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Status'
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
                  object QRLabel23: TQRLabel
                    Left = 334
                    Top = 82
                    Width = 58
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      883.708333333333400000
                      216.958333333333400000
                      153.458333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data Inicial'
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
                  object QRLabel24: TQRLabel
                    Left = 595
                    Top = 82
                    Width = 52
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1574.270833333333000000
                      216.958333333333400000
                      137.583333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Data Final'
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
                  object QRLabel26: TQRLabel
                    Left = 595
                    Top = 64
                    Width = 50
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1574.270833333333000000
                      169.333333333333300000
                      132.291666666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Telefone'
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
                    Left = 685
                    Top = 64
                    Width = 30
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1812.395833333333000000
                      169.333333333333300000
                      79.375000000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Valor'
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
                  object QRShape5: TQRShape
                    Left = 0
                    Top = 87
                    Width = 715
                    Height = 2
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      5.291666666666667000
                      0.000000000000000000
                      230.187500000000000000
                      1891.770833333333000000)
                    Brush.Color = clBlack
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRLabel30: TQRLabel
                    Left = 403
                    Top = 64
                    Width = 48
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1066.270833333333000000
                      169.333333333333300000
                      127.000000000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'Dia Venc'
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
                  object QRLabel31: TQRLabel
                    Left = 205
                    Top = 64
                    Width = 68
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      542.395833333333400000
                      169.333333333333300000
                      179.916666666666700000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Raz'#227'o Social'
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
                  object QRSysData3: TQRSysData
                    Left = 3
                    Top = 19
                    Width = 97
                    Height = 20
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      52.916666666666670000
                      7.937500000000000000
                      50.270833333333330000
                      256.645833333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    Color = clWhite
                    Data = qrsReportTitle
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -17
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Transparent = False
                    ExportAs = exptText
                    FontSize = 13
                  end
                  object QRLabel16: TQRLabel
                    Left = 3
                    Top = 2
                    Width = 78
                    Height = 18
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      47.625000000000000000
                      7.937500000000000000
                      5.291666666666667000
                      206.375000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'QRLabel16'
                    Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 11
                  end
                  object QRLabel33: TQRLabel
                    Left = 205
                    Top = 82
                    Width = 43
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      542.395833333333400000
                      216.958333333333400000
                      113.770833333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Tipo OS'
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
                  object QRLabel1: TQRLabel
                    Left = 457
                    Top = 64
                    Width = 75
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1209.145833333333000000
                      169.333333333333300000
                      198.437500000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'Dias Apos Fat'
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
                  object QRLabel2: TQRLabel
                    Left = 538
                    Top = 64
                    Width = 51
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1423.458333333333000000
                      169.333333333333300000
                      134.937500000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Caption = 'Dia Fat'
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
                object DetailBand3: TQRBand
                  Left = 38
                  Top = 144
                  Width = 718
                  Height = 17
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
                    44.979166666666670000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbDetail
                  object QRDBText14: TQRDBText
                    Left = 4
                    Top = 2
                    Width = 141
                    Height = 14
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      37.041666666666670000
                      10.583333333333330000
                      5.291666666666667000
                      373.062500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosRel
                    DataField = 'DESCR_CONTRATO_TMP'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsBold, fsItalic]
                    ParentFont = False
                    Transparent = False
                    WordWrap = True
                    ExportAs = exptText
                    FontSize = 8
                  end
                end
                object SummaryBand1: TQRBand
                  Left = 38
                  Top = 235
                  Width = 718
                  Height = 22
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
                    58.208333333333340000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbPageFooter
                  object QRShape6: TQRShape
                    Left = 0
                    Top = 4
                    Width = 715
                    Height = 2
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      5.291666666666667000
                      0.000000000000000000
                      10.583333333333330000
                      1891.770833333333000000)
                    Brush.Color = clBlack
                    Shape = qrsRectangle
                    VertAdjust = 0
                  end
                  object QRLabel20: TQRLabel
                    Left = 4
                    Top = 8
                    Width = 102
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      10.583333333333330000
                      21.166666666666670000
                      269.875000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Hw Sistemas e Computadores'
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
                object QRSubDetail1: TQRSubDetail
                  Left = 38
                  Top = 161
                  Width = 718
                  Height = 23
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  AlignToBottom = False
                  BeforePrint = QRSubDetail1BeforePrint
                  Color = clWhite
                  TransparentBand = False
                  ForceNewColumn = False
                  ForceNewPage = False
                  Size.Values = (
                    60.854166666666680000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  Master = QuickRep1
                  DataSet = DtmClientes.qrContratosDetalhesRel
                  FooterBand = QRBand2
                  PrintBefore = False
                  PrintIfEmpty = True
                  object QRDBText1: TQRDBText
                    Left = 3
                    Top = 2
                    Width = 56
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      7.937500000000000000
                      5.291666666666667000
                      148.166666666666700000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'COD_CLIENTE'
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
                    Left = 202
                    Top = 2
                    Width = 130
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      534.458333333333400000
                      5.291666666666667000
                      343.958333333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'RAZAO'
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
                    Left = 334
                    Top = 2
                    Width = 40
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      883.708333333333400000
                      5.291666666666667000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'CONTATO'
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
                    Left = 595
                    Top = 2
                    Width = 60
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1574.270833333333000000
                      5.291666666666667000
                      158.750000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'FONE_CLIENTE'
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
                  object QRDBText13: TQRDBText
                    Left = 664
                    Top = 2
                    Width = 51
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1756.833333333333000000
                      5.291666666666667000
                      134.937500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'VALOR_CONTRATO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -8
                    Font.Name = 'Arial'
                    Font.Style = []
                    Mask = '#0.00'
                    ParentFont = False
                    Transparent = False
                    WordWrap = False
                    ExportAs = exptText
                    FontSize = 6
                  end
                  object QRDBText15: TQRDBText
                    Left = 334
                    Top = 12
                    Width = 94
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      883.708333333333400000
                      31.750000000000000000
                      248.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'DATA_INICIAL_VIGENCIA'
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
                  object QRDBText16: TQRDBText
                    Left = 595
                    Top = 12
                    Width = 94
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1574.270833333333000000
                      31.750000000000000000
                      248.708333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'DATA_INICIAL_VIGENCIA'
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
                    Left = 69
                    Top = 12
                    Width = 32
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      182.562500000000000000
                      31.750000000000000000
                      84.666666666666680000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'STATUS'
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
                  object QRDBText18: TQRDBText
                    Left = 69
                    Top = 2
                    Width = 130
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      182.562500000000000000
                      5.291666666666667000
                      343.958333333333400000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'NOME_CLIENTE'
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
                  object QRDBText19: TQRDBText
                    Left = 403
                    Top = 2
                    Width = 48
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1066.270833333333000000
                      5.291666666666667000
                      127.000000000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'DIA_VENCIMENTO'
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
                  object QRDBText20: TQRDBText
                    Left = 202
                    Top = 12
                    Width = 34
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      534.458333333333400000
                      31.750000000000000000
                      89.958333333333340000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'TIPO_OS'
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
                    Left = 457
                    Top = 2
                    Width = 75
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1209.145833333333000000
                      5.291666666666667000
                      198.437500000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'DIAS_APOS_VENC'
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
                  object QRDBText3: TQRDBText
                    Left = 538
                    Top = 2
                    Width = 51
                    Height = 12
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      31.750000000000000000
                      1423.458333333333000000
                      5.291666666666667000
                      134.937500000000000000)
                    Alignment = taCenter
                    AlignToBand = False
                    AutoSize = False
                    AutoStretch = False
                    Color = clWhite
                    DataSet = DtmClientes.qrContratosDetalhesRel
                    DataField = 'DIA_FATURAMENTO'
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
                object QRBand2: TQRBand
                  Left = 38
                  Top = 184
                  Width = 718
                  Height = 25
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = True
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Frame.Width = 2
                  AlignToBottom = False
                  BeforePrint = QRBand2BeforePrint
                  Color = clWhite
                  TransparentBand = False
                  ForceNewColumn = False
                  ForceNewPage = False
                  Size.Values = (
                    66.145833333333340000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbGroupFooter
                  object QRExpr2: TQRExpr
                    Left = 441
                    Top = 7
                    Width = 138
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      1166.812500000000000000
                      18.520833333333330000
                      365.125000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Arial'
                    Font.Style = [fsItalic]
                    Color = clWhite
                    Master = QRSubDetail1
                    ParentFont = False
                    ResetAfterPrint = True
                    Transparent = False
                    WordWrap = True
                    Expression = 'SUM(VALOR_CONTRATO)'
                    Mask = '###,#0.00'
                    ExportAs = exptText
                    FontSize = 8
                  end
                  object QRLabel25: TQRLabel
                    Left = 8
                    Top = 6
                    Width = 141
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      21.166666666666670000
                      15.875000000000000000
                      373.062500000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Quantidade de Contratos:'
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
                  object QRLabel28: TQRLabel
                    Left = 318
                    Top = 6
                    Width = 117
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      841.375000000000000000
                      15.875000000000000000
                      309.562500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Soma dos Contratos:'
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
                  object QRLabel52: TQRLabel
                    Left = 155
                    Top = 7
                    Width = 54
                    Height = 15
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      39.687500000000000000
                      410.104166666666700000
                      18.520833333333330000
                      142.875000000000000000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'QRLabel52'
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
                object QRBand4: TQRBand
                  Left = 38
                  Top = 209
                  Width = 718
                  Height = 26
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  AlignToBottom = False
                  BeforePrint = QRBand4BeforePrint
                  Color = clWhite
                  TransparentBand = False
                  ForceNewColumn = False
                  ForceNewPage = False
                  Size.Values = (
                    68.791666666666680000
                    1899.708333333333000000)
                  PreCaluculateBandHeight = False
                  KeepOnOnePage = False
                  BandType = rbSummary
                  object QRLabel29: TQRLabel
                    Left = 441
                    Top = 7
                    Width = 40
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      1166.812500000000000000
                      18.520833333333330000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = '123,33'
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
                  object QRLabel32: TQRLabel
                    Left = 325
                    Top = 7
                    Width = 110
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      859.895833333333400000
                      18.520833333333330000
                      291.041666666666700000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Valor Total Geral:'
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
                  object QRLabel50: TQRLabel
                    Left = 4
                    Top = 6
                    Width = 195
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      10.583333333333330000
                      15.875000000000000000
                      515.937500000000000000)
                    Alignment = taRightJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = 'Quantidade Geral de Contratos:'
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
                  object QRLabel51: TQRLabel
                    Left = 205
                    Top = 7
                    Width = 40
                    Height = 17
                    Frame.Color = clBlack
                    Frame.DrawTop = False
                    Frame.DrawBottom = False
                    Frame.DrawLeft = False
                    Frame.DrawRight = False
                    Size.Values = (
                      44.979166666666670000
                      542.395833333333400000
                      18.520833333333330000
                      105.833333333333300000)
                    Alignment = taLeftJustify
                    AlignToBand = False
                    AutoSize = True
                    AutoStretch = False
                    Caption = '123,33'
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
                end
              end
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'TabSheet8'
          ImageIndex = 7
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnAjustarContrato: TPanel
            Left = 3
            Top = 0
            Width = 888
            Height = 529
            Caption = 'pnAjustarContrato'
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 487
              Width = 886
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn8: TBitBtn
                Left = 364
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Confirmar reajuste'
                Caption = 'Confirmar'
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
              object BitBtn9: TBitBtn
                Left = 444
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancela'
                TabOrder = 1
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
            end
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 886
              Height = 35
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label8: TLabel
                Left = 60
                Top = 8
                Width = 126
                Height = 13
                Alignment = taRightJustify
                Caption = 'Informe o fator de ajuste:'
              end
              object Label9: TLabel
                Left = 327
                Top = 10
                Width = 225
                Height = 13
                Caption = '(Exemplo: Para ajustar em 10% informar 1,10)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object EditHw9: TEditHw
                Left = 200
                Top = 7
                Width = 121
                Height = 21
                TabOrder = 0
                Text = '0,00'
                OnChange = EditHw9Change
                OnExit = EditHw9Exit
                Formato = fNumber
                FormatSize = '0.2'
              end
            end
            object DBGrid2: TDBGrid
              Left = 1
              Top = 36
              Width = 886
              Height = 451
              Align = alClient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGrid2KeyDown
              OnTitleClick = DBGrid2TitleClick
            end
          end
        end
        object tsAlterDadosProc: TTabSheet
          Caption = 'tsAlterDadosProc'
          ImageIndex = 9
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel52: TPanel
            Left = 0
            Top = 0
            Width = 899
            Height = 110
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object btVoltarDadosProc: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar a tela anterior'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btVoltarDadosProcClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object pnVindi2: TPanel
              Left = 744
              Top = 32
              Width = 99
              Height = 13
              BevelOuter = bvNone
              Caption = 'Pag Online'
              Color = 12910532
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
            end
            object pnCadIncompleto2: TPanel
              Left = 744
              Top = 52
              Width = 99
              Height = 13
              BevelOuter = bvNone
              Caption = 'Cad Incompleto'
              Color = 12315647
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
            end
          end
          object GroupBox79: TGroupBox
            Left = 0
            Top = 110
            Width = 899
            Height = 99
            Align = alTop
            Caption = 'Contrato'
            TabOrder = 1
            Visible = False
            object DBText57: TDBText
              Left = 152
              Top = 14
              Width = 75
              Height = 17
              DataField = 'COD_CONTRATO'
              DataSource = DtmClientes.dsContratoCl
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText58: TDBText
              Left = 152
              Top = 33
              Width = 620
              Height = 17
              DataField = 'NOME_CLIENTE'
              DataSource = DtmClientes.dsContratoCl
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label450: TLabel
              Left = 102
              Top = 14
              Width = 44
              Height = 13
              Caption = 'Codigo: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText59: TDBText
              Left = 152
              Top = 52
              Width = 620
              Height = 17
              DataField = 'RAZAO'
              DataSource = DtmClientes.dsContratoCl
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label453: TLabel
              Left = 30
              Top = 52
              Width = 116
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Raz'#227'o Social Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object Label456: TLabel
              Left = 607
              Top = 14
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
            object DBText60: TDBText
              Left = 645
              Top = 14
              Width = 106
              Height = 17
              DataField = 'VALOR_CONTRATO'
              DataSource = DtmClientes.dsContratoCl
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 18
              Top = 33
              Width = 128
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Nome Fantasia Cliente:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 152
              Top = 71
              Width = 620
              Height = 17
              DataField = 'DESC_SERVICO'
              DataSource = DtmClientes.dsContratoCl
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 101
              Top = 71
              Width = 45
              Height = 13
              BiDiMode = bdLeftToRight
              Caption = 'Servi'#231'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
            end
          end
          object Panel128: TPanel
            Left = 0
            Top = 209
            Width = 899
            Height = 357
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object pnCenterAlterDadosProd: TPanel
              Left = 0
              Top = 0
              Width = 895
              Height = 54
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButtonAlterarProduto: TSpeedButton
                Left = 62
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro - [CLI175]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000010000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330000000000000000000000000000000000000000
                  333333330036322F2D2C2825252221211F1D1D1A1A1717003333333300363636
                  3232322F2F252221211F1D1D1A1A17003333333300363636363632322F2F2525
                  21211F1D1D1A1A00333333330036271616161616160710161616161616161A00
                  3333333300363636363636363609051110252525251D1D003333333300362716
                  1616161616242035300F16161616250033333333003636363636363636363435
                  30300D2525252500333333330036271616161616161616233130300F16162500
                  33333333003636363636363636363232233130300B2525003333333300362716
                  161616161616161616233130300F250033333333003636363636363636363232
                  2F2F233130300D003333333300362A1B1B1B1B1B1B1B1B1B1919182331301E07
                  333333330036363636363636363636363632322F232613120733333300363636
                  36363636363636363632322F2F0C362B0A083333003636363636363636363636
                  3632322F2D2D141C113033330102020202020202020202020202020202020215
                  2E3033330E0000000000000000000000000000000000000E2929333333040404
                  0404040404040404040404040403063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarProdutoClick
              end
              object SpeedButtonAlterarProduto2: TSpeedButton
                Left = 5
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Editar Registro Selecionados  - [CLI262]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000230F0000230F00000001000000000000CE630000D673
                  0000DE7B0000D6730800D673100039291800D67B21003131310021214A007B5A
                  4A007363520018425A00846B5A0008426300E7A5630021526B0052636B002963
                  7B0084847B008C847B009C948C004A6B9C009C9C9C00FFD6A500B5ADAD00B5B5
                  AD00FFD6AD00B5B5B500E7CEB500FFDEB5003139BD00FFDEBD008CB5C600FFE7
                  C600FFE7CE0010A5D600D6D6D600FFEFD60042A5DE00DEDEDE00FFEFDE000010
                  E700E7E7E700F7EFE700FFEFE700FFF7E700299CEF00FFF7EF002973F70042E7
                  F700FFFFF700FF00FF006BC6FF008CF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333330D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
                  333333330D3636363636363636363636363636363636360D333333330D363636
                  3636363636363636363636363636360D333333330D3636363636363636363636
                  363636363636360D333333330D3636363636363636071036363636363636360D
                  333333330D3636363636363636090511103636363636360D333333330D363636
                  3636363636242035300F36363636360D333333330D3636363636363636363435
                  30300D363636360D333333330D36363636363636363636233130300F3636360D
                  333333330D3636363636363636363632233130300B36360D333333330D363636
                  363636363636363636233130300F360D333333330D3636363636363636363632
                  2F2F233130300D0D333333330D36363636363636363636363636362331301E07
                  333333330D36363636363636363636363632322F23261312073333330D363636
                  36363636363636363632322F2F0C362B0A0833330D3636363636363636363636
                  3632322F2D2D141C113033331111111111111111111111111111111111111115
                  2E303333110D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D112929333333111111
                  1111111111111111111111111111063333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333333333333333
                  3333333333333333333333333333333333333333333333333333}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButtonAlterarProduto2Click
              end
              object btExcluirRegistro: TSpeedButton
                Left = 121
                Top = 2
                Width = 51
                Height = 45
                Hint = 'Apagar Registro - [CLI176]'
                Flat = True
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000220B0000220B000000010000000100000031DE00FF00
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
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010100000101010101010101010101010101010101010101010000
                  0001010100000001010101010101010101010101010000000101010100000000
                  0101010101010101010101000000000101010101000000000001010101010101
                  0101000000000101010101010100000000000101010101010100000000010101
                  0101010101010200000000010101010100000000010101010101010101010101
                  0000000001010000000000010101010101010101010101010100000000000000
                  0000010101010101010101010101010101010000020002000001010101010101
                  0101010101010101010101000000020001010101010101010101010101010101
                  0101000002000002020101010101010101010101010101010100000200020202
                  0002010101010101010101010101010102020200020101020202020101010101
                  0101010101010102020002020101010102020202010101010101010101010202
                  0202020101010101010102020201010101010101010202020202010101010101
                  0101010202020101010101010202020202010101010101010101010101020101
                  0101010202020202010101010101010101010101010101010101010202020201
                  0101010101010101010101010101010101010102020201010101010101010101
                  0101010101010101010101010101010101010101010101010101010101010101
                  0101010101010101010101010101010101010101010101010101}
                ParentShowHint = False
                ShowHint = True
                OnClick = SpeedButton2Click
              end
              object ckPermOpcaoMarcadas: TCheckBox
                Left = 441
                Top = 18
                Width = 310
                Height = 17
                Hint = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Caption = 'Salvar/permanecer op'#231#245'es marcadas na altera'#231#227'o em lote'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ckPermOpcaoMarcadasClick
              end
            end
          end
        end
        object tsAlterDadosLote: TTabSheet
          Caption = 'tsAlterDadosLote'
          ImageIndex = 8
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnAlteracaoEmLote: TPanel
            Left = 16
            Top = 0
            Width = 713
            Height = 537
            TabOrder = 0
            object GroupBoxAlteracaoEmLote: TGroupBox
              Left = 1
              Top = 1
              Width = 711
              Height = 490
              Align = alClient
              Caption = 'Altera'#231#227'o em lote de contratos'
              TabOrder = 0
              object pnControle: TPanel
                Left = 2
                Top = 15
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 0
                object lbControle: TLabel
                  Left = 158
                  Top = 7
                  Width = 45
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Controle:'
                end
                object EdControle: TEditHw
                  Left = 206
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  OnExit = EdControleExit
                  OnKeyDown = EdControleKeyDown
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object DBLControle: TDBLookupComboBox
                  Left = 278
                  Top = 4
                  Width = 395
                  Height = 21
                  KeyField = 'CODIGO_CTRL'
                  ListField = 'NOME_CTRL'
                  ListSource = DtmClientes.dsCtrl
                  TabOrder = 2
                  OnExit = DBLControleExit
                end
                object ckControle: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckControleClick
                end
              end
              object pnVendedor: TPanel
                Left = 2
                Top = 46
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 1
                object lbVendedor: TLabel
                  Left = 153
                  Top = 7
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Vendedor:'
                end
                object EdVendedor: TEditHw
                  Left = 206
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  OnExit = EdVendedorExit
                  OnKeyDown = EdVendedorKeyDown
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object DBLVendedor: TDBLookupComboBox
                  Left = 278
                  Top = 4
                  Width = 395
                  Height = 21
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR'
                  ListSource = DtmClientes.dsColaborador
                  TabOrder = 2
                  OnExit = DBLVendedorExit
                end
                object ckVendedor: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckVendedorClick
                end
              end
              object pnDiaVencimento: TPanel
                Left = 2
                Top = 77
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 2
                object lbDiaVencimento: TLabel
                  Left = 111
                  Top = 7
                  Width = 92
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dia de Vencimento:'
                end
                object ckDiaVencimento: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDiaVencimentoClick
                end
                object EdDiaVencimento: TEditHw
                  Left = 206
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
              end
              object pnTipoOS: TPanel
                Left = 2
                Top = 170
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 5
                object lbTipoOS: TLabel
                  Left = 147
                  Top = 7
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo de OS:'
                end
                object cbTipoOS: TComboBox
                  Left = 206
                  Top = 4
                  Width = 212
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 1
                end
                object ckTipoOS: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckTipoOSClick
                end
              end
              object pnDataInicialBoleto: TPanel
                Left = 2
                Top = 275
                Width = 707
                Height = 43
                Align = alTop
                TabOrder = 8
                object ckDataInicialBoleto2: TLabel
                  Left = 55
                  Top = 0
                  Width = 100
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Impress'#227'o Boleta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lbDataInicialBoleto: TLabel
                  Left = 146
                  Top = 19
                  Width = 57
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data Inicial:'
                end
                object meDataInicialBoleto: TMaskEdit
                  Tag = 1
                  Left = 205
                  Top = 16
                  Width = 79
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 1
                  Text = '  /  /    '
                  OnExit = meDataInicialBoletoExit
                end
                object ckDataInicialBoleto: TCheckBox
                  Left = 22
                  Top = 18
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDataInicialBoletoClick
                end
                object ckHabDataInicialBoleto: TCheckBox
                  Left = 289
                  Top = 18
                  Width = 11
                  Height = 17
                  Hint = 'Adicionar Data Inicial da Impress'#227'o da Boleta'
                  Caption = 'CheckBox5'
                  Enabled = False
                  TabOrder = 2
                end
              end
              object pnGerarContratosAcada: TPanel
                Left = 2
                Top = 201
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 6
                object lbGerarContratosAcada: TLabel
                  Left = 81
                  Top = 6
                  Width = 122
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Gerar Contratos a Cada :'
                end
                object lbGerarContratosAcada2: TLabel
                  Left = 277
                  Top = 6
                  Width = 19
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'm'#234's'
                end
                object EdGerarContratosAcada: TEditHw
                  Left = 205
                  Top = 4
                  Width = 66
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object ckGerarContratosAcada: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckGerarContratosAcadaClick
                end
              end
              object pnStatusContrato: TPanel
                Left = 2
                Top = 318
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 9
                object lbStatusContrato: TLabel
                  Left = 107
                  Top = 7
                  Width = 96
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Status do Contrato:'
                end
                object cbStatusContrato: TComboBox
                  Left = 205
                  Top = 4
                  Width = 212
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 1
                  Items.Strings = (
                    'Ativo'
                    'Inativo'
                    'Pausado'
                    'Prescrito'
                    'Rescindido'
                    'Em Debito'
                    'Expirado'
                    'Cancelado'
                    'Cobran'#231'a Suspensa')
                end
                object ckStatusContrato: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckStatusContratoClick
                end
              end
              object pnDataInicialFinalContrato: TPanel
                Left = 2
                Top = 232
                Width = 707
                Height = 43
                Align = alTop
                TabOrder = 7
                object lbDataInicialFinalContrato2: TLabel
                  Left = 39
                  Top = 0
                  Width = 117
                  Height = 13
                  Caption = 'Vig'#234'ncia do Contrato'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  WordWrap = True
                end
                object lbDataInicialContrato: TLabel
                  Left = 146
                  Top = 19
                  Width = 57
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data Inicial:'
                end
                object Label11: TLabel
                  Left = 421
                  Top = 19
                  Width = 52
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data Final:'
                end
                object meDataInicialContrato: TMaskEdit
                  Tag = 1
                  Left = 206
                  Top = 16
                  Width = 78
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 1
                  Text = '  /  /    '
                  OnExit = meDataInicialContratoExit
                end
                object ckDataInicialFinalContrato: TCheckBox
                  Left = 22
                  Top = 18
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDataInicialFinalContratoClick
                end
                object meDataFinalContrato: TMaskEdit
                  Tag = 1
                  Left = 479
                  Top = 16
                  Width = 78
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 2
                  Text = '  /  /    '
                  OnExit = meDataFinalContratoExit
                end
              end
              object pnOBS: TPanel
                Left = 2
                Top = 349
                Width = 707
                Height = 65
                Align = alTop
                TabOrder = 10
                object lbOBS: TLabel
                  Left = 141
                  Top = 6
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Observa'#231#227'o:'
                end
                object ckOBS: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckOBSClick
                end
                object meOBS: TMemo
                  Left = 205
                  Top = 4
                  Width = 468
                  Height = 57
                  Lines.Strings = (
                    'meOBS')
                  TabOrder = 1
                end
              end
              object pnDiaFaturamento: TPanel
                Left = 2
                Top = 139
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 4
                object lbDiaFaturamento: TLabel
                  Left = 104
                  Top = 7
                  Width = 99
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dia do Faturamento:'
                end
                object ckDiaFaturamento: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 30
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDiaFaturamentoClick
                end
                object EdDiaFaturamento: TEditHw
                  Left = 206
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
              end
              object Panel21: TPanel
                Left = 2
                Top = 414
                Width = 707
                Height = 53
                Align = alTop
                TabOrder = 11
                object Panel22: TPanel
                  Left = 1
                  Top = 1
                  Width = 705
                  Height = 20
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label33: TLabel
                    Left = 123
                    Top = 0
                    Width = 32
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Gerar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel23: TPanel
                  Left = 1
                  Top = 21
                  Width = 705
                  Height = 31
                  Align = alClient
                  BevelOuter = bvNone
                  TabOrder = 1
                  object pnGerarNFS: TPanel
                    Left = 0
                    Top = 0
                    Width = 175
                    Height = 31
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label35: TLabel
                      Left = 54
                      Top = 9
                      Width = 23
                      Height = 13
                      Caption = 'NFS:'
                    end
                    object ckGerarNFS: TCheckBox
                      Left = 21
                      Top = 6
                      Width = 30
                      Height = 17
                      TabOrder = 0
                      OnClick = ckGerarNFSClick
                    end
                    object cbGerarNFS: TComboBox
                      Left = 105
                      Top = 4
                      Width = 60
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 1
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                    end
                  end
                  object pnGerarNF: TPanel
                    Left = 175
                    Top = 0
                    Width = 175
                    Height = 31
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Label36: TLabel
                      Left = 60
                      Top = 9
                      Width = 17
                      Height = 13
                      Caption = 'NF:'
                    end
                    object ckGerarNF: TCheckBox
                      Left = 22
                      Top = 6
                      Width = 30
                      Height = 17
                      TabOrder = 0
                      OnClick = ckGerarNFClick
                    end
                    object cbGerarNF: TComboBox
                      Left = 105
                      Top = 4
                      Width = 60
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 1
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                    end
                  end
                  object pnGerarRecLoc: TPanel
                    Left = 350
                    Top = 0
                    Width = 175
                    Height = 31
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 2
                    object Label37: TLabel
                      Left = 60
                      Top = 9
                      Width = 41
                      Height = 13
                      Caption = 'Rec Loc:'
                    end
                    object ckGerarRecLoc: TCheckBox
                      Left = 22
                      Top = 6
                      Width = 30
                      Height = 17
                      TabOrder = 0
                      OnClick = ckGerarRecLocClick
                    end
                    object cbGerarRecLoc: TComboBox
                      Left = 105
                      Top = 4
                      Width = 60
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 1
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                    end
                  end
                  object pnGerarBoleto: TPanel
                    Left = 525
                    Top = 0
                    Width = 175
                    Height = 31
                    Align = alLeft
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 3
                    object Label41: TLabel
                      Left = 60
                      Top = 9
                      Width = 34
                      Height = 13
                      Caption = 'Boleto:'
                    end
                    object ckGerarBoleto: TCheckBox
                      Left = 22
                      Top = 6
                      Width = 30
                      Height = 17
                      TabOrder = 0
                      OnClick = ckGerarBoletoClick
                    end
                    object cbGerarBoleto: TComboBox
                      Left = 105
                      Top = 4
                      Width = 60
                      Height = 21
                      Style = csDropDownList
                      ItemHeight = 0
                      TabOrder = 1
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                    end
                  end
                end
              end
              object pnDiasAposVencimento: TPanel
                Left = 2
                Top = 108
                Width = 707
                Height = 31
                Align = alTop
                TabOrder = 3
                object lbDiasAposVenc: TLabel
                  Left = 46
                  Top = 7
                  Width = 157
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dias de Venc Ap'#243's Faturamento:'
                  WordWrap = True
                end
                object ckDiasAposVenc: TCheckBox
                  Left = 22
                  Top = 6
                  Width = 19
                  Height = 17
                  TabOrder = 0
                  OnClick = ckDiasAposVencClick
                end
                object EdDiasAposVenc: TEditHw
                  Left = 206
                  Top = 4
                  Width = 63
                  Height = 21
                  TabOrder = 1
                  Text = '                 0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
              end
            end
            object Panel7: TPanel
              Left = 1
              Top = 491
              Width = 711
              Height = 45
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object btnOKAlteracaoEmLote: TBitBtn
                Left = 276
                Top = 8
                Width = 75
                Height = 25
                Hint = 'OK - [CLI263]'
                Caption = 'OK'
                TabOrder = 0
                OnClick = btnOKAlteracaoEmLoteClick
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
              object btnCancelarAlteracaoEmLote: TBitBtn
                Left = 357
                Top = 8
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = 'Cancela'
                TabOrder = 1
                OnClick = btnCancelarAlteracaoEmLoteClick
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
        object tsSelecionaGradeProd: TTabSheet
          Caption = 'tsSelecionaGradeProd'
          ImageIndex = 11
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object ScrollBox5: TScrollBox
            Left = 0
            Top = 0
            Width = 899
            Height = 566
            Align = alClient
            TabOrder = 0
            object pnSelecionaGradeProd: TPanel
              Left = 9
              Top = 10
              Width = 782
              Height = 366
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 778
                Height = 327
                Align = alClient
                TabOrder = 0
                object Panel19: TPanel
                  Left = 2
                  Top = 15
                  Width = 774
                  Height = 41
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label201: TLabel
                    Left = 8
                    Top = 24
                    Width = 40
                    Height = 13
                    Caption = 'Grupo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label202: TLabel
                    Left = 135
                    Top = 24
                    Width = 44
                    Height = 13
                    Caption = 'C'#243'digo: '
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label38: TLabel
                    Left = 40
                    Top = 1
                    Width = 44
                    Height = 13
                    Caption = 'Label38'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label39: TLabel
                    Left = 54
                    Top = 24
                    Width = 44
                    Height = 13
                    Caption = 'Label39'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label40: TLabel
                    Left = 187
                    Top = 23
                    Width = 44
                    Height = 13
                    Caption = 'Label40'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                end
                object Panel20: TPanel
                  Left = 2
                  Top = 56
                  Width = 774
                  Height = 269
                  Align = alClient
                  Caption = 'Panel6'
                  TabOrder = 1
                  object DBGrid3: TDBGrid
                    Left = 1
                    Top = 1
                    Width = 772
                    Height = 267
                    Align = alClient
                    DataSource = dsSelecionaGradeProd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = [fsBold]
                    OnDblClick = DBGrid3DblClick
                    OnKeyDown = DBGrid3KeyDown
                  end
                end
              end
              object Panel27: TPanel
                Left = 0
                Top = 327
                Width = 778
                Height = 35
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn11: TBitBtn
                  Left = 344
                  Top = 3
                  Width = 88
                  Height = 25
                  Caption = '&Assume'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = BitBtn11Click
                  Glyph.Data = {
                    D2020000424DD202000000000000D20100002800000010000000100000000100
                    08000000000000010000120B0000120B0000670000006700000000000000FFFF
                    FF00FF00FF00A4676900A6696B00A6696A007B16000079140000A7756B007D18
                    00007F1A0000AC6C5A00A46A5A00FBF4F200821F0000811E0000811F00008929
                    07008A2A080099411E00BC826800C9937900E7D0C400FEFCFB00AB5B3000BB76
                    5000BF7D5900D1926D00C67F4E00DA9D7500D1864900E7AB7900D8A57B00D8A3
                    7300E6BD9900F6E9DD00D1965A00D59D6600FEFBF800DCA16200E9C49D00D4BC
                    A000F7EEE300EAB66C00EBBB7600EDC18000EFC68A00F0CC9600F0CB9700F3D3
                    A400F6DDBA00F8E7CE00F8E7CF00FAEEDC00EEC48400F3D7AB00F6E1C000FBF2
                    E200FCF7EE00FEFAF300FCDD9F00FAEDD400FBF4E700FFEAB5002D6718002A70
                    270001550300005D0300017707000266060002600500036E0700036C07000363
                    070004780A0003600700015A0600058C0D0005840C0005700B00099613000875
                    11000C881600067F140015A52800149A26001A922F0022B63E001C96310027BB
                    45002CC5580030BD570041E07500FCFFFF000F30F8000F30F7007486E700001E
                    FF000F2EF3000F2FF300727FD700707BCE006E75BF0002020202020202020204
                    0404040404040202020202020202020431302E2D2C0402020202020202020208
                    32656266360402020202020202020214335F61632F040202020202020202021B
                    39605E6437040202020202020202021D3B3E353438040202020202020202021F
                    01263A05050B0303030303030303021F010117051C020328202125242B03021F
                    1B1B410502020319090E100F27030202024C5A5802020823120A06183C030202
                    435B5C5751021401150711223F0302405356595552491B010D131A3D29030202
                    0242544F02021D0101162A03030C0202024B504802021F0101015D031E020202
                    474A4D4602021F1B1B1B1B0302024545444E45020202}
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 792
      Top = 506
      ExplicitLeft = 792
      ExplicitTop = 506
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 601
    Width = 914
    ExplicitTop = 601
    ExplicitWidth = 914
  end
  inherited pnStatusProcessamento: TPanel
    Top = 531
    ExplicitTop = 531
    inherited lbStatusProcessamento: TLabel
      ExplicitLeft = 26
      ExplicitTop = 38
    end
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Top = 81
  end
  inherited PopupMenu2: TPopupMenu
    Top = 371
  end
  inherited Timer1: TTimer
    Left = 662
    Top = 371
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 630
    Top = 371
  end
  object dsSelecionaGradeProd: TDataSource
    Left = 696
    Top = 368
  end
end
