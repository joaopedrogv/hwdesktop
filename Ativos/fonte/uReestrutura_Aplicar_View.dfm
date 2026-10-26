object frmReestrutura_Aplicar_View: TfrmReestrutura_Aplicar_View
  Left = 0
  Top = 0
  Caption = 'Reestrutura'#231#227'o - Lista'
  ClientHeight = 514
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 514
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 722
      Height = 461
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 0
      object Panel4: TPanel
        Left = 6
        Top = 6
        Width = 706
        Height = 25
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Lista de atualiza'#231#227'o do banco de dados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 6
        Top = 31
        Width = 706
        Height = 218
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'versao'
            Title.Caption = 'Vers'#227'o'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'build'
            Title.Caption = 'Build'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'script'
            Title.Caption = 'Script'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'opcoes'
            Title.Caption = 'Op'#231#245'es'
            Width = 140
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 6
        Top = 249
        Width = 706
        Height = 202
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 253
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 702
          Height = 34
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 11
            Width = 33
            Height = 13
            Caption = 'Vers'#227'o'
          end
          object Label2: TLabel
            Left = 142
            Top = 11
            Width = 22
            Height = 13
            Caption = 'Build'
          end
          object Label3: TLabel
            Left = 256
            Top = 11
            Width = 41
            Height = 13
            Caption = 'Opc'#231#245'es'
          end
          object Panel7: TPanel
            Left = 633
            Top = 0
            Width = 69
            Height = 34
            Align = alRight
            BevelOuter = bvNone
            BorderWidth = 4
            TabOrder = 0
            ExplicitTop = -6
            object SpeedButton1: TSpeedButton
              Left = 4
              Top = 4
              Width = 23
              Height = 26
              Align = alLeft
              Flat = True
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                10000300000000020000120B0000120B00000000000000000000007C0000E003
                00001F0000007467813A813AA13EA13EA142C142C142C146E146E146E14AE14A
                014B014F946F8136A23EC242C242C346E34AE34A034F044F2453245344574557
                455B4457014F6136A23EC342C346E346E44A044BE44AA23E255345574657665B
                665B455B014F6136A23EA342C342C346E44AC342A742823A255325534657465B
                665B455B014B6132A23AA33EC342C342A33EA742DD7B823A2553255326574657
                465B4557E14A6132823AA33EA33E823EED4EFF7FFF7F823AE44AE44A044B054F
                46574557E14A41328236823A6236ED4EFF7FFF7FFF7F305B305B305B305BCB4A
                E44A2453E146423262366136ED4EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F986B
                C142014FE146422E623261365463FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F986B
                A142014BC146422E423262366136525FFF7FFF7FFF7F305B305B305B305BCB4A
                C142E14AC142222E4232623262366136ED4EFF7FFF7F6136A13EA13EA13EC142
                E14AE146C142222A422E4232623262366136ED4EDD7B6136A23EC142C142C146
                E146E146C142222A422E422E4232623262366136A7426136A23EA23EC142C142
                C146C146A13E222A222A422E422E42326232623661366136A23AA23EA23EC142
                C142C142A13E0226222A222A422E422E4232623262368236823AA23AA23EA23E
                C142A13EA13E545F0226222A222A222E422E422E413241326132613661368136
                813A813A7467}
              OnClick = SpeedButton1Click
              ExplicitLeft = 32
              ExplicitTop = 5
              ExplicitHeight = 22
            end
            object SpeedButton2: TSpeedButton
              Left = 27
              Top = 4
              Width = 23
              Height = 26
              Align = alLeft
              Flat = True
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                10000300000000020000120B0000120B00000000000000000000007C0000E003
                00001F0000007467813A813A813661366136613241324132422E422E222E222A
                222A0226545FA13EA13EC142A23EA23EA23A823A8236623662324232422E422E
                222A222A0226A13EC142C142C142A23EA23EA23A61366136623662324232422E
                422E222A222AA13EC146C146C142C142A23EA23E6136A7426136623662324232
                422E422E222AC142E146E146C146C142C142A23E6136DD7BED4E613662366232
                4232422E222AC142E146E14AC142A13EA13EA13E6136FF7FFF7FED4E61366236
                62324232222EC142E14AC142CB4A305B305B305B305BFF7FFF7FFF7F525F6136
                62364232422EC146014BA142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5463
                61366232422EE146014FC142986BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FED4E
                613662364232E1462453E44ACB4A305B305B305B305BFF7FFF7FFF7FED4E6236
                823A82364132E14A45574657054F044BE44AE44A823AFF7FFF7FED4E823EA33E
                A33E823A6132E14A4557465B4657265725532553823ADD7BA742A33EC342C342
                A33EA23A6132014B455B665B465B465725532553823AA742C342E44AC346C342
                A342A23E6136014F455B665B665B465745572553A23EE44A044BE44AE346C346
                C342A23E6136014F4457455B4557445724532453044F034FE34AE34AC346C242
                C242A23E8136946F014F014BE14AE14AE146E146C146C142C142A142A13EA13E
                813A813A7467}
              OnClick = SpeedButton2Click
              ExplicitLeft = 61
              ExplicitTop = 5
              ExplicitHeight = 22
            end
          end
          object DBEdit1: TDBEdit
            Left = 55
            Top = 8
            Width = 66
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 170
            Top = 8
            Width = 66
            Height = 21
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 303
            Top = 8
            Width = 250
            Height = 21
            ReadOnly = True
            TabOrder = 3
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 34
          Width = 55
          Height = 164
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = -6
          ExplicitTop = 40
          object Label4: TLabel
            Left = 18
            Top = 6
            Width = 31
            Height = 13
            Caption = 'Script:'
          end
        end
        object Panel9: TPanel
          Left = 55
          Top = 34
          Width = 647
          Height = 164
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel9'
          TabOrder = 2
          ExplicitLeft = 279
          ExplicitTop = 30
          ExplicitWidth = 402
          ExplicitHeight = 166
          object DBMemo1: TDBMemo
            Left = 0
            Top = 0
            Width = 628
            Height = 153
            Hint = 'Script a executar - F2: Ativar ou desativar quebra de linha'
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Lucida Console'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ScrollBars = ssBoth
            ShowHint = True
            TabOrder = 0
            WordWrap = False
            OnKeyDown = DBMemo1KeyDown
            ExplicitTop = 1
            ExplicitHeight = 123
          end
          object Panel10: TPanel
            Left = 628
            Top = 0
            Width = 19
            Height = 153
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitHeight = 164
          end
          object Panel11: TPanel
            Left = 0
            Top = 153
            Width = 647
            Height = 11
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 467
      Width = 722
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 473
      object BitBtn1: TBitBtn
        Left = 612
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
    end
  end
end
