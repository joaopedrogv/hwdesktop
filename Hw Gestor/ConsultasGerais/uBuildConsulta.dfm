object frmBuilConsultaOLAP: TfrmBuilConsultaOLAP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Constru'#231#227'o de consultas OLAP'
  ClientHeight = 477
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 477
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 6
      Top = 6
      Width = 823
      Height = 465
      ActivePage = tsParams
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object tsSQL: TTabSheet
        Caption = 'tsSQL'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Splitter1: TSplitter
          Left = 612
          Top = 0
          Height = 393
          Align = alRight
          ExplicitLeft = 408
          ExplicitTop = 144
          ExplicitHeight = 100
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 612
          Height = 393
          Align = alClient
          BevelOuter = bvNone
          Padding.Right = 6
          Padding.Bottom = 6
          TabOrder = 0
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 606
            Height = 17
            Align = alTop
            AutoSize = False
            Caption = 'SQL Consulta'
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 367
          end
          object memoSQLText: TMemo
            Left = 0
            Top = 17
            Width = 606
            Height = 370
            Align = alClient
            Lines.Strings = (
              'memoSQLText')
            TabOrder = 0
            OnKeyUp = memoSQLTextKeyUp
          end
        end
        object Panel4: TPanel
          Left = 615
          Top = 0
          Width = 200
          Height = 393
          Align = alRight
          BevelOuter = bvNone
          Padding.Bottom = 6
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 0
            Top = 193
            Width = 200
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object Panel5: TPanel
            Left = 0
            Top = 196
            Width = 200
            Height = 191
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label3: TLabel
              Left = 0
              Top = 0
              Width = 200
              Height = 17
              Align = alTop
              AutoSize = False
              Caption = 'Parametros da consulta'
              ExplicitLeft = 3
              ExplicitTop = -3
            end
            object tvParamCons: TTreeView
              Left = 0
              Top = 17
              Width = 200
              Height = 174
              Align = alClient
              Indent = 19
              TabOrder = 0
              OnDblClick = tvParamConsDblClick
              OnKeyDown = tvParamConsKeyDown
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 200
            Height = 193
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 200
              Height = 17
              Align = alTop
              AutoSize = False
              Caption = 'Parametros dispon'#237'veis'
              ExplicitLeft = 5
              ExplicitTop = -5
              ExplicitWidth = 196
            end
            object tvParamDB: TTreeView
              Left = 0
              Top = 17
              Width = 200
              Height = 176
              Align = alClient
              Indent = 19
              TabOrder = 0
            end
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 393
          Width = 815
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 2
          object Panel8: TPanel
            Left = 441
            Top = 0
            Width = 370
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btSql_Next: TBitBtn
              Left = 116
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Avan'#231'ar'
              TabOrder = 0
              OnClick = btSql_NextClick
            end
            object btSql_Cancel: TBitBtn
              Left = 286
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btSql_CancelClick
            end
          end
        end
      end
      object tsParams: TTabSheet
        Caption = 'tsParams'
        ImageIndex = 1
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 815
          Height = 393
          Align = alClient
          TabOrder = 0
        end
        object Panel9: TPanel
          Left = 0
          Top = 393
          Width = 815
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object Panel10: TPanel
            Left = 441
            Top = 0
            Width = 370
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btPamans_Undo: TBitBtn
              Left = 35
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Voltar'
              TabOrder = 2
              OnClick = btPamans_UndoClick
            end
            object btPamans_Next: TBitBtn
              Left = 116
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Avan'#231'ar'
              TabOrder = 0
              OnClick = btPamans_NextClick
            end
            object btPamans_Cancel: TBitBtn
              Left = 286
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btSql_CancelClick
            end
          end
        end
      end
      object tsFields: TTabSheet
        Caption = 'tsFields'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Splitter3: TSplitter
          Left = 270
          Top = 0
          Height = 393
          ExplicitLeft = 408
          ExplicitTop = 144
          ExplicitHeight = 100
        end
        object Splitter4: TSplitter
          Left = 542
          Top = 0
          Height = 393
          Align = alRight
          ExplicitLeft = 408
          ExplicitTop = 144
          ExplicitHeight = 100
        end
        object Panel11: TPanel
          Left = 0
          Top = 393
          Width = 815
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object Panel12: TPanel
            Left = 441
            Top = 0
            Width = 370
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btFields_Undo: TBitBtn
              Left = 35
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Voltar'
              TabOrder = 3
              OnClick = btFields_UndoClick
            end
            object btFields_Next: TBitBtn
              Left = 116
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Avan'#231'ar'
              TabOrder = 0
              OnClick = btFields_NextClick
            end
            object btFields_Cancel: TBitBtn
              Left = 286
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btSql_CancelClick
            end
            object btFields_OLAP: TBitBtn
              Left = 197
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Testar OLAP'
              Caption = 'OLAP'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btFields_OLAPClick
            end
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 0
          Width = 270
          Height = 393
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 270
            Height = 13
            Align = alTop
            Caption = 'Dimens'#245'es'
            ExplicitWidth = 51
          end
          object tvDimensions: TTreeView
            Left = 0
            Top = 13
            Width = 270
            Height = 380
            Hint = 'Duplo clique para mover entre as dimens'#245'es e sum'#225'rios'
            Align = alClient
            DragMode = dmAutomatic
            Indent = 19
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            OnDblClick = tvDimensionsDblClick
            OnDragDrop = tvDimensionsDragDrop
            OnDragOver = tvDimensionsDragOver
            OnKeyDown = tvDimensionsKeyDown
          end
        end
        object Panel14: TPanel
          Left = 273
          Top = 0
          Width = 269
          Height = 393
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Label6: TLabel
            Left = 0
            Top = 0
            Width = 269
            Height = 13
            Align = alTop
            Caption = 'Somas'
            ExplicitWidth = 31
          end
          object tvSummarys: TTreeView
            Left = 0
            Top = 13
            Width = 269
            Height = 380
            Hint = 'Duplo clique para mover entre as dimens'#245'es e sum'#225'rios'
            Align = alClient
            DragMode = dmAutomatic
            Indent = 19
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            OnDblClick = tvDimensionsDblClick
            OnDragDrop = tvDimensionsDragDrop
            OnDragOver = tvDimensionsDragOver
            OnKeyDown = tvDimensionsKeyDown
          end
        end
        object Panel15: TPanel
          Left = 545
          Top = 0
          Width = 270
          Height = 393
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 3
          object Label7: TLabel
            Left = 0
            Top = 0
            Width = 270
            Height = 13
            Align = alTop
            Caption = 'F'#243'rmulas'
            ExplicitWidth = 43
          end
          object tvFormulas: TTreeView
            Left = 0
            Top = 13
            Width = 270
            Height = 380
            Align = alClient
            DragMode = dmAutomatic
            Indent = 19
            PopupMenu = popUpViewFormulas
            ReadOnly = True
            TabOrder = 0
            OnDblClick = tvDimensionsDblClick
            OnDragDrop = tvDimensionsDragDrop
            OnDragOver = tvDimensionsDragOver
            OnKeyDown = tvDimensionsKeyDown
          end
        end
      end
      object tsConsultaName: TTabSheet
        Caption = 'tsConsultaName'
        ImageIndex = 3
        object Label8: TLabel
          Left = 99
          Top = 27
          Width = 29
          Height = 13
          Caption = 'Grupo'
        end
        object Label9: TLabel
          Left = 43
          Top = 54
          Width = 85
          Height = 13
          Caption = 'Nome da consulta'
        end
        object Panel16: TPanel
          Left = 0
          Top = 393
          Width = 815
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object Panel17: TPanel
            Left = 441
            Top = 0
            Width = 370
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btConsulta_Undo: TBitBtn
              Left = 35
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Voltar'
              TabOrder = 3
              OnClick = btConsulta_UndoClick
            end
            object btConsulta_Next: TBitBtn
              Left = 116
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Avan'#231'ar'
              Enabled = False
              TabOrder = 0
              OnClick = btConsulta_NextClick
            end
            object btConsulta_Cancel: TBitBtn
              Left = 286
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btSql_CancelClick
            end
            object btConsulta_OLAP: TBitBtn
              Left = 197
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Testar OLAP'
              Caption = 'OLAP'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btConsulta_OLAPClick
            end
          end
        end
        object edNomeConsulta: TEdit
          Left = 134
          Top = 51
          Width = 385
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 40
          TabOrder = 1
          Text = 'TITULO DA CONSULTA'
        end
        object cbGrupo: TComboBox
          Left = 134
          Top = 24
          Width = 385
          Height = 21
          CharCase = ecUpperCase
          ItemHeight = 13
          MaxLength = 40
          TabOrder = 2
          Text = 'COMBOBOX1'
        end
      end
      object tsConcluir: TTabSheet
        Caption = 'tsConcluir'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel18: TPanel
          Left = 0
          Top = 393
          Width = 815
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 0
          object Panel19: TPanel
            Left = 441
            Top = 0
            Width = 370
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btConcluir_Undo: TBitBtn
              Left = 35
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Voltar'
              TabOrder = 0
              OnClick = btConcluir_UndoClick
            end
            object btConcluir_Cancel: TBitBtn
              Left = 286
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 1
              OnClick = btSql_CancelClick
            end
          end
        end
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 815
          Height = 393
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          object Splitter5: TSplitter
            Left = 0
            Top = 62
            Width = 815
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitTop = 185
            ExplicitWidth = 208
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 65
            Width = 815
            Height = 328
            Align = alClient
            Caption = 'Concluir com script'
            TabOrder = 1
            object memoInsertSql: TMemo
              Left = 2
              Top = 56
              Width = 811
              Height = 270
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
            end
            object Panel2: TPanel
              Left = 2
              Top = 15
              Width = 811
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Label5: TLabel
                Left = 16
                Top = 16
                Width = 91
                Height = 13
                Caption = 'C'#243'digo da consulta'
              end
              object edCodConsulta: TEdit
                Left = 113
                Top = 12
                Width = 121
                Height = 21
                TabOrder = 0
                OnChange = edCodConsultaChange
              end
              object Panel20: TPanel
                Left = 680
                Top = 0
                Width = 131
                Height = 41
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 1
                object SpeedButton1: TSpeedButton
                  Left = 16
                  Top = 10
                  Width = 23
                  Height = 22
                  Hint = 'Copiar script para '#225'rea de transfer'#234'ncia'
                  Flat = True
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100008C5A5A009C6B
                    63009C6B6B00EFB56B00A57B7300B5847300C68C7B00BD848400B58C8C00FFD6
                    A500BDADAD00F7DEBD00D6C6C600F7DEC600FFDEC600FFE7C600EFDECE00F7DE
                    CE00F7E7CE00FFE7CE00EFE7D600F7E7D600FFE7D600FFEFD600EFDEDE00EFE7
                    DE00F7E7DE00F7EFDE00FFEFDE00FFF7DE00FFF7E700FFF7EF00FFFFEF00FFFF
                    F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00222222222208
                    000000000000000000222222222222081E1B1B1B1B1B1B120022222222222208
                    1B110D0D0D0D101000222222222222081E090909090909100022220800000008
                    1F0D0D0D0D0B1210012222081E1B1B081F120D0D0D0D1510022222081B110D08
                    2109090909090914042222081E0909082116161512161E18042222081F0D0D08
                    2323232121180C0A052222081F120D0823232321210808080822220821090908
                    2323232323080306222222082116160808080808080807222222220823232321
                    21180C0A05222222222222082323232121080808082222222222220823232323
                    2308030622222222222222080808080808080722222222222222}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = SpeedButton1Click
                end
                object btConcluir_Concluir_Script: TBitBtn
                  Left = 45
                  Top = 8
                  Width = 75
                  Height = 25
                  Caption = 'Concluir'
                  TabOrder = 0
                  OnClick = btConcluir_Concluir_ScriptClick
                end
              end
              object ckCamposInternos: TCheckBox
                Left = 240
                Top = 14
                Width = 129
                Height = 17
                Caption = 'Campos Internos'
                TabOrder = 2
                OnClick = ckCamposInternosClick
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 815
            Height = 62
            Align = alTop
            Caption = 'Salvar consulta no banco de dados(codigo > 9999)'
            TabOrder = 0
            object Panel21: TPanel
              Left = 673
              Top = 15
              Width = 140
              Height = 45
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object btConcluir_Concluir_SaveDB: TBitBtn
                Left = 54
                Top = 8
                Width = 75
                Height = 25
                Caption = 'Concluir'
                TabOrder = 0
                OnClick = btConcluir_Concluir_SaveDBClick
              end
            end
          end
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 408
    Top = 240
  end
  object popUpViewFormulas: TPopupMenu
    Left = 560
    object popUpFormula_nova: TMenuItem
      Caption = 'Nova f'#243'rmula'
      OnClick = popUpFormula_novaClick
    end
    object popUpFormula_excluir: TMenuItem
      Caption = 'Excluir f'#243'rmula'
      OnClick = popUpFormula_excluirClick
    end
  end
end
