inherited frmCadCEST_ConsultaDet: TfrmCadCEST_ConsultaDet
  Caption = 'Consulta CEST/NCM/MVA'
  ClientHeight = 592
  ClientWidth = 1046
  Position = poScreenCenter
  OnDestroy = FormDestroy
  ExplicitWidth = 1054
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  object pn_consulta_det: TPanel
    Left = 0
    Top = 0
    Width = 1046
    Height = 592
    Align = alClient
    BorderWidth = 6
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 741
      Top = 48
      Height = 537
      Align = alRight
      ExplicitLeft = 520
      ExplicitTop = 320
      ExplicitHeight = 100
    end
    object pn_consulta_det_top: TPanel
      Left = 7
      Top = 7
      Width = 1032
      Height = 41
      Align = alTop
      TabOrder = 0
      object bt_tipo_consulta: TSpeedButton
        Left = 16
        Top = 10
        Width = 81
        Height = 22
        Caption = 'CEST'
        OnClick = bt_tipo_consultaClick
      end
      object lb_info_ncm: TLabel
        Left = 589
        Top = 13
        Width = 265
        Height = 13
        Caption = 'Informe pelo menos 2 digitos do NCM e pressione Enter'
      end
      object ed_consulta: TMaskEdit
        Left = 112
        Top = 10
        Width = 471
        Height = 21
        TabOrder = 0
        OnChange = ed_consultaChange
        OnEnter = ed_consultaEnter
        OnExit = ed_consultaExit
        OnKeyDown = ed_consultaKeyDown
      end
    end
    object pn_consulta_det_client: TPanel
      Left = 7
      Top = 48
      Width = 734
      Height = 537
      Align = alClient
      TabOrder = 1
      object grid_cest: TDBGrid
        Left = 1
        Top = 1
        Width = 732
        Height = 535
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grid_cestDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEST'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMBITO'
            Title.Caption = #194'mbito'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 529
            Visible = True
          end>
      end
    end
    object pn_consulta_det_right: TPanel
      Left = 744
      Top = 48
      Width = 295
      Height = 537
      Align = alRight
      BorderWidth = 3
      TabOrder = 2
      object Label15: TLabel
        Left = 4
        Top = 4
        Width = 287
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'C'#243'digos NCM'
        Layout = tlCenter
        ExplicitWidth = 177
      end
      object Label16: TLabel
        Left = 4
        Top = 43
        Width = 287
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'Grupo'
        Layout = tlCenter
        ExplicitTop = 42
        ExplicitWidth = 177
      end
      object Label17: TLabel
        Left = 4
        Top = 82
        Width = 287
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = #194'mbito'
        Layout = tlCenter
        ExplicitTop = 80
        ExplicitWidth = 177
      end
      object Label18: TLabel
        Left = 4
        Top = 259
        Width = 287
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MVA'
        Layout = tlCenter
        ExplicitLeft = 2
        ExplicitTop = 247
      end
      object Label19: TLabel
        Left = 4
        Top = 340
        Width = 287
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = 'MVA Ajustado'
        Layout = tlCenter
        ExplicitTop = 265
        ExplicitWidth = 177
      end
      object Label1: TLabel
        Left = 4
        Top = 167
        Width = 287
        Height = 13
        Align = alTop
        Caption = 'CEST'
        ExplicitWidth = 25
      end
      object grid_mva: TStringGrid
        Left = 4
        Top = 277
        Width = 287
        Height = 63
        Align = alTop
        ColCount = 2
        Ctl3D = False
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 3
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing]
        ParentCtl3D = False
        TabOrder = 0
        OnDrawCell = grid_mvaDrawCell
        ColWidths = (
          65
          205)
      end
      object grid_mvaaj: TStringGrid
        Left = 4
        Top = 358
        Width = 287
        Height = 95
        Align = alTop
        Ctl3D = False
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing]
        ParentCtl3D = False
        TabOrder = 1
        OnDrawCell = grid_mvaajDrawCell
        ColWidths = (
          49
          56
          53
          54
          51)
      end
      object DBMemo1: TDBMemo
        Left = 4
        Top = 22
        Width = 287
        Height = 21
        Align = alTop
        DataField = 'NCM'
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 4
        Top = 61
        Width = 287
        Height = 21
        Align = alTop
        DataField = 'ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object DBMemo2: TDBMemo
        Left = 4
        Top = 100
        Width = 287
        Height = 67
        Align = alTop
        DataField = 'AMBITO_D'
        TabOrder = 4
      end
      object DBMemo3: TDBMemo
        Left = 4
        Top = 180
        Width = 287
        Height = 79
        Align = alTop
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 216
        Top = 471
        Width = 75
        Height = 25
        Caption = '&Sair'
        ModalResult = 2
        TabOrder = 6
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
      object bt_selecionar_cest: TBitBtn
        Left = 6
        Top = 471
        Width = 204
        Height = 25
        Caption = 'Selecionar CEST'
        TabOrder = 7
        OnClick = bt_selecionar_cestClick
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
    end
  end
end
