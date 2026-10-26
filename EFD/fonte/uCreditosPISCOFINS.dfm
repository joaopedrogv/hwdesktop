object frmCreditoPISCOFNS: TfrmCreditoPISCOFNS
  Left = 0
  Top = 0
  Caption = 'Creditos do PIS e da COFINS'
  ClientHeight = 472
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 472
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object groupGrid: TGroupBox
      Left = 6
      Top = 6
      Width = 781
      Height = 240
      Align = alClient
      Caption = 'Periodos anteriores'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 777
        Height = 223
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ANO'
            Title.Caption = 'Ano'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES'
            Title.Caption = 'Mes'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PIS'
            Title.Caption = 'Credito PIS'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COFINS'
            Title.Caption = 'Credito COFINS'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PIS_UTIL'
            Title.Caption = 'Credito PIS ja util. per. ant'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COFINS_UTIL'
            Title.Caption = 'Credito COFINS ja util. per. ant'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PIS_AT_UTIL'
            Title.Caption = 'Credito PIS util. apur atual'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COFINS_AT_UTIL'
            Title.Caption = 'Credito COFINS util. apur atual'
            Width = 139
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 425
      Width = 781
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object lbAno: TLabel
        Left = 78
        Top = 11
        Width = 24
        Height = 13
        Caption = '2015'
      end
      object SpeedButton3: TSpeedButton
        Left = 10
        Top = 6
        Width = 23
        Height = 25
        Hint = 'Dia anterior'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000010630000006B
          0000086B00000073000008730000007B0000107B000000840000088400001084
          0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
          000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
          000008630800087B0800107B080010840800008C0800088C0800009408001094
          0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
          1000187B10001084100018841000088C1000188C1000109410001894100010D6
          100018D61000107B1800187B18001884180029841800108C1800188C1800218C
          18001094180018941800189C1800219C180010C6180018C6180018D61800187B
          210018842100189421002194210029A521001873290029AD290031DE290029E7
          290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
          420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
          63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
          7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
          C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
          DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
          774F2F777777777777777777777777774F39127777777777777777777777774F
          353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
          440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
          071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
          071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
          070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
          080A0E7777777777777777777777774F383B2177777777777777777777777777
          4F3B0E77777777777777777777777777774F4477777777777777}
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 39
        Top = 6
        Width = 23
        Height = 25
        Hint = 'Pr'#243'ximo Dia'
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000010630000006B
          0000086B00000073000008730000007B0000107B000000840000088400001084
          0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
          000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
          000008630800087B0800107B080010840800008C0800088C0800009408001094
          0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
          1000187B10001084100018841000088C1000188C1000109410001894100010D6
          100018D61000107B1800187B18001884180029841800108C1800188C1800218C
          18001094180018941800189C1800219C180010C6180018C6180018D61800187B
          210018842100189421002194210029A521001873290029AD290031DE290029E7
          290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
          420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
          63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
          7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
          C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
          DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
          772F4F777777777777777777777777777712394F777777777777777777777777
          770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
          131F0A4457294F777777225840161413100A1E073957344F7777215817151413
          120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
          12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
          240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
          770E0A082D4F7777777777777777777777213B384F7777777777777777777777
          770E3B4F77777777777777777777777777444F77777777777777}
        OnClick = SpeedButton4Click
      end
      object btOK: TBitBtn
        Left = 351
        Top = 6
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
      end
    end
    object pnConsulta: TPanel
      Left = 6
      Top = 246
      Width = 781
      Height = 150
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 2
      object pnButtCons: TPanel
        Left = 671
        Top = 6
        Width = 104
        Height = 138
        Align = alRight
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object btExcluirConsulta: TBitBtn
          Left = 13
          Top = 70
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 0
          OnClick = btExcluirConsultaClick
        end
        object btNovoConsulta: TBitBtn
          Left = 13
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = btNovoConsultaClick
        end
        object btAltConsulta: TBitBtn
          Left = 13
          Top = 39
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 2
          OnClick = btAltConsultaClick
        end
        object btHistCons: TBitBtn
          Left = 13
          Top = 101
          Width = 75
          Height = 25
          Caption = 'Historico'
          TabOrder = 3
          OnClick = btHistConsClick
        end
      end
      object pnCadCons: TPanel
        Left = 6
        Top = 6
        Width = 665
        Height = 138
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        OnExit = pnCadConsExit
        object Label1: TLabel
          Left = 72
          Top = 49
          Width = 58
          Height = 13
          Caption = 'Credito PIS:'
        end
        object Label2: TLabel
          Left = 50
          Top = 76
          Width = 80
          Height = 13
          Caption = 'Credito COFINS:'
        end
        object Label5: TLabel
          Left = 88
          Top = 27
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mes/Ano'
        end
        object Label4: TLabel
          Left = 263
          Top = 49
          Width = 235
          Height = 13
          Alignment = taRightJustify
          Caption = 'Credito COFINS utilizado em periodos anteriores:'
        end
        object Label3: TLabel
          Left = 285
          Top = 22
          Width = 213
          Height = 13
          Alignment = taRightJustify
          Caption = 'Credito PIS utilizado em periodos anteriores:'
        end
        object DBEdit1: TDBEdit
          Left = 136
          Top = 46
          Width = 121
          Height = 21
          DataField = 'VALOR_PIS'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 136
          Top = 73
          Width = 121
          Height = 21
          DataField = 'VALOR_COFINS'
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 192
          Top = 19
          Width = 65
          Height = 21
          DataField = 'ANO'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 136
          Top = 19
          Width = 50
          Height = 21
          DataField = 'MES'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 504
          Top = 19
          Width = 121
          Height = 21
          DataField = 'VALOR_PIS_UTIL'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 504
          Top = 46
          Width = 121
          Height = 21
          DataField = 'VALOR_COFINS_UTIL'
          DataSource = DataSource1
          TabOrder = 5
        end
        object btCancelConsulta: TBitBtn
          Left = 311
          Top = 98
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 6
          OnClick = btCancelApurClick
        end
        object btSaveConsulta: TBitBtn
          Left = 392
          Top = 98
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 7
          OnClick = btSaveConsultaClick
        end
      end
    end
    object pnApuracao: TPanel
      Left = 6
      Top = 396
      Width = 781
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 6
      Caption = 'Em Apura'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 384
    Top = 128
  end
end
