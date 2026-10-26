inherited frmCadAnotacoes: TfrmCadAnotacoes
  Caption = 'Anota'#231#245'es'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    BevelOuter = bvNone
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 545
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 545
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 545
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            ExplicitWidth = 787
            ExplicitHeight = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ActivePage = tsCadastro
              ExplicitWidth = 787
              ExplicitHeight = 466
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 435
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  ExplicitWidth = 779
                  ExplicitHeight = 435
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
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
                  Width = 779
                  Height = 435
                  Align = alClient
                  TabOrder = 0
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 758
                    Height = 462
                    Align = alTop
                    Caption = 'Cadastro de Anota'#231#245'es'
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 118
                      Top = 24
                      Width = 33
                      Height = 13
                      Caption = 'Codigo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 118
                      Top = 53
                      Width = 33
                      Height = 13
                      Caption = 'Cliente'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 82
                      Top = 132
                      Width = 69
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo Anota'#231#227'o'
                    end
                    object Label9: TLabel
                      Left = 480
                      Top = 132
                      Width = 61
                      Height = 13
                      Caption = 'Atendimento'
                    end
                    object Label10: TLabel
                      Left = 108
                      Top = 78
                      Width = 43
                      Height = 13
                      Caption = 'Contrato'
                    end
                    object Label11: TLabel
                      Left = 92
                      Top = 396
                      Width = 59
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Colaborador'
                      FocusControl = DBEdit5
                    end
                    object Label12: TLabel
                      Left = 112
                      Top = 105
                      Width = 39
                      Height = 13
                      Caption = 'Contato'
                      FocusControl = DBEdit6
                    end
                    object Label13: TLabel
                      Left = 127
                      Top = 159
                      Width = 24
                      Height = 13
                      Caption = 'Email'
                      FocusControl = DBEdit7
                    end
                    object Label14: TLabel
                      Left = 517
                      Top = 159
                      Width = 24
                      Height = 13
                      Caption = 'Fone'
                      FocusControl = DBEdit8
                    end
                    object Label15: TLabel
                      Left = 128
                      Top = 186
                      Width = 23
                      Height = 13
                      Caption = 'Data'
                      FocusControl = DBEdit9
                    end
                    object Label16: TLabel
                      Left = 518
                      Top = 186
                      Width = 23
                      Height = 13
                      Caption = 'Hora'
                      FocusControl = DBEdit10
                    end
                    object Label17: TLabel
                      Left = 98
                      Top = 213
                      Width = 53
                      Height = 13
                      Caption = 'Hora Inicial'
                      FocusControl = DBEdit11
                    end
                    object Label18: TLabel
                      Left = 493
                      Top = 212
                      Width = 48
                      Height = 13
                      Caption = 'Hora Final'
                      FocusControl = DBEdit12
                    end
                    object Label19: TLabel
                      Left = 112
                      Top = 240
                      Width = 39
                      Height = 13
                      Caption = 'Assunto'
                    end
                    object Label20: TLabel
                      Left = 93
                      Top = 267
                      Width = 58
                      Height = 13
                      Caption = 'Observa'#231#227'o'
                      FocusControl = DBMemo1
                    end
                    object Label21: TLabel
                      Left = 80
                      Top = 423
                      Width = 71
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Status/Usu'#225'rio'
                    end
                    object SpeedButton9: TSpeedButton
                      Left = 687
                      Top = 236
                      Width = 23
                      Height = 22
                      Hint = 'Adicionar Novo Assunto'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton9Click
                    end
                    object Label22: TLabel
                      Left = 247
                      Top = 78
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Software'
                    end
                    object SpeedButton14: TSpeedButton
                      Left = 687
                      Top = 73
                      Width = 23
                      Height = 22
                      Hint = 'Adicionar Novo Assunto'
                      Flat = True
                      Glyph.Data = {
                        36050000424D3605000000000000360400002800000010000000100000000100
                        08000000000000010000130B0000130B000000010000000100002184290039B5
                        520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
                        0505050505050505050505050505050503000003050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050300000000
                        0004010000000000030505020101010101010101010101010005050204040404
                        0404010404040404000505030202020202040100000000000305050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0204010005050505050505050505050502040100050505050505050505050505
                        0302020305050505050505050505050505050505050505050505}
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = SpeedButton14Click
                    end
                    object DBEdit1: TDBEdit
                      Left = 157
                      Top = 21
                      Width = 134
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 157
                      Top = 48
                      Width = 134
                      Height = 21
                      DataField = 'COD_CLIENTE'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 1
                      OnEnter = DBEdit2Enter
                      OnExit = DBEdit2Exit
                      OnKeyDown = DBEdit2KeyDown
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 157
                      Top = 129
                      Width = 134
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TIPO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      ItemHeight = 0
                      Items.Strings = (
                        'Atendimento'
                        'Curriculum'
                        'Recado'
                        'Reclama'#231#227'o'
                        'Sa'#237'da'
                        'Sugest'#227'o'
                        'VisitaSuporte'
                        'VisitaVenda')
                      TabOrder = 6
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 547
                      Top = 129
                      Width = 134
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TP_ATEND_D'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      ItemHeight = 0
                      Items.Strings = (
                        'Direto'
                        'Telefone')
                      TabOrder = 7
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 157
                      Top = 75
                      Width = 68
                      Height = 21
                      Style = csDropDownList
                      DataField = 'TP_CONTR_D'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      ItemHeight = 0
                      Items.Strings = (
                        'Com Contrato'
                        'Sem Contrato')
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 157
                      Top = 393
                      Width = 134
                      Height = 21
                      DataField = 'COD_USUARIO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 16
                    end
                    object DBEdit6: TDBEdit
                      Left = 157
                      Top = 102
                      Width = 524
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CONTATO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 5
                    end
                    object DBEdit7: TDBEdit
                      Left = 157
                      Top = 156
                      Width = 314
                      Height = 21
                      CharCase = ecLowerCase
                      DataField = 'EMAIL'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 8
                    end
                    object DBEdit8: TDBEdit
                      Left = 547
                      Top = 156
                      Width = 134
                      Height = 21
                      DataField = 'FONE'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 9
                    end
                    object DBEdit9: TDBEdit
                      Left = 157
                      Top = 183
                      Width = 134
                      Height = 21
                      DataField = 'DATA'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 10
                    end
                    object DBEdit10: TDBEdit
                      Left = 547
                      Top = 183
                      Width = 134
                      Height = 21
                      DataField = 'HORA'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 11
                    end
                    object DBEdit11: TDBEdit
                      Left = 157
                      Top = 210
                      Width = 134
                      Height = 21
                      DataField = 'HORA_INICIAL'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 12
                    end
                    object DBEdit12: TDBEdit
                      Left = 547
                      Top = 210
                      Width = 134
                      Height = 21
                      DataField = 'HORA_FINAL'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 13
                    end
                    object DBEdit13: TDBEdit
                      Left = 297
                      Top = 48
                      Width = 384
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'NOME_CL'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 2
                      OnEnter = DBEdit13Enter
                      OnExit = DBEdit13Exit
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 157
                      Top = 237
                      Width = 524
                      Height = 21
                      DataField = 'COD_TIPOANOT'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      KeyField = 'COD_TIPOANOT'
                      ListField = 'DESCRICAO_TIPOANOT'
                      ListSource = dtmFollowUpPosAtendimento.dstipoAnot
                      TabOrder = 14
                    end
                    object DBMemo1: TDBMemo
                      Left = 157
                      Top = 264
                      Width = 524
                      Height = 123
                      DataField = 'OBSERVACAO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      TabOrder = 15
                    end
                    object DBComboBox4: TDBComboBox
                      Left = 157
                      Top = 420
                      Width = 134
                      Height = 21
                      Style = csDropDownList
                      DataField = 'STATUS'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      ItemHeight = 0
                      Items.Strings = (
                        'Cancelado'
                        'Em Andamento'
                        'Lido'
                        'N'#227'o Lido'
                        'Resolvido')
                      TabOrder = 18
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 297
                      Top = 393
                      Width = 384
                      Height = 21
                      DataField = 'COD_USUARIO'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmFollowUpPosAtendimento.dsColab
                      TabOrder = 17
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 297
                      Top = 420
                      Width = 384
                      Height = 21
                      Color = clBtnFace
                      DataField = 'US_STATUS'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      Enabled = False
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmFollowUpPosAtendimento.dsColab
                      TabOrder = 19
                    end
                    object ckRazao: TCheckBox
                      Left = 687
                      Top = 50
                      Width = 55
                      Height = 17
                      Caption = 'Raz'#227'o'
                      TabOrder = 20
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 297
                      Top = 75
                      Width = 384
                      Height = 21
                      DataField = 'COD_SOFT'
                      DataSource = dtmFollowUpPosAtendimento.dsAnotacoes
                      KeyField = 'COD_SOFT'
                      ListField = 'NOME_SOFT'
                      ListSource = dtmFollowUpPosAtendimento.dsSoft
                      TabOrder = 4
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              ExplicitTop = 466
              ExplicitWidth = 787
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar - [CRM084]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited GroupBox3: TGroupBox
            Width = 787
            Height = 201
            ExplicitWidth = 787
            ExplicitHeight = 201
            inherited imgInformation: TImage
              Left = 761
              Height = 184
              ExplicitLeft = 765
              ExplicitHeight = 184
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CRM081]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CRM082]'
            end
            inherited CheckBox3: TCheckBox
              Top = 47
              ExplicitTop = 47
            end
            object GroupBox5: TGroupBox
              Left = 408
              Top = 68
              Width = 277
              Height = 127
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              object Label109: TLabel
                Left = 7
                Top = 54
                Width = 51
                Height = 13
                Caption = 'Conte'#250'do:'
              end
              object Label110: TLabel
                Left = 21
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 157
                Top = 54
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object Label112: TLabel
                Left = 10
                Top = 78
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 64
                Top = 20
                Width = 203
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 64
                Top = 46
                Width = 203
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
                OnKeyDown = MaskEdit3KeyDown
              end
              object MaskEdit8: TMaskEdit
                Left = 193
                Top = 46
                Width = 74
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 64
                Top = 46
                Width = 72
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 64
                Top = 72
                Width = 72
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
            object GroupBox6: TGroupBox
              Left = 10
              Top = 68
              Width = 392
              Height = 127
              Caption = 'Avan'#231'ada'
              TabOrder = 12
              Visible = False
              object Panel4: TPanel
                Left = 191
                Top = 15
                Width = 199
                Height = 110
                Align = alRight
                BevelOuter = bvNone
                BorderWidth = 3
                TabOrder = 0
                object GroupBox8: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 110
                  Height = 104
                  Align = alLeft
                  Caption = 'Contrato'
                  TabOrder = 0
                  object ckComContr: TCheckBox
                    Left = 10
                    Top = 17
                    Width = 97
                    Height = 17
                    Caption = 'Com Contrato'
                    TabOrder = 0
                  end
                  object ckSemContr: TCheckBox
                    Left = 8
                    Top = 80
                    Width = 97
                    Height = 17
                    Caption = 'Sem Contrato'
                    TabOrder = 1
                  end
                end
                object GroupBox9: TGroupBox
                  Left = 113
                  Top = 3
                  Width = 83
                  Height = 104
                  Align = alClient
                  Caption = 'Contato'
                  TabOrder = 1
                  object ckTelef: TCheckBox
                    Left = 8
                    Top = 17
                    Width = 65
                    Height = 17
                    Caption = 'Telefone'
                    TabOrder = 0
                  end
                  object ckDireto: TCheckBox
                    Left = 8
                    Top = 80
                    Width = 65
                    Height = 17
                    Caption = 'Direto'
                    TabOrder = 1
                  end
                end
              end
              object Panel5: TPanel
                Left = 2
                Top = 15
                Width = 189
                Height = 110
                Align = alClient
                BevelOuter = bvNone
                BorderWidth = 3
                TabOrder = 1
                object GroupBox7: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 183
                  Height = 104
                  Align = alClient
                  Caption = 'Tipo'
                  TabOrder = 0
                  object ckAtend: TCheckBox
                    Left = 7
                    Top = 17
                    Width = 85
                    Height = 17
                    Caption = 'Atendimento'
                    TabOrder = 0
                  end
                  object ckCurr: TCheckBox
                    Left = 7
                    Top = 38
                    Width = 85
                    Height = 17
                    Caption = 'Curriculum'
                    TabOrder = 1
                  end
                  object ckRec: TCheckBox
                    Left = 7
                    Top = 59
                    Width = 85
                    Height = 17
                    Caption = 'Recado'
                    TabOrder = 2
                  end
                  object ckRecl: TCheckBox
                    Left = 7
                    Top = 80
                    Width = 85
                    Height = 17
                    Caption = 'Reclama'#231#227'o'
                    TabOrder = 3
                  end
                  object ckSaida: TCheckBox
                    Left = 92
                    Top = 17
                    Width = 85
                    Height = 17
                    Caption = 'Sa'#237'da'
                    TabOrder = 4
                  end
                  object ckSug: TCheckBox
                    Left = 92
                    Top = 38
                    Width = 85
                    Height = 17
                    Caption = 'Sugest'#227'o'
                    TabOrder = 5
                  end
                  object ckVisSup: TCheckBox
                    Left = 92
                    Top = 59
                    Width = 85
                    Height = 17
                    Caption = 'VisitaSuporte'
                    TabOrder = 6
                  end
                  object ckVisVenda: TCheckBox
                    Left = 92
                    Top = 80
                    Width = 85
                    Height = 17
                    Caption = 'VisitaVenda'
                    TabOrder = 7
                  end
                end
              end
            end
          end
          inherited Panel1: TPanel
            Top = 201
            Width = 787
            Height = 313
            ExplicitTop = 201
            ExplicitWidth = 787
            ExplicitHeight = 313
            inherited Splitter1: TSplitter
              Height = 252
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 252
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CRM083]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para lixeira - [CRM085]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [CRM086]'
                OnClick = SpeedButton25Click
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 252
              ExplicitHeight = 252
              inherited ScrollBox2: TScrollBox
                Height = 235
                ExplicitHeight = 235
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
        end
        object tsClientes: TTabSheet
          Caption = 'tsClientes'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnClientes: TPanel
            Left = 3
            Top = 16
            Width = 785
            Height = 289
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox10: TGroupBox
              Left = 6
              Top = 6
              Width = 773
              Height = 236
              Align = alClient
              Caption = 'Clientes'
              TabOrder = 0
              OnEnter = GroupBox10Enter
              object DBGrid2: TDBGrid
                Left = 2
                Top = 15
                Width = 769
                Height = 219
                Align = alClient
                DataSource = DataSource1
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnEnter = GroupBox10Enter
                OnKeyDown = DBGrid2KeyDown
              end
            end
            object Panel7: TPanel
              Left = 6
              Top = 242
              Width = 773
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn7: TBitBtn
                Left = 307
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Assume'
                TabOrder = 0
                OnClick = BitBtn7Click
                OnEnter = GroupBox10Enter
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
                  7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
                  FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
                  99986B66FF00FFFF00FFFF00FFB48176FEF3E399330099330099330099330099
                  3300993300993300993300EECC97F3D199986B66FF00FFFF00FFFF00FFB48176
                  FFF7EB993300FEFEFEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D1
                  98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4993300FEFEFEFAFBFE7E98FC03
                  35FB597AFCFEFEFE993300F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
                  FFFFFD993300D6DEFE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5
                  A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFF9933005274FC1442FBBCC9FDEF
                  F2FE1A47FB4F72FC973304F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
                  FFFFFF993300E4EAFED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DD
                  B4986B66FF00FFFF00FFFF00FFDCA887FFFFFF993300FEFEFEFEFEFEFEFEFEFE
                  FEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
                  FFFFFF9933009933009933009933009933009933008F33112235C80335FBC6BC
                  A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
                  F8F3FDF6ECF1E1D5B481760335FB0335FB0335FBFF00FFFF00FFFF00FFE3B18E
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
                  4A0335FBFF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
                  FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
                  FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
                  A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
              end
              object BitBtn8: TBitBtn
                Left = 388
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn8Click
                OnEnter = GroupBox10Enter
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
        object tsAssunto: TTabSheet
          Caption = 'tsAssunto'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnCadAssunto: TPanel
            Left = 3
            Top = 16
            Width = 785
            Height = 289
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox11: TGroupBox
              Left = 6
              Top = 6
              Width = 773
              Height = 170
              Align = alClient
              Caption = 'Assuntos'
              TabOrder = 0
              OnEnter = GroupBox10Enter
              object SpeedButton13: TSpeedButton
                Left = 720
                Top = 15
                Width = 51
                Height = 153
                Align = alRight
                Caption = 'Alterar'
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
                Layout = blGlyphBottom
                OnClick = SpeedButton13Click
                ExplicitLeft = 726
                ExplicitTop = 14
              end
              object DBGrid3: TDBGrid
                Left = 2
                Top = 15
                Width = 718
                Height = 153
                Align = alClient
                DataSource = dtmFollowUpPosAtendimento.dstipoAnot
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnEnter = GroupBox10Enter
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_TIPOANOT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO_TIPOANOT'
                    Visible = True
                  end>
              end
            end
            object Panel8: TPanel
              Left = 6
              Top = 242
              Width = 773
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn10: TBitBtn
                Left = 684
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Sair'
                TabOrder = 0
                OnClick = BitBtn10Click
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
            object GroupBox12: TGroupBox
              Left = 6
              Top = 176
              Width = 773
              Height = 66
              Align = alBottom
              Caption = 'Novo'
              TabOrder = 2
              object Edit1: TEdit
                Left = 16
                Top = 24
                Width = 662
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object BitBtn11: TBitBtn
                Left = 684
                Top = 21
                Width = 75
                Height = 25
                Hint = 
                  'Salvar Novo registro - [CRM088] / Salvar registro alterado - [CR' +
                  'M089]'
                Caption = 'Salva'
                TabOrder = 1
                OnClick = BitBtn11Click
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
          end
        end
        object tsSoft: TTabSheet
          Caption = 'tsSoft'
          ImageIndex = 5
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnSoft: TPanel
            Left = 3
            Top = 16
            Width = 785
            Height = 289
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 0
            object GroupBox13: TGroupBox
              Left = 6
              Top = 6
              Width = 773
              Height = 170
              Align = alClient
              Caption = 'Softwares'
              TabOrder = 0
              OnEnter = GroupBox10Enter
              object SpeedButton10: TSpeedButton
                Left = 720
                Top = 15
                Width = 51
                Height = 153
                Align = alRight
                Caption = 'Alterar'
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
                Layout = blGlyphBottom
                OnClick = SpeedButton10Click
                ExplicitLeft = 726
                ExplicitTop = 14
              end
              object DBGrid4: TDBGrid
                Left = 2
                Top = 15
                Width = 718
                Height = 153
                Align = alClient
                DataSource = dtmFollowUpPosAtendimento.dsSoft
                Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnEnter = GroupBox10Enter
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_SOFT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_SOFT'
                    Width = 302
                    Visible = True
                  end>
              end
            end
            object Panel9: TPanel
              Left = 6
              Top = 242
              Width = 773
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object BitBtn9: TBitBtn
                Left = 684
                Top = 6
                Width = 75
                Height = 25
                Caption = '&Sair'
                TabOrder = 0
                OnClick = BitBtn9Click
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
            object GroupBox14: TGroupBox
              Left = 6
              Top = 176
              Width = 773
              Height = 66
              Align = alBottom
              Caption = 'Novo'
              TabOrder = 2
              object Edit2: TEdit
                Left = 16
                Top = 24
                Width = 662
                Height = 21
                CharCase = ecUpperCase
                MaxLength = 32
                TabOrder = 0
              end
              object BitBtn12: TBitBtn
                Left = 684
                Top = 21
                Width = 75
                Height = 25
                Hint = 
                  'Salvar Novo registro - [CRM091] / Salvar registro alterado - [CR' +
                  'M092]'
                Caption = 'Salva'
                TabOrder = 1
                OnClick = BitBtn12Click
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
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 545
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 545
      inherited bMarketingHW: TBitBtn
        Top = 523
        ExplicitTop = 523
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 632
    Top = 192
  end
end
