inherited frmCadAgenda: TfrmCadAgenda
  Caption = 'Agenda Oficina'
  ClientHeight = 590
  ClientWidth = 1081
  Scaled = False
  ExplicitWidth = 1089
  ExplicitHeight = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 1081
    Height = 571
    ExplicitWidth = 1081
    ExplicitHeight = 571
    inherited Splitter2: TSplitter
      Height = 569
      ExplicitLeft = 744
      ExplicitTop = 2
      ExplicitHeight = 543
    end
    inherited PanelLeft: TPanel
      Width = 1076
      Height = 569
      ExplicitWidth = 1076
      ExplicitHeight = 569
      inherited PageControl1: TPageControl
        Width = 1074
        Height = 567
        ExplicitWidth = 1074
        ExplicitHeight = 567
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 1066
          ExplicitHeight = 536
          inherited ScrollBox1: TScrollBox
            Width = 1066
            Height = 536
            ExplicitWidth = 1066
            ExplicitHeight = 536
            inherited PageControl3: TPageControl
              Width = 1066
              Height = 488
              ActivePage = tsCadastro
              ExplicitWidth = 1066
              ExplicitHeight = 488
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 1058
                ExplicitHeight = 457
                inherited ScrollBox3: TScrollBox
                  Width = 1058
                  Height = 457
                  ExplicitWidth = 1058
                  ExplicitHeight = 457
                  inherited GroupBox1: TGroupBox
                    Width = 1054
                    ExplicitWidth = 1054
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
                object Label7: TLabel
                  Left = 50
                  Top = 374
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Observa'#231#227'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label10: TLabel
                  Left = 82
                  Top = 439
                  Width = 41
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Status:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 75
                  Top = 217
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Servi'#231'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 607
                  Top = 217
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'TMO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 617
                  Top = 439
                  Width = 22
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'OS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label15: TLabel
                  Left = 210
                  Top = 4
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Hora:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 390
                  Top = 1
                  Width = 56
                  Height = 16
                  Caption = 'Label16'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object Label8: TLabel
                  Left = 88
                  Top = 3
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 76
                  Top = 156
                  Width = 44
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cliente:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label9: TLabel
                  Left = 598
                  Top = 156
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fone:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label29: TLabel
                  Left = 299
                  Top = 4
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Minuto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBMemo1: TDBMemo
                  Left = 129
                  Top = 371
                  Width = 609
                  Height = 57
                  DataField = 'OBSERVACAO'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 13
                end
                object DBComboBox1: TDBComboBox
                  Left = 129
                  Top = 436
                  Width = 221
                  Height = 21
                  DataField = 'STATUS_AGENDA'
                  DataSource = DtmAgenda.dsAgenda
                  ItemHeight = 0
                  Items.Strings = (
                    'AGENDADO'
                    'OS ABERTA'
                    'FINALIZADO'
                    'CANCELADO')
                  TabOrder = 12
                end
                object DBEdit5: TDBEdit
                  Left = 645
                  Top = 214
                  Width = 93
                  Height = 21
                  DataField = 'TMO_SERVICO'
                  DataSource = DtmAgenda.dsAgendaItens
                  Enabled = False
                  TabOrder = 11
                  OnExit = DBEdit5Exit
                end
                object Panel27: TPanel
                  Left = 129
                  Top = 177
                  Width = 609
                  Height = 33
                  BevelKind = bkTile
                  BevelOuter = bvNone
                  TabOrder = 8
                  object BitBtn16: TBitBtn
                    Left = 172
                    Top = 2
                    Width = 75
                    Height = 25
                    Hint = 'Incluir Servi'#231'o - [AGO007]'
                    Caption = 'Incluir'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                    OnClick = BitBtn16Click
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
                  object BitBtn19: TBitBtn
                    Left = 335
                    Top = 2
                    Width = 75
                    Height = 25
                    Hint = 'Remover Servi'#231'o - [AGO008]'
                    Caption = 'Cancela'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 2
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
                  object BitBtn17: TBitBtn
                    Left = 253
                    Top = 2
                    Width = 75
                    Height = 25
                    Hint = 'Confirmar Servi'#231'o - [AGO009] '
                    Caption = 'Salva'
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    OnClick = BitBtn17Click
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
                object DBLookupComboBox2: TDBLookupComboBox
                  Left = 206
                  Top = 214
                  Width = 391
                  Height = 21
                  DataField = 'COD_SERVICO'
                  DataSource = DtmAgenda.dsAgendaItens
                  Enabled = False
                  KeyField = 'COD_SERVICO'
                  ListField = 'DESC_SERVICO'
                  ListSource = DtmAgenda.dsServicoCons
                  TabOrder = 10
                  OnExit = DBLookupComboBox2Exit
                end
                object DBGrid3: TDBGrid
                  Left = 129
                  Top = 241
                  Width = 609
                  Height = 122
                  DataSource = DtmAgenda.dsAgendaItens
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnKeyDown = DBGrid3KeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'COD_SERVICO'
                      Title.Caption = 'Codigo'
                      Width = 40
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DESC_SERVICO'
                      Title.Caption = 'Descri'#231#227'o'
                      Width = 320
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NITEM'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TMO_SERVICO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_BOX'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_VENDEDOR'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NPED'
                      Visible = True
                    end>
                end
                object DBEdit1: TDBEdit
                  Left = 645
                  Top = 436
                  Width = 93
                  Height = 21
                  DataField = 'NPED'
                  DataSource = DtmAgenda.dsAgenda
                  Enabled = False
                  TabOrder = 14
                end
                object PageControl4: TPageControl
                  Left = -10
                  Top = 28
                  Width = 794
                  Height = 120
                  ActivePage = TabSheet4
                  Style = tsFlatButtons
                  TabOrder = 4
                  object TabSheet4: TTabSheet
                    Caption = 'Dados Veiculo'
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object Label64: TLabel
                      Left = 89
                      Top = 6
                      Width = 37
                      Height = 13
                      Caption = 'Placa:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label65: TLabel
                      Left = 84
                      Top = 33
                      Width = 42
                      Height = 13
                      Caption = 'Chassi:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label67: TLabel
                      Left = 74
                      Top = 60
                      Width = 52
                      Height = 13
                      Caption = 'Ano Fab:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label22: TLabel
                      Left = 332
                      Top = 88
                      Width = 75
                      Height = 13
                      Caption = 'Cod Ve'#237'culo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      Visible = False
                    end
                    object Label30: TLabel
                      Left = 247
                      Top = 60
                      Width = 55
                      Height = 13
                      Caption = 'Ano Mod:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit32: TDBEdit
                      Tag = 1
                      Left = 132
                      Top = 3
                      Width = 102
                      Height = 21
                      Hint = '[F4:Novo]  - Placa do Ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'PLACA'
                      DataSource = DtmAgenda.dsAgenda
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                      OnExit = DBEdit32Exit
                      OnKeyDown = DBEdit32KeyDown
                    end
                    object DBEdit38: TDBEdit
                      Tag = 2
                      Left = 132
                      Top = 30
                      Width = 198
                      Height = 21
                      Hint = 'Chassi do Ve'#237'culo'
                      CharCase = ecUpperCase
                      DataField = 'CHASSI'
                      DataSource = DtmAgenda.dsAgenda
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBEdit38Exit
                      OnKeyDown = DBEdit38KeyDown
                    end
                    object DBEdit39: TDBEdit
                      Left = 132
                      Top = 57
                      Width = 86
                      Height = 21
                      Hint = 'Ano Fabrica'#231#227'o de Ve'#237'culo'
                      DataField = 'ANOFAB'
                      DataSource = DtmAgenda.dsveic
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                    end
                    object Memo1: TMemo
                      Left = 431
                      Top = 3
                      Width = 313
                      Height = 60
                      Hint = 'Resumo dos dados do ve'#237'culo'
                      Color = clWhite
                      Enabled = False
                      TabOrder = 0
                    end
                    object BitBtn9: TBitBtn
                      Left = 499
                      Top = 65
                      Width = 143
                      Height = 24
                      Hint = 'Clique para pesquisar o ve'#237'culo'
                      Caption = '&Pesquisar Ve'#237'culo'
                      TabOrder = 1
                      OnClick = BitBtn9Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000D30E0000D30E00000001000000010000181810001818
                        18002929290031313100313931004A39310039393900423939004A423900524A
                        3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                        5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                        73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                        8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                        8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                        9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                        9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                        A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                        AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                        AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                        BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                        C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                        CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                        D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                        E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                        8080808080808080808080808080808080808080808052068080808080808080
                        8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                        808080471134612A80808080808080808080581634522A808080808080343434
                        34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                        7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                        386B1A18808080808080344271634444646C271F808080808080494056647474
                        5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                        4541588080808080808080803C3F453A53358080808080808080}
                    end
                    object DBEdit10: TDBEdit
                      Left = 308
                      Top = 57
                      Width = 86
                      Height = 21
                      Hint = 'Ano Modelo do ve'#237'culo'
                      DataField = 'ANOMOD'
                      DataSource = DtmAgenda.dsveic
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 5
                    end
                  end
                  object TabSheet5: TTabSheet
                    Caption = 'Dados do Objeto de Servi'#231'o'
                    ImageIndex = 1
                    ExplicitLeft = 0
                    ExplicitTop = 0
                    ExplicitWidth = 0
                    ExplicitHeight = 0
                    object Label74: TLabel
                      Left = 82
                      Top = 4
                      Width = 44
                      Height = 13
                      Caption = 'C'#243'digo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label75: TLabel
                      Left = 26
                      Top = 44
                      Width = 100
                      Height = 13
                      Caption = 'Dados do Objeto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label73: TLabel
                      Left = 355
                      Top = 4
                      Width = 42
                      Height = 13
                      Caption = 'Objeto:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit41: TDBEdit
                      Left = 135
                      Top = 1
                      Width = 101
                      Height = 21
                      Hint = '[F4: Novo]  - C'#243'digo do equipamento'
                      DataField = 'COD_EQUIP'
                      DataSource = DtmAgenda.dsAgenda
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      OnExit = DBEdit41Exit
                      OnKeyDown = DBEdit41KeyDown
                    end
                    object Memo2: TMemo
                      Left = 135
                      Top = 33
                      Width = 387
                      Height = 55
                      Hint = 'Resumo dos dados do aparelho'
                      Color = clWhite
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit40: TDBEdit
                      Left = 400
                      Top = 1
                      Width = 341
                      Height = 21
                      Hint = 'Descri'#231#227'o do aparelho'
                      DataField = 'NOM_EQUIP'
                      DataSource = DtmAgenda.dsApar
                      Enabled = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                    end
                    object BitBtn21: TBitBtn
                      Left = 571
                      Top = 46
                      Width = 123
                      Height = 25
                      Hint = 'Clique aqui para pesquisar o aparelho'
                      Caption = '&Pesquisar Objeto'
                      TabOrder = 2
                      OnClick = BitBtn21Click
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000D30E0000D30E00000001000000010000181810001818
                        18002929290031313100313931004A39310039393900423939004A423900524A
                        3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                        5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                        73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                        8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                        8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                        9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                        9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                        A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                        AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                        AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                        BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                        C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                        CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                        D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                        E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                        8080808080808080808080808080808080808080808052068080808080808080
                        8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                        808080471134612A80808080808080808080581634522A808080808080343434
                        34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                        7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                        386B1A18808080808080344271634444646C271F808080808080494056647474
                        5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                        4541588080808080808080803C3F453A53358080808080808080}
                    end
                  end
                end
                object DBEdit2: TDBEdit
                  Left = 126
                  Top = 0
                  Width = 71
                  Height = 21
                  DataField = 'DATA_AGENDA'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 1
                  OnExit = DBEdit2Exit
                end
                object DBEdit3: TDBEdit
                  Left = 249
                  Top = 1
                  Width = 32
                  Height = 21
                  DataField = 'HORA_AGENDA'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 2
                  OnExit = DBEdit3Exit
                end
                object DBEdit7: TDBEdit
                  Left = 203
                  Top = 152
                  Width = 391
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'NOME_CLIENTE'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 6
                end
                object DBEdit6: TDBEdit
                  Left = 637
                  Top = 152
                  Width = 101
                  Height = 21
                  DataField = 'FONE_CLIENTE'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 7
                end
                object DBEdit8: TDBEdit
                  Left = 129
                  Top = 214
                  Width = 71
                  Height = 21
                  DataField = 'COD_SERVICO'
                  DataSource = DtmAgenda.dsAgendaItens
                  Enabled = False
                  TabOrder = 9
                  OnExit = DBEdit8Exit
                  OnKeyDown = DBEdit8KeyDown
                end
                object DBEdit9: TDBEdit
                  Left = 129
                  Top = 152
                  Width = 71
                  Height = 21
                  DataField = 'COD_CLIENTE'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 5
                  OnExit = DBEdit9Exit
                  OnKeyDown = DBEdit9KeyDown
                end
                object DBEdit4: TDBEdit
                  Left = 347
                  Top = 0
                  Width = 32
                  Height = 21
                  DataField = 'MINUTO_AGENDA'
                  DataSource = DtmAgenda.dsAgenda
                  TabOrder = 3
                  OnExit = DBEdit4Exit
                end
              end
            end
            inherited Panel3: TPanel
              Top = 488
              Width = 1066
              ExplicitTop = 488
              ExplicitWidth = 1066
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [AGO006]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 1066
          ExplicitHeight = 536
          inherited GroupBox3: TGroupBox
            Width = 1066
            ExplicitWidth = 1066
            inherited imgInformation: TImage
              Left = 1040
              ExplicitLeft = 1040
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [AGO002]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [AGO003]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object BitBtn8: TBitBtn
              Left = 604
              Top = 13
              Width = 75
              Height = 25
              Hint = 'Voltar'
              Caption = '&Voltar'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              OnClick = BitBtn8Click
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
          end
          inherited Panel1: TPanel
            Width = 1066
            Height = 463
            ExplicitWidth = 1066
            ExplicitHeight = 463
            inherited Splitter1: TSplitter
              Height = 402
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              Width = 773
              Height = 402
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 1062
              ExplicitWidth = 1062
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [AGO004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [AGO005]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [AGO021]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Visible = False
              end
              inherited SpeedButton6: TSpeedButton
                Visible = False
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
                Top = 5
                Visible = False
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
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
          ExplicitWidth = 1066
          ExplicitHeight = 536
        end
        object tsAgenda: TTabSheet
          Caption = 'tsAgenda'
          ImageIndex = 3
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 1066
            Height = 536
            Align = alClient
            BiDiMode = bdLeftToRight
            Caption = 'Agenda de Servi'#231'os'
            ParentBiDiMode = False
            TabOrder = 0
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 231
              Height = 519
              Align = alLeft
              BevelInner = bvRaised
              TabOrder = 0
              object Panel5: TPanel
                Left = 2
                Top = 157
                Width = 227
                Height = 360
                Align = alClient
                TabOrder = 0
                object Panel11: TPanel
                  Left = 1
                  Top = 159
                  Width = 225
                  Height = 200
                  Align = alClient
                  BevelOuter = bvLowered
                  TabOrder = 0
                  object SpeedButton9: TSpeedButton
                    Left = 1
                    Top = 101
                    Width = 223
                    Height = 50
                    Hint = 'Desmacar Agendamento  - [AGO005]'
                    Align = alTop
                    Caption = '&Desmarcar'
                    Glyph.Data = {
                      36050000424D3605000000000000F60200002800000018000000180000000100
                      08000000000040020000120B0000120B0000B0000000B000000000000000FFFF
                      FF004E4D50005C5B5D00FF00FF003F3D3E00403E3F004C4B4B00FEFCFC00C9C7
                      C700FEFCFB00BC4B0000827E7B00D9640100FEEFE100FEF0E300FEF3E900FEF4
                      EB00FED1A400FED5AB00FEDAB500FEDEBD00FEE7D100FEE9D400FEEAD700FEEB
                      D800FEEFE000FEF0E200FEF2E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFB
                      F800FEFCFA00D5812700FECB9600FED3A500FED5A900FED7AC00FED7AD00FED8
                      AD00FED8B000FED9B200FEDAB200FEDCB700FEDCB800FEDEBB00FEE1C100FEE2
                      C400FEE3C600FEE3C700FEE5C900FEE5CA00FEE6CC00FEE7CF00FEE9D300FEEA
                      D400FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700FEF6ED00FEDCB500FEE0
                      BD00FEE1C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEBD500FEEDD900FEEF
                      DE00FEF7EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFBF700FEFAF400C6C4
                      C100FEFAF300FEFBF6006DA9600084B07E00639D5F0075A972008BBA8800007F
                      0000006F0000005900002BAA2E0090E691006CD574000A8B19000EA02300112D
                      170016B03A0020B846001CB846001A7335001C5E3B0047866A0054809E001E7F
                      F700162F4E001C67C50016294100162335001664DD0015376C00112753000F44
                      B80011295C000C297A000A2D96002856F8002A59FF00305FFB0013151C001844
                      FF002049F8002250FF00244BEF000E36FF00123BFF00133EFF00143BF8001540
                      FF001A41F700193FF0001D42ED000A31FC000A2BF3000B2EFF000C33FF000C2F
                      F7000C2EF6000D34FF000D2EF3000E32FF000E2FF3000E30F3001032F6001033
                      F6001135FB001134F6001133F0001134ED001336F000001FFF000425FF000626
                      FA000624F0000724ED00082AFF000927F0000D2DF300001DFF00001CFB000018
                      F6000019F6000018F3000019F3000017EF00011CFE000118EE00021EF3000000
                      82001313150028282A0041414200EDEDEE0088888900FEFEFE00040404040404
                      04040404040404A9A9040404040404A9A904040404040404040404040404A985
                      9AA904040404A9A1A0A9040404040404040404040404A98A889BA90404A9A49F
                      A5A90B0B0B0B0B0B0B0B0B0B0B0B0BA98C8B9DA9A9A297A7A9040B3E1B3B1816
                      3531412D0B292612A98E7D99A69FA3A90B040B4E1D3D4948384332420B402A13
                      25A9899C98A8A9240B040B201F3F3E3C4B4744340B412D2B27A9928D8786A924
                      0B040B0A555B5B5B5B5B54460B322323A9827993907E9EA90B040BAF565A6063
                      5C595B3A0B3734A97A7B83A9A9947F8FA9040BAF575F645E5D625B0F0B19A975
                      7684A92B28A9958191A90BAFAF616668676558110B1AA9777CA923232323A996
                      80A90BAFAE78737473780C1F0B3E1BA9A9453531412E2CA9A9040BAFAC727171
                      717005210B4A1D3D4948174333302F140B040BAFAB6F6E6E6E6F06080B532323
                      23232323232323150B040BAFAB6D6B69696C07AF0B0A4F524E104C4919383632
                      0B040BAF03AAAA6C6AAA51AF0BAF0A21501E111C0E4B39370B040BAFAD02AAAA
                      0209AFAF0BAF232323232323232323190B040BAFAFAFAFAFAFAFAFAF0BAFAFAF
                      AF0821524A114D1A0B040BAFAFAFAFAFAFAFAFAF0BAFAFAFAFAF08224F1F3F3E
                      0B040B0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0B040B0B0B0B0B0B
                      0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B04040B0B0B0B0B0B0B0B0B0B0B0B0B
                      0B0B0B0B0B0B0B0B040404040404040404040404040404040404040404040404
                      0404040404040404040404040404040404040404040404040404}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton9Click
                  end
                  object SpeedButton10: TSpeedButton
                    Left = 1
                    Top = 51
                    Width = 223
                    Height = 50
                    Hint = 'Editar Agendamento - [AGO004]'
                    Align = alTop
                    Caption = '&Editar'
                    Glyph.Data = {
                      2A060000424D2A06000000000000EA0300002800000018000000180000000100
                      08000000000040020000120B0000120B0000ED000000ED00000000000000FFFF
                      FF004E4D50005C5B5D00534E5700FF00FF003F3D3E00403E3F003F2F30005B35
                      3500643B3B008B555500804E4E0091595900965D5D008B565600734747008C57
                      570095606000AA6E6E00A96D6D00A76C6C00A66B6B007A4F4F008C5B5B009160
                      6000B77A7A00B6797900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B
                      8B00C7898900C98B8B00C78A8A00CC8E8E00DA9A9A00D9999900C2898900D99A
                      9A00DC9D9D00E1A1A100DA9C9C00E2A3A300EBAAAA00E2A4A400E1A3A3004C4B
                      4B00FEFCFC00C9C7C700FCFBFB005A3432005D383600764D4B00B6A19F005C35
                      2F00B7A19C00B7A39E00B7A09A00DDCBC200FEFCFB00BC4B0000BB4B0000B849
                      0000B6490000B5480000A7430000A1410000903900008C380000722D0000702D
                      00005A2400005B27030091400C0089512B0076604F00827E7B00D9640100D763
                      01009F5E2800755E4B00755E4C00D5680600653C1600FAE3CE00FAF0E700F3C2
                      9000E0B58900C1A07F00FEEAD700FEF0E200FEF4EA00FEF8F200FEFAF600FEFB
                      F800FAF7F400D5812700D17F2600CF7D2600BF732300A0621D007F4D1700683F
                      1300824F1800FECB9600FBC99500FCCA9600F3C49100F4C59200E0B58700F6C7
                      9600BD9A7500E5BB8F00E3BB9000C2A07B00967B5F00C2A17E009A8166009C83
                      6800998268007D6A5500F4E0CB00FCEBD800FEEEDD00FEF0E100FEF2E500FEF3
                      E700FEF6ED00BD9C7600967D60007A6A5700FAEAD700FEEFDE00FAF3EB00FEF7
                      EE00FCF7F000FAF6F000F3EFE900C6C4C100FCFAF700FAF6EF00F4F2EE00FCFA
                      F400FBFAF70084B07E00639D5F0075A972008AB8870005500300007E0000006F
                      000000590000005600002BAA2E0090E691006CD574000A8B19000EA02300112D
                      170016B03A0020B846001CB846001A7335001C5E3B0047866A00758686001734
                      3C004D6C750000BDFF0000B1F20000AAEA0000A6E600009FDE000093D100097B
                      AB000087C4000084C100028AC4000A405900113B4E00008CD100036A9D000468
                      9A000459830005679800064F7500073953000F2C3A00182A33001B506E003150
                      650054809E00354756001E7FF700162F4E002A3440001C67C500162941001623
                      35001664DD0015376C0011275300414855000F44B80011295C000C297A00012B
                      A7000A2D960013151C00001C9D002D4FF6005270FC00021DB100031EB1000420
                      B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624BF000109
                      9700010A9700050DA50000058F0000008200131315001F1F210028282A004141
                      4200EDEDEE0088888900FEFEFE000505050505E7E70505050505050505050505
                      0505050505050505050505E7E7BFBE0505050505050505050505050505050505
                      05050505B6B9BCBD05050505050505050505050505053F3F3F3F4042A9B8BBC0
                      C6084B49474443403F3F3F3F3F053F815D7E5C57A8BAC112130E0A5376727059
                      6C6B6B6B3F053F895E80877D7CB518251D130E0A537672706E6C6B6B3F053F60
                      5F82817F86AA1F2A201E140D095484835A6F6C6B3F053F3E939A9A9A9A9B372F
                      2A201E14113556686766656D3F053FEC9499A0A39C9897172D2A211C150F094E
                      7875737140053FEC959FA49E9DA29A3D10302C231C150F367B79777442053FEC
                      ECA1A6C2A7A596584C102B26231A160B39696A5B44053FECEBD3D0D2D0D34F8A
                      403C102B29241A160B09857A46053FECE9CFCECECECC066140883A192E27221B
                      0CCDC38548053FECE8CBCACACACB07323F916452192E2704B4ADAEB24A053FEC
                      E8C9C7C4C4C831EC3F3E8E8F3B1928B1ABABAED4E5053FEC03E6E6C8C5E68DEC
                      3FEC3E8E8B3810AFABB7D4DEE2E53FECEA02E6E60233ECEC3FEC636363644DB0
                      ACD1DAD9D7E23FECECECECECECECECEC3FECECECEC34628CB3DDD5DBD8E43FEC
                      ECECECECECECECEC3FECECECECEC349290E0D6DCE1053F505050505050505050
                      50505050505050505155DFE345053F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
                      3F4041434305053F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F404005050505
                      0505050505050505050505050505050505050505050505050505050505050505
                      0505050505050505050505050505}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton10Click
                  end
                  object SpeedButton13: TSpeedButton
                    Left = 1
                    Top = 151
                    Width = 223
                    Height = 50
                    Hint = 'Sair'
                    Align = alTop
                    Caption = '&Sair'
                    Glyph.Data = {
                      2E020000424D2E020000000000002E0100002800000010000000100000000100
                      08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
                      FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
                      EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
                      E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
                      BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
                      AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
                      D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
                      FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
                      FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
                      0202020202020202020202020202020202020204040404040404040404040402
                      020202040132302E28272125242F04020202020401050F221B1614130B260402
                      0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
                      02020204010101332A20291D192D040202020204010101010112093D1E2E043D
                      020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
                      0202020203040404040404043D383D0202020202020202020202023D353D393D
                      020202020202020202023D343D023D3A3D020202020202020202023D0202023D
                      020202020202020202020202020202020202}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton13Click
                  end
                  object SpeedButton14: TSpeedButton
                    Left = 1
                    Top = 1
                    Width = 223
                    Height = 50
                    Hint = 'Incluir Agendamento - [AGO003]'
                    Align = alTop
                    Caption = '&Agendar'
                    Glyph.Data = {
                      22050000424D2205000000000000E20200002800000018000000180000000100
                      08000000000040020000120B0000120B0000AB000000AB00000000000000FFFF
                      FF004E4D50005C5B5D00FF00FF003F3D3E00403E3F004C4B4B00FEFCFC00C9C7
                      C700FEFCFB00BC4B0000BB4B0000BA4A0000B5480000A64200009A3E0000827E
                      7B00D9640100FEEFE100FEF0E300FEF3E900FEF4EB00F6CCA100FEDAB500FCDA
                      B700FEDEBD00FEE7D100FEE9D400FEEAD700FEEBD800FEEFE000FEF0E200FEF2
                      E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFBF800FEFCFA00CE7D2500D581
                      2700CF7D2600D4802700D3802700A9886500C09C7500FED0A000F4CA9E00FCD4
                      A700F6CFA600FED7AC00FED8AD00FED8B000FED9B100FBD7B000FEDCB600FEDC
                      B700FEDDB800FEDEBB00FEE0BF00FEE1C100FEE1C200FEE2C400FEE3C500FEE3
                      C600FEE3C700FEE5C900FEE5CA00FEE6CB00FEE6CC00FEE7CF00FEE9D300FEEA
                      D400FEEAD500FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700FEF6ED00FCD9
                      B100FEDCB500FEE0BD00FEE1C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEB
                      D500FEEDD900FEEFDE00FEF7EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFB
                      F700FEFAF400C6C4C100FEFAF300FEFBF6006DA9600084B07E00639D5F0075A9
                      72008BBA8800007F0000006F000000590000035A05002BAA2E0090E691000690
                      0E00089511000A9814006CD574000A9A17000C9D19000A8B19000DA01C000EA1
                      1D0010A5200011A522000EA0230011A6240013AB270014AC290017B02E0018B2
                      30001BB735001CBA38001FBF3E0020C1400022C4430023C5450025C74700112D
                      170016B03A0027CB4B0028CC4D0020B8460029CF52002CD355002DD458001CB8
                      460030D95E0034DE65001A7335001C5E3B0047866A0054809E001E7FF700162F
                      4E001C67C50016294100162335001664DD0015376C00112753000F44B8001129
                      5C000C297A000A2D960013151C001313150028282A0041414200EDEDEE008888
                      8900FEFEFE0004040404040404040404040404040404046E6E6E6E0404040404
                      0404040404040404040404040404046E72716E04040404040404040404040404
                      040404040404046E76736E0404040B0B0B0B0B0B0B0B0B0B0B0B0C0E6E6E6E6E
                      7D796E6E6E6E0B4F204C1D1B443F53390B3431306E888583817F7B78756E0B60
                      224E5B5A485541540B5235326E8F8C878482807E7A6E0B2524504F4D5D595643
                      0B5339376E6E6E6E8B866E6E6E6E0B0A676D6D6D6D6D66580B41292B2929296E
                      908E6E2D10040BAA686C7C8D6F6B6D4B0B47433E1A38366E93926E2E0F040BAA
                      69779174708A6D140B1E5845403C3A6E6E6E6E2F0B040BAAAA89959796946A16
                      0B1F292929292B2C2A2828170D040BAAA9A4A2A3A2A411240B4F204C4A57443F
                      531951330B040BAAA7A1A0A0A09F05260B5C224E5B5A1C55423D3B180B040BAA
                      A69E9D9D9D9E06080B652929292929292929291A0B040BAAA69C9A98989B07AA
                      0B0A616460155E5B1E4846410B040BAA03A5A59B99A563AA0BAA0A2662231621
                      135D49470B040BAAA802A5A50209AAAA0BAA2929292929292929291E0B040BAA
                      AAAAAAAAAAAAAAAA0BAAAAAAAA0826645C165F1F0B040BAAAAAAAAAAAAAAAAAA
                      0BAAAAAAAAAA08276124504F0B040B1212121212121212121212121212121212
                      121212120B040B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B04040B
                      0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B040404040404040404040404
                      0404040404040404040404040404040404040404040404040404040404040404
                      040404040404}
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = SpeedButton14Click
                  end
                end
                object Panel8: TPanel
                  Left = 1
                  Top = 1
                  Width = 225
                  Height = 158
                  Align = alTop
                  BevelOuter = bvLowered
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Vani'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  object Panel6: TPanel
                    Left = 1
                    Top = 42
                    Width = 223
                    Height = 115
                    Align = alClient
                    TabOrder = 0
                    object Label13: TLabel
                      Left = 77
                      Top = -1
                      Width = 71
                      Height = 20
                      Caption = 'Legenda'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -16
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 38
                      Top = 51
                      Width = 138
                      Height = 13
                      Caption = 'Aguardando Fechamento OS'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label18: TLabel
                      Left = 17
                      Top = 20
                      Width = 49
                      Height = 13
                      Caption = 'OS Aberta'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label19: TLabel
                      Left = 138
                      Top = 20
                      Width = 60
                      Height = 13
                      Caption = 'OS Fechada'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 6
                      Top = 78
                      Width = 69
                      Height = 13
                      Caption = 'OS Cancelada'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 129
                      Top = 79
                      Width = 86
                      Height = 13
                      Caption = 'Servi'#231'o em Atraso'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Panel21: TPanel
                      Left = 88
                      Top = 65
                      Width = 35
                      Height = 13
                      BevelOuter = bvNone
                      Color = clMenuHighlight
                      Font.Charset = CHINESEBIG5_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 0
                    end
                    object Panel22: TPanel
                      Left = 23
                      Top = 35
                      Width = 35
                      Height = 13
                      BevelOuter = bvNone
                      Color = clYellow
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 1
                    end
                    object Panel23: TPanel
                      Left = 150
                      Top = 35
                      Width = 35
                      Height = 13
                      BevelOuter = bvNone
                      Color = clGreen
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 2
                    end
                    object Panel24: TPanel
                      Left = 23
                      Top = 93
                      Width = 35
                      Height = 13
                      BevelOuter = bvNone
                      Color = clRed
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 3
                    end
                    object Panel25: TPanel
                      Left = 150
                      Top = 93
                      Width = 35
                      Height = 13
                      BevelOuter = bvNone
                      Color = clFuchsia
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = [fsBold]
                      ParentBackground = False
                      ParentFont = False
                      TabOrder = 4
                    end
                  end
                  object Panel29: TPanel
                    Left = 1
                    Top = 1
                    Width = 223
                    Height = 41
                    Align = alTop
                    TabOrder = 1
                    object Label23: TLabel
                      Left = 3
                      Top = 22
                      Width = 38
                      Height = 14
                      Caption = 'Label23'
                    end
                    object Label24: TLabel
                      Left = 84
                      Top = 21
                      Width = 38
                      Height = 14
                      Caption = 'Label24'
                    end
                    object Label25: TLabel
                      Left = 171
                      Top = 22
                      Width = 38
                      Height = 14
                      Caption = 'Label25'
                    end
                    object Label26: TLabel
                      Left = 3
                      Top = 0
                      Width = 53
                      Height = 14
                      Caption = 'Min por Dia'
                    end
                    object Label27: TLabel
                      Left = 84
                      Top = 0
                      Width = 65
                      Height = 14
                      Caption = 'Min Utilizados'
                    end
                    object Label28: TLabel
                      Left = 171
                      Top = 0
                      Width = 43
                      Height = 14
                      Caption = 'Min Disp.'
                    end
                  end
                end
              end
              object Panel7: TPanel
                Left = 2
                Top = 2
                Width = 227
                Height = 155
                Align = alTop
                BevelOuter = bvLowered
                TabOrder = 1
                object MonthCalendar1: TMonthCalendar
                  Left = 1
                  Top = 1
                  Width = 225
                  Height = 153
                  Margins.Left = 0
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alClient
                  AutoSize = True
                  Date = 41135.587685069450000000
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -5
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  OnClick = MonthCalendar1Click
                end
              end
            end
            object Panel9: TPanel
              Left = 233
              Top = 15
              Width = 831
              Height = 519
              Align = alClient
              BevelInner = bvRaised
              TabOrder = 1
              object GroupBox5: TGroupBox
                Left = 2
                Top = 2
                Width = 827
                Height = 42
                Align = alTop
                Caption = 'Visualiza'#231#227'o por:'
                TabOrder = 0
                object pnDia: TPanel
                  Left = 148
                  Top = 8
                  Width = 152
                  Height = 31
                  Caption = 'Dia'
                  TabOrder = 0
                  OnClick = pnDiaClick
                end
                object pnSemana: TPanel
                  Left = 300
                  Top = 8
                  Width = 152
                  Height = 31
                  Caption = 'Semana'
                  TabOrder = 1
                  OnClick = pnSemanaClick
                end
                object BitBtn7: TBitBtn
                  Left = 526
                  Top = 8
                  Width = 98
                  Height = 34
                  Hint = 'Clique para pesquisar - [AGO002]'
                  Caption = '&Procurar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = BitBtn7Click
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
              end
              object GroupBox6: TGroupBox
                Left = 2
                Top = 44
                Width = 827
                Height = 42
                Align = alTop
                Caption = 'Turno'
                TabOrder = 1
                object pnManha: TPanel
                  Left = 148
                  Top = 8
                  Width = 152
                  Height = 31
                  Caption = 'Manh'#227
                  TabOrder = 0
                  OnClick = pnManhaClick
                end
                object pnTarde: TPanel
                  Left = 300
                  Top = 8
                  Width = 152
                  Height = 31
                  Caption = 'Tarde'
                  TabOrder = 1
                  OnClick = pnTardeClick
                end
                object BitBtn10: TBitBtn
                  Left = 515
                  Top = 6
                  Width = 111
                  Height = 34
                  Caption = '&Atualizar Lembretes'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  Visible = False
                  OnClick = BitBtn10Click
                end
              end
              object PageControl2: TPageControl
                Left = 2
                Top = 86
                Width = 827
                Height = 431
                ActivePage = tsSemana
                Align = alClient
                Style = tsFlatButtons
                TabOrder = 2
                object tsDia: TTabSheet
                  Caption = 'Dia'
                  ParentShowHint = False
                  ShowHint = False
                  TabVisible = False
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel12: TPanel
                    Left = 0
                    Top = 0
                    Width = 819
                    Height = 421
                    Align = alClient
                    TabOrder = 0
                    object Splitter3: TSplitter
                      Left = 1
                      Top = 300
                      Width = 817
                      Height = 3
                      Cursor = crVSplit
                      Align = alTop
                      ExplicitLeft = 0
                      ExplicitTop = 291
                    end
                    object Panel14: TPanel
                      Left = 1
                      Top = 1
                      Width = 817
                      Height = 299
                      Align = alTop
                      Caption = 'Panel13'
                      TabOrder = 0
                      object Splitter6: TSplitter
                        Left = 719
                        Top = 1
                        Height = 297
                        Align = alRight
                        ExplicitHeight = 3
                      end
                      object Panel18: TPanel
                        Left = 1
                        Top = 1
                        Width = 718
                        Height = 297
                        Align = alClient
                        Caption = 'Panel7'
                        TabOrder = 0
                        object StringGrid2: TStringGrid
                          Left = 1
                          Top = 1
                          Width = 716
                          Height = 295
                          Align = alClient
                          ColCount = 2
                          DefaultColWidth = 50
                          DefaultRowHeight = 40
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 0
                          OnClick = StringGrid2Click
                          ColWidths = (
                            50
                            639)
                          RowHeights = (
                            40
                            40
                            40
                            40
                            40)
                        end
                      end
                      object Panel10: TPanel
                        Left = 722
                        Top = 1
                        Width = 94
                        Height = 297
                        Align = alRight
                        Caption = 'Panel7'
                        TabOrder = 1
                        object DBGrid2: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 92
                          Height = 295
                          Align = alClient
                          DataSource = DtmAgenda.dsLembreteAgenda
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Times New Roman'
                          Font.Style = []
                          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                          ParentFont = False
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -3
                          TitleFont.Name = 'MS Sans Serif'
                          TitleFont.Style = []
                          OnDrawColumnCell = DBGrid2DrawColumnCell
                          OnDblClick = DBGrid2DblClick
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'LEMBRETE'
                              Title.Caption = 'Lembrete'
                              Visible = True
                            end>
                        end
                      end
                    end
                    object Panel13: TPanel
                      Left = 1
                      Top = 331
                      Width = 817
                      Height = 89
                      Align = alClient
                      Caption = 'Panel13'
                      TabOrder = 1
                      object DBGrid4: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 815
                        Height = 87
                        Hint = 'Aperte Enter para visualizar registro selecionado - [AGO004]'
                        Align = alClient
                        DataSource = DtmAgenda.dsAgenda
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
                            FieldName = 'COD_AGENDA'
                            Title.Caption = 'Cod Agenda'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CLIENTE'
                            Width = 60
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NOME_CLIENTE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'FONE_CLIENTE'
                            Title.Caption = 'Fone'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'HORA_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'MINUTO_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'STATUS_AGENDA'
                            Width = 80
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TMO_SERVICO'
                            Title.Caption = 'Tmo'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NPED'
                            Title.Caption = 'N'#186' OS'
                            Visible = True
                          end>
                      end
                    end
                    object Panel15: TPanel
                      Left = 1
                      Top = 303
                      Width = 817
                      Height = 28
                      Align = alTop
                      Caption = 'Resumo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                    end
                  end
                end
                object tsSemana: TTabSheet
                  Caption = 'Semana'
                  ImageIndex = 1
                  TabVisible = False
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel16: TPanel
                    Left = 0
                    Top = 0
                    Width = 819
                    Height = 421
                    Align = alClient
                    TabOrder = 0
                    object Splitter4: TSplitter
                      Left = 1
                      Top = 300
                      Width = 817
                      Height = 3
                      Cursor = crVSplit
                      Align = alTop
                      ExplicitLeft = 0
                      ExplicitTop = 291
                    end
                    object Panel17: TPanel
                      Left = 1
                      Top = 1
                      Width = 817
                      Height = 299
                      Align = alTop
                      Caption = 'Panel13'
                      TabOrder = 0
                      object Splitter5: TSplitter
                        Left = 719
                        Top = 1
                        Height = 297
                        Align = alRight
                        ExplicitLeft = 727
                        ExplicitTop = -1
                        ExplicitHeight = 294
                      end
                      object Panel19: TPanel
                        Left = 1
                        Top = 1
                        Width = 718
                        Height = 297
                        Align = alClient
                        Caption = 'Panel7'
                        TabOrder = 0
                        object StringGrid4: TStringGrid
                          Left = 1
                          Top = 1
                          Width = 716
                          Height = 295
                          Align = alClient
                          ColCount = 7
                          DefaultColWidth = 95
                          DefaultRowHeight = 40
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                          TabOrder = 0
                          OnClick = StringGrid4Click
                          ColWidths = (
                            95
                            95
                            95
                            95
                            95
                            95
                            95)
                          RowHeights = (
                            40
                            40
                            40
                            40
                            40)
                        end
                      end
                      object Panel20: TPanel
                        Left = 722
                        Top = 1
                        Width = 94
                        Height = 297
                        Align = alRight
                        Caption = 'Panel7'
                        TabOrder = 1
                        object DBGrid5: TDBGrid
                          Left = 1
                          Top = 1
                          Width = 92
                          Height = 295
                          Align = alClient
                          DataSource = DtmAgenda.dsLembreteAgenda
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'Times New Roman'
                          Font.Style = []
                          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                          ParentFont = False
                          TabOrder = 0
                          TitleFont.Charset = DEFAULT_CHARSET
                          TitleFont.Color = clWindowText
                          TitleFont.Height = -3
                          TitleFont.Name = 'MS Sans Serif'
                          TitleFont.Style = []
                          OnDrawColumnCell = DBGrid5DrawColumnCell
                          OnDblClick = DBGrid5DblClick
                          Columns = <
                            item
                              Expanded = False
                              FieldName = 'LEMBRETE'
                              Title.Caption = 'Lembrete'
                              Visible = True
                            end>
                        end
                      end
                    end
                    object Panel26: TPanel
                      Left = 1
                      Top = 331
                      Width = 817
                      Height = 89
                      Align = alClient
                      Caption = 'Panel13'
                      TabOrder = 1
                      object DBGrid6: TDBGrid
                        Left = 1
                        Top = 1
                        Width = 815
                        Height = 87
                        Hint = 'Aperte Enter para visualizar registro selecionado - [AGO004]'
                        Align = alClient
                        DataSource = DtmAgenda.dsAgenda
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                        TabOrder = 0
                        TitleFont.Charset = DEFAULT_CHARSET
                        TitleFont.Color = clWindowText
                        TitleFont.Height = -11
                        TitleFont.Name = 'Tahoma'
                        TitleFont.Style = []
                        OnKeyDown = DBGrid6KeyDown
                        Columns = <
                          item
                            Expanded = False
                            FieldName = 'COD_AGENDA'
                            Title.Caption = 'Cod Agenda'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'COD_CLIENTE'
                            Width = 60
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NOME_CLIENTE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'FONE_CLIENTE'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'DATA_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'HORA_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'MINUTO_AGENDA'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'STATUS_AGENDA'
                            Width = 80
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'TMO_SERVICO'
                            Title.Caption = 'Tmo'
                            Visible = True
                          end
                          item
                            Expanded = False
                            FieldName = 'NPED'
                            Title.Caption = 'N'#186' OS'
                            Visible = True
                          end>
                      end
                    end
                    object Panel28: TPanel
                      Left = 1
                      Top = 303
                      Width = 817
                      Height = 28
                      Align = alTop
                      Caption = 'Resumo'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 2
                    end
                  end
                end
              end
            end
          end
        end
        object tsRelAgenda: TTabSheet
          Caption = 'tsRelAgenda'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpAgenda: TQuickRep
            Left = 1
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = DtmAgenda.cdsAgenda
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
            OnPreview = qrpAgendaPreview
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
            PrevFormStyle = fsStayOnTop
            PreviewInitialState = wsMaximized
            PrevInitialZoom = qrZoomToWidth
            PreviewDefaultSaveType = stQRP
            object TitleBand1: TQRBand
              Left = 38
              Top = 38
              Width = 718
              Height = 83
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
                219.604166666666700000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbTitle
              object QRLabel1: TQRLabel
                Left = 0
                Top = 34
                Width = 136
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  0.000000000000000000
                  89.958333333333320000
                  359.833333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Agenda Oficina'
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
              object QRLabel3: TQRLabel
                Left = 607
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
                  1606.020833333333000000
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
              object QRSysData2: TQRSysData
                Left = 658
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
                  1740.958333333333000000
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
              object lbEmpresa: TQRLabel
                Left = 2
                Top = 4
                Width = 103
                Height = 24
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  63.500000000000000000
                  5.291666666666667000
                  10.583333333333330000
                  272.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'lbEmpresa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Arial'
                Font.Style = [fsBold, fsItalic]
                OnPrint = lbEmpresaPrint
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 14
              end
            end
            object ColumnHeaderBand1: TQRBand
              Left = 38
              Top = 121
              Width = 718
              Height = 33
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
                87.312500000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbColumnHeader
              object QRShape1: TQRShape
                Left = 3
                Top = 1
                Width = 734
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  7.937500000000000000
                  2.645833333333333000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRShape2: TQRShape
                Left = -48
                Top = 27
                Width = 766
                Height = 3
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  7.937500000000000000
                  -127.000000000000000000
                  71.437500000000000000
                  2026.708333333333000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
              object QRLabel4: TQRLabel
                Left = 7
                Top = 6
                Width = 33
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  18.520833333333330000
                  15.875000000000000000
                  87.312500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cod'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel5: TQRLabel
                Left = 46
                Top = 6
                Width = 54
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  121.708333333333300000
                  15.875000000000000000
                  142.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Cliente'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel6: TQRLabel
                Left = 340
                Top = 6
                Width = 36
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  899.583333333333200000
                  15.875000000000000000
                  95.250000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Data'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel7: TQRLabel
                Left = 236
                Top = 6
                Width = 40
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  624.416666666666800000
                  15.875000000000000000
                  105.833333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Fone'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel8: TQRLabel
                Left = 414
                Top = 6
                Width = 38
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1095.375000000000000000
                  15.875000000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Hora'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel9: TQRLabel
                Left = 499
                Top = 6
                Width = 46
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1320.270833333333000000
                  15.875000000000000000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'N'#176' OS'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel10: TQRLabel
                Left = 559
                Top = 6
                Width = 103
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1479.020833333333000000
                  15.875000000000000000
                  272.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Chassi/Equip'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel11: TQRLabel
                Left = 668
                Top = 6
                Width = 43
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1767.416666666667000000
                  15.875000000000000000
                  113.770833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Placa'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel12: TQRLabel
                Left = 461
                Top = 6
                Width = 28
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  1219.729166666667000000
                  15.875000000000000000
                  74.083333333333320000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Min'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object PageFooterBand1: TQRBand
              Left = 38
              Top = 177
              Width = 718
              Height = 36
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
                95.250000000000000000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageFooter
              object QRLabel15: TQRLabel
                Left = 3
                Top = 6
                Width = 210
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  15.875000000000000000
                  555.625000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'HW Sistemas e Computadores Ltda'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRShape3: TQRShape
                Left = -4
                Top = 2
                Width = 734
                Height = 2
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  5.291666666666667000
                  -10.583333333333330000
                  5.291666666666667000
                  1942.041666666667000000)
                Brush.Color = clBlack
                Shape = qrsRectangle
                VertAdjust = 0
              end
            end
            object DetailBand1: TQRBand
              Left = 38
              Top = 154
              Width = 718
              Height = 23
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
                60.854166666666680000
                1899.708333333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRDBText2: TQRDBText
                Left = 7
                Top = 0
                Width = 33
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  18.520833333333330000
                  0.000000000000000000
                  87.312500000000000000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'COD_AGENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText3: TQRDBText
                Left = 47
                Top = -1
                Width = 186
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  124.354166666666700000
                  -2.645833333333333000
                  492.125000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'NOME_CLIENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText1: TQRDBText
                Left = 340
                Top = -1
                Width = 69
                Height = 18
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  47.625000000000000000
                  899.583333333333200000
                  -2.645833333333333000
                  182.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'DATA_AGENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText4: TQRDBText
                Left = 236
                Top = -1
                Width = 101
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  624.416666666666800000
                  -2.645833333333333000
                  267.229166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'FONE_CLIENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText6: TQRDBText
                Left = 414
                Top = -1
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1095.375000000000000000
                  -2.645833333333333000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'HORA_AGENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText5: TQRDBText
                Left = 499
                Top = -1
                Width = 60
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1320.270833333333000000
                  -2.645833333333333000
                  158.750000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'NPED'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText7: TQRDBText
                Left = 559
                Top = -1
                Width = 100
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1479.020833333333000000
                  -2.645833333333333000
                  264.583333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText8: TQRDBText
                Left = 668
                Top = 0
                Width = 58
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1767.416666666667000000
                  0.000000000000000000
                  153.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'PLACA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 9
              end
              object QRDBText9: TQRDBText
                Left = 461
                Top = -1
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1219.729166666667000000
                  -2.645833333333333000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = DtmAgenda.cdsAgenda
                DataField = 'MINUTO_AGENDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Arial'
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
    end
    inherited PanelFlash: TPanel
      Width = 80
      Height = 569
      ExplicitWidth = 80
      ExplicitHeight = 569
      inherited bMarketingHW: TBitBtn
        Top = 25
        Width = 78
        Height = 543
        Visible = False
        ExplicitTop = 25
        ExplicitWidth = 78
        ExplicitHeight = 543
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 571
    Width = 1081
    ExplicitTop = 571
    ExplicitWidth = 1081
  end
  inherited pnStatusProcessamento: TPanel
    Left = 1050
    ExplicitLeft = 1050
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 102
    Top = 323
  end
  inherited Timer1: TTimer
    Interval = 10000
    Left = 62
    Top = 323
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 30
    Top = 323
  end
end
