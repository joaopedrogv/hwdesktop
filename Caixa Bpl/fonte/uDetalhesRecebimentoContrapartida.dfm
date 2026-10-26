object frmDetalhesRecebimentoContrapartida: TfrmDetalhesRecebimentoContrapartida
  Left = 0
  Top = 0
  Caption = 'Detalhes do Recebimento da Contrapartida'
  ClientHeight = 562
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 521
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
      TabOrder = 0
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
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 137
        Height = 19
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '    Valor contrapartida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
      object pnContrapartida: TPanel
        Left = 137
        Top = 0
        Width = 185
        Height = 19
        Align = alLeft
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'pnContrapartida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 23
      Width = 784
      Height = 149
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object gridLancamento: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 149
        Align = alClient
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 521
      Width = 784
      Height = 149
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 172
      Width = 784
      Height = 349
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 3
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 776
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
          TabOrder = 0
          object pnCh: TPanel
            Left = 587
            Top = 0
            Width = 185
            Height = 19
            Align = alRight
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'pnCh'
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
          Top = 23
          Width = 776
          Height = 149
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object gridCheques: TDBGrid
            Left = 0
            Top = 0
            Width = 776
            Height = 149
            Align = alClient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 172
          Width = 776
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
          TabOrder = 2
          object pnCred: TPanel
            Left = 587
            Top = 0
            Width = 185
            Height = 19
            Align = alRight
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'pnCred'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
        end
        object gridCreditos: TDBGrid
          Left = 0
          Top = 195
          Width = 776
          Height = 126
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 23
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Contas a pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
          object pnCTP: TPanel
            Left = 587
            Top = 0
            Width = 185
            Height = 19
            Align = alRight
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'pnCTP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 0
          end
        end
        object gridContasAPagar: TDBGrid
          Left = 0
          Top = 23
          Width = 776
          Height = 298
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
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
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 352
      Top = 6
      Width = 75
      Height = 25
      Caption = '&OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
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
    object BitBtn13: TBitBtn
      Left = 20
      Top = 6
      Width = 149
      Height = 25
      Hint = 'Estornar Lan'#231'amento - [LANC037]'
      Caption = 'Estornar Lan'#231'amento'
      TabOrder = 1
      OnClick = BitBtn13Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D7E1E2D8321FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF2A70152D801F2F8F2830972E2E8B272D821FFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF28660E2B781A2E8A25308E282F8E262F972D2F97
        2E2F922A2E8E27FF00FFFF00FFFF00FFFF00FFFF00FF286811286B0F2862082D
        811E2F8F282F932C2D9D3F2E9C372F9A302F9932309930256611FF00FFFF00FF
        28650F2A72162D89262C7A1929680B2F8C282DA4442CAF582CB15D2CAC542D93
        312F9129309F35297518255E0C2C791A2D84202F90292F902A2B70132B6F0A2F
        921E2D992E2DA5462DB25C2DAA4E296E132B771B2FA7412A781B2355072A7418
        3091282E8B262E9C362D7F0D2F7F032F80032F7B012F80062E93232CB1582DA7
        4B2C902E2B8728286B12245A0A2D7F1D2F98302DA6492CB15B2E96222E7B022F
        7F032F81032F80032F7F022EA03B2C983D276A11245807FF00FF255D0A2D9736
        2CB55E2BAF592CAD572DAD542D972A2F870F2F83092F83072B7005286A0F286A
        12FF00FFFF00FFFF00FFFF00FF286C162D993A0000662CB15B2CAD562CB4602C
        B0582D9C392C7316286A12FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        0000660000662DA1452DB55D2CA54B2B8A2D286A12FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000660000FF
        0000FF0000FF0000FF0000FF000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0000660000FF0000FF000066000066000066FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000066000066FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000066FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BitBtn2: TBitBtn
      Left = 175
      Top = 6
      Width = 149
      Height = 25
      Hint = 'Imprimir Lan'#231'amento - [LANC039]'
      Caption = 'Imprimir'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        10000300000000020000120B0000120B00000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
        4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
        EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
        734EF75E104210429452AE358610861086108610861086108610861086108610
        AE35945210423146F75EAE358610861086108610861086108610861086108610
        AE35F75E3146524ABD7795523246324632463246324632463246324632463246
        9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
        F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
        B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
        1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
        1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
  end
end
