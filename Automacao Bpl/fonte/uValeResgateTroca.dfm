object frmValeResgateTroca: TfrmValeResgateTroca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gerar vale resgate/troca'
  ClientHeight = 437
  ClientWidth = 887
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel62: TPanel
    Left = 0
    Top = 41
    Width = 887
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label353: TLabel
      Left = 41
      Top = 8
      Width = 154
      Height = 13
      Alignment = taRightJustify
      Caption = 'Saldo dispon'#237'vel (PONTOS): '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label354: TLabel
      Left = 263
      Top = 9
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label354'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label356: TLabel
      Left = 724
      Top = 13
      Width = 159
      Height = 13
      Alignment = taRightJustify
      Caption = '* Valor m'#237'nimo de pontos:  0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 324
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Atualizar saldo'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFA7
        A7A7A4A4A4CFCFCFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EFEFEFFFFFFFB1B1B1262626181818474747494949181818252525AFAFAFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9292929757575191919AAAAAAFCFCFCFF
        FFFFFFFFFFFEFEFEADADAD191919818181FFFFFFFFFFFFFFFFFFFFFFFFD3D3D3
        000000000000C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E01919
        19AFAFAFFFFFFFFFFFFFFFFFFFBABABA474747747474BCBCBCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB272727FEFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
        FD171717D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF838383D0D0D0FFFFFFFFFFFFCDCDCD
        888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFCECECE1A1A1AFDFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        252525AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8787875C5C
        5C5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFABABAB1C1C1CE2E2E2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7070700000005C5C5CFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7C7C7C1B1B1BB1B1B1FEFEFEFFFFFFFFFFFFFDFDFDADADAD1919194040
        40878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA2222221A1A1A4A
        4A4A4A4A4A181818252525AEAEAEFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFDFDCCCCCCA4A4A4A5A5A5CFCFCFFEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton1Click
    end
    object Label349: TLabel
      Left = 489
      Top = 9
      Width = 130
      Height = 13
      Alignment = taRightJustify
      Caption = 'Saldo acumulado (R$): '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label350: TLabel
      Left = 673
      Top = 9
      Width = 51
      Height = 13
      Caption = 'Label350'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl7: TPageControl
    Left = 0
    Top = 73
    Width = 887
    Height = 335
    ActivePage = tsOpcaoValeCompra
    Align = alClient
    TabOrder = 1
    object tsOpcaoValeCompra: TTabSheet
      Caption = 'Vale Resgate'
      object DBGridValeCompraProgFid: TDBGrid
        Left = 0
        Top = 66
        Width = 879
        Height = 241
        Align = alClient
        DataSource = DtmClientes.dsRegrasValeCompraProgFid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGridValeCompraProgFidKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PONTOS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end>
      end
      object pnInfValorVale: TPanel
        Left = 0
        Top = 25
        Width = 879
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label358: TLabel
          Left = 6
          Top = 11
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pontos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label355: TLabel
          Left = 406
          Top = 11
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbValorVale: TLabel
          Left = 181
          Top = 11
          Width = 7
          Height = 13
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditHwPontosVale: TEditHw
          Left = 54
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = EditHwPontosValeExit
          Formato = fInteger
          FormatSize = '0.2'
        end
        object EditHwValorVale: TEditHw
          Left = 444
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0,00'
          Visible = False
          OnExit = EditHwValorValeExit
          Formato = fNumber
          FormatSize = '0.2'
        end
      end
      object Panel63: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbInfVale: TLabel
          Left = 6
          Top = 3
          Width = 170
          Height = 18
          Caption = 'Informe o valor o vale:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tsOpcaoValeTroca: TTabSheet
      Caption = 'Vale Troca'
      ImageIndex = 1
      object Panel64: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label360: TLabel
          Left = 4
          Top = 3
          Width = 417
          Height = 18
          Caption = 'Selecione as mercadorias que deseja gerar o vale troca:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel65: TPanel
        Left = 0
        Top = 25
        Width = 879
        Height = 33
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object Label361: TLabel
          Left = 22
          Top = 9
          Width = 32
          Height = 13
          Caption = 'Filtar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ComboBoxFiltro: TComboBox
          Left = 72
          Top = 6
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Num Fabricante'
          Items.Strings = (
            'Num Fabricante'
            'Descricao')
        end
        object EditFiltro: TEdit
          Left = 232
          Top = 6
          Width = 449
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = EditFiltroChange
        end
      end
      object GroupBox59: TGroupBox
        Left = 0
        Top = 160
        Width = 879
        Height = 147
        Align = alBottom
        Caption = 'Mercadorias adicionadas:'
        TabOrder = 4
        object DBGridTempValeTroca: TDBGrid
          Left = 2
          Top = 15
          Width = 875
          Height = 100
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = PopupMenu5
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = DBGridTempValeTrocaDrawColumnCell
          OnDblClick = DBGridTempValeTrocaDblClick
          OnKeyDown = DBGridTempValeTrocaKeyDown
        end
        object Panel67: TPanel
          Left = 2
          Top = 115
          Width = 875
          Height = 30
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object LabelPontosValeTroca: TLabel
            Left = 567
            Top = 6
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pontos: 0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LabelValorValeTroca: TLabel
            Left = 735
            Top = 6
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor : 0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object BitBtn106: TBitBtn
            Left = 357
            Top = 1
            Width = 75
            Height = 25
            Hint = 'Excluir Registro - [CLI225]'
            Caption = '&Deletar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn106Click
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000220B0000220B000000010000000100000031DE000031
              E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
              0404040404040404000004000004040404040404040404000004040000000404
              0404040404040000040404000000000404040404040000040404040402000000
              0404040400000404040404040404000000040000000404040404040404040400
              0101010004040404040404040404040401010204040404040404040404040400
              0201020304040404040404040404030201040403030404040404040404050203
              0404040405030404040404040303050404040404040303040404040303030404
              0404040404040403040403030304040404040404040404040404030304040404
              0404040404040404040404040404040404040404040404040404}
          end
        end
      end
      object DBGrid19: TDBGrid
        Left = 0
        Top = 58
        Width = 879
        Height = 72
        Align = alClient
        DataSource = DtmClientes.dsRegrasValeTrocaProgFid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid19DrawColumnCell
        OnDblClick = DBGrid19DblClick
        OnKeyDown = DBGrid19KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'SEL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PONTOS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_FAB_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_GRADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCR_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRUPO_PROD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PROD'
            Visible = True
          end>
      end
      object Panel66: TPanel
        Left = 0
        Top = 130
        Width = 879
        Height = 30
        Align = alBottom
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 3
        object BitBtn107: TBitBtn
          Left = 358
          Top = 0
          Width = 75
          Height = 25
          Hint = 'Incluir Registro - [CLI224]'
          Caption = '&Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn107Click
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
      end
    end
  end
  object Panel61: TPanel
    Left = 0
    Top = 408
    Width = 887
    Height = 29
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn62: TBitBtn
      Left = 389
      Top = 0
      Width = 104
      Height = 25
      Hint = 'OK - [Gerar Vale - [CLI221/CLI223]'
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn62Click
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
    object BitBtn63: TBitBtn
      Left = 808
      Top = 0
      Width = 75
      Height = 25
      Hint = 'Voltar'
      Align = alRight
      Caption = 'Voltar'
      TabOrder = 1
      OnClick = BitBtn63Click
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
  object GroupBoxDoc: TGroupBox
    Left = 0
    Top = 0
    Width = 887
    Height = 41
    Align = alTop
    Caption = 'Venda'
    TabOrder = 3
    object Label1: TLabel
      Left = 58
      Top = 16
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Num Doc: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNumDoc: TLabel
      Left = 119
      Top = 16
      Width = 56
      Height = 13
      Caption = 'lbNumDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 299
      Top = 16
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Doc: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTipoDoc: TLabel
      Left = 359
      Top = 16
      Width = 55
      Height = 13
      Caption = 'lbTipoDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 478
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Doc: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValorDoc: TLabel
      Left = 543
      Top = 16
      Width = 55
      Height = 13
      Caption = 'lbTipoDoc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 752
    Top = 272
    object EditarQtdeValeTroca: TMenuItem
      Caption = 'Editar quantidade - [CLI227]'
      OnClick = EditarQtdeValeTrocaClick
    end
  end
end
