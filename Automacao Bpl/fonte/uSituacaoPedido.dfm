inherited frmSituacaoPedido: TfrmSituacaoPedido
  Caption = 'Situa'#231#227'o dos Pedidos'
  ClientHeight = 559
  ClientWidth = 1027
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 1035
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 559
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object pnTitulo: TPanel
      Left = 6
      Top = 6
      Width = 1015
      Height = 26
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Situa'#231#227'o dos Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 6
      Top = 73
      Width = 1015
      Height = 480
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 1
      object gridSituacao: TDBGrid
        Left = 6
        Top = 6
        Width = 999
        Height = 357
        Align = alClient
        DataSource = DtmPedVenda.dsSitPed
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = gridSituacaoDrawColumnCell
        OnTitleClick = gridSituacaoTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Pedido'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Financeiro'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Separacao'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Faturamento'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Expedicao'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saida'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Acerto'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_CARGA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NPED'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PED'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Width = 200
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 6
        Top = 363
        Width = 999
        Height = 107
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object Panel6: TPanel
          Left = 814
          Top = 0
          Width = 185
          Height = 107
          Align = alRight
          BevelKind = bkTile
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          object BitBtn1: TBitBtn
            Left = 6
            Top = 6
            Width = 169
            Height = 43
            Align = alTop
            Caption = '&Atualizar'
            TabOrder = 0
            OnClick = BitBtn1Click
            Glyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C0060000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4C79897B76A85AC4C81AA4581AA
              458CB057A2BD7BC3CFB0FF00FFFF00FFFF00FFFF00FFFF00FF82AB48FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADC38D84AB4A80A94481AA45
              80A94481AA4580A94480A94480A94481AA4590B25EC4D0B3FF00FFFF00FFFF00
              FF89AE5382AB48FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B25F81AA4580
              A94480A94481AA4580A94481AA4580A94480A94480A94481AA4580A94480A945
              ADC38CFF00FFFF00FF81AA4587AD5082AB48FF00FFFF00FFFF00FFFF00FF8CB0
              5781AA4581AA4581AA458EB15AB4C798FF00FFFF00FFFF00FFC4D0B2A5BE7F84
              AB4981AA4581AA4581AA45A6BF81FF00FF81AA4581AA4587AD50FF00FFFF00FF
              FF00FF90B25E80A94480A94483AB48AEC38FFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF93B46480A94481AA4580A944A8C08581AA4580A94480
              A944FF00FFFF00FFAAC18881AA4580A94481A946BFCDAAFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99B76D81AA4580A94481A9
              4581AA4580A94480A944FF00FFFF00FF83AB4981AA4581AA45AFC490FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              8DB15981AA4581AA4581AA4581AA4581AA45FF00FFA9C18780A94481AA458FB2
              5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF80A94480A94481AA4580A94480A944FF00FF8AAE54
              80A94481AA45BBCBA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF82AB4887AD4F80A94480A94481AA4580A94480A94481AA4580A94480
              A944FF00FF81AA4581AA4584AB4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF82AB4884AB4A81AA4581AA4581AA4581AA
              4581AA4581AA4581AA45C1CEAD80A94480A94492B361FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82AA4782AA47
              81AA4581AA4581AA4581AA4581AA4581AA45FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF81AA4580A94480A94481AA4580A94480A94481AA45FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF87AD
              4F81AA4580A944FF00FF81AA4580A94480A94481AA4580A94480A94481AA4581
              AA45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF80A94581AA4581AA47FF00FF81AA4581AA4581AA4581AA4581AA
              4581AA4581AA4581AA4581AA45FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFB0C59281AA4581AA4594B564FF00FF81AA4580A944
              80A94481AA4580A944FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AE5280A94481AA45B4C799FF
              00FF81AA4580A94480A94481AA4580A94495B567FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5BE7F80A94480A9
              4487AD4FFF00FFFF00FF81AA4581AA4581AA4581AA4681AA4581AA45A2BC7AFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1C593
              81AA4581AA4581AA45B5C89AFF00FFFF00FF81AA4580A94481A945A8C08480A9
              4480A94481AA459BB86FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFA6BE8180A94481AA4580A94499B76CFF00FFFF00FFFF00FF82AB4880A944
              81AA47FF00FF99B76D80A94481AA4580A94484AB4BA8C084C4D0B3FF00FFFF00
              FFC8D2B8ADC38D89AE5280A94480A94481AA458EB15CFF00FFFF00FFFF00FFFF
              00FF82AA4784AB4983AB48FF00FFFF00FFA4BE7F81AA4581AA4581AA4581AA45
              81AA4581AA4581AA4581AA4581AA4581AA4581AA4581AA4599B86CFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF82AA4785AC4DFF00FFFF00FFFF00FFBFCDAA8C
              B05880A94481AA4580A94481AA4580A94480A94480A94481AA4587AD50B5C79A
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82AB48FF00FFFF00
              FFFF00FFFF00FFFF00FFC0CEACA1BC7A8CB05882AB4881A94589AE549CB972BA
              CBA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          object BitBtn2: TBitBtn
            Left = 6
            Top = 72
            Width = 169
            Height = 25
            Align = alBottom
            Caption = '&Sair'
            TabOrder = 1
            OnClick = BitBtn2Click
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB06F30B06F30
              B06F30B06F30B06F30B06F30B06F30FF00FFFF00FFFF00FFFF00FFFF00FFAE6E
              30AF6E30B06F30FF00FFAE6E30AE6E30AE6E30AE6E30AE6E30AE6E30AE6E30AE
              6E30FF00FFFF00FFFF00FFFF00FFBF956DAE6E30AE6E30D1BCA9AE6E30AE6E30
              AE6E30AE6E30B07439AE6E30AE6E30AE6E30AE6E30FF00FFFF00FFFF00FFD1BB
              A5AE6E30AE6E30C39E7AAE6F32AE6E30AE6E30AE6E30AE6E30CBB096FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE6E30AE6E30B88554AE6F32AE6E30
              AE6E30AE6E30AE6E30AE6E30C8AA8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFAE6E31AE6E30B1763CAE6E30AE6E30AE6E30C6A483AE6E30AE6E30AE6E30C8
              AA8DFF00FFFF00FFFF00FFFF00FFFF00FFB47C46AE6E30AE6F32AF7034AE6E30
              AE6E30FF00FFC39D78AE6E30AE6E30AE6E30C09871FF00FFFF00FFFF00FFFF00
              FFAE6E30AE6E30B57F4AFF00FFAE6E30AE6E30FF00FFFF00FFC29C77AE6E30AE
              6E30AE6E30AE6E30BB8A5BB78351AE6E30AE6E30AE6E30CEB69FFF00FFFF00FF
              AE6E31FF00FFFF00FFFF00FFCAAD91AE6E30AE6E30AE6E30AE6E30AE6E30AE6E
              30AE6E30C0966EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFC39D79B1763DAE6E30AE6E30B6814ED2BFADFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          end
        end
        object pnDetalhes: TPanel
          Left = 0
          Top = 0
          Width = 814
          Height = 107
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object pnPedido: TPanel
            Left = 0
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label3: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Iniciado'
              ExplicitWidth = 37
            end
            object DBText1: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'PED_INI'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 67
              ExplicitWidth = 42
            end
            object Label4: TLabel
              Left = 2
              Top = 45
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText2: TDBText
              Left = 2
              Top = 58
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'PED_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 67
              ExplicitWidth = 42
            end
            object Label5: TLabel
              Left = 2
              Top = 71
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'N'#227'o Autorizado'
              ExplicitWidth = 74
            end
            object DBText3: TDBText
              Left = 2
              Top = 84
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'PED_NAO'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 67
              ExplicitWidth = 42
            end
            object Panel7: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Pedido'
              Color = clWindow
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnFinanceiro: TPanel
            Left = 115
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Label10: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText8: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'FIN_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 67
              ExplicitWidth = 42
            end
            object Label11: TLabel
              Left = 2
              Top = 45
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'N'#227'o Autorizado'
              ExplicitWidth = 74
            end
            object DBText9: TDBText
              Left = 2
              Top = 58
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'FIN_NAO'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 67
              ExplicitWidth = 42
            end
            object Panel11: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Financeiro'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnSeparacao: TPanel
            Left = 230
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object Label12: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Iniciado'
              ExplicitWidth = 37
            end
            object DBText10: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'SEP_INI'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Label13: TLabel
              Left = 2
              Top = 45
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText11: TDBText
              Left = 2
              Top = 58
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'SEP_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Panel13: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Separa'#231#227'o'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnFaturamento: TPanel
            Left = 345
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 3
            object Label15: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Iniciado'
              ExplicitWidth = 37
            end
            object DBText13: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'FAT_INI'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Label16: TLabel
              Left = 2
              Top = 45
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText14: TDBText
              Left = 2
              Top = 58
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'FAT_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Panel15: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Faturamento'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnExpedicao: TPanel
            Left = 460
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 4
            object Label18: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Iniciado'
              ExplicitWidth = 37
            end
            object DBText16: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'EXP_INI'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Label19: TLabel
              Left = 2
              Top = 45
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText17: TDBText
              Left = 2
              Top = 58
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'EXP_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Panel17: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Expedi'#231#227'o'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnSaida: TPanel
            Left = 575
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 5
            object Label22: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText20: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'SAI_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Panel19: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Sa'#237'da'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
          end
          object pnAcerto: TPanel
            Left = 690
            Top = 0
            Width = 115
            Height = 103
            Align = alLeft
            BevelKind = bkTile
            BevelOuter = bvNone
            BorderWidth = 2
            Color = clWhite
            ParentBackground = False
            TabOrder = 6
            object Label24: TLabel
              Left = 2
              Top = 19
              Width = 107
              Height = 13
              Align = alTop
              Caption = 'Finalizado'
              ExplicitWidth = 47
            end
            object DBText22: TDBText
              Left = 2
              Top = 32
              Width = 107
              Height = 13
              Align = alTop
              Alignment = taRightJustify
              AutoSize = True
              Color = clWhite
              DataField = 'ACE_FIN'
              DataSource = DtmPedVenda.dsSitPed
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 61
              ExplicitWidth = 48
            end
            object Panel21: TPanel
              Left = 2
              Top = 2
              Width = 107
              Height = 17
              Align = alTop
              BevelKind = bkTile
              BevelOuter = bvNone
              Caption = 'Acerto'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 32
      Width = 1015
      Height = 41
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 32
        Top = 11
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
      end
      object Label2: TLabel
        Left = 176
        Top = 11
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object edDataIni: TMaskEdit
        Left = 95
        Top = 8
        Width = 75
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
      object edDataFim: TMaskEdit
        Left = 230
        Top = 8
        Width = 75
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object btPesquisar: TBitBtn
        Left = 352
        Top = 6
        Width = 81
        Height = 25
        Caption = '&Pesquisar'
        TabOrder = 2
        OnClick = btPesquisarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
          73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
          8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
          9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
          A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
          AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
          BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
          D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
          E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
          F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
          424242424242424242422B39180B42424242424242424242424243443C180B42
          4242424242424242424242444438180B42424242424242424242424244433918
          0A424242424242424242424242444335004201101A114242424242424242453D
          05072F343434291942424242424242221A2D34343437403E0442424242424206
          231C303437404146284242424242421B210F30373A414140310D42424242421F
          20032434373A3A37321342424242421D25030F2D37373737311042424242420D
          2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
          4227312D21252314424242424242424242420E141B1B42424242}
      end
      object rbNomeFantasia: TRadioButton
        Left = 488
        Top = 2
        Width = 98
        Height = 17
        Caption = 'Nome Fantasia'
        TabOrder = 3
        OnClick = rbNomeFantasiaClick
      end
      object rbRazaoSocial: TRadioButton
        Left = 488
        Top = 19
        Width = 89
        Height = 17
        Caption = 'Raz'#227'o Social'
        TabOrder = 4
        OnClick = rbNomeFantasiaClick
      end
      object ckAbertos: TCheckBox
        Left = 592
        Top = 10
        Width = 122
        Height = 17
        Caption = 'Apenas Abertos'
        TabOrder = 5
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 32
  end
  object PopupMenu2: TPopupMenu
    Left = 504
    Top = 288
    object Filtrar1: TMenuItem
      Caption = 'Filtrar'
      OnClick = Filtrar1Click
    end
    object Removerfiltro1: TMenuItem
      Caption = 'Remover filtro'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExportarparaExcel1: TMenuItem
      Caption = 'Exportar para Excel'
    end
  end
end
