object frmLogView: TfrmLogView
  Left = 0
  Top = 0
  Caption = 'Log de sincroniza'#231#227'o Caixas NFCe'
  ClientHeight = 600
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1000
    Height = 600
    Align = alClient
    BorderWidth = 6
    Caption = 'Panel3'
    Padding.Top = 3
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 7
      Top = 10
      Width = 986
      Height = 583
      ActivePage = ts_log
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      ExplicitHeight = 542
      object ts_log: TTabSheet
        Caption = '<<          Log          >>'
        ExplicitHeight = 511
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          Padding.Bottom = 3
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 272
            Height = 78
            Align = alLeft
            Caption = 'Filtrar Caixas'
            Padding.Left = 6
            Padding.Top = 3
            Padding.Right = 6
            Padding.Bottom = 6
            TabOrder = 0
            object ckListCaixa: TCheckListBox
              Left = 8
              Top = 18
              Width = 256
              Height = 52
              OnClickCheck = ckListCaixaClickCheck
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
              OnClick = ckListCaixaClickCheck
              OnEnter = ckListCaixaClickCheck
              OnExit = ckListCaixaClickCheck
            end
          end
          object Panel9: TPanel
            Left = 272
            Top = 0
            Width = 105
            Height = 78
            Align = alLeft
            BevelOuter = bvNone
            Padding.Left = 6
            TabOrder = 1
            object GroupBox5: TGroupBox
              Left = 6
              Top = 0
              Width = 99
              Height = 78
              Align = alClient
              Caption = 'Filtrar Tipo'
              Padding.Left = 6
              Padding.Top = 3
              Padding.Right = 6
              Padding.Bottom = 6
              TabOrder = 0
              object ckTipoErros: TCheckBox
                Left = 8
                Top = 18
                Width = 83
                Height = 17
                Align = alTop
                Caption = 'Erros'
                TabOrder = 0
              end
              object ckTipoWarn: TCheckBox
                Left = 8
                Top = 35
                Width = 83
                Height = 17
                Align = alTop
                Caption = 'Avisos'
                TabOrder = 1
              end
              object ckTipoInfo: TCheckBox
                Left = 8
                Top = 52
                Width = 83
                Height = 17
                Align = alTop
                Caption = 'Informa'#231#245'es'
                TabOrder = 2
              end
            end
          end
          object Panel11: TPanel
            Left = 377
            Top = 0
            Width = 136
            Height = 78
            Align = alLeft
            BevelOuter = bvNone
            Padding.Left = 6
            TabOrder = 2
            object GroupBox6: TGroupBox
              Left = 6
              Top = 0
              Width = 130
              Height = 78
              Align = alClient
              Caption = 'Filtrar Dire'#231#227'o'
              Padding.Left = 6
              Padding.Top = 9
              Padding.Right = 6
              Padding.Bottom = 12
              TabOrder = 0
              object ckDirecClientServer: TCheckBox
                Left = 8
                Top = 24
                Width = 114
                Height = 17
                Align = alTop
                Caption = 'Caixa -> Servidor'
                TabOrder = 0
              end
              object ckDirecServerClient: TCheckBox
                Left = 8
                Top = 47
                Width = 114
                Height = 17
                Align = alBottom
                Caption = 'Servidor -> Caixa'
                TabOrder = 1
              end
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 81
          Width = 978
          Height = 423
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitHeight = 430
          object memo_log: TMemo
            Left = 0
            Top = 0
            Width = 978
            Height = 423
            Align = alClient
            Lines.Strings = (
              'Memo1')
            ScrollBars = ssVertical
            TabOrder = 0
            ExplicitHeight = 430
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 504
          Width = 978
          Height = 48
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Panel2: TPanel
            Left = 0
            Top = 7
            Width = 978
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitLeft = 7
            ExplicitTop = 552
            ExplicitWidth = 986
            object bt_limpar: TBitBtn
              Left = 10
              Top = 6
              Width = 100
              Height = 25
              Caption = 'Limpar'
              TabOrder = 0
              OnClick = bt_limparClick
            end
            object bt_parar: TBitBtn
              Left = 116
              Top = 6
              Width = 100
              Height = 25
              Caption = 'Parar'
              TabOrder = 1
              OnClick = bt_pararClick
            end
            object Panel4: TPanel
              Left = 856
              Top = 0
              Width = 118
              Height = 37
              Align = alRight
              BevelOuter = bvNone
              Caption = 'Panel4'
              TabOrder = 3
              ExplicitLeft = 854
              object BitBtn3: TBitBtn
                Left = 9
                Top = 6
                Width = 100
                Height = 25
                Caption = 'Sair'
                TabOrder = 0
                OnClick = BitBtn3Click
              end
            end
            object bt_detail: TBitBtn
              Left = 222
              Top = 6
              Width = 100
              Height = 25
              Caption = 'Detalhar'
              TabOrder = 2
              OnClick = bt_detailClick
            end
          end
        end
      end
      object ts_detail: TTabSheet
        Caption = '<<          Detalhes          >>'
        ImageIndex = 2
        ExplicitHeight = 511
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 504
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          ExplicitHeight = 511
          object Panel7: TPanel
            Left = 6
            Top = 6
            Width = 966
            Height = 492
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            ExplicitHeight = 499
            object GroupBox2: TGroupBox
              Left = 7
              Top = 88
              Width = 952
              Height = 346
              Align = alClient
              Caption = 'Lista de log'
              Padding.Left = 6
              Padding.Top = 3
              Padding.Right = 6
              Padding.Bottom = 6
              TabOrder = 1
              ExplicitHeight = 363
              object Panel10: TPanel
                Left = 560
                Top = 18
                Width = 384
                Height = 320
                Align = alRight
                BevelOuter = bvNone
                Padding.Left = 6
                TabOrder = 1
                ExplicitHeight = 327
                object GroupBox3: TGroupBox
                  Left = 6
                  Top = 0
                  Width = 378
                  Height = 320
                  Align = alClient
                  Caption = 'Registros / Valores'
                  Padding.Left = 6
                  Padding.Top = 3
                  Padding.Right = 6
                  Padding.Bottom = 6
                  TabOrder = 0
                  ExplicitTop = 41
                  ExplicitWidth = 282
                  ExplicitHeight = 296
                  object grid_data: TDBGrid
                    Left = 81
                    Top = 18
                    Width = 289
                    Height = 294
                    Align = alClient
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                    TabOrder = 1
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnEnter = grid_dataEnter
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'FIELD'
                        Title.Caption = 'Campo'
                        Width = 111
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DATA'
                        Title.Caption = 'Dado'
                        Width = 138
                        Visible = True
                      end>
                  end
                  object Panel17: TPanel
                    Left = 8
                    Top = 18
                    Width = 73
                    Height = 294
                    Align = alLeft
                    BevelOuter = bvNone
                    Caption = 'Panel17'
                    Padding.Right = 6
                    TabOrder = 0
                    ExplicitHeight = 260
                    object grid_seq: TDBGrid
                      Left = 0
                      Top = 0
                      Width = 67
                      Height = 294
                      Align = alClient
                      Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                      TabOrder = 0
                      TitleFont.Charset = DEFAULT_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -11
                      TitleFont.Name = 'Tahoma'
                      TitleFont.Style = []
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SEQ'
                          Width = 35
                          Visible = True
                        end>
                    end
                  end
                end
              end
              object grid_detail: TDBGrid
                Left = 8
                Top = 18
                Width = 552
                Height = 320
                Align = alClient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = grid_detailDrawColumnCell
                OnEnter = grid_detailEnter
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SEQ'
                    Title.Caption = 'Seq'
                    Width = 57
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CREATEDAT'
                    Title.Caption = 'Data e Hora'
                    Width = 113
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SOURCE'
                    Title.Caption = 'Origem'
                    Width = 87
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DIRECTION'
                    Title.Caption = 'Dire'#231#227'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LEVEL_'
                    Title.Caption = 'Tipo'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'qtde'
                    Title.Caption = 'Dados'
                    Width = 34
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEXT'
                    Title.Caption = 'Texto'
                    Width = 113
                    Visible = True
                  end>
              end
            end
            object Panel8: TPanel
              Left = 7
              Top = 434
              Width = 952
              Height = 51
              Align = alBottom
              BevelOuter = bvNone
              Padding.Top = 6
              TabOrder = 2
              ExplicitTop = 441
              object memo_detail: TMemo
                Left = 0
                Top = 6
                Width = 952
                Height = 45
                Align = alClient
                Lines.Strings = (
                  'Memo1')
                ReadOnly = True
                TabOrder = 0
                ExplicitTop = -2
                ExplicitHeight = 43
              end
            end
            object Panel12: TPanel
              Left = 7
              Top = 7
              Width = 952
              Height = 81
              Align = alTop
              BevelOuter = bvNone
              Padding.Bottom = 3
              TabOrder = 0
              object Label1: TLabel
                Left = 582
                Top = 35
                Width = 16
                Height = 13
                Caption = 'at'#233
              end
              object GroupBox7: TGroupBox
                Left = 0
                Top = 0
                Width = 272
                Height = 78
                Align = alLeft
                Caption = 'Filtrar Caixas'
                Padding.Left = 6
                Padding.Top = 3
                Padding.Right = 6
                Padding.Bottom = 6
                TabOrder = 0
                object ckl_detail_caixa: TCheckListBox
                  Left = 8
                  Top = 18
                  Width = 256
                  Height = 52
                  OnClickCheck = ckListCaixaClickCheck
                  Align = alClient
                  ItemHeight = 13
                  TabOrder = 0
                  OnClick = ckListCaixaClickCheck
                  OnEnter = ckListCaixaClickCheck
                  OnExit = ckListCaixaClickCheck
                end
              end
              object Panel13: TPanel
                Left = 272
                Top = 0
                Width = 121
                Height = 78
                Align = alLeft
                BevelOuter = bvNone
                Padding.Left = 6
                TabOrder = 1
                object GroupBox8: TGroupBox
                  Left = 6
                  Top = 0
                  Width = 115
                  Height = 78
                  Align = alClient
                  Caption = 'Filtrar Tipo'
                  Padding.Left = 6
                  Padding.Top = 3
                  Padding.Right = 6
                  Padding.Bottom = 6
                  TabOrder = 0
                  object ck_det_err: TCheckBox
                    Left = 8
                    Top = 18
                    Width = 99
                    Height = 17
                    Align = alTop
                    Caption = 'Erros'
                    TabOrder = 0
                  end
                  object ck_det_warn: TCheckBox
                    Left = 8
                    Top = 35
                    Width = 99
                    Height = 17
                    Align = alTop
                    Caption = 'Avisos'
                    TabOrder = 1
                  end
                  object ck_det_info: TCheckBox
                    Left = 8
                    Top = 52
                    Width = 99
                    Height = 17
                    Align = alTop
                    Caption = 'Informa'#231#245'es'
                    TabOrder = 2
                  end
                end
              end
              object Panel14: TPanel
                Left = 393
                Top = 0
                Width = 145
                Height = 78
                Align = alLeft
                BevelOuter = bvNone
                Padding.Left = 6
                TabOrder = 2
                object GroupBox9: TGroupBox
                  Left = 6
                  Top = 0
                  Width = 139
                  Height = 78
                  Align = alClient
                  Caption = 'Filtrar Dire'#231#227'o'
                  Padding.Left = 6
                  Padding.Top = 9
                  Padding.Right = 6
                  Padding.Bottom = 12
                  TabOrder = 0
                  object ck_det_cli_serv: TCheckBox
                    Left = 8
                    Top = 24
                    Width = 123
                    Height = 17
                    Align = alTop
                    Caption = 'Caixa -> Servidor'
                    TabOrder = 0
                  end
                  object ck_det_serv_cli: TCheckBox
                    Left = 8
                    Top = 47
                    Width = 123
                    Height = 17
                    Align = alBottom
                    Caption = 'Servidor -> Caixa'
                    TabOrder = 1
                  end
                end
              end
              object BitBtn5: TBitBtn
                Left = 664
                Top = 32
                Width = 97
                Height = 25
                Caption = 'Consultar'
                TabOrder = 5
                OnClick = BitBtn5Click
              end
              object ed_dt_ini: TMaskEdit
                Left = 544
                Top = 8
                Width = 103
                Height = 21
                EditMask = '!99/99/0000 90:00;1;_'
                MaxLength = 16
                TabOrder = 3
                Text = '  /  /       :  '
              end
              object ed_dt_fim: TMaskEdit
                Left = 544
                Top = 54
                Width = 102
                Height = 21
                EditMask = '!99/99/0000 90:00;1;_'
                MaxLength = 16
                TabOrder = 4
                Text = '  /  /       :  '
              end
            end
          end
        end
        object Panel16: TPanel
          Left = 0
          Top = 504
          Width = 978
          Height = 48
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Panel18: TPanel
            Left = 0
            Top = 7
            Width = 978
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object bt_voltar: TBitBtn
              Left = 10
              Top = 6
              Width = 100
              Height = 25
              Caption = 'Voltar'
              TabOrder = 0
              OnClick = bt_voltarClick
            end
            object Panel19: TPanel
              Left = 856
              Top = 0
              Width = 118
              Height = 37
              Align = alRight
              BevelOuter = bvNone
              Caption = 'Panel4'
              TabOrder = 1
              object BitBtn4: TBitBtn
                Left = 9
                Top = 6
                Width = 100
                Height = 25
                Caption = 'Sair'
                TabOrder = 0
                OnClick = BitBtn3Click
              end
            end
          end
        end
      end
    end
  end
  object timerLog: TTimer
    OnTimer = timerLogTimer
    Left = 960
  end
end
