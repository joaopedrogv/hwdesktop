inherited frmCadPedVenda_NotasVinculadas: TfrmCadPedVenda_NotasVinculadas
  Caption = 'Notas Fiscais vinculadas'
  ClientHeight = 552
  ClientWidth = 937
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 945
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 937
    Height = 552
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 6
    TabOrder = 0
    ExplicitHeight = 695
    object Panel2: TPanel
      Left = 7
      Top = 7
      Width = 923
      Height = 497
      Align = alClient
      BevelOuter = bvNone
      Padding.Bottom = 6
      TabOrder = 0
      ExplicitHeight = 640
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 923
        Height = 491
        Align = alClient
        Caption = 'Notas Fiscais'
        Padding.Left = 6
        Padding.Top = 3
        Padding.Right = 6
        Padding.Bottom = 6
        TabOrder = 0
        ExplicitHeight = 634
        object Splitter1: TSplitter
          Left = 8
          Top = 193
          Width = 907
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitLeft = 2
          ExplicitTop = 56
          ExplicitWidth = 576
        end
        object Panel4: TPanel
          Left = 8
          Top = 18
          Width = 907
          Height = 175
          Align = alTop
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'Sem registros'
          ParentBiDiMode = False
          TabOrder = 0
          object grid_nf: TDBGrid
            Left = 0
            Top = 0
            Width = 907
            Height = 175
            Align = alClient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Visible = False
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 196
          Width = 907
          Height = 287
          Align = alClient
          Caption = 'Itens da NF'
          TabOrder = 1
          ExplicitTop = 228
          ExplicitHeight = 398
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 903
            Height = 270
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 6
            Caption = 'Sem registros'
            TabOrder = 0
            ExplicitHeight = 381
            object grid_itens: TDBGrid
              Left = 6
              Top = 6
              Width = 891
              Height = 258
              Align = alClient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Visible = False
              OnDrawColumnCell = grid_itensDrawColumnCell
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 7
      Top = 504
      Width = 923
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 647
      object BitBtn1: TBitBtn
        Left = 422
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Voltar'
        ModalResult = 2
        TabOrder = 0
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
      object Panel6: TPanel
        Left = 16
        Top = 8
        Width = 185
        Height = 20
        BevelOuter = bvNone
        Caption = 'Itens do pedido'
        Color = 16774118
        ParentBackground = False
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 722
        Top = 8
        Width = 185
        Height = 20
        BevelOuter = bvNone
        Caption = 'Itens de outros pedidos'
        Color = 15395583
        ParentBackground = False
        TabOrder = 2
      end
    end
  end
end
