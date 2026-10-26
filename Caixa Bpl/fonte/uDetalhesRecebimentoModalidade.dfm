inherited frmDetalhesRecebimentoModalidade: TfrmDetalhesRecebimentoModalidade
  Caption = 'Detalhes do Recebimento por Modalidade'
  ClientHeight = 562
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 562
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 784
      Height = 23
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Lan'#231'amentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
      ExplicitTop = -6
      object pnLanc: TPanel
        Left = 595
        Top = 0
        Width = 185
        Height = 19
        Align = alRight
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnLanc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 23
      Width = 784
      Height = 149
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object gridLancamento: TDBGrid
        Left = 0
        Top = 0
        Width = 780
        Height = 145
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gridLancamentoKeyDown
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 172
      Width = 784
      Height = 23
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Cheques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 3
      object pnCh: TPanel
        Left = 595
        Top = 0
        Width = 185
        Height = 19
        Align = alRight
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Panel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 367
      Width = 784
      Height = 149
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 6
      object gridCreditos: TDBGrid
        Left = 0
        Top = 0
        Width = 780
        Height = 145
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gridLancamentoKeyDown
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 344
      Width = 784
      Height = 23
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Cr'#233'ditos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 5
      object pnCred: TPanel
        Left = 595
        Top = 0
        Width = 185
        Height = 19
        Align = alRight
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Panel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 195
      Width = 784
      Height = 149
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 4
      object gridCheques: TDBGrid
        Left = 0
        Top = 0
        Width = 780
        Height = 145
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = gridLancamentoKeyDown
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 521
      Width = 784
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 352
        Top = 8
        Width = 75
        Height = 25
        Caption = '&OK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
        OnKeyDown = gridLancamentoKeyDown
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
          B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
          DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
          4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
          E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
          7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
          6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
          4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
      end
    end
  end
end
